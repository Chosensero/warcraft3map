function Trig_False_Promise_Config_Actions takes nothing returns nothing
    call InitHashtableBJ()
    set udg_FalsePromise_Hash=GetLastCreatedHashtableBJ()
    set udg_FalsePromise_Ability='A02N'
    set udg_FalsePromise_Buff='B007'
    set udg_FalsePromise_Duration[1]=15.00
    set udg_FalsePromise_Duration[2]=9.00
    set udg_FalsePromise_Duration[3]=10.00
    set udg_FalsePromise_HealMultiplier[1]=3.00
    set udg_FalsePromise_HealMultiplier[2]=2.50
    set udg_FalsePromise_HealMultiplier[3]=3.00
    set udg_FalsePromise_SFXTarget="Abilities\\Spells\\Items\\StaffOfSanctuary\\Staff_Sanctuary_Target.mdl"
    set udg_FalsePromise_SFXTarget_AP="origin"
    set udg_FalsePromise_SFXHeal="Abilities\\Spells\\Undead\\DarkRitual\\DarkRitualTarget.mdl"
    set udg_FalsePromise_SFXHeal_AP="origin"
    set udg_FalsePromise_SFXDamage="Abilities\\Spells\\Undead\\OrbOfDeath\\OrbOfDeathMissile.mdl"
    set udg_FalsePromise_SFXDamage_AP="chest"
    set udg_FalsePromise_SFXCredit="Objects\\Spawnmodels\\Other\\ToonBoom\\ToonBoom.mdl"
    set udg_FalsePromise_SFXCredit_AP="origin"
    //  
    set udg_FalsePromise_PeriodicTimer=0.03
    call TriggerRegisterTimerEventPeriodic(gg_trg_False_Promise_Loop, udg_FalsePromise_PeriodicTimer)
    set udg_FalsePromise_LoopInt=0
endfunction

//===========================================================================
function InitTrig_False_Promise_Config takes nothing returns nothing
    set gg_trg_False_Promise_Config=CreateTrigger()
    call TriggerAddAction(gg_trg_False_Promise_Config, function Trig_False_Promise_Config_Actions)
endfunction

//===========================================================================
// Trigger: False Promise Cast
//===========================================================================
function Trig_False_Promise_Cast_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == udg_FalsePromise_Ability ) ) then
        return false
    endif
    return true
endfunction

function Trig_False_Promise_Cast_Func003Func009C takes nothing returns boolean
    if ( not ( udg_FalsePromise_SpellCount == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_False_Promise_Cast_Func003Func011C takes nothing returns boolean
    if ( not ( udg_FalsePromise_RecycledSize == 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_False_Promise_Cast_Func003C takes nothing returns boolean
    if ( not ( UnitHasBuffBJ(udg_FalsePromise_Unit, udg_FalsePromise_Buff) == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_False_Promise_Cast_Actions takes nothing returns nothing
    set udg_FalsePromise_Unit=GetSpellTargetUnit()
    if ( Trig_False_Promise_Cast_Func003C() ) then
        set udg_FalsePromise_SpellCount=( udg_FalsePromise_SpellCount + 1 )
        if ( Trig_False_Promise_Cast_Func003Func009C() ) then
            call EnableTrigger(gg_trg_False_Promise_Loop)
            call EnableTrigger(gg_trg_False_Promise_Damage)
        else
        if ( Trig_False_Promise_Cast_Func003Func011C() ) then
            set udg_FalsePromise_MaxIndex=( udg_FalsePromise_MaxIndex + 1 )
            set udg_FalsePromise_Spell_ID=udg_FalsePromise_MaxIndex
        else
            set udg_FalsePromise_RecycledSize=( udg_FalsePromise_RecycledSize - 1 )
            set udg_FalsePromise_Spell_ID=udg_FalsePromise_RecycledStack[udg_FalsePromise_RecycledSize]
        endif
        set udg_FalsePromise_NodeNext[udg_FalsePromise_Spell_ID]=0
        set udg_FalsePromise_NodePrev[udg_FalsePromise_Spell_ID]=udg_FalsePromise_NodePrev[0]
        set udg_FalsePromise_NodeNext[udg_FalsePromise_NodePrev[0]]=udg_FalsePromise_Spell_ID
        set udg_FalsePromise_NodePrev[0]=udg_FalsePromise_Spell_ID
        //  
        set udg_FalsePromise_Target[udg_FalsePromise_Spell_ID]=GetSpellTargetUnit()
        set udg_FalsePromise_HitPoints[udg_FalsePromise_Spell_ID]=GetUnitStateSwap(UNIT_STATE_LIFE, udg_FalsePromise_Target[udg_FalsePromise_Spell_ID])
        set udg_FalsePromise_AbilityLvl[udg_FalsePromise_Spell_ID]=GetUnitAbilityLevelSwapped(udg_FalsePromise_Ability, GetTriggerUnit())
        set udg_FalsePromise_Counter[udg_FalsePromise_Spell_ID]=0.00
        set udg_FalsePromise_CounterHeal[udg_FalsePromise_Spell_ID]=0.00
        set udg_FalsePromise_CounterDamage[udg_FalsePromise_Spell_ID]=0.00
        set udg_FalsePromise_Damage[udg_FalsePromise_Spell_ID]=0.00
        set udg_FalsePromise_DamageUnit[udg_FalsePromise_Spell_ID]=null
        set udg_FalsePromise_SpellNode[GetUnitUserData(udg_FalsePromise_Target[udg_FalsePromise_Spell_ID])]=udg_FalsePromise_Spell_ID
        //  
        call AddSpecialEffectTargetUnitBJ(udg_FalsePromise_SFXTarget_AP, udg_FalsePromise_Target[udg_FalsePromise_Spell_ID], udg_FalsePromise_SFXTarget)
        set udg_FalsePromise_TargetSFX[udg_FalsePromise_Spell_ID]=GetLastCreatedEffectBJ()
        //  
        set udg_FalsePromise_Unit=udg_FalsePromise_Target[udg_FalsePromise_Spell_ID]
        set udg_FalsePromise_AbiLvl=udg_FalsePromise_AbilityLvl[udg_FalsePromise_Spell_ID]
        set udg_FalsePromise_Event=0.00
        set udg_FalsePromise_Event=1.00
        set udg_FalsePromise_Event=0.00
    else
        set udg_FalsePromise_Spell_ID=udg_FalsePromise_SpellNode[GetUnitUserData(udg_FalsePromise_Unit)]
        set udg_FalsePromise_AbilityLvl[udg_FalsePromise_Spell_ID]=GetUnitAbilityLevelSwapped(udg_FalsePromise_Ability, GetTriggerUnit())
        set udg_FalsePromise_Counter[udg_FalsePromise_Spell_ID]=0.00
        set udg_FalsePromise_CounterHeal[udg_FalsePromise_Spell_ID]=0.00
        set udg_FalsePromise_CounterDamage[udg_FalsePromise_Spell_ID]=0.00
        set udg_FalsePromise_Damage[udg_FalsePromise_Spell_ID]=0.00
        set udg_FalsePromise_DamageUnit[udg_FalsePromise_Spell_ID]=null
    endif
endfunction

//===========================================================================
function InitTrig_False_Promise_Cast takes nothing returns nothing
    set gg_trg_False_Promise_Cast=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_False_Promise_Cast, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_False_Promise_Cast, Condition(function Trig_False_Promise_Cast_Conditions))
    call TriggerAddAction(gg_trg_False_Promise_Cast, function Trig_False_Promise_Cast_Actions)
endfunction

//===========================================================================
// Trigger: False Promise Loop
//===========================================================================
function Trig_False_Promise_Loop_Func002Func005C takes nothing returns boolean
    if ( not ( udg_FalsePromise_TempReal != udg_FalsePromise_HitPoints[udg_FalsePromise_Spell_ID] ) ) then
        return false
    endif
    return true
endfunction

function Trig_False_Promise_Loop_Func002Func009Func001C takes nothing returns boolean
    if ( ( UnitHasBuffBJ(udg_FalsePromise_Target[udg_FalsePromise_Spell_ID], udg_FalsePromise_Buff) == false ) ) then
        return true
    endif
    if ( ( udg_FalsePromise_Counter[udg_FalsePromise_Spell_ID] >= udg_FalsePromise_Duration[udg_FalsePromise_AbilityLvl[udg_FalsePromise_Spell_ID]] ) ) then
        return true
    endif
    return false
endfunction

function Trig_False_Promise_Loop_Func002Func009Func005C takes nothing returns boolean
    if ( not ( udg_FalsePromise_CounterDamage[udg_FalsePromise_Spell_ID] > ( udg_FalsePromise_CounterHeal[udg_FalsePromise_Spell_ID] + udg_FalsePromise_HitPoints[udg_FalsePromise_Spell_ID] ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_False_Promise_Loop_Func002Func009Func021C takes nothing returns boolean
    if ( not ( udg_FalsePromise_SpellCount == 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_False_Promise_Loop_Func002Func009C takes nothing returns boolean
    if ( not Trig_False_Promise_Loop_Func002Func009Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_False_Promise_Loop_Actions takes nothing returns nothing
    set udg_FalsePromise_Spell_ID=0
    set udg_FalsePromise_LoopInt=1
    loop
        exitwhen udg_FalsePromise_LoopInt > udg_FalsePromise_SpellCount
        set udg_FalsePromise_Spell_ID=udg_FalsePromise_NodeNext[udg_FalsePromise_Spell_ID]
        set udg_FalsePromise_TempReal=GetUnitStateSwap(UNIT_STATE_LIFE, udg_FalsePromise_Target[udg_FalsePromise_Spell_ID])
        if ( Trig_False_Promise_Loop_Func002Func005C() ) then
            call SetUnitLifeBJ(udg_FalsePromise_Target[udg_FalsePromise_Spell_ID], udg_FalsePromise_HitPoints[udg_FalsePromise_Spell_ID])
            set udg_FalsePromise_CounterHeal[udg_FalsePromise_Spell_ID]=( udg_FalsePromise_CounterHeal[udg_FalsePromise_Spell_ID] + ( udg_FalsePromise_TempReal - udg_FalsePromise_HitPoints[udg_FalsePromise_Spell_ID] ) )
        else
        endif
        set udg_FalsePromise_Counter[udg_FalsePromise_Spell_ID]=( udg_FalsePromise_Counter[udg_FalsePromise_Spell_ID] + udg_FalsePromise_PeriodicTimer )
        if ( Trig_False_Promise_Loop_Func002Func009C() ) then
            call DestroyEffectBJ(udg_FalsePromise_TargetSFX[udg_FalsePromise_Spell_ID])
            call UnitRemoveBuffBJ(udg_FalsePromise_Buff, udg_FalsePromise_Target[udg_FalsePromise_Spell_ID])
            if ( Trig_False_Promise_Loop_Func002Func009Func005C() ) then
                call SetUnitLifeBJ(udg_FalsePromise_Target[udg_FalsePromise_Spell_ID], 1.00)
                call UnitDamageTargetBJ(udg_FalsePromise_DamageUnit[udg_FalsePromise_Spell_ID], udg_FalsePromise_Target[udg_FalsePromise_Spell_ID], udg_FalsePromise_HitPoints[udg_FalsePromise_Spell_ID], ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL)
                call AddSpecialEffectTargetUnitBJ(udg_FalsePromise_SFXDamage_AP, udg_FalsePromise_Target[udg_FalsePromise_Spell_ID], udg_FalsePromise_SFXDamage)
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
                call AddSpecialEffectTargetUnitBJ(udg_FalsePromise_SFXCredit_AP, udg_FalsePromise_DamageUnit[udg_FalsePromise_Spell_ID], udg_FalsePromise_SFXCredit)
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
            else
                call SetUnitLifeBJ(udg_FalsePromise_Target[udg_FalsePromise_Spell_ID], ( udg_FalsePromise_HitPoints[udg_FalsePromise_Spell_ID] + ( udg_FalsePromise_CounterHeal[udg_FalsePromise_Spell_ID] * udg_FalsePromise_HealMultiplier[udg_FalsePromise_AbilityLvl[udg_FalsePromise_Spell_ID]] ) ))
                call AddSpecialEffectTargetUnitBJ(udg_FalsePromise_SFXHeal_AP, udg_FalsePromise_Target[udg_FalsePromise_Spell_ID], udg_FalsePromise_SFXHeal)
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
            endif
            set udg_FalsePromise_Unit_ID=GetHandleId(udg_FalsePromise_Target[udg_FalsePromise_Spell_ID])
            call FlushChildHashtableBJ(udg_FalsePromise_Unit_ID, udg_FalsePromise_Hash)
            //  
            set udg_FalsePromise_Unit=udg_FalsePromise_Target[udg_FalsePromise_Spell_ID]
            set udg_FalsePromise_AbiLvl=udg_FalsePromise_AbilityLvl[udg_FalsePromise_Spell_ID]
            set udg_FalsePromise_Event=0.00
            set udg_FalsePromise_Event=2.00
            set udg_FalsePromise_Event=0.00
            //  
            set udg_FalsePromise_RecycledStack[udg_FalsePromise_RecycledSize]=udg_FalsePromise_Spell_ID
            set udg_FalsePromise_RecycledSize=( udg_FalsePromise_RecycledSize + 1 )
            set udg_FalsePromise_NodeNext[udg_FalsePromise_NodePrev[udg_FalsePromise_Spell_ID]]=udg_FalsePromise_NodeNext[udg_FalsePromise_Spell_ID]
            set udg_FalsePromise_NodePrev[udg_FalsePromise_NodeNext[udg_FalsePromise_Spell_ID]]=udg_FalsePromise_NodePrev[udg_FalsePromise_Spell_ID]
            //  
            set udg_FalsePromise_SpellCount=( udg_FalsePromise_SpellCount - 1 )
            if ( Trig_False_Promise_Loop_Func002Func009Func021C() ) then
                call DisableTrigger(gg_trg_False_Promise_Loop)
                call DisableTrigger(gg_trg_False_Promise_Damage)
            else
            endif
        else
        endif
        set udg_FalsePromise_LoopInt=udg_FalsePromise_LoopInt + 1
    endloop
endfunction

//===========================================================================
function InitTrig_False_Promise_Loop takes nothing returns nothing
    set gg_trg_False_Promise_Loop=CreateTrigger()
    call DisableTrigger(gg_trg_False_Promise_Loop)
    call TriggerAddAction(gg_trg_False_Promise_Loop, function Trig_False_Promise_Loop_Actions)
endfunction

//===========================================================================
// Trigger: False Promise Damage
//===========================================================================
function Trig_False_Promise_Damage_Conditions takes nothing returns boolean
    if ( not ( UnitHasBuffBJ(udg_DamageEventTarget, udg_FalsePromise_Buff) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_False_Promise_Damage_Func005C takes nothing returns boolean
    if ( not ( HaveSavedValue(udg_FalsePromise_TempInt, bj_HASHTABLE_REAL, udg_FalsePromise_Unit_ID, udg_FalsePromise_Hash) == false ) ) then
        return false
    endif
    return true
endfunction

function Trig_False_Promise_Damage_Func010C takes nothing returns boolean
    if ( not ( udg_FalsePromise_TempReal >= udg_FalsePromise_Damage[udg_FalsePromise_Spell_ID] ) ) then
        return false
    endif
    return true
endfunction

function Trig_False_Promise_Damage_Actions takes nothing returns nothing
    set udg_DamageEventAmount=0.00
    set udg_FalsePromise_Unit_ID=GetHandleId(udg_DamageEventTarget)
    set udg_FalsePromise_TempInt=GetUnitUserData(udg_DamageEventSource)
    if ( Trig_False_Promise_Damage_Func005C() ) then
        set udg_FalsePromise_TempReal=udg_DamageEventPrevAmt
    else
        set udg_FalsePromise_TempReal=( LoadRealBJ(udg_FalsePromise_TempInt, udg_FalsePromise_Unit_ID, udg_FalsePromise_Hash) + udg_DamageEventPrevAmt )
    endif
    call SaveRealBJ(udg_FalsePromise_TempReal, udg_FalsePromise_TempInt, udg_FalsePromise_Unit_ID, udg_FalsePromise_Hash)
    set udg_FalsePromise_Spell_ID=udg_FalsePromise_SpellNode[GetUnitUserData(udg_DamageEventTarget)]
    if ( Trig_False_Promise_Damage_Func010C() ) then
        set udg_FalsePromise_Damage[udg_FalsePromise_Spell_ID]=udg_FalsePromise_TempReal
        set udg_FalsePromise_DamageUnit[udg_FalsePromise_Spell_ID]=udg_DamageEventSource
    else
    endif
    set udg_FalsePromise_CounterDamage[udg_FalsePromise_Spell_ID]=( udg_FalsePromise_CounterDamage[udg_FalsePromise_Spell_ID] + udg_DamageEventPrevAmt )
endfunction

//===========================================================================
function InitTrig_False_Promise_Damage takes nothing returns nothing
    set gg_trg_False_Promise_Damage=CreateTrigger()
    call DisableTrigger(gg_trg_False_Promise_Damage)
    call TriggerRegisterVariableEvent(gg_trg_False_Promise_Damage, "udg_DamageModifierEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_False_Promise_Damage, Condition(function Trig_False_Promise_Damage_Conditions))
    call TriggerAddAction(gg_trg_False_Promise_Damage, function Trig_False_Promise_Damage_Actions)
endfunction

//===========================================================================
// Trigger: Ult2
//===========================================================================

function Trig_Ult2_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A02M' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Ult2_Func002002003001 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_GROUND) == true )
endfunction

function Trig_Ult2_Func002002003002 takes nothing returns boolean
    return ( IsUnitAlly(GetFilterUnit(), GetOwningPlayer(GetTriggerUnit())) == true )
endfunction

function Trig_Ult2_Func002002003 takes nothing returns boolean
    return GetBooleanAnd(Trig_Ult2_Func002002003001(), Trig_Ult2_Func002002003002())
endfunction

function Trig_Ult2_Func004A takes nothing returns nothing
    set udg_RecruitPoint=GetUnitLoc(GetEnumUnit())
    call CreateNUnitsAtLoc(1, 'u00H', GetOwningPlayer(GetTriggerUnit()), udg_RecruitPoint, bj_UNIT_FACING)
    call UnitAddAbilityBJ('A02N', GetLastCreatedUnit())
    call IssueTargetOrderBJ(GetLastCreatedUnit(), "doom", GetEnumUnit())
    call UnitApplyTimedLifeBJ(1.00, 'BTLF', GetLastCreatedUnit())
    call RemoveLocation(udg_RecruitPoint)
endfunction

function Trig_Ult2_Actions takes nothing returns nothing
    set udg_RecruitPoint=GetSpellTargetLoc()
    set udg_RecruitGroup=GetUnitsInRangeOfLocMatching(500.00, udg_RecruitPoint, Condition(function Trig_Ult2_Func002002003))
    call RemoveLocation(udg_RecruitPoint)
    call ForGroupBJ(udg_RecruitGroup, function Trig_Ult2_Func004A)
endfunction

//===========================================================================
function InitTrig_Ult2 takes nothing returns nothing
    set gg_trg_Ult2=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Ult2, EVENT_PLAYER_UNIT_SPELL_CAST)
    call TriggerAddCondition(gg_trg_Ult2, Condition(function Trig_Ult2_Conditions))
    call TriggerAddAction(gg_trg_Ult2, function Trig_Ult2_Actions)
endfunction