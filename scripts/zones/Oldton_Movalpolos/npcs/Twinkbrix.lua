-----------------------------------
--  Area: Oldton Movalpolos
--  NPC:  Twinkbrix
--  Type: Warp NPC
--  @pos -292.779 6.999 -263.153 11
-----------------------------------
package.loaded["scripts/zones/Oldton_Movalpolos/TextIDs"] = nil;
package.loaded["scripts/globals/keyitems"] = nil;
package.loaded["scripts/globals/common"] = nil;
package.loaded["scripts/globals/status"] = nil;
-----------------------------------
require("scripts/zones/Oldton_Movalpolos/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/common");
require("scripts/globals/status");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    --[[
        Trading 2,000+ gil results in the 'higher' number increasing.
        See wiki page: http://wiki.ffxiclopedia.org/wiki/Twinkbrix
    ]]--

    local prog = player:getVar("[ENM]MineShaft");
    local waitTime = prog - getTimeOffset(TIME_OFFSET_DEC);
    
    local roll = math.random(2, 100);
    local teleFee = 2000;
    
    --[[ Ensure only gil is present in the trade ]]--
    if(trade:getGil() > 0 and trade:getItemCount() == 1) then
    
        local gil = trade:getGil();
        local maxVal = (gil/200);

        --[[ Highest number caps at 50 (10,000 gil) ]]--
        if maxVal > 50 then maxVal = 50 end
        
        if(player:hasKeyItem(SHAFT_GATE_OPERATING_DIAL) == false) then
            if(gil == 2716) then
                player:startEvent(0x0037, gil, maxVal - 1, roll, teleFee);
            else
                player:startEvent(0x0037, gil, maxVal, roll, teleFee);  
            end          
            
        --[[ Player has the keyitem necessary for teleporting and can be teleported if 2,000 gil is traded ]]--
        elseif(player:hasKeyItem(SHAFT_GATE_OPERATING_DIAL) == true and gil == teleFee) then
            player:startEvent(0x0038);
            
        end
        
    --[[ Player is trading a Sylvan Stone for Mine Shaft #2716 Lever ]]--
    elseif(trade:hasItemQty(1781,1) and trade:getItemCount() == 1) then
        --[[ Check if player has to wait before initiating the keyitem reward cs ]]--
        if(waitTime <= 0) then
            player:startEvent(0x0033, 1781);
        end
    else
        player:startEvent(0x0032);
    end
    
    
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local prog = player:getVar("[ENM]MineShaft");
    local waitTime = prog - getTimeOffset(TIME_OFFSET_DEC);
    
    --[[ Player already has the keyitem, assume ENM hasn't been entered ]]--
    if(player:hasKeyItem(SHAFT_2716_OPERATING_LEVER) == true) then
        player:startEvent(0x0032);
        
    --[[ Player doesn't have keyitem or waiting time, display starting cs ]]--
    elseif((player:hasKeyItem(SHAFT_2716_OPERATING_LEVER) == false) and waitTime <= 0) then
        player:startEvent(0x0034, 1781);
        
    --[[ Player doesn't have the keyitem but has to wait before receiving a new one, display waiting time ]]--
    elseif((player:hasKeyItem(SHAFT_2716_OPERATING_LEVER) == false) and waitTime > 0) then
        player:startEvent(0x0035, 1781, prog);
        
    --[[ Default Dialogue ]]--
    else
        player:startEvent(0x0032);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
 
    if(csid == 0x0037) then
        --[[ Option is equal to 1 only if player won the gamble, award keyitem if they won ]]--
        if(option == 1) then
            player:addKeyItem(SHAFT_GATE_OPERATING_DIAL);
            player:messageSpecial(KEYITEM_OBTAINED, SHAFT_GATE_OPERATING_DIAL);
        end
        player:tradeComplete();
        
        
    elseif(csid == 0x0038) then
        --[[ Teleporting removes Shaft #2716 Operating Lever keyitem, do it ]]--
        if(player:hasKeyItem(SHAFT_2716_OPERATING_LEVER)) then
            player:delKeyItem(SHAFT_2716_OPERATING_LEVER);
        end
        player:tradeComplete();
        --[[ Teleport player to Mine Shaft #2716 ]]--
        player:setPos(0,0,0,0,13);
        
    elseif(csid == 0x0033) then
        player:addKeyItem(SHAFT_2716_OPERATING_LEVER);
        player:messageSpecial(KEYITEM_OBTAINED, SHAFT_2716_OPERATING_LEVER);
        player:setVar("[ENM]MineShaft",0);
        
    end
end;
