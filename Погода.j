function Trig_Settings_Actions takes nothing returns nothing
    set udg_WeatherHash=InitHashtable()
    // Weather Library
    set udg_Weather[1]='RAhr'
    set udg_Weather[2]='RAlr'
    set udg_Weather[3]='FDwh'
    set udg_Weather[4]='FDwl'
    set udg_Weather[5]='RLhr'
    set udg_Weather[6]='RLlr'
    set udg_Weather[7]='SNbs'
    set udg_Weather[8]='SNhs'
    set udg_Weather[9]='SNls'
    set udg_Weather[10]='WOcw'
    set udg_Weather[11]='WOlw'
    set udg_Weather[12]='LRaa'
    set udg_Weather[13]='LRma'
    set udg_Weather[14]='WNcw'
    // End of Library
    set udg_Randomweather=GetRandomInt(1, 14)
    call SaveInteger(udg_WeatherHash, GetHandleId(bj_mapInitialPlayableArea), StringHash("weather"), udg_Randomweather)
    set udg_Weather_effect=AddWeatherEffect(bj_mapInitialPlayableArea, udg_Weather[udg_Randomweather])
    call EnableWeatherEffect(udg_Weather_effect, true)
endfunction

//===========================================================================
function InitTrig_Settings takes nothing returns nothing
    set gg_trg_Settings=CreateTrigger()
    call TriggerAddAction(gg_trg_Settings, function Trig_Settings_Actions)
endfunction

//===========================================================================
// Trigger: Random Weather
//===========================================================================
function Trig_Random_Weather_Func003C takes nothing returns boolean
    if ( not ( udg_Randomweather != LoadIntegerBJ(StringHashBJ("weather"), GetHandleIdBJ(GetPlayableMapRect()), udg_WeatherHash) ) ) then
        return false
    endif
    return true
endfunction

function Trig_Random_Weather_Actions takes nothing returns nothing
    set udg_Randomweather=GetRandomInt(1, 14)
    if ( Trig_Random_Weather_Func003C() ) then
        call RemoveWeatherEffect(udg_Weather_effect)
        set udg_Weather_effect=AddWeatherEffect(bj_mapInitialPlayableArea, udg_Weather[udg_Randomweather])
        call EnableWeatherEffect(udg_Weather_effect, true)
        call SaveInteger(udg_WeatherHash, GetHandleId(bj_mapInitialPlayableArea), StringHash("weather"), udg_Randomweather)
    else
    endif
    set udg_Randomweather=0
endfunction

//===========================================================================
function InitTrig_Random_Weather takes nothing returns nothing
    set gg_trg_Random_Weather=CreateTrigger()
    call TriggerRegisterTimerEventPeriodic(gg_trg_Random_Weather, 500.00)
    call TriggerAddAction(gg_trg_Random_Weather, function Trig_Random_Weather_Actions)
endfunction