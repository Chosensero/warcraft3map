
//===========================================================================
// Trigger: Melee Initialization
//
// Default melee game initialization for all players
//===========================================================================
function Trig_Melee_Initialization_Func001A takes nothing returns nothing
    call SetPlayerTechMaxAllowedSwap('H00E', 1, GetEnumPlayer())
    call SetPlayerTechMaxAllowedSwap('H00D', 1, GetEnumPlayer())
    call SetPlayerTechMaxAllowedSwap('H00A', 1, GetEnumPlayer())
    call SetPlayerTechMaxAllowedSwap('H00B', 1, GetEnumPlayer())
    call SetPlayerTechMaxAllowedSwap('H00I', 1, GetEnumPlayer())
    call SetPlayerTechMaxAllowedSwap('U005', 1, GetEnumPlayer())
    call SetPlayerTechMaxAllowedSwap('E001', 1, GetEnumPlayer())
    call SetPlayerTechMaxAllowedSwap('E002', 1, GetEnumPlayer())
    call SetPlayerTechMaxAllowedSwap('E003', 1, GetEnumPlayer())
    call SetPlayerTechMaxAllowedSwap('Efur', 1, GetEnumPlayer())
    call SetPlayerTechMaxAllowedSwap('H003', 1, GetEnumPlayer())
    call SetPlayerTechMaxAllowedSwap('U00D', 1, GetEnumPlayer())
    call SetPlayerTechMaxAllowedSwap('U00E', 1, GetEnumPlayer())
endfunction

function Trig_Melee_Initialization_Actions takes nothing returns nothing
    call ForForce(GetPlayersAll(), function Trig_Melee_Initialization_Func001A)
    call MeleeStartingVisibility()
    call MeleeStartingHeroLimit()
    call MeleeGrantHeroItems()
    call MeleeStartingResources()
    call MeleeClearExcessUnits()
    call MeleeStartingUnits()
    call MeleeStartingAI()
    call MeleeInitVictoryDefeat()
endfunction

//===========================================================================
function InitTrig_Melee_Initialization takes nothing returns nothing
    set gg_trg_Melee_Initialization=CreateTrigger()
    call TriggerAddAction(gg_trg_Melee_Initialization, function Trig_Melee_Initialization_Actions)
endfunction