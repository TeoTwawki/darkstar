-----------------------------------
-- Area: Abyssea-Attohwa
--  MOB: Murrain Chigoe
-- Note: This mob does not need chigoe mixin
-- TODO: En-Disease
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onCriticalHit(mob)
    if mob:getHP() > 0 then
        mob:setMobMod(dsp.mobMod.EXP_BONUS, -100)
        mob:setHP(0)
    end
end

function onWeaponskillHit(mob, attacker, weaponskill)
    if mob:getHP() > 0 then
        mob:setMobMod(dsp.mobMod.EXP_BONUS, -100)
        mob:setHP(0)
    end
end

function onMobDeath(mob, player, isKiller)
end