
//===========================================================================
// Trigger: RecruitGroup
//===========================================================================
function Trig_RecruitGroup_Func001002002 takes nothing returns boolean
    return ( UnitHasBuffBJ(GetFilterUnit(), 'B005') == true )
endfunction

function Trig_RecruitGroup_Func002002002 takes nothing returns boolean
    return ( UnitHasBuffBJ(GetFilterUnit(), 'B005') == false )
endfunction

function Trig_RecruitGroup_Func004Func001Func002003001003 takes nothing returns boolean
    return ( IsUnitAlly(GetFilterUnit(), GetOwningPlayer(GetEnumUnit())) == true )
endfunction

function Trig_RecruitGroup_Func004Func001C takes nothing returns boolean
    return true
endfunction

function Trig_RecruitGroup_Func004A takes nothing returns nothing
    if ( Trig_RecruitGroup_Func004Func001C() ) then
        call IssueTargetOrderBJ(GetEnumUnit(), "attack", GroupPickRandomUnit(GetUnitsInRangeOfLocMatching(512, GetUnitLoc(GetEnumUnit()), Condition(function Trig_RecruitGroup_Func004Func001Func002003001003))))
    else
        call DoNothing()
    endif
endfunction

function Trig_RecruitGroup_Actions takes nothing returns nothing
    set udg_RecruitGroup=GetUnitsInRectMatching(GetEntireMapRect(), Condition(function Trig_RecruitGroup_Func001002002))
    set udg_NotRecruit=GetUnitsInRectMatching(GetEntireMapRect(), Condition(function Trig_RecruitGroup_Func002002002))
    set bj_wantDestroyGroup=true
    call ForGroupBJ(udg_RecruitGroup, function Trig_RecruitGroup_Func004A)
endfunction

//===========================================================================
function InitTrig_RecruitGroup takes nothing returns nothing
    set gg_trg_RecruitGroup=CreateTrigger()
    call TriggerRegisterTimerEventPeriodic(gg_trg_RecruitGroup, 1.00)
    call TriggerAddAction(gg_trg_RecruitGroup, function Trig_RecruitGroup_Actions)
endfunction

//===========================================================================
// Trigger: Безымянный триггер 001
//===========================================================================
function Trig_____________________________________001_Func001001 takes nothing returns boolean
    return ( GetPlayerController(GetOwningPlayer(GetTriggerUnit())) == MAP_CONTROL_CREEP )
endfunction

function Trig_____________________________________001_Func001002 takes nothing returns boolean
    return ( GetPlayerController(GetOwningPlayer(GetTriggerUnit())) == MAP_CONTROL_COMPUTER )
endfunction

function Trig_____________________________________001_Conditions takes nothing returns boolean
    if ( not GetBooleanOr(Trig_____________________________________001_Func001001(), Trig_____________________________________001_Func001002()) ) then
        return false
    endif
    return true
endfunction

function Trig_____________________________________001_Func002Func003001 takes nothing returns boolean
    return ( IsUnitAlly(GetAttacker(), GetOwningPlayer(GetAttackedUnitBJ())) == true )
endfunction

function Trig_____________________________________001_Func002Func003002 takes nothing returns boolean
    return ( GetUnitLifePercent(GetAttackedUnitBJ()) <= 35.00 )
endfunction

function Trig_____________________________________001_Func002C takes nothing returns boolean
    if ( not GetBooleanAnd(Trig_____________________________________001_Func002Func003001(), Trig_____________________________________001_Func002Func003002()) ) then
        return false
    endif
    return true
endfunction

function Trig_____________________________________001_Actions takes nothing returns nothing
    if ( Trig_____________________________________001_Func002C() ) then
        call IssueImmediateOrderBJ(GetAttacker(), "stop")
    else
        call DoNothing()
    endif
endfunction

//===========================================================================
function InitTrig_____________________________________001 takes nothing returns nothing
    set gg_trg_____________________________________001=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_____________________________________001, EVENT_PLAYER_UNIT_ATTACKED)
    call TriggerAddCondition(gg_trg_____________________________________001, Condition(function Trig_____________________________________001_Conditions))
    call TriggerAddAction(gg_trg_____________________________________001, function Trig_____________________________________001_Actions)
endfunction

