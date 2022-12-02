//===========================================================================
// Trigger: PierceIf
//===========================================================================
function Trig_PierceIf_Conditions takes nothing returns boolean
    if ( not ( GetResearched() == 'R000' ) ) then
        return false
    endif
    if ( not ( GetPlayerTechCountSimple('Rovs', GetOwningPlayer(GetTriggerUnit())) == 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_PierceIf_Actions takes nothing returns nothing
    call SetPlayerTechMaxAllowedSwap('R008', 1, GetOwningPlayer(GetTriggerUnit()))
    call SetPlayerTechMaxAllowedSwap('Rovs', 0, GetOwningPlayer(GetTriggerUnit()))
endfunction

//===========================================================================
function InitTrig_PierceIf takes nothing returns nothing
    set gg_trg_PierceIf=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_PierceIf, EVENT_PLAYER_UNIT_RESEARCH_FINISH)
    call TriggerAddCondition(gg_trg_PierceIf, Condition(function Trig_PierceIf_Conditions))
    call TriggerAddAction(gg_trg_PierceIf, function Trig_PierceIf_Actions)
endfunction

//===========================================================================
// Trigger: PierceUp
//===========================================================================
function Trig_PierceUp_Conditions takes nothing returns boolean
    if ( not ( GetResearched() == 'R000' ) ) then
        return false
    endif
    return true
endfunction

function Trig_PierceUp_Func001C takes nothing returns boolean
    if ( not ( GetPlayerTechCountSimple('Rovs', GetOwningPlayer(GetTriggerUnit())) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_PierceUp_Actions takes nothing returns nothing
    if ( Trig_PierceUp_Func001C() ) then
        call SetPlayerTechMaxAllowedSwap('R008', 1, GetOwningPlayer(GetTriggerUnit()))
        call SetPlayerTechResearchedSwap('R008', 1, GetOwningPlayer(GetTriggerUnit()))
    else
        call DoNothing()
    endif
endfunction

//===========================================================================
function InitTrig_PierceUp takes nothing returns nothing
    set gg_trg_PierceUp=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_PierceUp, EVENT_PLAYER_UNIT_RESEARCH_FINISH)
    call TriggerAddCondition(gg_trg_PierceUp, Condition(function Trig_PierceUp_Conditions))
    call TriggerAddAction(gg_trg_PierceUp, function Trig_PierceUp_Actions)
endfunction

//===========================================================================
// Trigger: Pierce
//===========================================================================
function Trig_Pierce_Conditions takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A027', GetAttacker()) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Pierce_Func003C takes nothing returns boolean
    if ( not ( udg_Piercechance <= 6 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Pierce_Actions takes nothing returns nothing
    set udg_TempPiercePoint=GetUnitLoc(GetTriggerUnit())
    set udg_Piercechance=GetRandomInt(1, 25)
    if ( Trig_Pierce_Func003C() ) then
        call CreateNUnitsAtLoc(1, 'u00F', GetOwningPlayer(GetAttacker()), udg_TempPiercePoint, bj_UNIT_FACING)
        call UnitAddAbilityBJ('A028', GetLastCreatedUnit())
        call IssueTargetOrderBJ(GetLastCreatedUnit(), "cripple", GetAttackedUnitBJ())
        call UnitApplyTimedLifeBJ(1.00, 'BTLF', GetLastCreatedUnit())
         call RemoveLocation(udg_TempPiercePoint)
    else
        call DoNothing()
    endif
endfunction

//===========================================================================
function InitTrig_Pierce takes nothing returns nothing
    set gg_trg_Pierce=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Pierce, EVENT_PLAYER_UNIT_ATTACKED)
    call TriggerAddCondition(gg_trg_Pierce, Condition(function Trig_Pierce_Conditions))
    call TriggerAddAction(gg_trg_Pierce, function Trig_Pierce_Actions)
endfunction
