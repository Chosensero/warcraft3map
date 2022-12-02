//===========================================================================
// Trigger: Ritual
//===========================================================================
function Trig_Ritual_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A02B' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Ritual_Actions takes nothing returns nothing
    call KillUnit(GetTriggerUnit())
endfunction

//===========================================================================
function InitTrig_Ritual takes nothing returns nothing
    set gg_trg_Ritual=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Ritual, EVENT_PLAYER_UNIT_SPELL_FINISH)
    call TriggerAddCondition(gg_trg_Ritual, Condition(function Trig_Ritual_Conditions))
    call TriggerAddAction(gg_trg_Ritual, function Trig_Ritual_Actions)
endfunction