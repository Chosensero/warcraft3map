//===========================================================================
// Trigger: Damage Tag
//===========================================================================
function Trig_Damage_Tag_Func001Func001Func001Func001Func001C takes nothing returns boolean
    if ( not ( udg_IsDamageSpell == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_Damage_Tag_Func001Func001Func001Func001C takes nothing returns boolean
    if ( not ( udg_DamageEventType == udg_DamageTypeReduced ) ) then
        return false
    endif
    return true
endfunction

function Trig_Damage_Tag_Func001Func001Func001C takes nothing returns boolean
    if ( not ( udg_DamageEventType == udg_DamageTypeHeal ) ) then
        return false
    endif
    return true
endfunction

function Trig_Damage_Tag_Func001Func001C takes nothing returns boolean
    if ( not ( udg_DamageEventType == udg_DamageTypeCriticalStrike ) ) then
        return false
    endif
    return true
endfunction

function Trig_Damage_Tag_Func001C takes nothing returns boolean
    if ( not ( udg_DamageEventType == udg_DamageTypeBlocked ) ) then
        return false
    endif
    return true
endfunction

function Trig_Damage_Tag_Func004003001 takes nothing returns boolean
    return ( IsUnitVisible(GetTriggerUnit(), GetFilterPlayer()) == true )
endfunction

function Trig_Damage_Tag_Actions takes nothing returns nothing
    if ( Trig_Damage_Tag_Func001C() ) then
        call CreateTextTagUnitBJ(( "блокировано!" ), udg_DamageEventTarget, 50.00, 10.00, 0.00, 100.00, 100.00, 0.00)
    else
        if ( Trig_Damage_Tag_Func001Func001C() ) then
            call CreateTextTagUnitBJ(( I2S(R2I(udg_DamageEventAmount)) + "!" ), udg_DamageEventTarget, 50.00, 10.00, 90.00, 0.00, 0.00, 0)
        else
            if ( Trig_Damage_Tag_Func001Func001Func001C() ) then
                call CreateTextTagUnitBJ(( "+" + I2S(R2I(RAbsBJ(udg_DamageEventAmount))) ), udg_DamageEventTarget, 50.00, 10.00, 0.00, 100.00, 0.00, 0)
            else
                if ( Trig_Damage_Tag_Func001Func001Func001Func001C() ) then
                    call CreateTextTagUnitBJ(( "" + I2S(R2I(udg_DamageEventAmount)) ), udg_DamageEventTarget, 50.00, 10.00, 0.00, 100.00, 100.00, 0)
                else
                    if ( Trig_Damage_Tag_Func001Func001Func001Func001Func001C() ) then
                        call CreateTextTagUnitBJ(I2S(R2I(udg_DamageEventAmount)), udg_DamageEventTarget, 50.00, 10.00, 0.00, 100.00, 100.00, 0)
                    else
                        call CreateTextTagUnitBJ(I2S(R2I(udg_DamageEventAmount)), udg_DamageEventTarget, 50.00, 10.00, 100.00, 100.00, 0.00, 0)
                    endif
                endif
            endif
        endif
    endif
    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 100.00, 45.00)
    call ShowTextTagForceBJ(false, GetLastCreatedTextTag(), GetPlayersAll())
    call ShowTextTagForceBJ(true, GetLastCreatedTextTag(), GetPlayersMatching(Condition(function Trig_Damage_Tag_Func004003001)))
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.00)
endfunction

//===========================================================================
function InitTrig_Damage_Tag takes nothing returns nothing
    set gg_trg_Damage_Tag=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_Damage_Tag, "udg_DamageEvent", EQUAL, 1.00)
    call TriggerAddAction(gg_trg_Damage_Tag, function Trig_Damage_Tag_Actions)
endfunction

//===========================================================================
// Trigger: On Death
//
// This trigger is important to show that the killer is really getting the kill
//===========================================================================
function Trig_On_Death_Func001C takes nothing returns boolean
    if ( not ( GetKillingUnitBJ() != null ) ) then
        return false
    endif
    return true
endfunction

function Trig_On_Death_Actions takes nothing returns nothing
    if ( Trig_On_Death_Func001C() ) then
        call DisplayTextToForce(GetForceOfPlayer(GetOwningPlayer(GetTriggerUnit())), ( GetUnitName(GetKillingUnitBJ()) + ( " убил(-а) " + GetUnitName(GetTriggerUnit()) ) ))
    else
    endif
endfunction

//===========================================================================
function InitTrig_On_Death takes nothing returns nothing
    set gg_trg_On_Death=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_On_Death, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddAction(gg_trg_On_Death, function Trig_On_Death_Actions)
endfunction

//===========================================================================
// Trigger: Life Drain Fix
//
// Copy this trigger into your map if you want to fix the life drain abilitity. It comes with a potential weird side-effect: if you had already cast a damage over time ability on the damage target from the damage source before life draining, it will heal off of that damage over time ability as well. Without triggering life drain completely on your own, there is no way to prevent this. However, this issue does not affect the Dark Ranger since she only has that one damage-over-time ability.
//===========================================================================
function Trig_Life_Drain_Fix_Conditions takes nothing returns boolean
    if ( not ( udg_IsDamageSpell == true ) ) then
        return false
    endif
    if ( not ( UnitHasBuffBJ(udg_DamageEventSource, 'Bdcl') == true ) ) then
        return false
    endif
    if ( not ( UnitHasBuffBJ(udg_DamageEventTarget, 'Bdtl') == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_Life_Drain_Fix_Actions takes nothing returns nothing
    call SetUnitLifeBJ(udg_DamageEventSource, ( GetUnitStateSwap(UNIT_STATE_LIFE, udg_DamageEventSource) + udg_DamageEventAmount ))
endfunction

//===========================================================================
function InitTrig_Life_Drain_Fix takes nothing returns nothing
    set gg_trg_Life_Drain_Fix=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_Life_Drain_Fix, "udg_AfterDamageEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_Life_Drain_Fix, Condition(function Trig_Life_Drain_Fix_Conditions))
    call TriggerAddAction(gg_trg_Life_Drain_Fix, function Trig_Life_Drain_Fix_Actions)
endfunction

//===========================================================================
// Trigger: Finger of Death Fix
//
// This is pretty easy to fix.
//===========================================================================
function Trig_Finger_of_Death_Fix_Conditions takes nothing returns boolean
    if ( not ( udg_IsDamageSpell == true ) ) then
        return false
    endif
    if ( not ( GetUnitCurrentOrder(udg_DamageEventSource) == String2OrderIdBJ("fingerofdeath") ) ) then
        return false
    endif
    return true
endfunction

function Trig_Finger_of_Death_Fix_Actions takes nothing returns nothing
    set udg_DamageEventType=udg_DamageTypeExplosive
endfunction

//===========================================================================
function InitTrig_Finger_of_Death_Fix takes nothing returns nothing
    set gg_trg_Finger_of_Death_Fix=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_Finger_of_Death_Fix, "udg_DamageModifierEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_Finger_of_Death_Fix, Condition(function Trig_Finger_of_Death_Fix_Conditions))
    call TriggerAddAction(gg_trg_Finger_of_Death_Fix, function Trig_Finger_of_Death_Fix_Actions)
endfunction

//===========================================================================
// Trigger: Anti Magic Shield Fix
//
// Requires you to copy the ability "Anti-Magic Shell (Fixed)" from Object Editor into your map. AMS cannot be configured to work with a damage detection system as it will always have ambiguous results and the shield will be popped or reduce damage to 0.00 before the damage event runs, so the ability is based off of Frost Armor with its only utility being triggered.
//===========================================================================
//TESH.scrollpos=12
//TESH.alwaysfold=0
constant function GetAMSBuffId takes nothing returns integer
    return 'Bams'
endfunction

constant function GetAMSAbilId takes nothing returns integer
    return 'A002'
endfunction

constant function GetAMSShieldVal takes nothing returns real
    return 300.00
endfunction

function Trig_Anti_Magic_Shield_Fix_Actions takes nothing returns nothing
    local integer id= GetUnitUserData(udg_DamageEventTarget)
    local real shield= udg_AMSAmount[id] - udg_DamageEventAmount
    if shield <= 0.00 then
        set udg_DamageEventAmount=- shield
        set shield=0.00
        call UnitRemoveAbility(udg_DamageEventTarget, GetAMSBuffId())
    else
        set udg_DamageEventAmount=0.00
        if udg_DamageEventType == 0 then
            set udg_DamageEventType=udg_DamageTypeBlocked
        endif
    endif
    set udg_AMSAmount[id]=shield
endfunction

function Trig_Anti_Magic_Shield_Fix_Conditions takes nothing returns boolean
    if udg_IsDamageSpell then
        if GetUnitAbilityLevel(udg_DamageEventTarget, GetAMSBuffId()) > 0 then
            call Trig_Anti_Magic_Shield_Fix_Actions()
        else
            set udg_AMSAmount[GetUnitUserData(udg_DamageEventTarget)]=0.00
        endif
    endif
    return false
endfunction

function AMS_Refresh_Conditions takes nothing returns boolean
    if GetSpellAbilityId() == GetAMSAbilId() then
        set udg_AMSAmount[GetUnitUserData(GetSpellTargetUnit())]=GetAMSShieldVal()
    endif
    return false
endfunction

function InitTrig_Anti_Magic_Shield_Fix takes nothing returns nothing
    local trigger t= CreateTrigger()
    call TriggerRegisterVariableEvent(t, "udg_DamageModifierEvent", EQUAL, 4.00)
    call TriggerAddCondition(t, Condition(function Trig_Anti_Magic_Shield_Fix_Conditions))
    set t=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(t, Filter(function AMS_Refresh_Conditions))
endfunction//===========================================================================
// Trigger: Mana Shield Fix
//
// DamageModifierEvent becoming Equal to 4.00 is a new event introduced in DamageEngine 3.5. It is the final phase of damage processing as it is built specifically to handle shields, and only runs if the damage is greater than 0.
//===========================================================================
function Trig_Mana_Shield_Fix_Conditions takes nothing returns boolean
    if ( not ( UnitHasBuffBJ(udg_DamageEventTarget, 'BNms') == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_Mana_Shield_Fix_Func004Func005C takes nothing returns boolean
    if ( not ( udg_DmgEvMSlvl == 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Mana_Shield_Fix_Func004Func007C takes nothing returns boolean
    if ( not ( udg_DamageEventAmount < ( udg_DmgEvMana - 0.01 ) ) ) then
        return false
    endif
    return true
endfunction

function Trig_Mana_Shield_Fix_Func004C takes nothing returns boolean
    return true
endfunction

function Trig_Mana_Shield_Fix_Actions takes nothing returns nothing
    // Mana Shield handling. For it to work, you need to set the mana shield Damage Absorbed %
    // to 0.00 for Mana Shield (Neutral Hostile) and for all 3 levels of Mana Shield for the Naga Sea Witch.
    if ( Trig_Mana_Shield_Fix_Func004C() ) then
        set udg_DmgEvMana=GetUnitStateSwap(UNIT_STATE_MANA, udg_DamageEventTarget)
        // Get the shielding mana multiplier from the target unit based on the unit or hero ability ("multiplier" mana per HP)
        // If you have custom mana shield abilities or have modified the normal ones, add or configure those here.
        set udg_DmgEvMSlvl=GetUnitAbilityLevelSwapped('ANms', udg_DamageEventTarget)
        if ( Trig_Mana_Shield_Fix_Func004Func005C() ) then
            set udg_DmgEvManaMult=2.00
        else
            set udg_DmgEvManaMult=( ( 0.50 * I2R(udg_DmgEvMSlvl) ) + 0.50 )
        endif
        set udg_DmgEvMana=( udg_DmgEvMana * udg_DmgEvManaMult )
        if ( Trig_Mana_Shield_Fix_Func004Func007C() ) then
            set udg_DmgEvMana=( udg_DmgEvMana - udg_DamageEventAmount )
            set udg_DamageEventAmount=0.00
            set udg_DmgEvMana=( udg_DmgEvMana / udg_DmgEvManaMult )
            // You can remove this damage type change if you want, it's mostly for the purpose of the test map.
            set udg_DamageEventType=udg_DamageTypeBlocked
        else
            set udg_DamageEventAmount=( udg_DamageEventAmount - udg_DmgEvMana )
            set udg_DmgEvMana=0.00
            call IssueImmediateOrderBJ(udg_DamageEventTarget, "manashieldoff")
            // You can remove this damage type change if you want, it's mostly for the purpose of the test map.
            set udg_DamageEventType=udg_DamageTypeReduced
        endif
        call SetUnitManaBJ(udg_DamageEventTarget, udg_DmgEvMana)
    else
    endif
endfunction

//===========================================================================
function InitTrig_Mana_Shield_Fix takes nothing returns nothing
    set gg_trg_Mana_Shield_Fix=CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_Mana_Shield_Fix, "udg_DamageModifierEvent", EQUAL, 4.00)
    call TriggerAddCondition(gg_trg_Mana_Shield_Fix, Condition(function Trig_Mana_Shield_Fix_Conditions))
    call TriggerAddAction(gg_trg_Mana_Shield_Fix, function Trig_Mana_Shield_Fix_Actions)
endfunction

//===========================================================================
// Trigger: Unit Indexer
//
// Unit Indexer gives you an array-safe (1-8190) custom value for units, eliminating the need for hashtables to store unit-specific data.
// Just use "Set MyArrayData[(Custom value of Unit)] = (Some data)".
// --------
// If you want to get the unit assigned to an index (reverse lookup) use "UDexUnits[(Index)]".
// --------
// If you want to detect when an index is created or when it is released, use "UnitIndexEvent Equal to 1.00" (created) or "UnitIndexEvent Equal to 2.00" (released). The index being created/released is called "UDex".
// --------
// You can enable/disable Unit Indexer to protect some of your undesirable units from being indexed like this:
// Trigger - Turn off Unit Indexer <gen>
// Unit - Create 1 Dummy for (Triggering player) at TempPoint facing 0.00 degrees
// Trigger - Turn on Unit Indexer <gen>
// --------
// If you want to use a Map Initialization trigger that uses custom value of units, to make sure that UnitIndexer initializes first, use the event "UnitIndexEvent Equal to 3.00". Otherwise the custom value of units may be zero.
// --------
// Advanced:
// --------
// If you want to lock the index of a unit, use "Set UnitIndexLock[(Index)] = (UnitIndexLock[(Index)] + 1)". This will prevent the index from being recycled. If you want to unlock it and allow it to be recycled, run the Unit Indexer <gen> trigger.
// Note: Make sure if you add a lock that you will eventually remove the lock, otherwise the index will never be recycled.
//===========================================================================
function Trig_Unit_Indexer_Func005Func002C takes nothing returns boolean
    if ( not ( udg_UnitIndexLock[udg_UDex] == 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Unit_Indexer_Func005C takes nothing returns boolean
    if ( not ( GetUnitUserData(udg_UDexUnits[udg_UDex]) == 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Unit_Indexer_Func014Func003C takes nothing returns boolean
    if ( not ( udg_UDexWasted == 32 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Unit_Indexer_Func014Func005C takes nothing returns boolean
    if ( not ( udg_UDexRecycle == 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Unit_Indexer_Func014C takes nothing returns boolean
    if ( not ( udg_UnitIndexerEnabled == true ) ) then
        return false
    endif
    if ( not ( GetUnitUserData(GetFilterUnit()) == 0 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Unit_Indexer_Actions takes nothing returns nothing
        call ExecuteFunc("InitializeUnitIndexer")
    endfunction
     
    function ClearUnitIndex takes nothing returns nothing
    if ( Trig_Unit_Indexer_Func005C() ) then
        set udg_UnitIndexLock[udg_UDex]=( udg_UnitIndexLock[udg_UDex] - 1 )
        if ( Trig_Unit_Indexer_Func005Func002C() ) then
            set udg_UDexNext[udg_UDexPrev[udg_UDex]]=udg_UDexNext[udg_UDex]
            set udg_UDexPrev[udg_UDexNext[udg_UDex]]=udg_UDexPrev[udg_UDex]
            set udg_UDexPrev[udg_UDex]=0
            set udg_UnitIndexEvent=0.00
            set udg_UnitIndexEvent=2.00
            set udg_UnitIndexEvent=0.00
            set udg_UDexUnits[udg_UDex]=null
            set udg_UDexNext[udg_UDex]=udg_UDexRecycle
            set udg_UDexRecycle=udg_UDex
        else
        endif
    else
    endif
    endfunction
     
    function IndexUnit takes nothing returns boolean
        local integer pdex= udg_UDex
        local integer ndex
    // -
    // You can customize the following block - if conditions are false the (Matching unit) won't be indexed.
    // -
    if ( Trig_Unit_Indexer_Func014C() ) then
        set udg_UDexWasted=( udg_UDexWasted + 1 )
        if ( Trig_Unit_Indexer_Func014Func003C() ) then
            set udg_UDexWasted=0
            set udg_UDex=udg_UDexNext[0]
            loop
                exitwhen udg_UDex == 0
                set ndex=udg_UDexNext[udg_UDex]
                call ClearUnitIndex()
                set udg_UDex=ndex
            endloop
        else
        endif
        if ( Trig_Unit_Indexer_Func014Func005C() ) then
            set udg_UDex=( udg_UDexGen + 1 )
            set udg_UDexGen=udg_UDex
        else
            set udg_UDex=udg_UDexRecycle
            set udg_UDexRecycle=udg_UDexNext[udg_UDex]
        endif
        set udg_UDexUnits[udg_UDex]=GetFilterUnit()
        call SetUnitUserData(udg_UDexUnits[udg_UDex], udg_UDex)
        set udg_UDexPrev[udg_UDexNext[0]]=udg_UDex
        set udg_UDexNext[udg_UDex]=udg_UDexNext[0]
        set udg_UDexNext[0]=udg_UDex
        set udg_UnitIndexLock[udg_UDex]=1
        set udg_UnitIndexEvent=0.00
        set udg_UnitIndexEvent=1.00
        set udg_UnitIndexEvent=0.00
        set udg_UDex=pdex
    else
    endif
        return false
    endfunction
     
    function InitializeUnitIndexer takes nothing returns nothing
        local integer i= bj_MAX_PLAYER_SLOTS
        local boolexpr b= Filter(function IndexUnit)
        local region re= CreateRegion()
        local trigger t= GetTriggeringTrigger()
        local rect r= GetWorldBounds()
        call RegionAddRect(re, r)
        call TriggerRegisterEnterRegion(t, re, b)
        call TriggerClearActions(t)
        call TriggerAddAction(t, function ClearUnitIndex)
    set udg_UnitIndexerEnabled=true
        loop
            set i=i - 1
            call GroupEnumUnitsOfPlayer(bj_lastCreatedGroup, Player(i), b)
            exitwhen i == 0
        endloop
        call RemoveRect(r)
        set re=null
        set r=null
        set t=null
        set b=null
    set udg_UnitIndexEvent=3.00
    set udg_UnitIndexEvent=0.00
endfunction

//===========================================================================
function InitTrig_Unit_Indexer takes nothing returns nothing
    set gg_trg_Unit_Indexer=CreateTrigger()
    call TriggerAddAction(gg_trg_Unit_Indexer, function Trig_Unit_Indexer_Actions)
endfunction

//===========================================================================
// Trigger: Damage Engine Config
//===========================================================================
function Trig_Damage_Engine_Config_Actions takes nothing returns nothing
    // -
    // This trigger's conditions let you filter out units you don't want detection for.
    // NOTE: By default, units with Locust will not pass the check.
    // TIP: The unit is called UDexUnits[UDex] and its custom value is UDex
    // -
    // Copy the Cheat Death Ability from Object Editor into your map and set the following variable respectively:
    // -
    // -
    // Copy the Detect Spell Damage Ability from Object Editor into your map and set the following variable respectively:
    // -
    // -
    // You can add extra classifications here if you want to differentiate between your triggered damage
    // Use DamageTypeExplosive (or any negative value damage type) if you want a unit killed by that damage to explode
    // -
    set udg_DamageTypeExplosive=- 1
    set udg_DamageTypeCriticalStrike=1
    set udg_DamageTypeHeal=2
    set udg_DamageTypeReduced=3
    set udg_DamageTypeBlocked=4
    // -
    // Leave the next Set statement disabled if you modified the Spell Damage Reduction item ability to 1.67 reduction
    // Otherwise, if you removed that ability from Runed Bracers, you'll need to enable this line:
    // -
    // -
    // Set the damage multiplication factor (1.00 being unmodified, increasing in damage over 1.00 and at 0 damage with 0.00)
    // NOTE. With the default values, Runed Bracers is reduces 33%, Elune's Grace reduces 20% and Ethereal increases 67%
    // -
    set udg_DAMAGE_FACTOR_BRACERS=0.67
    set udg_DAMAGE_FACTOR_ELUNES=0.80
    set udg_DAMAGE_FACTOR_ETHEREAL=1.67
    // -
    // Added 25 July 2017 to allow detection of things like Bash or Pulverize or AOE spread
    // -
    set udg_DamageEventAOE=1
    set udg_DamageEventLevel=1
    // -
    // Do not enable any of the following lines as they are simply variable declarations to make copying easier
    // -
endfunction

//===========================================================================
function InitTrig_Damage_Engine_Config takes nothing returns nothing
    set gg_trg_Damage_Engine_Config=CreateTrigger()
    call TriggerAddAction(gg_trg_Damage_Engine_Config, function Trig_Damage_Engine_Config_Actions)
endfunction

//===========================================================================
// Trigger: Damage Engine
//===========================================================================
//===========================================================================
// Damage Engine lets you detect, amplify, block or nullify damage. It even
// lets you detect if the damage was physical or from a spell. Just reference
// DamageEventAmount/Source/Target or the boolean IsDamageSpell, to get the
// necessary damage event data.
//
// - Detect damage: use the event "DamageEvent Equal to 1.00"
// - To change damage before it's dealt: use the event "DamageModifierEvent Equal to 1.00"
// - Detect damage after it was applied, use the event "AfterDamageEvent Equal to 1.00"
// - Detect spell damage: use the condition "IsDamageSpell Equal to True"
// - Detect zero-damage: use the event "DamageEvent Equal to 2.00" (an AfterDamageEvent will not fire for this)
//
// You can specify the DamageEventType before dealing triggered damage. To prevent an already-improbable error, I recommend running the trigger "ClearDamageEvent (Checking Conditions)" after dealing triggered damage from within a damage event:
// - Set NextDamageType = DamageTypeWhatever
// - Unit - Cause...
// - Trigger - Run ClearDamageEvent (Checking Conditions)
//
// You can modify the DamageEventAmount and the DamageEventType from a "DamageModifierEvent Equal to 1.00" trigger.
// - If the amount is modified to negative, it will count as a heal.
// - If the amount is set to 0, no damage will be dealt.
//
// If you need to reference the original in-game damage, use the variable "DamageEventPrevAmt".
// 
//===========================================================================
// Programming note about "integer i" and "udg_DmgEvRecursionN": integer i
// ranges from -1 upwards. "udg_DmgEvRecursionN" ranges from 0 upwards.
// "integer i" is always 1 less than "udg_DmgEvRecursionN"
// 
function DmgEvResetVars takes nothing returns nothing
    local integer i= udg_DmgEvRecursionN - 2
    set udg_DmgEvRecursionN=i + 1
    if i >= 0 then
        set udg_DamageEventPrevAmt=udg_LastDmgPrevAmount[i]
        set udg_DamageEventAmount=udg_LastDmgValue[i]
        set udg_DamageEventSource=udg_LastDmgSource[i]
        set udg_DamageEventTarget=udg_LastDmgTarget[i]
        set udg_IsDamageSpell=udg_LastDmgWasSpell[i]
        set udg_DamageEventType=udg_LastDmgPrevType[i]
    endif
endfunction

function CheckDamagedLifeEvent takes boolean clear returns nothing
    if clear then
        set udg_NextDamageOverride=false
        set udg_NextDamageType=0
    endif
    if udg_DmgEvTrig != null then
        call DestroyTrigger(udg_DmgEvTrig)
        set udg_DmgEvTrig=null
        if udg_IsDamageSpell then
            call SetWidgetLife(udg_DamageEventTarget, RMaxBJ(udg_LastDamageHP, 0.41))
            if udg_LastDamageHP <= 0.405 then
                if udg_DamageEventType < 0 then
                    call SetUnitExploded(udg_DamageEventTarget, true)
                endif
                //Kill the unit
                call DisableTrigger(udg_DamageEventTrigger)
                call UnitDamageTarget(udg_DamageEventSource, udg_DamageEventTarget, - 999, false, false, null, DAMAGE_TYPE_UNIVERSAL, null)
                call EnableTrigger(udg_DamageEventTrigger)
            endif
        elseif GetUnitAbilityLevel(udg_DamageEventTarget, udg_DamageBlockingAbility) > 0 then
            call UnitRemoveAbility(udg_DamageEventTarget, udg_DamageBlockingAbility)
            call SetWidgetLife(udg_DamageEventTarget, udg_LastDamageHP)
        endif
        if udg_DamageEventAmount != 0.00 and not udg_HideDamageFrom[GetUnitUserData(udg_DamageEventSource)] then
            set udg_AfterDamageEvent=0.00
            set udg_AfterDamageEvent=1.00
            set udg_AfterDamageEvent=0.00
        endif
        call DmgEvResetVars()
    endif
endfunction
    
function DmgEvOnAOEEnd takes nothing returns nothing
    if udg_DamageEventAOE > 1 then
        set udg_AOEDamageEvent=0.00
        set udg_AOEDamageEvent=1.00
        set udg_AOEDamageEvent=0.00
        set udg_DamageEventAOE=1
    endif
    set udg_DamageEventLevel=1
    set udg_EnhancedDamageTarget=null
    call GroupClear(udg_DamageEventAOEGroup)
endfunction
    
function DmgEvOnExpire takes nothing returns nothing
    set udg_DmgEvStarted=false
    call CheckDamagedLifeEvent(true)
    //Reset things so they don't perpetuate for AoE/Level target detection
    call DmgEvOnAOEEnd()
    set udg_DamageEventTarget=null
    set udg_DamageEventSource=null
endfunction

function PreCheckDamagedLifeEvent takes nothing returns boolean
    call CheckDamagedLifeEvent(true)
    return false
endfunction

function OnUnitDamage takes nothing returns boolean
    local boolean override= udg_DamageEventOverride
    local integer i
    local integer e= udg_DamageEventLevel
    local integer a= udg_DamageEventAOE
    local string s
    local real prevAmount
    local real life
    local real prevLife
    local unit u
    local unit f
    call CheckDamagedLifeEvent(false) //in case the unit state event failed and the 0.00 second timer hasn't yet expired
    set i=udg_DmgEvRecursionN - 1 //Had to be moved here due to false recursion tracking
    if i < 0 then
        //Added 25 July 2017 to detect AOE damage or multiple single-target damage
        set u=udg_DamageEventTarget
        set f=udg_DamageEventSource
    elseif i < 16 then
        set udg_LastDmgPrevAmount[i]=udg_DamageEventPrevAmt
        set udg_LastDmgValue[i]=udg_DamageEventAmount
        set udg_LastDmgSource[i]=udg_DamageEventSource
        set udg_LastDmgTarget[i]=udg_DamageEventTarget
        set udg_LastDmgWasSpell[i]=udg_IsDamageSpell
        set udg_LastDmgPrevType[i]=udg_DamageEventType
    else
        set s="WARNING: Recursion error when dealing damage! Make sure when you deal damage from within a DamageEvent trigger, do it like this:\n\n"
        set s=s + "Trigger - Turn off (This Trigger)\n"
        set s=s + "Unit - Cause...\n"
        set s=s + "Trigger - Turn on (This Trigger)"
        
        //Delete the next couple of lines to disable the in-game recursion crash warnings
        call ClearTextMessages()
        call DisplayTimedTextToPlayer(GetLocalPlayer(), 0.00, 0.00, 999.00, s)
        return false
    endif
    set udg_DmgEvRecursionN=i + 2
    set prevAmount=GetEventDamage()
    set udg_DamageEventTarget=GetTriggerUnit()
    set udg_DamageEventSource=GetEventDamageSource()
    
    set udg_DamageEventAmount=prevAmount
    
    set udg_DamageEventType=udg_NextDamageType
    set udg_NextDamageType=0
    set udg_DamageEventOverride=udg_NextDamageOverride
    set udg_NextDamageOverride=false
    
    if i < 0 then
        //Added 25 July 2017 to detect AOE damage or multiple single-target damage
        if udg_DamageEventType == 0 then
            if f == udg_DamageEventSource then
                //Source has damaged more than once
                if IsUnitInGroup(udg_DamageEventTarget, udg_DamageEventAOEGroup) then
                    //Added 5 August 2017 to improve tracking of enhanced damage against, say, Pulverize
                    set udg_DamageEventLevel=udg_DamageEventLevel + 1
                    set udg_EnhancedDamageTarget=udg_DamageEventTarget
                else
                    //Multiple targets hit by this source - flag as AOE
                    set udg_DamageEventAOE=udg_DamageEventAOE + 1
                endif
            else
                //New damage source - unflag everything
                set u=udg_DamageEventSource
                set udg_DamageEventSource=f
                call DmgEvOnAOEEnd()
                set udg_DamageEventSource=u
            endif
            call GroupAddUnit(udg_DamageEventAOEGroup, udg_DamageEventTarget)
        endif
        if not udg_DmgEvStarted then
            set udg_DmgEvStarted=true
            call TimerStart(udg_DmgEvTimer, 0.00, false, function DmgEvOnExpire)
        endif
    endif
    
    if prevAmount == 0.00 then
        if not udg_HideDamageFrom[GetUnitUserData(udg_DamageEventSource)] then
            set udg_DamageEventPrevAmt=0.00
            set udg_DamageEvent=0.00
            set udg_DamageEvent=2.00
            set udg_DamageEvent=0.00
        endif
        call DmgEvResetVars()
    else
        set u=udg_DamageEventTarget
        set udg_IsDamageSpell=prevAmount < 0.00
        if udg_IsDamageSpell then
            set prevAmount=- udg_DamageEventAmount
            set life=1.00
            if IsUnitType(u, UNIT_TYPE_ETHEREAL) and not IsUnitType(u, UNIT_TYPE_HERO) then
                set life=life * udg_DAMAGE_FACTOR_ETHEREAL //1.67
            endif
            if GetUnitAbilityLevel(u, 'Aegr') > 0 then
                set life=life * udg_DAMAGE_FACTOR_ELUNES //0.80
            endif
            if udg_DmgEvBracers != 0 and IsUnitType(u, UNIT_TYPE_HERO) then
                //Inline of UnitHasItemOfTypeBJ without the potential handle ID leak.
                set i=6
                loop
                    set i=i - 1
                    if GetItemTypeId(UnitItemInSlot(u, i)) == udg_DmgEvBracers then
                        set life=life * udg_DAMAGE_FACTOR_BRACERS //0.67
                        exitwhen true
                    endif
                    exitwhen i == 0
                endloop
            endif
            set udg_DamageEventAmount=prevAmount * life
        endif
        set udg_DamageEventPrevAmt=prevAmount
        set udg_DamageModifierEvent=0.00
        if not udg_DamageEventOverride then
            set udg_DamageModifierEvent=1.00
            if not udg_DamageEventOverride then
                set udg_DamageModifierEvent=2.00
                set udg_DamageModifierEvent=3.00
            endif
        endif
        set udg_DamageEventOverride=override
        if udg_DamageEventAmount > 0.00 then
            set udg_DamageModifierEvent=4.00
        endif
        set udg_DamageModifierEvent=0.00
        if not udg_HideDamageFrom[GetUnitUserData(udg_DamageEventSource)] then
            set udg_DamageEvent=0.00
            set udg_DamageEvent=1.00
            set udg_DamageEvent=0.00
        endif
        call CheckDamagedLifeEvent(true) //in case the unit state event failed from a recursive damage event
        
        //All events have run and the damage amount is finalized.
        set life=GetWidgetLife(u)
        set udg_DmgEvTrig=CreateTrigger()
        call TriggerAddCondition(udg_DmgEvTrig, Filter(function PreCheckDamagedLifeEvent))
        if not udg_IsDamageSpell then
            if udg_DamageEventAmount != prevAmount then
                set life=life + prevAmount - udg_DamageEventAmount
                if GetUnitState(u, UNIT_STATE_MAX_LIFE) < life then
                    set udg_LastDamageHP=life - prevAmount
                    call UnitAddAbility(u, udg_DamageBlockingAbility)
                endif
                call SetWidgetLife(u, RMaxBJ(life, 0.42))
            endif
            call TriggerRegisterUnitStateEvent(udg_DmgEvTrig, u, UNIT_STATE_LIFE, LESS_THAN, RMaxBJ(0.41, life - prevAmount / 2.00))
        else
            set udg_LastDamageHP=GetUnitState(u, UNIT_STATE_MAX_LIFE)
            set prevLife=life
            if life + prevAmount * 0.75 > udg_LastDamageHP then
                set life=RMaxBJ(udg_LastDamageHP - prevAmount / 2.00, 1.00)
                call SetWidgetLife(u, life)
                set life=( life + udg_LastDamageHP ) / 2.00
            else
                set life=life + prevAmount * 0.50
            endif
            set udg_LastDamageHP=prevLife - ( prevAmount - ( prevAmount - udg_DamageEventAmount ) )
            call TriggerRegisterUnitStateEvent(udg_DmgEvTrig, u, UNIT_STATE_LIFE, GREATER_THAN, life)
        endif
    endif
    set u=null
    set f=null
    return false
endfunction

function CreateDmgEvTrg takes nothing returns nothing
    set udg_DamageEventTrigger=CreateTrigger()
    call TriggerAddCondition(udg_DamageEventTrigger, Filter(function OnUnitDamage))
endfunction

function SetupDmgEv takes nothing returns boolean
    local integer i= udg_UDex
    local unit u
    if udg_UnitIndexEvent == 1.00 then
        set u=udg_UDexUnits[i]
        if GetUnitAbilityLevel(u, 'Aloc') == 0 and TriggerEvaluate(gg_trg_Damage_Engine_Config) then
            set udg_UnitDamageRegistered[i]=true
            call TriggerRegisterUnitEvent(udg_DamageEventTrigger, u, EVENT_UNIT_DAMAGED)
            call UnitAddAbility(u, udg_SpellDamageAbility)
            call UnitMakeAbilityPermanent(u, true, udg_SpellDamageAbility)
        endif
        set u=null
    else
        set udg_HideDamageFrom[i]=false
        if udg_UnitDamageRegistered[i] then
            set udg_UnitDamageRegistered[i]=false
            set udg_DamageEventsWasted=udg_DamageEventsWasted + 1
            if udg_DamageEventsWasted == 32 then //After 32 registered units have been removed...
                set udg_DamageEventsWasted=0
                
                //Rebuild the mass EVENT_UNIT_DAMAGED trigger:
                call DestroyTrigger(udg_DamageEventTrigger)
                call CreateDmgEvTrg()
                set i=udg_UDexNext[0]
                loop
                    exitwhen i == 0
                    if udg_UnitDamageRegistered[i] then
                        call TriggerRegisterUnitEvent(udg_DamageEventTrigger, udg_UDexUnits[i], EVENT_UNIT_DAMAGED)
                    endif
                    set i=udg_UDexNext[i]
                endloop
            endif
        endif
    endif
    return false
endfunction
    
//===========================================================================
function InitTrig_Damage_Engine takes nothing returns nothing
    local unit u= CreateUnit(Player(bj_PLAYER_NEUTRAL_EXTRA), 'uloc', 0, 0, 0)
    local integer i= bj_MAX_PLAYERS
    
    //Create this trigger with UnitIndexEvents in order add and remove units
    //as they are created or removed.
    local trigger t= CreateTrigger()
    call TriggerRegisterVariableEvent(t, "udg_UnitIndexEvent", EQUAL, 1.00)
    call TriggerRegisterVariableEvent(t, "udg_UnitIndexEvent", EQUAL, 2.00)
    call TriggerAddCondition(t, Filter(function SetupDmgEv))
    set t=null
    
    //Run the configuration trigger to set all configurables:
    if gg_trg_Damage_Engine_Config == null then
        //It's possible this InitTrig_ function ran first, in which case use ExecuteFunc.
        call ExecuteFunc("Trig_Damage_Engine_Config_Actions")
    else
        call TriggerExecute(gg_trg_Damage_Engine_Config)
    endif
    
    //Create trigger for storing all EVENT_UNIT_DAMAGED events.
    call CreateDmgEvTrg()
    
    //Create GUI-friendly trigger for cleaning up after UnitDamageTarget.
    set udg_ClearDamageEvent=CreateTrigger()
    call TriggerAddCondition(udg_ClearDamageEvent, Filter(function PreCheckDamagedLifeEvent))
    
    //Disable SpellDamageAbility for every player.
    loop
        set i=i - 1
        call SetPlayerAbilityAvailable(Player(i), udg_SpellDamageAbility, false)
        exitwhen i == 0
    endloop
    
    //Preload abilities.
    call UnitAddAbility(u, udg_DamageBlockingAbility)
    call UnitAddAbility(u, udg_SpellDamageAbility)
    call RemoveUnit(u)
    set u=null
endfunction