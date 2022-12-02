function Trig_____________________________________002_____________________u_Func007001 takes nothing returns boolean
    return ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == false )
endfunction

function Trig_____________________________________002_____________________u_Func007002001 takes nothing returns boolean
    return ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_STRUCTURE) == false )
endfunction

function Trig_____________________________________002_____________________u_Func007002002 takes nothing returns boolean
    return ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_MECHANICAL) == false )
endfunction

function Trig_____________________________________002_____________________u_Func007002 takes nothing returns boolean
    return GetBooleanAnd(Trig_____________________________________002_____________________u_Func007002001(), Trig_____________________________________002_____________________u_Func007002002())
endfunction

function Trig_____________________________________002_____________________u_Conditions takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A02I', GetKillingUnitBJ()) == 1 ) ) then
        return false
    endif
    if ( not GetBooleanAnd(Trig_____________________________________002_____________________u_Func007001(), Trig_____________________________________002_____________________u_Func007002()) ) then
        return false
    endif
    return true
endfunction

function Trig_____________________________________002_____________________u_Actions takes nothing returns nothing
    set udg_Zombietarget=GetUnitLoc(GetDyingUnit())
    call CreateNUnitsAtLoc(1, 'ndmu', GetOwningPlayer(GetKillingUnitBJ()), udg_Zombietarget, bj_UNIT_FACING)
    call SetUnitAnimation(GetLastCreatedUnit(), "birth")
    call UnitApplyTimedLifeBJ(55.00, 'BTLF', GetLastCreatedUnit())
    call RemoveLocation(udg_Zombietarget)
endfunction

//===========================================================================
function InitTrig_____________________________________002_____________________u takes nothing returns nothing
    set gg_trg_____________________________________002_____________________u=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_____________________________________002_____________________u, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_____________________________________002_____________________u, Condition(function Trig_____________________________________002_____________________u_Conditions))
    call TriggerAddAction(gg_trg_____________________________________002_____________________u, function Trig_____________________________________002_____________________u_Actions)
endfunction

//===========================================================================
// Trigger: Безымянный триггер 002
//===========================================================================
function Trig_____________________________________002_Func006001 takes nothing returns boolean
    return ( GetUnitAbilityLevelSwapped('Apts', GetKillingUnitBJ()) == 1 )
endfunction

function Trig_____________________________________002_Func006002 takes nothing returns boolean
    return ( GetUnitAbilityLevelSwapped('Aap1', GetKillingUnitBJ()) == 1 )
endfunction

function Trig_____________________________________002_Conditions takes nothing returns boolean
    if ( not GetBooleanOr(Trig_____________________________________002_Func006001(), Trig_____________________________________002_Func006002()) ) then
        return false
    endif
    return true
endfunction

function Trig_____________________________________002_Actions takes nothing returns nothing
    set udg_Zombietarget=GetUnitLoc(GetDyingUnit())
    call CreateNUnitsAtLoc(1, 'nzom', GetOwningPlayer(GetKillingUnitBJ()), udg_Zombietarget, bj_UNIT_FACING)
    call SetUnitAnimation(GetLastCreatedUnit(), "birth")
    call UnitApplyTimedLifeBJ(55.00, 'BTLF', GetLastCreatedUnit())
    call RemoveLocation(udg_Zombietarget)
endfunction

//===========================================================================
function InitTrig_____________________________________002 takes nothing returns nothing
    set gg_trg_____________________________________002=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_____________________________________002, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_____________________________________002, Condition(function Trig_____________________________________002_Conditions))
    call TriggerAddAction(gg_trg_____________________________________002, function Trig_____________________________________002_Actions)
endfunction
