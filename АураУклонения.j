//===========================================================================
// Trigger: Evasion Aura
//===========================================================================
function Trig_Evasion_Aura_Func001002002 takes nothing returns boolean
    return ( UnitHasBuffBJ(GetFilterUnit(), 'B000') == true )
endfunction

function Trig_Evasion_Aura_Func002002002 takes nothing returns boolean
    return ( UnitHasBuffBJ(GetFilterUnit(), 'B000') != true )
endfunction

function Trig_Evasion_Aura_Func004Func001C takes nothing returns boolean
    if ( not ( udg_EvasionLevel == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Evasion_Aura_Func004A takes nothing returns nothing
    if ( Trig_Evasion_Aura_Func004Func001C() ) then
        call UnitRemoveAbilityBJ('A01U', GetEnumUnit())
        call UnitAddAbilityBJ('A01U', GetEnumUnit())
        call SetUnitAbilityLevelSwapped('A01T', GetEnumUnit(), 1)
        call SetPlayerAbilityAvailableBJ(false, 'A01U', GetOwningPlayer(GetEnumUnit()))
    else
        call DoNothing()
    endif
endfunction

function Trig_Evasion_Aura_Actions takes nothing returns nothing
    set udg_EvasionGroup=GetUnitsInRectMatching(GetEntireMapRect(), Condition(function Trig_Evasion_Aura_Func001002002))
    set udg_NotEvasionGroup=GetUnitsInRectMatching(GetEntireMapRect(), Condition(function Trig_Evasion_Aura_Func002002002))
    set bj_wantDestroyGroup=true
    call ForGroupBJ(udg_EvasionGroup, function Trig_Evasion_Aura_Func004A)
endfunction

//===========================================================================
function InitTrig_Evasion_Aura takes nothing returns nothing
    set gg_trg_Evasion_Aura=CreateTrigger()
    call TriggerRegisterTimerEventPeriodic(gg_trg_Evasion_Aura, 1.00)
    call TriggerAddAction(gg_trg_Evasion_Aura, function Trig_Evasion_Aura_Actions)
endfunction

//===========================================================================
// Trigger: Evasion Aura Level
//===========================================================================
function Trig_Evasion_Aura_Level_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetSummonedUnit()) == 'now3' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Evasion_Aura_Level_Actions takes nothing returns nothing
    set udg_EvasionLevel=GetUnitAbilityLevelSwapped('A01V', GetSummonedUnit())
endfunction

//===========================================================================
function InitTrig_Evasion_Aura_Level takes nothing returns nothing
    set gg_trg_Evasion_Aura_Level=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Evasion_Aura_Level, EVENT_PLAYER_UNIT_SUMMON)
    call TriggerAddCondition(gg_trg_Evasion_Aura_Level, Condition(function Trig_Evasion_Aura_Level_Conditions))
    call TriggerAddAction(gg_trg_Evasion_Aura_Level, function Trig_Evasion_Aura_Level_Actions)
endfunction
