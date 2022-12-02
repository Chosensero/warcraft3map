//===========================================================================
// Trigger: MTWBE
//===========================================================================
function Trig_MTWBE_Conditions takes nothing returns boolean
	return GetSpellAbilityId() == 'A01L'
endfunction
function Trig_MTWBE_Radius takes nothing returns real
	return 500.00
endfunction
function Trig_MTWBE_Filters takes nothing returns boolean
	return GetOwningPlayer(GetFilterUnit()) == bj_groupEnumOwningPlayer and IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false and IsUnitType(GetFilterUnit(), UNIT_TYPE_SAPPER) == false
endfunction
function Trig_MTWBE_Actions takes nothing returns boolean
 local location loc= GetSpellTargetLoc()
 local unit u= GetTriggerUnit()
 local real dx= GetLocationX(loc) - GetUnitX(u)
 local real dy= GetLocationY(loc) - GetUnitY(u)
    local integer i= 0
    local group g= CreateGroup()
    set bj_groupEnumOwningPlayer=GetOwningPlayer(u)
    call GroupEnumUnitsInRange(g, GetUnitX(u), GetUnitY(u), Trig_MTWBE_Radius(), Filter(function Trig_MTWBE_Filters))
    loop
        exitwhen u == null or i == 12
        call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\NightElf\\Blink\\BlinkCaster.mdl", GetUnitX(u), GetUnitY(u)))
        call SetUnitX(u, GetUnitX(u) + dx)
        call SetUnitY(u, GetUnitY(u) + dy)
        call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\NightElf\\Blink\\BlinkTarget.mdl", GetUnitX(u), GetUnitY(u)))
        call GroupRemoveUnit(g, u)
        set u=FirstOfGroup(g)
        set i=i + 1
    endloop
	call RemoveLocation(loc)
	set loc=null
	set u=null
	call DestroyGroup(g)
	set g=null
	return false
endfunction
function InitTrig_MTWBE takes nothing returns nothing
	set gg_trg_MTWBE=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(gg_trg_MTWBE, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	call TriggerAddCondition(gg_trg_MTWBE, And(Filter(function Trig_MTWBE_Conditions), Filter(function Trig_MTWBE_Actions)))
endfunction