//===========================================================================
// Trigger: Elf upgrade
//===========================================================================
function Trig_Elf_upgrade_Conditions takes nothing returns boolean
    if ( not ( GetResearched() == 'R001' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Elf_upgrade_Func007Func001C takes nothing returns boolean
    if ( not ( GetPlayerTechCountSimple('R001', GetOwningPlayer(GetEnumUnit())) == 1 ) ) then
        return false
    endif
    if ( not ( IsUnitAlly(GetEnumUnit(), GetOwningPlayer(GetTriggerUnit())) == true ) ) then
        return false
    endif
    if ( not ( GetUnitTypeId(GetEnumUnit()) == 'hmil' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Elf_upgrade_Func007Func002C takes nothing returns boolean
    if ( not ( GetPlayerTechCountSimple('R001', GetOwningPlayer(GetEnumUnit())) == 1 ) ) then
        return false
    endif
    if ( not ( IsUnitAlly(GetEnumUnit(), GetOwningPlayer(GetTriggerUnit())) == true ) ) then
        return false
    endif
    if ( not ( GetUnitTypeId(GetEnumUnit()) == 'hpea' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Elf_upgrade_Func007A takes nothing returns nothing
    if ( Trig_Elf_upgrade_Func007Func001C() ) then
        call ReplaceUnitBJ(GetEnumUnit(), 'h00G', bj_UNIT_STATE_METHOD_RELATIVE)
    else
        call DoNothing()
    endif
    if ( Trig_Elf_upgrade_Func007Func002C() ) then
        call UnitAddAbilityBJ('S005', GetEnumUnit())
    else
        call DoNothing()
    endif
endfunction

function Trig_Elf_upgrade_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('h00G', true, GetOwningPlayer(GetTriggerUnit()))
    call SetPlayerUnitAvailableBJ('nbt2', true, GetOwningPlayer(GetTriggerUnit()))
    call SetPlayerUnitAvailableBJ('ndt2', true, GetOwningPlayer(GetTriggerUnit()))
    call SetPlayerUnitAvailableBJ('net2', true, GetOwningPlayer(GetTriggerUnit()))
    call SetPlayerUnitAvailableBJ('nft2', true, GetOwningPlayer(GetTriggerUnit()))
    set bj_wantDestroyGroup=true
    call ForGroupBJ(GetUnitsInRectAll(GetPlayableMapRect()), function Trig_Elf_upgrade_Func007A)
endfunction

//===========================================================================
function InitTrig_Elf_upgrade takes nothing returns nothing
    set gg_trg_Elf_upgrade=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Elf_upgrade, EVENT_PLAYER_UNIT_RESEARCH_FINISH)
    call TriggerAddCondition(gg_trg_Elf_upgrade, Condition(function Trig_Elf_upgrade_Conditions))
    call TriggerAddAction(gg_trg_Elf_upgrade, function Trig_Elf_upgrade_Actions)
endfunction