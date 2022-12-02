//===========================================================================
// Trigger: Безымянный триггер 006
//===========================================================================
function Trig_____________________________________006_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTriggerUnit()) == 'h007' ) ) then
        return false
    endif
    return true
endfunction

function Trig_____________________________________006_Actions takes nothing returns nothing
    call SetUnitAnimation(GetTriggerUnit(), "death alternate")
endfunction

//===========================================================================
function InitTrig_____________________________________006 takes nothing returns nothing
    set gg_trg_____________________________________006=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_____________________________________006, EVENT_PLAYER_UNIT_SPELL_FINISH)
    call TriggerAddCondition(gg_trg_____________________________________006, Condition(function Trig_____________________________________006_Conditions))
    call TriggerAddAction(gg_trg_____________________________________006, function Trig_____________________________________006_Actions)
endfunction
