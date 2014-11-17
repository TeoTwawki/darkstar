-----------------------------------
-- Area: Mine Shaft #2716
-- NPC:  Armoury Crate
-------------------------------------
package.loaded["scripts/zones/Mine_Shaft_2716/TextIDs"] = nil;
-------------------------------------

require("scripts/zones/Mine_Shaft_2716/TextIDs");
require("scripts/globals/bcnm");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    --[[ 18,000 EXP is distributed among party members present ]]--
    local EXP = 18000;
    local membercount = 0;
    
    --[[ Add together the size of all parties present ]]--
    membercount = player:getAllianceSize() + player:getPartySize(0) - 1;
    
    player:PrintToPlayer(membercount);
    
    --[[ Split the EXP between members equally ]]--
    EXP = EXP/membercount;
    
    --[[ Distribute EXP amongst members of each party ]]--
    for partyId = 0, 2, 1 do
        
        for i = 0, membercount, 1 do
            local member = player:getPartyMember(partyId, i, true); -- getPartyMember(partyId, member.at(i), silent);
            
            if(member ~= nil and member:getHP() > 0) then
                member:addExp(EXP);
            end
            i = i + 1;
        end
        partyId = partyId + 1;
    end
    

	player:getBCNMloot();
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
end;
