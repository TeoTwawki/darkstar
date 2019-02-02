---------------------------------------------
-- Elemental Sforzo
---------------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    MobBuffMove(mob, dsp.effect.ELEMENTAL_SFORZO, 1, 0, 30)
    skill:setMsg(dsp.msg.basic.USES)

    return dsp.effect.ELEMENTAL_SFORZO
end
