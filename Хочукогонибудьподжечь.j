//===========================================================================
// Trigger: Arson
//===========================================================================
function Trig_Arson_Func002Func003Func001C takes nothing returns boolean
    if ( not ( UnitHasBuffBJ(GetEnumUnit(), 'B004') == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_Arson_Func002Func003A takes nothing returns nothing
    if ( Trig_Arson_Func002Func003Func001C() ) then
        call UnitRemoveBuffBJ('B004', GetEnumUnit())
    else
        call DoNothing()
    endif
endfunction

function Trig_Arson_Func002Func004001001 takes nothing returns boolean
    return ( GetSpellAbilityId() == 'AHbz' )
endfunction

function Trig_Arson_Func002Func004001002 takes nothing returns boolean
    return ( GetSpellAbilityId() == 'AUcs' )
endfunction

function Trig_Arson_Func002Func004001 takes nothing returns boolean
    return GetBooleanOr(Trig_Arson_Func002Func004001001(), Trig_Arson_Func002Func004001002())
endfunction

function Trig_Arson_Func002Func004002001 takes nothing returns boolean
    return ( GetSpellAbilityId() == 'A00N' )
endfunction

function Trig_Arson_Func002Func004002002 takes nothing returns boolean
    return ( GetSpellAbilityId() == 'AOsh' )
endfunction

function Trig_Arson_Func002Func004002 takes nothing returns boolean
    return GetBooleanOr(Trig_Arson_Func002Func004002001(), Trig_Arson_Func002Func004002002())
endfunction

function Trig_Arson_Func002C takes nothing returns boolean
    if ( not GetBooleanOr(Trig_Arson_Func002Func004001(), Trig_Arson_Func002Func004002()) ) then
        return false
    endif
    return true
endfunction

function Trig_Arson_Actions takes nothing returns nothing
    set udg_Arsonnew=GetSpellTargetLoc()
    if ( Trig_Arson_Func002C() ) then
        set bj_wantDestroyGroup=true
        call ForGroupBJ(GetUnitsInRangeOfLocAll(300.00, udg_Arsonnew), function Trig_Arson_Func002Func003A)
    else
        call DoNothing()
    endif
endfunction

//===========================================================================
function InitTrig_Arson takes nothing returns nothing
    set gg_trg_Arson=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Arson, EVENT_PLAYER_UNIT_SPELL_CAST)
    call TriggerAddAction(gg_trg_Arson, function Trig_Arson_Actions)
endfunction
