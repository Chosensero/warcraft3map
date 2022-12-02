function InitGlobals takes nothing returns nothing
    local integer i= 0
    set udg_g=0
    set udg_FI_DefaultHeight=0
    set udg_FI_EffectA=""
    set udg_FI_EffectB=""
    set udg_FI_Sound=""
    set udg_BF_DefautInterval=0
    set udg_Shake=0
    set udg_KB_Max=0
    set udg_kb=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_KB_Speed[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_KB_Angle[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_KB_Dist[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_KB_MaxDist[i]=0
        set i=i + 1
    endloop

    set udg_FI_Max=0
    set udg_fi=0
    set udg_tmpDiffHeight=0
    set udg_tmpTargetZ=0
    set udg_tmpCasterZ=0
    set udg_tmpHeight=0
    set udg_tmpDistance=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_FI_z[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_FI_Angle[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_FI_Vz[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_FI_Height[i]=0
        set i=i + 1
    endloop

    set udg_tmpTime=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_FI_Vp[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_FI_AnimSpeed[i]=0
        set i=i + 1
    endloop

    set udg_real2=0
    set udg_real=0
    set udg_FI_FallHeight=0
    set udg_group=CreateGroup()
    set udg_BF_Max=0
    set udg_bf=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_BF_Time[i]=0
        set i=i + 1
    endloop

    set udg_integer=0
    set udg_TO_Max=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_TO_Duration[i]=0
        set i=i + 1
    endloop

    set udg_UM_CustomInteger=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_CoreX[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_CoreY[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_Map[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_MaxDistance[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_MainAngle[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_MatterReturnAngle[i]=0
        set i=i + 1
    endloop

    set udg_UM_AbilityMaxLevel=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_Radius[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_ExplosionRadius[i]=0
        set i=i + 1
    endloop

    set udg_UM_DestroyTrees=false
    set udg_UM_LoopInterval=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_Effect[i]=""
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_EffectAttach[i]=""
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_MainSize[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_MainHeight[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_MainSpeed[i]=0
        set i=i + 1
    endloop

    set udg_UM_MainCreationRange=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_MatterAmount[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_MatterSize[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_MatterHeight[i]=0
        set i=i + 1
    endloop

    set udg_UM_MatterRotation=false
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_MatterRotationAngleSpeed[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_RevolveDuration[i]=0
        set i=i + 1
    endloop

    set udg_UM_MatterMinimumEffect=0
    set udg_UM_MatterMaximumEffect=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_MatterLightningEffect[i]=""
        set i=i + 1
    endloop

    set udg_UM_MatterMinimumLightning=0
    set udg_UM_MatterMaximumLightning=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_MatterLightningWidth[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_MatterLightningDamage[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_MatterReturnTime[i]=0
        set i=i + 1
    endloop

    set udg_UM_MotionEffectChance=0
    set udg_UM_MatterCollideExplosion=false
    set udg_UM_ExplosionOrbsModelSpecific=false
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_ExplosionOrbsAmount[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_ExplosionOrbsSize[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_ExplosionOrbsMinHeight[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_ExplosionOrbsMaxHeight[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_ExplosionOrbsSpeed[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_ExplosionOrbsCollision[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_ExplosionOrbsDamage[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_ExplosionRadiusDamage[i]=0
        set i=i + 1
    endloop

    set udg_UM_ExplosionOrbsArcChance=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_ExplosionOrbsArc[i]=0
        set i=i + 1
    endloop

    set udg_UM_EffectsAmount=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_CustomReal[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_CustomReal2[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_CustomReal3[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_CustomReal4[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_CustomReal5[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_CustomReal6[i]=0
        set i=i + 1
    endloop

    set udg_UM_ID=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_Level[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_CurrentDistance[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_Phase[i]=0
        set i=i + 1
    endloop

    set udg_UM_Group=CreateGroup()
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_MatterAngle[i]=0
        set i=i + 1
    endloop

    set udg_UM_CustomID=0
    set udg_LH_DurationSet=0
    set udg_LH_LightningNameSet=""
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_MatterRevolveAngle[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_RevolveDurationCounter[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_MatterReturnTimeCounter[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_MatterCurrentDistance[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UM_CustomBoolean[i]=false
        set i=i + 1
    endloop

    set udg_LSE_Width=0
    set udg_LSE_Group=CreateGroup()
    set udg_KB3D_Range=0
    set udg_KB3D_Speed=0
    set udg_KB3D_Angle=0
    set udg_KB3D_D_ENEMY=false
    set udg_KB3D_EndFx=""
    set udg_KB3D_AoEEndDamage=0
    set udg_KB3D_EndwhenDead=false
    set udg_KB3D_KillatEnd=false
    set udg_KB3D_AoE=0
    set udg_KB3D_Arc=0
    set udg_KB3D_DestroyTree=false
    set udg_KB3D_DisableUnit=false
    set udg_KB3D_FaceAngle=false
    set udg_KB3D_iKB=false
    set udg_KB3D_JumpOverCliff=false
    set udg_KB3D_Attach=""
    set udg_KB3D_TrailFx=""
    set udg_KB3D_UnpathableStop=false
    set udg_KB3D_Zoffset=0
    set udg_M_Radius=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_M_Damage[i]=0
        set i=i + 1
    endloop

    set udg_M_Denominator=0
    set udg_M_Numerator=0
    set udg_M_Loops=0
    set udg_M_SpeedBase=0
    set udg_M_Speed=0
    set udg_M_AnglePlus=0
    set udg_M_SuckSFX=""
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_M_Duration[i]=0
        set i=i + 1
    endloop

    set udg_M_TornadoSFX=""
    set udg_M_Levels=0
    set udg_M_THandle=0
    set udg_M_TornadoGroup=CreateGroup()
    set udg_M_PickedHandle=0
    set udg_M_VictimGroup=CreateGroup()
    set udg_M_DistanceBase=0
    set udg_M_DamageLoop=0
    set udg_M_Angle=0
    set udg_SD_Distance=0
    set udg_SD_Speed=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_SD_Damage[i]=0
        set i=i + 1
    endloop

    set udg_SD_Animation=""
    set udg_SD_AnimSpeed=0
    set udg_SD_Offset=0
    set udg_SD_Degrees=0
    set udg_SD_SFX1=""
    set udg_SD_SFX2=""
    set udg_SD_IndexSize=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_SD_Index[i]=0
        set i=i + 1
    endloop

    set udg_SD_MaxIndexSize=0
    set udg_SD_TempInt=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_SD_LOA[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_SD_Angle[i]=0
        set i=i + 1
    endloop

    set udg_manaburn=false
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_damage[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_areaofeffect[i]=0
        set i=i + 1
    endloop

    set udg_unitsfx=""
    set udg_orderid=""
    set udg_stormgroup=CreateGroup()
    set udg_boolean=false
    set udg_handle=0
    set udg_level=0
    set udg_TempGroup=CreateForce()
    set udg_TempReal=0
    set udg_TempInt2=0
    set udg_TempInt=0
    set udg_IAIndex=0
    set udg_IALastRecycled=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_IARecycledList[i]=0
        set i=i + 1
    endloop

    set udg_IAMax=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_IAHas[i]=false
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_IAMaxDistance[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_IADistance[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_IADamage[i]=0
        set i=i + 1
    endloop

    set udg_IACount=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_IAAngle[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_IADMGGroup[i]=CreateGroup()
        set i=i + 1
    endloop

    set udg_ARIndex=0
    set udg_ARLastRecycled=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_ARRecycledList[i]=0
        set i=i + 1
    endloop

    set udg_ARMax=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_ARHas[i]=false
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_ARDelay[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_ARArrows[i]=0
        set i=i + 1
    endloop

    set udg_ARCount=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_ARDamage[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_ARArrowsGroup[i]=CreateGroup()
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_ARArrowsGroup2[i]=CreateGroup()
        set i=i + 1
    endloop

    set udg_FAIndex=0
    set udg_FALastRecycled=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_FARecycledList[i]=0
        set i=i + 1
    endloop

    set udg_FAMax=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_FAHas[i]=false
        set i=i + 1
    endloop

    set udg_FACount=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_FATimer[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_FADelay[i]=0
        set i=i + 1
    endloop

    set udg_SF_BouncesNumber=0
    set udg_SF_RangeBetweenBounces=0
    set udg_SF_RangeOfSmallMissiles=0
    set udg_SF_NumberOfSmallMissiles=0
    set udg_SF_DamageBigMissiles=0
    set udg_SF_DamageSmallMissiles=0
    set udg_SF_DestroyTrees=false
    set udg_JDA_JumpHigh_Distance=0
    set udg_JDA_DestroyTrees_Dash=false
    set udg_JDA_Speed=0
    set udg_JDA_SmallFalse_BigTrue=false
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_JD_Integers[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_JD_Distances[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_JD_ReachedDistance[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_JD_SpeedUnits[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_JD_Angle[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_JD_TreesDestroy[i]=false
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_JD_HighSettings[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_JD_SmallFalse_BigTrue[i]=false
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_JD_DamageBig[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_JD_DamageSmall[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_JD_BouncesMax[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_JD_BouncesCur[i]=0
        set i=i + 1
    endloop

    set udg_JD_Group=CreateGroup()
    set udg_JD_TempGroup=CreateGroup()
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_JD_RealTimer[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_JD_JumpHigh[i]=0
        set i=i + 1
    endloop

    set udg_KrakenGroup=CreateGroup()
    set udg_KrakenCount=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_KrakenCounterStart[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_KrakenTimeCounter[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_KrakenDamageCount[i]=0
        set i=i + 1
    endloop

    set udg_AnchorGroup=CreateGroup()
    set udg_RavageGroup=CreateGroup()
    set udg_RavagePlayer=CreateForce()
    set udg_Timer=CreateTimer()
    set udg_Seconds=0
    set udg_UDex=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UnitIndexLock[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UDexPrev[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UDexNext[i]=0
        set i=i + 1
    endloop

    set udg_UnitIndexEvent=0
    set udg_UDexRecycle=0
    set udg_UnitIndexerEnabled=false
    set udg_UDexWasted=0
    set udg_UDexGen=0
    set udg_DamageTypeExplosive=0
    set udg_DamageTypeCriticalStrike=0
    set udg_DamageTypeHeal=0
    set udg_DamageTypeReduced=0
    set udg_DamageTypeBlocked=0
    set udg_DAMAGE_FACTOR_BRACERS=0
    set udg_DAMAGE_FACTOR_ELUNES=0
    set udg_DAMAGE_FACTOR_ETHEREAL=0
    set udg_DamageEventAOE=0
    set udg_DamageEventLevel=0
    set udg_AfterDamageEvent=0
    set udg_DamageEvent=0
    set udg_AOEDamageEvent=0
    set udg_DamageModifierEvent=0
    set udg_DamageEventAmount=0
    set udg_DamageEventPrevAmt=0
    set udg_DamageEventOverride=false
    set udg_NextDamageOverride=false
    set udg_DamageEventType=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_LastDmgPrevType[i]=0
        set i=i + 1
    endloop

    set udg_NextDamageType=0
    set udg_DamageEventsWasted=0
    set udg_DmgEvRecursionN=0
    set udg_DmgEvRunning=false
    set udg_DmgEvStarted=false
    set udg_IsDamageSpell=false
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_LastDmgWasSpell[i]=false
        set i=i + 1
    endloop

    set udg_LastDamageHP=0
    set udg_DmgEvTimer=CreateTimer()
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_LastDmgPrevAmount[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_LastDmgValue[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_HideDamageFrom[i]=false
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UnitDamageRegistered[i]=false
        set i=i + 1
    endloop

    set udg_DamageEventAOEGroup=CreateGroup()
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_AMSAmount[i]=0
        set i=i + 1
    endloop

    set udg_DmgEvMana=0
    set udg_DmgEvMSlvl=0
    set udg_DmgEvManaMult=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UMovNext[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UMovPrev[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UnitMoving[i]=false
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UnitMovingX[i]=0
        set i=i + 1
    endloop

    set udg_TempX=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_UnitMovingY[i]=0
        set i=i + 1
    endloop

    set udg_TempY=0
    set udg_UnitMovingEvent=0
    set udg_AOEString=""
    set udg_gold=0
    set udg_Lumber=0
    set udg_tempgroup=CreateForce()
    set udg_Tmp_UnitGroup=CreateGroup()
    set udg_playercountgroup=CreateForce()
    set udg_damagegroupvar=CreateForce()
    set udg_string=""
    set udg_EvasionGroup=CreateGroup()
    set udg_NotEvasionGroup=CreateGroup()
    set udg_EvasionLevel=0
    set udg_worker=CreateGroup()
    set udg_Delayed_Duration=0
    set udg_VengeanceAura=0
    set udg_VengeanceGroup=CreateGroup()
    set udg_NotVengeanceGroup=CreateGroup()
    set udg_Piercechance=0
    set udg_RecruitGroup=CreateGroup()
    set udg_RecruitLevel=0
    set udg_NotRecruit=CreateGroup()
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_DamageTaken[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_DamageTotalWorkfroce[i]=0
        set i=i + 1
    endloop

    set udg_Randomweather=0
    set udg_Randomweather2=0
    set i=0
    loop
        exitwhen ( i > 14 )
        set udg_Weather[i]=0
        set i=i + 1
    endloop

    set udg_Satanicgroup=CreateGroup()
    set udg_PedGroup=CreateGroup()
    set udg_TentacleGroup=CreateGroup()
    set udg_TentacleGroup3=CreateGroup()
    set udg_TentacleGroup2=CreateGroup()
    set udg_Tentacleinteger=0
    set udg_Tentacleinteger2=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_TentacleReal[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_RecruitUndyingGroup[i]=CreateGroup()
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_FalsePromise_AbilityLvl[i]=0
        set i=i + 1
    endloop

    set udg_FalsePromise_AbiLvl=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_FalsePromise_Counter[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_FalsePromise_CounterDamage[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_FalsePromise_CounterHeal[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_FalsePromise_Damage[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_FalsePromise_Duration[i]=0
        set i=i + 1
    endloop

    set udg_FalsePromise_Event=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_FalsePromise_HealMultiplier[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_FalsePromise_HitPoints[i]=0
        set i=i + 1
    endloop

    set udg_FalsePromise_LoopInt=0
    set udg_FalsePromise_MaxIndex=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_FalsePromise_NodeNext[i]=0
        set i=i + 1
    endloop

    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_FalsePromise_NodePrev[i]=0
        set i=i + 1
    endloop

    set udg_FalsePromise_PeriodicTimer=0
    set udg_FalsePromise_RecycledSize=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_FalsePromise_RecycledStack[i]=0
        set i=i + 1
    endloop

    set udg_FalsePromise_SFXCredit=""
    set udg_FalsePromise_SFXDamage=""
    set udg_FalsePromise_SFXCredit_AP=""
    set udg_FalsePromise_SFXDamage_AP=""
    set udg_FalsePromise_SFXHeal=""
    set udg_FalsePromise_SFXHeal_AP=""
    set udg_FalsePromise_SFXTarget=""
    set udg_FalsePromise_SFXTarget_AP=""
    set udg_FalsePromise_Spell_ID=0
    set udg_FalsePromise_SpellCount=0
    set i=0
    loop
        exitwhen ( i > 1 )
        set udg_FalsePromise_SpellNode[i]=0
        set i=i + 1
    endloop

    set udg_FalsePromise_TempInt=0
    set udg_FalsePromise_TempReal=0
    set udg_FalsePromise_Unit_ID=0
endfunction
