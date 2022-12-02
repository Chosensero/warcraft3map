//===========================================================================
// Trigger: Yeger
//===========================================================================
function Trig_Yeger_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'H003' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Yeger_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('H00E', false, GetOwningPlayer(GetTrainedUnit()))
    call SetPlayerUnitAvailableBJ('H003', false, GetOwningPlayer(GetTrainedUnit()))
endfunction

//===========================================================================
function InitTrig_Yeger takes nothing returns nothing
    set gg_trg_Yeger=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Yeger, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Yeger, Condition(function Trig_Yeger_Conditions))
    call TriggerAddAction(gg_trg_Yeger, function Trig_Yeger_Actions)
endfunction

//===========================================================================
// Trigger: Yeger2
//===========================================================================
function Trig_Yeger2_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'H00E' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Yeger2_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('H003', false, GetOwningPlayer(GetTrainedUnit()))
    call SetPlayerUnitAvailableBJ('H00E', false, GetOwningPlayer(GetTrainedUnit()))
endfunction

//===========================================================================
function InitTrig_Yeger2 takes nothing returns nothing
    set gg_trg_Yeger2=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Yeger2, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Yeger2, Condition(function Trig_Yeger2_Conditions))
    call TriggerAddAction(gg_trg_Yeger2, function Trig_Yeger2_Actions)
endfunction

//===========================================================================
// Trigger: Shaman
//===========================================================================
function Trig_Shaman_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'O006' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Shaman_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('Oshd', false, GetOwningPlayer(GetTrainedUnit()))
    call SetPlayerUnitAvailableBJ('O006', false, GetOwningPlayer(GetTrainedUnit()))
endfunction

//===========================================================================
function InitTrig_Shaman takes nothing returns nothing
    set gg_trg_Shaman=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Shaman, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Shaman, Condition(function Trig_Shaman_Conditions))
    call TriggerAddAction(gg_trg_Shaman, function Trig_Shaman_Actions)
endfunction

//===========================================================================
// Trigger: Shaman copy
//===========================================================================
function Trig_Shaman_copy_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'Oshd' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Shaman_copy_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('Oshd', false, GetOwningPlayer(GetTrainedUnit()))
    call SetPlayerUnitAvailableBJ('O006', false, GetOwningPlayer(GetTrainedUnit()))
endfunction

//===========================================================================
function InitTrig_Shaman_copy takes nothing returns nothing
    set gg_trg_Shaman_copy=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Shaman_copy, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Shaman_copy, Condition(function Trig_Shaman_copy_Conditions))
    call TriggerAddAction(gg_trg_Shaman_copy, function Trig_Shaman_copy_Actions)
endfunction

//===========================================================================
// Trigger: CCairne copy
//===========================================================================
function Trig_CCairne_copy_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'Otch' ) ) then
        return false
    endif
    return true
endfunction

function Trig_CCairne_copy_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('O005', false, GetOwningPlayer(GetTrainedUnit()))
    call SetPlayerUnitAvailableBJ('Otch', false, GetOwningPlayer(GetTrainedUnit()))
endfunction

//===========================================================================
function InitTrig_CCairne_copy takes nothing returns nothing
    set gg_trg_CCairne_copy=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_CCairne_copy, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_CCairne_copy, Condition(function Trig_CCairne_copy_Conditions))
    call TriggerAddAction(gg_trg_CCairne_copy, function Trig_CCairne_copy_Actions)
endfunction

//===========================================================================
// Trigger: Thrall Copy
//===========================================================================
function Trig_Thrall_Copy_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'Ofar' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Thrall_Copy_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('Ofar', false, GetOwningPlayer(GetTrainedUnit()))
    call SetPlayerUnitAvailableBJ('O004', false, GetOwningPlayer(GetTrainedUnit()))
endfunction

//===========================================================================
function InitTrig_Thrall_Copy takes nothing returns nothing
    set gg_trg_Thrall_Copy=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Thrall_Copy, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Thrall_Copy, Condition(function Trig_Thrall_Copy_Conditions))
    call TriggerAddAction(gg_trg_Thrall_Copy, function Trig_Thrall_Copy_Actions)
endfunction

//===========================================================================
// Trigger: BM copy
//===========================================================================
function Trig_BM_copy_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'Obla' ) ) then
        return false
    endif
    return true
endfunction

function Trig_BM_copy_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('Obla', false, GetOwningPlayer(GetTrainedUnit()))
    call SetPlayerUnitAvailableBJ('O003', false, GetOwningPlayer(GetTrainedUnit()))
endfunction

//===========================================================================
function InitTrig_BM_copy takes nothing returns nothing
    set gg_trg_BM_copy=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_BM_copy, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_BM_copy, Condition(function Trig_BM_copy_Conditions))
    call TriggerAddAction(gg_trg_BM_copy, function Trig_BM_copy_Actions)
endfunction

//===========================================================================
// Trigger: Kael Копировать
//===========================================================================
function Trig_Kael_____________________u_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'Hblm' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Kael_____________________u_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('Hblm', false, GetOwningPlayer(GetTrainedUnit()))
    call SetPlayerUnitAvailableBJ('H00D', false, GetOwningPlayer(GetTrainedUnit()))
endfunction

//===========================================================================
function InitTrig_Kael_____________________u takes nothing returns nothing
    set gg_trg_Kael_____________________u=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Kael_____________________u, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Kael_____________________u, Condition(function Trig_Kael_____________________u_Conditions))
    call TriggerAddAction(gg_trg_Kael_____________________u, function Trig_Kael_____________________u_Actions)
endfunction

//===========================================================================
// Trigger: Cairne
//===========================================================================
function Trig_Cairne_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'O005' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Cairne_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('Otch', false, GetOwningPlayer(GetTrainedUnit()))
    call SetPlayerUnitAvailableBJ('O005', false, GetOwningPlayer(GetTrainedUnit()))
endfunction

//===========================================================================
function InitTrig_Cairne takes nothing returns nothing
    set gg_trg_Cairne=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Cairne, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Cairne, Condition(function Trig_Cairne_Conditions))
    call TriggerAddAction(gg_trg_Cairne, function Trig_Cairne_Actions)
endfunction

//===========================================================================
// Trigger: Thrall
//===========================================================================
function Trig_Thrall_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'O004' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Thrall_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('Ofar', false, GetOwningPlayer(GetTrainedUnit()))
    call SetPlayerUnitAvailableBJ('O004', false, GetOwningPlayer(GetTrainedUnit()))
endfunction

//===========================================================================
function InitTrig_Thrall takes nothing returns nothing
    set gg_trg_Thrall=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Thrall, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Thrall, Condition(function Trig_Thrall_Conditions))
    call TriggerAddAction(gg_trg_Thrall, function Trig_Thrall_Actions)
endfunction

//===========================================================================
// Trigger: Grom
//===========================================================================
function Trig_Grom_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'O003' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Grom_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('Obla', false, GetOwningPlayer(GetTrainedUnit()))
    call SetPlayerUnitAvailableBJ('O003', false, GetOwningPlayer(GetTrainedUnit()))
endfunction

//===========================================================================
function InitTrig_Grom takes nothing returns nothing
    set gg_trg_Grom=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Grom, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Grom, Condition(function Trig_Grom_Conditions))
    call TriggerAddAction(gg_trg_Grom, function Trig_Grom_Actions)
endfunction

//===========================================================================
// Trigger: Kael
//===========================================================================
function Trig_Kael_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'H00D' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Kael_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('Hblm', false, GetOwningPlayer(GetTrainedUnit()))
    call SetPlayerUnitAvailableBJ('H00D', false, GetOwningPlayer(GetTrainedUnit()))
endfunction

//===========================================================================
function InitTrig_Kael takes nothing returns nothing
    set gg_trg_Kael=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Kael, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Kael, Condition(function Trig_Kael_Conditions))
    call TriggerAddAction(gg_trg_Kael, function Trig_Kael_Actions)
endfunction

//===========================================================================
// Trigger: Muradin
//===========================================================================
function Trig_Muradin_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'H00C' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Muradin_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('Hmkg', false, GetOwningPlayer(GetTrainedUnit()))
    call SetPlayerUnitAvailableBJ('H00C', false, GetOwningPlayer(GetTrainedUnit()))
endfunction

//===========================================================================
function InitTrig_Muradin takes nothing returns nothing
    set gg_trg_Muradin=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Muradin, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Muradin, Condition(function Trig_Muradin_Conditions))
    call TriggerAddAction(gg_trg_Muradin, function Trig_Muradin_Actions)
endfunction

//===========================================================================
// Trigger: Muradin Копировать
//===========================================================================
function Trig_Muradin_____________________u_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'Hmkg' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Muradin_____________________u_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('Hmkg', false, GetOwningPlayer(GetTrainedUnit()))
    call SetPlayerUnitAvailableBJ('H00C', false, GetOwningPlayer(GetTrainedUnit()))
endfunction

//===========================================================================
function InitTrig_Muradin_____________________u takes nothing returns nothing
    set gg_trg_Muradin_____________________u=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Muradin_____________________u, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Muradin_____________________u, Condition(function Trig_Muradin_____________________u_Conditions))
    call TriggerAddAction(gg_trg_Muradin_____________________u, function Trig_Muradin_____________________u_Actions)
endfunction

//===========================================================================
// Trigger: Archmage
//===========================================================================
function Trig_Archmage_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'H00B' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Archmage_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('Hamg', false, GetOwningPlayer(GetTrainedUnit()))
    call SetPlayerUnitAvailableBJ('H00B', false, GetOwningPlayer(GetTrainedUnit()))
endfunction

//===========================================================================
function InitTrig_Archmage takes nothing returns nothing
    set gg_trg_Archmage=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Archmage, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Archmage, Condition(function Trig_Archmage_Conditions))
    call TriggerAddAction(gg_trg_Archmage, function Trig_Archmage_Actions)
endfunction

//===========================================================================
// Trigger: Archmage Копировать
//===========================================================================
function Trig_Archmage_____________________u_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'Hamg' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Archmage_____________________u_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('Hamg', false, GetOwningPlayer(GetTrainedUnit()))
    call SetPlayerUnitAvailableBJ('H00B', false, GetOwningPlayer(GetTrainedUnit()))
endfunction

//===========================================================================
function InitTrig_Archmage_____________________u takes nothing returns nothing
    set gg_trg_Archmage_____________________u=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Archmage_____________________u, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Archmage_____________________u, Condition(function Trig_Archmage_____________________u_Conditions))
    call TriggerAddAction(gg_trg_Archmage_____________________u, function Trig_Archmage_____________________u_Actions)
endfunction

//===========================================================================
// Trigger: Paladin
//===========================================================================
function Trig_Paladin_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'H00A' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Paladin_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('Hpal', false, GetOwningPlayer(GetTrainedUnit()))
    call SetPlayerUnitAvailableBJ('H00A', false, GetOwningPlayer(GetTrainedUnit()))
endfunction

//===========================================================================
function InitTrig_Paladin takes nothing returns nothing
    set gg_trg_Paladin=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Paladin, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Paladin, Condition(function Trig_Paladin_Conditions))
    call TriggerAddAction(gg_trg_Paladin, function Trig_Paladin_Actions)
endfunction

//===========================================================================
// Trigger: Paladin Копировать
//===========================================================================
function Trig_Paladin_____________________u_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'Hpal' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Paladin_____________________u_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('Hpal', false, GetOwningPlayer(GetTrainedUnit()))
    call SetPlayerUnitAvailableBJ('H00A', false, GetOwningPlayer(GetTrainedUnit()))
endfunction

//===========================================================================
function InitTrig_Paladin_____________________u takes nothing returns nothing
    set gg_trg_Paladin_____________________u=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Paladin_____________________u, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Paladin_____________________u, Condition(function Trig_Paladin_____________________u_Conditions))
    call TriggerAddAction(gg_trg_Paladin_____________________u, function Trig_Paladin_____________________u_Actions)
endfunction

//===========================================================================
// Trigger: Sylvanas quote
//===========================================================================
function Trig_Sylvanas_quote_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'H00E' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Sylvanas_quote_Actions takes nothing returns nothing
    if GetLocalPlayer() == GetOwningPlayer(GetTriggerUnit()) then
    call PlaySoundOnUnitBJ(gg_snd_Sylvanasrecruited, 100, GetTrainedUnit())
    call KillSoundWhenDoneBJ(GetLastPlayedSound())
    endif
endfunction

//===========================================================================
function InitTrig_Sylvanas_quote takes nothing returns nothing
    set gg_trg_Sylvanas_quote=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Sylvanas_quote, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Sylvanas_quote, Condition(function Trig_Sylvanas_quote_Conditions))
    call TriggerAddAction(gg_trg_Sylvanas_quote, function Trig_Sylvanas_quote_Actions)
endfunction

//===========================================================================
// Trigger: Muradin quote
//===========================================================================
function Trig_Muradin_quote_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'H00C' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Muradin_quote_Actions takes nothing returns nothing
    if GetLocalPlayer() == GetOwningPlayer(GetTriggerUnit()) then
    call PlaySoundOnUnitBJ(gg_snd_Muradinrecruited, 100, GetTrainedUnit())
    call KillSoundWhenDoneBJ(GetLastPlayedSound())
    endif
endfunction

//===========================================================================
function InitTrig_Muradin_quote takes nothing returns nothing
    set gg_trg_Muradin_quote=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Muradin_quote, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Muradin_quote, Condition(function Trig_Muradin_quote_Conditions))
    call TriggerAddAction(gg_trg_Muradin_quote, function Trig_Muradin_quote_Actions)
endfunction

//===========================================================================
// Trigger: Archmage quote
//===========================================================================
function Trig_Archmage_quote_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'H00B' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Archmage_quote_Actions takes nothing returns nothing
    if GetLocalPlayer() == GetOwningPlayer(GetTriggerUnit()) then
    call PlaySoundOnUnitBJ(gg_snd_Jainarecruited, 100, GetTrainedUnit())
    call KillSoundWhenDoneBJ(GetLastPlayedSound())
    endif
endfunction

//===========================================================================
function InitTrig_Archmage_quote takes nothing returns nothing
    set gg_trg_Archmage_quote=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Archmage_quote, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Archmage_quote, Condition(function Trig_Archmage_quote_Conditions))
    call TriggerAddAction(gg_trg_Archmage_quote, function Trig_Archmage_quote_Actions)
endfunction

//===========================================================================
// Trigger: Paladin quote
//===========================================================================
function Trig_Paladin_quote_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'H00A' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Paladin_quote_Actions takes nothing returns nothing
    if GetLocalPlayer() == GetOwningPlayer(GetTriggerUnit()) then
    call PlaySoundOnUnitBJ(gg_snd_Utherrecruited, 100, GetTrainedUnit())
    call KillSoundWhenDoneBJ(GetLastPlayedSound())
    endif
endfunction

//===========================================================================
function InitTrig_Paladin_quote takes nothing returns nothing
    set gg_trg_Paladin_quote=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Paladin_quote, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Paladin_quote, Condition(function Trig_Paladin_quote_Conditions))
    call TriggerAddAction(gg_trg_Paladin_quote, function Trig_Paladin_quote_Actions)
endfunction

//===========================================================================
// Trigger: Cairne quote
//===========================================================================
function Trig_Cairne_quote_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'O005' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Cairne_quote_Actions takes nothing returns nothing
    if GetLocalPlayer() == GetOwningPlayer(GetTriggerUnit()) then
    call PlaySoundOnUnitBJ(gg_snd_Cairnerecruited, 100, GetTrainedUnit())
    call KillSoundWhenDoneBJ(GetLastPlayedSound())
    endif
endfunction

//===========================================================================
function InitTrig_Cairne_quote takes nothing returns nothing
    set gg_trg_Cairne_quote=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Cairne_quote, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Cairne_quote, Condition(function Trig_Cairne_quote_Conditions))
    call TriggerAddAction(gg_trg_Cairne_quote, function Trig_Cairne_quote_Actions)
endfunction

//===========================================================================
// Trigger: Thrall quote
//===========================================================================
function Trig_Thrall_quote_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'O004' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Thrall_quote_Actions takes nothing returns nothing
    if GetLocalPlayer() == GetOwningPlayer(GetTriggerUnit()) then
    call PlaySoundOnUnitBJ(gg_snd_ThrallRecruited, 100, GetTrainedUnit())
    call KillSoundWhenDoneBJ(GetLastPlayedSound())
    endif
endfunction

//===========================================================================
function InitTrig_Thrall_quote takes nothing returns nothing
    set gg_trg_Thrall_quote=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Thrall_quote, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Thrall_quote, Condition(function Trig_Thrall_quote_Conditions))
    call TriggerAddAction(gg_trg_Thrall_quote, function Trig_Thrall_quote_Actions)
endfunction

//===========================================================================
// Trigger: Grom quote
//===========================================================================
function Trig_Grom_quote_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'O003' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Grom_quote_Actions takes nothing returns nothing
    if GetLocalPlayer() == GetOwningPlayer(GetTriggerUnit()) then
    call PlaySoundOnUnitBJ(gg_snd_GromRecruited, 100, GetTrainedUnit())
    call KillSoundWhenDoneBJ(GetLastPlayedSound())
    endif
endfunction

//===========================================================================
function InitTrig_Grom_quote takes nothing returns nothing
    set gg_trg_Grom_quote=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Grom_quote, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Grom_quote, Condition(function Trig_Grom_quote_Conditions))
    call TriggerAddAction(gg_trg_Grom_quote, function Trig_Grom_quote_Actions)
endfunction

//===========================================================================
// Trigger: Tyrande quote
//===========================================================================
function Trig_Tyrande_quote_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'E001' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Tyrande_quote_Actions takes nothing returns nothing
    if GetLocalPlayer() == GetOwningPlayer(GetTriggerUnit()) then
    call PlaySoundOnUnitBJ(gg_snd_TyrandeRecruited, 100, GetTrainedUnit())
    call KillSoundWhenDoneBJ(GetLastPlayedSound())
    endif
endfunction

//===========================================================================
function InitTrig_Tyrande_quote takes nothing returns nothing
    set gg_trg_Tyrande_quote=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Tyrande_quote, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Tyrande_quote, Condition(function Trig_Tyrande_quote_Conditions))
    call TriggerAddAction(gg_trg_Tyrande_quote, function Trig_Tyrande_quote_Actions)
endfunction

//===========================================================================
// Trigger: Maeve quote
//===========================================================================
function Trig_Maeve_quote_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'E003' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Maeve_quote_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('Ewar', false, GetOwningPlayer(GetTrainedUnit()))
    call SetPlayerUnitAvailableBJ('E003', false, GetOwningPlayer(GetTrainedUnit()))
endfunction

//===========================================================================
function InitTrig_Maeve_quote takes nothing returns nothing
    set gg_trg_Maeve_quote=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Maeve_quote, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Maeve_quote, Condition(function Trig_Maeve_quote_Conditions))
    call TriggerAddAction(gg_trg_Maeve_quote, function Trig_Maeve_quote_Actions)
endfunction

//===========================================================================
// Trigger: Maeve quote Копировать
//===========================================================================
function Trig_Maeve_quote_____________________u_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'Ewar' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Maeve_quote_____________________u_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('Ewar', false, GetOwningPlayer(GetTrainedUnit()))
    call SetPlayerUnitAvailableBJ('E003', false, GetOwningPlayer(GetTrainedUnit()))
endfunction

//===========================================================================
function InitTrig_Maeve_quote_____________________u takes nothing returns nothing
    set gg_trg_Maeve_quote_____________________u=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Maeve_quote_____________________u, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Maeve_quote_____________________u, Condition(function Trig_Maeve_quote_____________________u_Conditions))
    call TriggerAddAction(gg_trg_Maeve_quote_____________________u, function Trig_Maeve_quote_____________________u_Actions)
endfunction

//===========================================================================
// Trigger: illidan
//===========================================================================
function Trig_illidan_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'E002' ) ) then
        return false
    endif
    return true
endfunction

function Trig_illidan_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('Edem', false, GetOwningPlayer(GetTrainedUnit()))
    call SetPlayerUnitAvailableBJ('E002', false, GetOwningPlayer(GetTrainedUnit()))
endfunction

//===========================================================================
function InitTrig_illidan takes nothing returns nothing
    set gg_trg_illidan=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_illidan, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_illidan, Condition(function Trig_illidan_Conditions))
    call TriggerAddAction(gg_trg_illidan, function Trig_illidan_Actions)
endfunction

//===========================================================================
// Trigger: illidan Копировать
//===========================================================================
function Trig_illidan_____________________u_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'Edem' ) ) then
        return false
    endif
    return true
endfunction

function Trig_illidan_____________________u_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('Edem', false, GetOwningPlayer(GetTrainedUnit()))
    call SetPlayerUnitAvailableBJ('E002', false, GetOwningPlayer(GetTrainedUnit()))
endfunction

//===========================================================================
function InitTrig_illidan_____________________u takes nothing returns nothing
    set gg_trg_illidan_____________________u=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_illidan_____________________u, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_illidan_____________________u, Condition(function Trig_illidan_____________________u_Conditions))
    call TriggerAddAction(gg_trg_illidan_____________________u, function Trig_illidan_____________________u_Actions)
endfunction

//===========================================================================
// Trigger: Tyrande
//===========================================================================
function Trig_Tyrande_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'E001' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Tyrande_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('Emoo', false, GetOwningPlayer(GetTrainedUnit()))
    call SetPlayerUnitAvailableBJ('E001', false, GetOwningPlayer(GetTrainedUnit()))
endfunction

//===========================================================================
function InitTrig_Tyrande takes nothing returns nothing
    set gg_trg_Tyrande=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Tyrande, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Tyrande, Condition(function Trig_Tyrande_Conditions))
    call TriggerAddAction(gg_trg_Tyrande, function Trig_Tyrande_Actions)
endfunction

//===========================================================================
// Trigger: Tyrande Копировать
//===========================================================================
function Trig_Tyrande_____________________u_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'Emoo' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Tyrande_____________________u_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('Emoo', false, GetOwningPlayer(GetTrainedUnit()))
    call SetPlayerUnitAvailableBJ('E001', false, GetOwningPlayer(GetTrainedUnit()))
endfunction

//===========================================================================
function InitTrig_Tyrande_____________________u takes nothing returns nothing
    set gg_trg_Tyrande_____________________u=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Tyrande_____________________u, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Tyrande_____________________u, Condition(function Trig_Tyrande_____________________u_Conditions))
    call TriggerAddAction(gg_trg_Tyrande_____________________u, function Trig_Tyrande_____________________u_Actions)
endfunction

//===========================================================================
// Trigger: Furion
//===========================================================================
function Trig_Furion_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'Efur' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Furion_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('Ekee', false, GetOwningPlayer(GetTrainedUnit()))
    call SetPlayerUnitAvailableBJ('Efur', false, GetOwningPlayer(GetTrainedUnit()))
endfunction

//===========================================================================
function InitTrig_Furion takes nothing returns nothing
    set gg_trg_Furion=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Furion, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Furion, Condition(function Trig_Furion_Conditions))
    call TriggerAddAction(gg_trg_Furion, function Trig_Furion_Actions)
endfunction

//===========================================================================
// Trigger: Furion Копировать
//===========================================================================
function Trig_Furion_____________________u_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'Ekee' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Furion_____________________u_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('Ekee', false, GetOwningPlayer(GetTrainedUnit()))
    call SetPlayerUnitAvailableBJ('Efur', false, GetOwningPlayer(GetTrainedUnit()))
endfunction

//===========================================================================
function InitTrig_Furion_____________________u takes nothing returns nothing
    set gg_trg_Furion_____________________u=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Furion_____________________u, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Furion_____________________u, Condition(function Trig_Furion_____________________u_Conditions))
    call TriggerAddAction(gg_trg_Furion_____________________u, function Trig_Furion_____________________u_Actions)
endfunction

//===========================================================================
// Trigger: KelThuzad
//===========================================================================
function Trig_KelThuzad_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'U00E' ) ) then
        return false
    endif
    return true
endfunction

function Trig_KelThuzad_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('Ulic', false, GetOwningPlayer(GetTrainedUnit()))
    call SetPlayerUnitAvailableBJ('U00E', false, GetOwningPlayer(GetTrainedUnit()))
endfunction

//===========================================================================
function InitTrig_KelThuzad takes nothing returns nothing
    set gg_trg_KelThuzad=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KelThuzad, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_KelThuzad, Condition(function Trig_KelThuzad_Conditions))
    call TriggerAddAction(gg_trg_KelThuzad, function Trig_KelThuzad_Actions)
endfunction

//===========================================================================
// Trigger: KelThuzad Копировать
//===========================================================================
function Trig_KelThuzad_____________________u_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'Ulic' ) ) then
        return false
    endif
    return true
endfunction

function Trig_KelThuzad_____________________u_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('Ulic', false, GetOwningPlayer(GetTrainedUnit()))
    call SetPlayerUnitAvailableBJ('U00E', false, GetOwningPlayer(GetTrainedUnit()))
endfunction

//===========================================================================
function InitTrig_KelThuzad_____________________u takes nothing returns nothing
    set gg_trg_KelThuzad_____________________u=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KelThuzad_____________________u, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_KelThuzad_____________________u, Condition(function Trig_KelThuzad_____________________u_Conditions))
    call TriggerAddAction(gg_trg_KelThuzad_____________________u, function Trig_KelThuzad_____________________u_Actions)
endfunction

//===========================================================================
// Trigger: Arthas
//===========================================================================
function Trig_Arthas_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'U00D' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Arthas_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('Udea', false, GetOwningPlayer(GetTrainedUnit()))
    call SetPlayerUnitAvailableBJ('U00D', false, GetOwningPlayer(GetTrainedUnit()))
endfunction

//===========================================================================
function InitTrig_Arthas takes nothing returns nothing
    set gg_trg_Arthas=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Arthas, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Arthas, Condition(function Trig_Arthas_Conditions))
    call TriggerAddAction(gg_trg_Arthas, function Trig_Arthas_Actions)
endfunction

//===========================================================================
// Trigger: Arthas Копировать
//===========================================================================
function Trig_Arthas_____________________u_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'Udea' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Arthas_____________________u_Actions takes nothing returns nothing
    call SetPlayerUnitAvailableBJ('Udea', false, GetOwningPlayer(GetTrainedUnit()))
    call SetPlayerUnitAvailableBJ('U00D', false, GetOwningPlayer(GetTrainedUnit()))
endfunction

//===========================================================================
function InitTrig_Arthas_____________________u takes nothing returns nothing
    set gg_trg_Arthas_____________________u=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Arthas_____________________u, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Arthas_____________________u, Condition(function Trig_Arthas_____________________u_Conditions))
    call TriggerAddAction(gg_trg_Arthas_____________________u, function Trig_Arthas_____________________u_Actions)
endfunction

//===========================================================================
// Trigger: Furion quote
//===========================================================================
function Trig_Furion_quote_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'Efur' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Furion_quote_Actions takes nothing returns nothing
    if GetLocalPlayer() == GetOwningPlayer(GetTriggerUnit()) then
    call PlaySoundOnUnitBJ(gg_snd_FurionRecruited, 100, GetTrainedUnit())
    call KillSoundWhenDoneBJ(GetLastPlayedSound())
    endif
endfunction

//===========================================================================
function InitTrig_Furion_quote takes nothing returns nothing
    set gg_trg_Furion_quote=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Furion_quote, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Furion_quote, Condition(function Trig_Furion_quote_Conditions))
    call TriggerAddAction(gg_trg_Furion_quote, function Trig_Furion_quote_Actions)
endfunction

//===========================================================================
// Trigger: KelThuzad quote
//===========================================================================
function Trig_KelThuzad_quote_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'U00E' ) ) then
        return false
    endif
    return true
endfunction

function Trig_KelThuzad_quote_Actions takes nothing returns nothing
    if GetLocalPlayer() == GetOwningPlayer(GetTriggerUnit()) then
    call PlaySoundOnUnitBJ(gg_snd_KelThuzadrecruited, 100, GetTrainedUnit())
    call KillSoundWhenDoneBJ(GetLastPlayedSound())
    endif
endfunction

//===========================================================================
function InitTrig_KelThuzad_quote takes nothing returns nothing
    set gg_trg_KelThuzad_quote=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KelThuzad_quote, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_KelThuzad_quote, Condition(function Trig_KelThuzad_quote_Conditions))
    call TriggerAddAction(gg_trg_KelThuzad_quote, function Trig_KelThuzad_quote_Actions)
endfunction

//===========================================================================
// Trigger: Arthas quote
//===========================================================================
function Trig_Arthas_quote_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTrainedUnit()) == 'U00D' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Arthas_quote_Actions takes nothing returns nothing
    if GetLocalPlayer() == GetOwningPlayer(GetTriggerUnit()) then
    call PlaySoundOnUnitBJ(gg_snd_Arthasrecruited, 100, GetTrainedUnit())
    call KillSoundWhenDoneBJ(GetLastPlayedSound())
    endif
endfunction

//===========================================================================
function InitTrig_Arthas_quote takes nothing returns nothing
    set gg_trg_Arthas_quote=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Arthas_quote, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(gg_trg_Arthas_quote, Condition(function Trig_Arthas_quote_Conditions))
    call TriggerAddAction(gg_trg_Arthas_quote, function Trig_Arthas_quote_Actions)
endfunction

//===========================================================================
// Trigger: HuAl
//===========================================================================
function Trig_HuAl_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTriggerUnit()) == 'h009' ) ) then
        return false
    endif
    return true
endfunction

function Trig_HuAl_Actions takes nothing returns nothing
    call SetUnitAnimation(GetTriggerUnit(), "stand")
    call AddSpecialEffectLocBJ(GetUnitLoc(GetTriggerUnit()), "Abilities\\Spells\\Human\\Resurrect\\ResurrectTarget.mdl")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
endfunction

//===========================================================================
function InitTrig_HuAl takes nothing returns nothing
    set gg_trg_HuAl=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_HuAl, EVENT_PLAYER_UNIT_SPELL_FINISH)
    call TriggerAddCondition(gg_trg_HuAl, Condition(function Trig_HuAl_Conditions))
    call TriggerAddAction(gg_trg_HuAl, function Trig_HuAl_Actions)
endfunction

//===========================================================================
// Trigger: HUAL
//===========================================================================
function Trig_HUAL_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTriggerUnit()) == 'halt' ) ) then
        return false
    endif
    return true
endfunction

function Trig_HUAL_Actions takes nothing returns nothing
    call SetUnitAnimation(GetTriggerUnit(), "stand")
    call AddSpecialEffectLocBJ(GetUnitLoc(GetTriggerUnit()), "Abilities\\Spells\\Human\\Resurrect\\ResurrectTarget.mdl")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
endfunction

//===========================================================================
function InitTrig_HUAL takes nothing returns nothing
    set gg_trg_HUAL=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_HUAL, EVENT_PLAYER_UNIT_SPELL_FINISH)
    call TriggerAddCondition(gg_trg_HUAL, Condition(function Trig_HUAL_Conditions))
    call TriggerAddAction(gg_trg_HUAL, function Trig_HUAL_Actions)
endfunction

//===========================================================================
// Trigger: OrcAl
//===========================================================================
function Trig_OrcAl_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTriggerUnit()) == 'oalt' ) ) then
        return false
    endif
    return true
endfunction

function Trig_OrcAl_Actions takes nothing returns nothing
    call SetUnitAnimation(GetTriggerUnit(), "stand")
    call AddSpecialEffectLocBJ(GetUnitLoc(GetTriggerUnit()), "Units\\Demon\\Infernal\\InfernalBirth.mdl")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
endfunction

//===========================================================================
function InitTrig_OrcAl takes nothing returns nothing
    set gg_trg_OrcAl=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_OrcAl, EVENT_PLAYER_UNIT_SPELL_FINISH)
    call TriggerAddCondition(gg_trg_OrcAl, Condition(function Trig_OrcAl_Conditions))
    call TriggerAddAction(gg_trg_OrcAl, function Trig_OrcAl_Actions)
endfunction

//===========================================================================
// Trigger: ORCAL
//===========================================================================
function Trig_ORCAL_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTriggerUnit()) == 'o002' ) ) then
        return false
    endif
    return true
endfunction

function Trig_ORCAL_Actions takes nothing returns nothing
    call SetUnitAnimation(GetTriggerUnit(), "stand")
    call AddSpecialEffectLocBJ(GetUnitLoc(GetTriggerUnit()), "Units\\Demon\\Infernal\\InfernalBirth.mdl")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
endfunction

//===========================================================================
function InitTrig_ORCAL takes nothing returns nothing
    set gg_trg_ORCAL=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ORCAL, EVENT_PLAYER_UNIT_SPELL_FINISH)
    call TriggerAddCondition(gg_trg_ORCAL, Condition(function Trig_ORCAL_Conditions))
    call TriggerAddAction(gg_trg_ORCAL, function Trig_ORCAL_Actions)
endfunction

//===========================================================================
// Trigger: Neal
//===========================================================================
function Trig_Neal_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTriggerUnit()) == 'eate' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Neal_Actions takes nothing returns nothing
    call SetUnitAnimation(GetTriggerUnit(), "stand")
    call AddSpecialEffectLocBJ(GetUnitLoc(GetTriggerUnit()), "Abilities\\Spells\\NightElf\\Starfall\\StarfallTarget.mdl")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    call TriggerSleepAction(0.35)
    call AddSpecialEffectLocBJ(GetUnitLoc(GetTriggerUnit()), "Units\\NightElf\\Wisp\\WispExplode.mdl")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
endfunction

//===========================================================================
function InitTrig_Neal takes nothing returns nothing
    set gg_trg_Neal=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Neal, EVENT_PLAYER_UNIT_SPELL_FINISH)
    call TriggerAddCondition(gg_trg_Neal, Condition(function Trig_Neal_Conditions))
    call TriggerAddAction(gg_trg_Neal, function Trig_Neal_Actions)
endfunction

//===========================================================================
// Trigger: NEAL
//===========================================================================
function Trig_NEAL_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTriggerUnit()) == 'e000' ) ) then
        return false
    endif
    return true
endfunction

function Trig_NEAL_Actions takes nothing returns nothing
    call SetUnitAnimation(GetTriggerUnit(), "stand")
    call AddSpecialEffectLocBJ(GetUnitLoc(GetTriggerUnit()), "Abilities\\Spells\\NightElf\\Starfall\\StarfallTarget.mdl")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    call TriggerSleepAction(0.35)
    call AddSpecialEffectLocBJ(GetUnitLoc(GetTriggerUnit()), "Units\\NightElf\\Wisp\\WispExplode.mdl")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
endfunction

//===========================================================================
function InitTrig_NEAL takes nothing returns nothing
    set gg_trg_NEAL=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_NEAL, EVENT_PLAYER_UNIT_SPELL_FINISH)
    call TriggerAddCondition(gg_trg_NEAL, Condition(function Trig_NEAL_Conditions))
    call TriggerAddAction(gg_trg_NEAL, function Trig_NEAL_Actions)
endfunction

//===========================================================================
// Trigger: Udal
//===========================================================================
function Trig_Udal_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTriggerUnit()) == 'u00C' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Udal_Actions takes nothing returns nothing
    call SetUnitAnimation(GetTriggerUnit(), "stand")
    call AddSpecialEffectLocBJ(GetUnitLoc(GetTriggerUnit()), "Abilities\\Spells\\Undead\\FrostNova\\FrostNovaTarget.mdl")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
endfunction

//===========================================================================
function InitTrig_Udal takes nothing returns nothing
    set gg_trg_Udal=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Udal, EVENT_PLAYER_UNIT_SPELL_FINISH)
    call TriggerAddCondition(gg_trg_Udal, Condition(function Trig_Udal_Conditions))
    call TriggerAddAction(gg_trg_Udal, function Trig_Udal_Actions)
endfunction

//===========================================================================
// Trigger: UDAL
//===========================================================================
function Trig_UDAL_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetTriggerUnit()) == 'uaod' ) ) then
        return false
    endif
    return true
endfunction

function Trig_UDAL_Actions takes nothing returns nothing
    call SetUnitAnimation(GetTriggerUnit(), "stand")
    call AddSpecialEffectLocBJ(GetUnitLoc(GetTriggerUnit()), "Abilities\\Spells\\Undead\\FrostNova\\FrostNovaTarget.mdl")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
endfunction

//===========================================================================
function InitTrig_UDAL takes nothing returns nothing
    set gg_trg_UDAL=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_UDAL, EVENT_PLAYER_UNIT_SPELL_FINISH)
    call TriggerAddCondition(gg_trg_UDAL, Condition(function Trig_UDAL_Conditions))
    call TriggerAddAction(gg_trg_UDAL, function Trig_UDAL_Actions)
endfunction