-----------------------------------
--  Area: Tavnazian Safehold
--   NPC: Morangeart
--  Type: ENM Quest Activator
-- @zone: 26
--  @pos -74.308 -24.782 -28.475 26
-----------------------------------
package.loaded["scripts/zones/Tavnazian_Safehold/TextIDs"] = nil;
package.loaded["scripts/globals/keyitems"] = nil;
package.loaded["scripts/globals/status"] = nil;
package.loaded["scripts/globals/common"] = nil;
-----------------------------------
require("scripts/zones/Tavnazian_Safehold/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/status");
require("scripts/globals/common");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local prog = player:getVar("[ENM]MonarchLinn");
    local waitTime = prog - getTimeOffset(TIME_OFFSET_DEC);


    --[[ Player has the keyitem but has not triggered the ENM ]]--
    if(player:hasKeyItem(MONARCH_BEARD) == true) then
        player:startEvent(0x020B);
        
    --[[ Player has triggered the ENM and had the keyitem removed, 5 days are up ]]--
    elseif((player:hasKeyItem(MONARCH_BEARD) == false) and waitTime <= 0) then
        player:startEvent(0x0209);
        
    --[[ Player has triggered the ENM and had the keyitem removed, 5 day wait isn't over yet ]]--
    elseif((player:hasKeyItem(MONARCH_BEARD) == false) and waitTime > 0) then
        player:startEvent(0x020A,prog);
        
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
	 printf("CSID: %u",csid);
	 printf("RESULT: %u",option);
    if(csid == 0x0209) then
        player:addKeyItem(MONARCH_BEARD);
        player:messageSpecial(KEYITEM_OBTAINED, MONARCH_BEARD);
        player:setVar("[ENM]MonarchLinn", 0);
    end
    
end;

