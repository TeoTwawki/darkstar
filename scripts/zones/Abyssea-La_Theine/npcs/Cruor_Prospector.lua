-----------------------------------
-- Area: Abyssea - La_Theine
--  NPC: Cruor Prospector
-- Type: Cruor NPC
-- @pos -469.072 -1.587 787.575 132
-----------------------------------
package.loaded["scripts/zones/Abyssea-La_Theine/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Abyssea-La_Theine/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/globals/abyssea");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local Cruor = player:getCurrency("cruor");
    local Demilune = getDemiluneAbyssite(player);
    player:startEvent(2002, Cruor, Demilune);
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

    if (option == 65539) then -- Map of Abyssea - La_Theine
        if (player:hasKeyItem(MAP_OF_ABYSSEA_LA_THEINE) == false) then
            player:messageSpecial(KEYITEM_OBTAINED,MAP_OF_ABYSSEA_LA_THEINE);
            player:addKeyItem(MAP_OF_ABYSSEA_LA_THEINE);
            player:delCurrency("cruor", 3500);
        end
    elseif (option == 131075) then -- Ivory Abyssite of Sojourn
        if (player:hasKeyItem(IVORY_ABYSSITE_OF_SOJOURN) == false) then
            player:messageSpecial(KEYITEM_OBTAINED,IVORY_ABYSSITE_OF_SOJOURN);
            player:addKeyItem(IVORY_ABYSSITE_OF_SOJOURN);
            player:delCurrency("cruor", 6000);
        end
    elseif (option == 196611) then -- Ivory Abyssite of Confluence
        if (player:hasKeyItem(IVORY_ABYSSITE_OF_CONFLUENCE) == false) then
            player:messageSpecial(KEYITEM_OBTAINED,IVORY_ABYSSITE_OF_CONFLUENCE);
            player:addKeyItem(IVORY_ABYSSITE_OF_CONFLUENCE);
            player:delCurrency("cruor", 4800);
        end
    elseif (option == 262147) then -- Ivory Abyssite of Expertise
        if (player:hasKeyItem(IVORY_ABYSSITE_OF_EXPERTISE) == false) then
            player:messageSpecial(KEYITEM_OBTAINED,IVORY_ABYSSITE_OF_EXPERTISE);
            player:addKeyItem(IVORY_ABYSSITE_OF_EXPERTISE);
            player:delCurrency("cruor", 4800);
        end
    elseif (option == 458755) then -- Clear Demilune Abyssite
        if (player:hasKeyItem(CLEAR_DEMILUNE_ABYSSITE) == false) then
            player:messageSpecial(KEYITEM_OBTAINED,CLEAR_DEMILUNE_ABYSSITE);
            player:addKeyItem(CLEAR_DEMILUNE_ABYSSITE);
            player:delCurrency("cruor", 300);
        end
    elseif (option == 393220) then -- HP Boost
        player:addStatusEffectEx(EFFECT_ABYSSEA_HP,EFFECT_MAX_HP_BOOST,20+(getAbyssiteTotal(player,"MERIT") *10),0,0);
        player:addHP(20+(getAbyssiteTotal(player,"MERIT") *10) *10);
        player:delCurrency("cruor", 50);
    elseif (option == 458756) then -- MP Boost
        player:addStatusEffectEx(EFFECT_ABYSSEA_MP,EFFECT_MAX_MP_BOOST,10+(getAbyssiteTotal(player,"MERIT") *5),0,0);
        player:addMP(10+(getAbyssiteTotal(player,"MERIT") *5) *10);
        player:delCurrency("cruor", 120);
    elseif (option == 524292) then -- STR-DEX Boost
        player:addStatusEffectEx(EFFECT_ABYSSEA_STR,EFFECT_STR_BOOST,10+(getAbyssiteTotal(player,"FURTHERANCE") *10),0,0);
        player:addStatusEffectEx(EFFECT_ABYSSEA_DEX,EFFECT_DEX_BOOST,10+(getAbyssiteTotal(player,"FURTHERANCE") *10),0,0);
        player:delCurrency("cruor", 120);
    elseif (option == 589828) then -- VIT-AGI Boost
        player:addStatusEffectEx(EFFECT_ABYSSEA_VIT,EFFECT_VIT_BOOST,10+(getAbyssiteTotal(player,"FURTHERANCE") *10),0,0);
        player:addStatusEffectEx(EFFECT_ABYSSEA_AGI,EFFECT_AGI_BOOST,10+(getAbyssiteTotal(player,"FURTHERANCE") *10),0,0);
        player:delCurrency("cruor", 100);
    elseif (option == 655364) then -- INT-MND-CHR Boost
        player:addStatusEffectEx(EFFECT_ABYSSEA_INT,EFFECT_INT_BOOST,10+(getAbyssiteTotal(player,"FURTHERANCE") *10),0,0);
        player:addStatusEffectEx(EFFECT_ABYSSEA_MND,EFFECT_MND_BOOST,10+(getAbyssiteTotal(player,"FURTHERANCE") *10),0,0);
        player:addStatusEffectEx(EFFECT_ABYSSEA_CHR,EFFECT_CHR_BOOST,10+(getAbyssiteTotal(player,"FURTHERANCE") *10),0,0);
        player:delCurrency("cruor", 100);
    elseif (option == 720900) then -- All Enhancements
        player:addStatusEffectEx(EFFECT_ABYSSEA_HP,EFFECT_MAX_HP_BOOST,20+(getAbyssiteTotal(player,"MERIT") *10),0,0);
        player:addHP(20+(getAbyssiteTotal(player,"MERIT") *10) *10);
        player:addStatusEffectEx(EFFECT_ABYSSEA_MP,EFFECT_MAX_MP_BOOST,10+(getAbyssiteTotal(player,"MERIT") *5),0,0);
        player:addMP(10+(getAbyssiteTotal(player,"MERIT") *5) *10);
        player:addStatusEffectEx(EFFECT_ABYSSEA_STR,EFFECT_STR_BOOST,10+(getAbyssiteTotal(player,"FURTHERANCE") *10),0,0);
        player:addStatusEffectEx(EFFECT_ABYSSEA_DEX,EFFECT_DEX_BOOST,10+(getAbyssiteTotal(player,"FURTHERANCE") *10),0,0);
        player:addStatusEffectEx(EFFECT_ABYSSEA_VIT,EFFECT_VIT_BOOST,10+(getAbyssiteTotal(player,"FURTHERANCE") *10),0,0);
        player:addStatusEffectEx(EFFECT_ABYSSEA_AGI,EFFECT_AGI_BOOST,10+(getAbyssiteTotal(player,"FURTHERANCE") *10),0,0);
        player:addStatusEffectEx(EFFECT_ABYSSEA_INT,EFFECT_INT_BOOST,10+(getAbyssiteTotal(player,"FURTHERANCE") *10),0,0);
        player:addStatusEffectEx(EFFECT_ABYSSEA_MND,EFFECT_MND_BOOST,10+(getAbyssiteTotal(player,"FURTHERANCE") *10),0,0);
        player:addStatusEffectEx(EFFECT_ABYSSEA_CHR,EFFECT_CHR_BOOST,10+(getAbyssiteTotal(player,"FURTHERANCE") *10),0,0);
        player:delCurrency("cruor", 470);
    else
        prospectorEventFinish(player, option);
    end
end;