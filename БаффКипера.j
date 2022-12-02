//===========================================================================
// Trigger: VengeanceAura
//===========================================================================
function Trig_VengeanceAura_Conditions takes nothing returns boolean
    if ( not ( GetLearnedSkillBJ() == 'AEah' ) ) then
        return false
    endif
    return true
endfunction

function Trig_VengeanceAura_Func002C takes nothing returns boolean
    if ( not ( udg_VengeanceAura == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_VengeanceAura_Func003C takes nothing returns boolean
    if ( not ( udg_VengeanceAura == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_VengeanceAura_Func004C takes nothing returns boolean
    if ( not ( udg_VengeanceAura == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_VengeanceAura_Actions takes nothing returns nothing
    set udg_VengeanceAura=GetUnitAbilityLevelSwapped('AEah', GetLearningUnit())
    if ( Trig_VengeanceAura_Func002C() ) then
        call UnitAddAbilityBJ('A029', GetTriggerUnit())
        call SetUnitAbilityLevelSwapped('A029', GetTriggerUnit(), udg_VengeanceAura)
    else
        call DoNothing()
    endif
    if ( Trig_VengeanceAura_Func003C() ) then
        call UnitAddAbilityBJ('A029', GetTriggerUnit())
        call SetUnitAbilityLevelSwapped('A029', GetTriggerUnit(), udg_VengeanceAura)
    else
        call DoNothing()
    endif
    if ( Trig_VengeanceAura_Func004C() ) then
        call UnitAddAbilityBJ('A029', GetTriggerUnit())
        call SetUnitAbilityLevelSwapped('A029', GetTriggerUnit(), udg_VengeanceAura)
    else
        call DoNothing()
    endif
endfunction

//===========================================================================
function InitTrig_VengeanceAura takes nothing returns nothing
    set gg_trg_VengeanceAura=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_VengeanceAura, EVENT_PLAYER_HERO_SKILL)
    call TriggerAddCondition(gg_trg_VengeanceAura, Condition(function Trig_VengeanceAura_Conditions))
    call TriggerAddAction(gg_trg_VengeanceAura, function Trig_VengeanceAura_Actions)
endfunction

//===========================================================================
// Trigger: Tranquility Arson
//===========================================================================
function Trig_Tranquility_Arson_Func001Func003Func001C takes nothing returns boolean
    if ( not ( UnitHasBuffBJ(GetEnumUnit(), 'B004') == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_Tranquility_Arson_Func001Func003A takes nothing returns nothing
    if ( Trig_Tranquility_Arson_Func001Func003Func001C() ) then
        call UnitRemoveBuffBJ('B004', GetEnumUnit())
    else
        call DoNothing()
    endif
endfunction

function Trig_Tranquility_Arson_Func001C takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'AEtq' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Tranquility_Arson_Actions takes nothing returns nothing
    if ( Trig_Tranquility_Arson_Func001C() ) then
        set bj_wantDestroyGroup=true
        call ForGroupBJ(GetUnitsInRangeOfLocAll(900.00, GetUnitLoc(GetSpellAbilityUnit())), function Trig_Tranquility_Arson_Func001Func003A)
    else
        call DoNothing()
    endif
endfunction

//===========================================================================
function InitTrig_Tranquility_Arson takes nothing returns nothing
    set gg_trg_Tranquility_Arson=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Tranquility_Arson, EVENT_PLAYER_UNIT_SPELL_CAST)
    call TriggerAddAction(gg_trg_Tranquility_Arson, function Trig_Tranquility_Arson_Actions)
endfunction
//===========================================================================
// Trigger: Cast
//===========================================================================
function Trig_Cast_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A00N' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Cast_Func002Func002Func001C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A00N', GetTriggerUnit()) == 1 ) ) then
        return false
    endif
    if ( not ( IsUnitType(GetEnumUnit(), UNIT_TYPE_STRUCTURE) == true ) ) then
        return false
    endif
    if ( not ( IsUnitAlly(GetEnumUnit(), GetOwningPlayer(GetEnumUnit())) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_Cast_Func002Func002Func002C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A00N', GetTriggerUnit()) == 2 ) ) then
        return false
    endif
    if ( not ( IsUnitType(GetEnumUnit(), UNIT_TYPE_STRUCTURE) == true ) ) then
        return false
    endif
    if ( not ( IsUnitAlly(GetEnumUnit(), GetOwningPlayer(GetEnumUnit())) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_Cast_Func002Func002Func003C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A00N', GetTriggerUnit()) == 3 ) ) then
        return false
    endif
    if ( not ( IsUnitType(GetEnumUnit(), UNIT_TYPE_STRUCTURE) == true ) ) then
        return false
    endif
    if ( not ( IsUnitAlly(GetEnumUnit(), GetOwningPlayer(GetEnumUnit())) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_Cast_Func002Func002A takes nothing returns nothing
    if ( Trig_Cast_Func002Func002Func001C() ) then
        call SetUnitLifeBJ(GetEnumUnit(), ( GetUnitStateSwap(UNIT_STATE_LIFE, GetEnumUnit()) + 150.00 ))
    else
        call DoNothing()
    endif
    if ( Trig_Cast_Func002Func002Func002C() ) then
        call SetUnitLifeBJ(GetEnumUnit(), ( GetUnitStateSwap(UNIT_STATE_LIFE, GetEnumUnit()) + 250.00 ))
    else
        call DoNothing()
    endif
    if ( Trig_Cast_Func002Func002Func003C() ) then
        call SetUnitLifeBJ(GetEnumUnit(), ( GetUnitStateSwap(UNIT_STATE_LIFE, GetEnumUnit()) + 300.00 ))
    else
        call DoNothing()
    endif
endfunction

function Trig_Cast_Func002C takes nothing returns boolean
    return true
endfunction

function Trig_Cast_Func003A takes nothing returns nothing
    call DestructableRestoreLife(GetEnumDestructable(), GetDestructableMaxLife(GetEnumDestructable()), true)
endfunction

function Trig_Cast_Actions takes nothing returns nothing
    set udg_TargetLoc=GetSpellTargetLoc()
    if ( Trig_Cast_Func002C() ) then
        set bj_wantDestroyGroup=true
        call ForGroupBJ(GetUnitsInRangeOfLocAll(300.00, udg_TargetLoc), function Trig_Cast_Func002Func002A)
    else
    endif
    call EnumDestructablesInCircleBJ(300.00, udg_TargetLoc, function Trig_Cast_Func003A)
    call RemoveLocation(udg_TargetLoc)
endfunction

//===========================================================================
function InitTrig_Cast takes nothing returns nothing
    set gg_trg_Cast=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Cast, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Cast, Condition(function Trig_Cast_Conditions))
    call TriggerAddAction(gg_trg_Cast, function Trig_Cast_Actions)
endfunction
