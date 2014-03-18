-----------------------------------
--
-- Zone: Uleguerand_Range (5)
--
-----------------------------------
package.loaded["scripts/zones/Uleguerand_Range/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Uleguerand_Range/TextIDs");
require("scripts/globals/missions");
require("scripts/globals/weather");
-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn(player,prevZone)		
	cs = -1;	
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then	
		player:setPos(363.025,16,-60,12);
	end	
	if(player:getCurrentMission(COP) == DAWN and player:getVar("COP_louverance_story")== 1 )then
	  cs=0x0011;
	end
	return cs;	
end;		

-----------------------------------		
-- onRegionEnter		
-----------------------------------		

function onRegionEnter(player,region)	
end;	

-----------------------------------		
-- onZoneWeatherChange		
-----------------------------------		

function OnZoneWeatherChange(weather)

    --[[ Ice Wall in (H-8) is open on clear days. ]]--
    if(weather ~= WEATHER_BLIZZARDS and weather ~= WEATHER_CLOUDS) then
        GetNPCByID(16798107):setAnimation(8);
    else
        GetNPCByID(16798107):setAnimation(9);
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
	if(csid == 0x0011)then
		player:setVar("COP_louverance_story",2);
	end
end;	
