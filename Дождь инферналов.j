//===========================================================================
// Trigger: Infernal Rain on the map
//
// vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
//===========================================================================
function Trig_Infernal_Rain_on_the_map_Actions takes nothing returns nothing
    set udg_pointmap=GetRandomLocInRect(GetPlayableMapRect())
    call AddSpecialEffectLocBJ(udg_pointmap, "Units\\Demon\\Infernal\\InfernalBirth.mdl")
    call PlayThematicMusicBJ("Sound\\Music\\mp3Music\\Doom.mp3")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    call DisplayTextToForce(GetPlayersAll(), "TRIGSTR_027")
    call TriggerSleepAction(0.70)
    call CreateNUnitsAtLoc(1, 'n00B', Player(PLAYER_NEUTRAL_AGGRESSIVE), udg_pointmap, bj_UNIT_FACING)
    call RemoveLocation(udg_rainpoint)
endfunction

//===========================================================================
function InitTrig_Infernal_Rain_on_the_map takes nothing returns nothing
    set gg_trg_Infernal_Rain_on_the_map=CreateTrigger()
    call TriggerRegisterTimerEventPeriodic(gg_trg_Infernal_Rain_on_the_map, 1000.00)
    call TriggerAddAction(gg_trg_Infernal_Rain_on_the_map, function Trig_Infernal_Rain_on_the_map_Actions)
endfunction

//===========================================================================
// Trigger: Infernal Rain
//
// vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
//===========================================================================
function Trig_Infernal_Rain_Func001002001001 takes nothing returns boolean
    return ( GetPlayerSlotState(GetFilterPlayer()) == PLAYER_SLOT_STATE_PLAYING )
endfunction

function Trig_Infernal_Rain_Func001002001002 takes nothing returns boolean
    return ( GetPlayerController(GetFilterPlayer()) == MAP_CONTROL_USER )
endfunction

function Trig_Infernal_Rain_Func001002001 takes nothing returns boolean
    return GetBooleanAnd(Trig_Infernal_Rain_Func001002001001(), Trig_Infernal_Rain_Func001002001002())
endfunction

function Trig_Infernal_Rain_Func002Func001C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A02L', GetEnumUnit()) == 1 ) ) then
        return false
    endif
    if ( not ( IsPlayerInForce(GetOwningPlayer(GetEnumUnit()), udg_playercountgroup) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_Infernal_Rain_Func002A takes nothing returns nothing
    if ( Trig_Infernal_Rain_Func002Func001C() ) then
        set udg_rainpoint=GetRandomLocInRect(RectFromCenterSizeBJ(GetUnitLoc(GetEnumUnit()), 1500.00, 1500.00))
        call AddSpecialEffectLocBJ(udg_rainpoint, "Units\\Demon\\Infernal\\InfernalBirth.mdl")
        call PlayThematicMusicBJ("Sound\\Music\\mp3Music\\Doom.mp3")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call DisplayTextToForce(GetPlayersAll(), "TRIGSTR_028")
        call CreateNUnitsAtLoc(1, 'n00P', Player(PLAYER_NEUTRAL_AGGRESSIVE), udg_rainpoint, bj_UNIT_FACING)
        call DestroyForce(udg_playercountgroup)
        call RemoveLocation(udg_rainpoint)
    else
        call DoNothing()
    endif
endfunction

function Trig_Infernal_Rain_Actions takes nothing returns nothing
    set udg_playercountgroup=GetPlayersMatching(Condition(function Trig_Infernal_Rain_Func001002001))
    call ForGroupBJ(GetUnitsInRectAll(GetPlayableMapRect()), function Trig_Infernal_Rain_Func002A)
endfunction

//===========================================================================
function InitTrig_Infernal_Rain takes nothing returns nothing
    set gg_trg_Infernal_Rain=CreateTrigger()
    call TriggerRegisterTimerEventPeriodic(gg_trg_Infernal_Rain, 400.00)
    call TriggerAddAction(gg_trg_Infernal_Rain, function Trig_Infernal_Rain_Actions)
endfunction