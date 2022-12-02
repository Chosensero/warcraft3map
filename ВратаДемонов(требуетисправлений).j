//===========================================================================
// Trigger: Demon gate
//===========================================================================
function Trig_Demon_gate_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A00X' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Demon_gate_Func001C takes nothing returns boolean
    if ( not ( GetPlayerState(GetOwningPlayer(GetTriggerUnit()), PLAYER_STATE_RESOURCE_GOLD) >= 350 ) ) then
        return false
    endif
    if ( not ( GetPlayerState(GetOwningPlayer(GetTriggerUnit()), PLAYER_STATE_RESOURCE_LUMBER) >= 150 ) ) then
        return false
    endif
    return true
endfunction

function Trig_Demon_gate_Actions takes nothing returns nothing
    if ( Trig_Demon_gate_Func001C() ) then
        call AdjustPlayerStateBJ(- 350, GetOwningPlayer(GetTriggerUnit()), PLAYER_STATE_RESOURCE_GOLD)
        call AdjustPlayerStateBJ(- 150, GetOwningPlayer(GetTriggerUnit()), PLAYER_STATE_RESOURCE_LUMBER)
    else
        set udg_TempGroup=GetForceOfPlayer(GetTriggerPlayer())
        if GetLocalPlayer() == GetOwningPlayer(GetTriggerUnit()) then
        call PlaySoundBJ(gg_snd_NecromancerNoGold1)
        call KillSoundWhenDoneBJ(GetLastPlayedSound())
        endif
        call DisplayTimedTextToForce(udg_TempGroup, 10.00, "TRIGSTR_029")
        call IssueImmediateOrderBJ(GetTriggerUnit(), "stop")
        call DestroyForce(udg_TempGroup)
    endif
endfunction

//===========================================================================
function InitTrig_Demon_gate takes nothing returns nothing
    set gg_trg_Demon_gate=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Demon_gate, EVENT_PLAYER_UNIT_SPELL_CAST)
    call TriggerAddCondition(gg_trg_Demon_gate, Condition(function Trig_Demon_gate_Conditions))
    call TriggerAddAction(gg_trg_Demon_gate, function Trig_Demon_gate_Actions)
endfunction