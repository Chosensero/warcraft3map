//===========================================================================
// Trigger: FEL ORC
//===========================================================================
function Trig_FEL_ORC_Conditions takes nothing returns boolean
    if ( not ( GetResearched() == 'R000' ) ) then
        return false
    endif
    return true
endfunction

function Trig_FEL_ORC_Func012Func001C takes nothing returns boolean
    if ( not ( GetPlayerTechCountSimple('R000', GetOwningPlayer(GetEnumUnit())) == 1 ) ) then
        return false
    endif
    if ( not ( GetUnitTypeId(GetEnumUnit()) == 'owyv' ) ) then
        return false
    endif
    return true
endfunction

function Trig_FEL_ORC_Func012Func002C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnumUnit()) == 'oshm' ) ) then
        return false
    endif
    if ( not ( GetPlayerTechCountSimple('R000', GetOwningPlayer(GetEnumUnit())) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_FEL_ORC_Func012Func003C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnumUnit()) == 'okod' ) ) then
        return false
    endif
    if ( not ( GetPlayerTechCountSimple('R000', GetOwningPlayer(GetEnumUnit())) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_FEL_ORC_Func012Func004C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnumUnit()) == 'opeo' ) ) then
        return false
    endif
    if ( not ( GetPlayerTechCountSimple('R000', GetOwningPlayer(GetEnumUnit())) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_FEL_ORC_Func012Func005C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnumUnit()) == 'orai' ) ) then
        return false
    endif
    if ( not ( GetPlayerTechCountSimple('R000', GetOwningPlayer(GetEnumUnit())) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_FEL_ORC_Func012Func006C takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetEnumUnit()) == 'ogru' ) ) then
        return false
    endif
    if ( not ( GetPlayerTechCountSimple('R000', GetOwningPlayer(GetEnumUnit())) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_FEL_ORC_Func012A takes nothing returns nothing
    if ( Trig_FEL_ORC_Func012Func001C() ) then
        call UnitAddAbilityBJ('S004', GetEnumUnit())
    else
        call DoNothing()
    endif
    if ( Trig_FEL_ORC_Func012Func002C() ) then
        call UnitAddAbilityBJ('Sca3', GetEnumUnit())
    else
        call DoNothing()
    endif
    if ( Trig_FEL_ORC_Func012Func003C() ) then
        call UnitAddAbilityBJ('Sca4', GetEnumUnit())
    else
        call DoNothing()
    endif
    if ( Trig_FEL_ORC_Func012Func004C() ) then
        call UnitAddAbilityBJ('Sca5', GetEnumUnit())
    else
        call DoNothing()
    endif
    if ( Trig_FEL_ORC_Func012Func005C() ) then
        call UnitAddAbilityBJ('Sca2', GetEnumUnit())
    else
        call DoNothing()
    endif
    if ( Trig_FEL_ORC_Func012Func006C() ) then
        call UnitAddAbilityBJ('Sca1', GetEnumUnit())
    else
        call DoNothing()
    endif
endfunction

function Trig_FEL_ORC_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('o007', true, GetOwningPlayer(GetTriggerUnit()))
    call SetPlayerUnitAvailableBJ('owyv', false, GetOwningPlayer(GetTriggerUnit()))
    call SetPlayerUnitAvailableBJ('nchw', true, GetOwningPlayer(GetTriggerUnit()))
    call SetPlayerUnitAvailableBJ('oshm', false, GetOwningPlayer(GetTriggerUnit()))
    call SetPlayerUnitAvailableBJ('nckb', true, GetOwningPlayer(GetTriggerUnit()))
    call SetPlayerUnitAvailableBJ('okod', false, GetOwningPlayer(GetTriggerUnit()))
    call SetPlayerUnitAvailableBJ('ncpn', true, GetOwningPlayer(GetTriggerUnit()))
    call SetPlayerUnitAvailableBJ('opeo', false, GetOwningPlayer(GetTriggerUnit()))
    call SetPlayerUnitAvailableBJ('nchr', true, GetOwningPlayer(GetTriggerUnit()))
    call SetPlayerUnitAvailableBJ('orai', false, GetOwningPlayer(GetTriggerUnit()))
    set bj_wantDestroyGroup=true
    call ForGroupBJ(GetUnitsInRectAll(GetPlayableMapRect()), function Trig_FEL_ORC_Func012A)
endfunction

//===========================================================================
function InitTrig_FEL_ORC takes nothing returns nothing
    set gg_trg_FEL_ORC=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_FEL_ORC, EVENT_PLAYER_UNIT_RESEARCH_FINISH)
    call TriggerAddCondition(gg_trg_FEL_ORC, Condition(function Trig_FEL_ORC_Conditions))
    call TriggerAddAction(gg_trg_FEL_ORC, function Trig_FEL_ORC_Actions)
endfunction