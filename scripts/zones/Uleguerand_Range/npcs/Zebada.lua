-----------------------------------
--  Area: Uleguerand Range
--  NPC:  Zebada
--  Type: ENM Quest Activator
--  @pos -308.112 -42.137 -570.096 5
-----------------------------------
package.loaded["scripts/zones/Uleguerand_Range/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Uleguerand_Range/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/common");
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    local prog = player:getVar("[ENM]Bearclaw");
    local waitTime = prog - getTimeOffset(TIME_OFFSET_DEC);

    --[[ Trade Chamnaet Ice ]]--
    if(trade:hasItemQty(1780,1) and trade:getItemCount() == 1) then
    
    --[[ Check if player already has keyitem or still has time left to wait ]]--
        if(player:hasKeyItem(ZEPHYR_FAN) == false and waitTime <= 0) then
            --[[ Award KeyItem ]]--
            player:startEvent(0x000d);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local prog = player:getVar("[ENM]Bearclaw");
    local waitTime = prog - getTimeOffset(TIME_OFFSET_DEC);
    
    --[[ Player has the keyitem but has not triggered the ENM ]]--
    if(player:hasKeyItem(ZEPHYR_FAN) == true) then
        player:startEvent(0x000c);
        
    --[[ Player has triggered the ENM and had the keyitem removed, 5 day wait isn't up ]]--
    elseif(player:hasKeyItem(ZEPHYR_FAN) == false and waitTime > 0) then
        player:startEvent(0x000F, prog);
        
    --[[ Player has triggered the ENM and had the keyitem removed, 5 days are up ]]--
    elseif(player:hasKeyItem(ZEPHYR_FAN) == false and waitTime <= 0) then
        player:startEvent(0x000e);
        
        
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
    
    if(csid == 0x000e) then
    --[[ Check if player has room in inventory before giving the Cotton Pouch ]]--
        if(player:getFreeSlotsCount() > 0) then
            player:addItem(1779,1);
            player:messageSpecial(ITEM_OBTAINED, 1779);
        else
            --[[ Player does not have enough inventory space free, tell them to free up some space ]]--
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 1779);
        end
        
    elseif(csid == 0x000d) then
        player:addKeyItem(ZEPHYR_FAN);
        player:messageSpecial(KEYITEM_OBTAINED, ZEPHYR_FAN);
    end
end;