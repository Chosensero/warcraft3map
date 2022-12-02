//===========================================================================
// Trigger: Warden
//===========================================================================
function Trig_Warden_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A01Z' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Warden_Func003C takes nothing returns boolean
    if ( not ( GetTimeOfDay() == 6.00 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Warden_Actions takes nothing returns nothing
    call UnitAddAbilityBJ('Sshm', GetTriggerUnit())
    call BlzUnitHideAbility(GetTriggerUnit(), 'Sshm', true)
    if ( Trig_Warden_Func003C() ) then
        call UnitRemoveAbilityBJ('Sshm', GetTriggerUnit())
    else
        call DoNothing()
    endif
endfunction

//===========================================================================
function InitTrig_Warden takes nothing returns nothing
    set gg_trg_Warden=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Warden, EVENT_PLAYER_UNIT_SPELL_FINISH)
    call TriggerAddCondition(gg_trg_Warden, Condition(function Trig_Warden_Conditions))
    call TriggerAddAction(gg_trg_Warden, function Trig_Warden_Actions)
endfunction

//===========================================================================
// Trigger: Watchers
//===========================================================================
function Trig_Watchers_Conditions takes nothing returns boolean
    if ( not ( IsUnitEnemy(GetTriggerUnit(), GetOwningPlayer(GetAttacker())) == true ) ) then
        return false
    endif
    if ( not ( GetUnitAbilityLevelSwapped('A01X', GetAttacker()) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Watchers_Func002Func001C takes nothing returns boolean
    if ( not ( IsUnitAlly(GetEnumUnit(), GetOwningPlayer(GetAttacker())) == true ) ) then
        return false
    endif
    if ( not ( GetUnitLifePercent(GetEnumUnit()) < 100.00 ) ) then
        return false
    endif
    if ( not ( IsUnitType(GetEnumUnit(), UNIT_TYPE_STRUCTURE) == false ) ) then
        return false
    endif
    if ( not ( IsUnitType(GetEnumUnit(), UNIT_TYPE_MECHANICAL) == false ) ) then
        return false
    endif
    if ( not ( IsUnitAliveBJ(GetEnumUnit()) == true ) ) then
        return false
    endif
    if ( not ( GetOwningPlayer(GetEnumUnit()) != Player(PLAYER_NEUTRAL_PASSIVE) ) ) then
        return false
    endif
    return true
endfunction

function Trig_Watchers_Func002A takes nothing returns nothing
    if ( Trig_Watchers_Func002Func001C() ) then
        call SetUnitLifeBJ(GetEnumUnit(), ( GetUnitStateSwap(UNIT_STATE_LIFE, GetEnumUnit()) + 5.00 ))
        call AddSpecialEffectTargetUnitBJ("origin", GetEnumUnit(), "Abilities\\Spells\\Human\\Heal\\HealTarget.mdl")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
    else
        call DoNothing()
    endif
endfunction

function Trig_Watchers_Actions takes nothing returns nothing
    set bj_wantDestroyGroup=true
    call ForGroupBJ(GetUnitsInRangeOfLocAll(700.00, GetUnitLoc(GetAttacker())), function Trig_Watchers_Func002A)
endfunction

//===========================================================================
function InitTrig_Watchers takes nothing returns nothing
    set gg_trg_Watchers=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Watchers, EVENT_PLAYER_UNIT_ATTACKED)
    call TriggerAddCondition(gg_trg_Watchers, Condition(function Trig_Watchers_Conditions))
    call TriggerAddAction(gg_trg_Watchers, function Trig_Watchers_Actions)
endfunction
