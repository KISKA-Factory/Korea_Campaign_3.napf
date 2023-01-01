/* ----------------------------------------------------------------------------
    Misc setup
---------------------------------------------------------------------------- */
[] call KOR_fnc_setupClassEventHandlers;

[] call KOR_fnc_site1_spawnMarines;

call KOR_fnc_site1_createHelicopters;

call KOR_fnc_createPlayerVehicles;


/* ----------------------------------------------------------------------------
    Tasks
---------------------------------------------------------------------------- */
["Area1_Task"] call KISKA_fnc_createTaskFromConfig;
["Area2_Task"] call KISKA_fnc_createTaskFromConfig;
["Area3_Task"] call KISKA_fnc_createTaskFromConfig;
["Area4_Task"] call KISKA_fnc_createTaskFromConfig;
["Area5_Task"] call KISKA_fnc_createTaskFromConfig;
["Area6_Task"] call KISKA_fnc_createTaskFromConfig;


/* ----------------------------------------------------------------------------
    Airfield Effects
---------------------------------------------------------------------------- */
[] spawn KOR_fnc_effect_ambientArty;
[] call KOR_fnc_effect_ambientHelicopter;
["Airfield"] call KISKA_fnc_bases_createFromConfig;

private _radioChatterPositions = ["Airfield Radio Chatter Markers"] call KISKA_fnc_getMissionLayerObjects;
_radioChatterPositions apply {
    [
        false,
        [
            _x
        ]
    ] call KISKA_fnc_radioChatter;
};


/* ----------------------------------------------------------------------------
    Enemy Sites
---------------------------------------------------------------------------- */
private _fnc_createEnemyBase = {
    params ["_base","_task"];

    private _baseMap = [_base] call KISKA_fnc_bases_createFromConfig;
    private _unitsToKill = _baseMap get "unit list";
    private _event = [
        _unitsToKill,
        [[_task],{
            _thisArgs params ["_task"];
            [_task] call KISKA_fnc_endTask;

            private _parentTask = _task call BIS_fnc_taskParent;
            if (_parentTask isEqualTo "") exitWith {};

            private _parentChildren = _parentTask call BIS_fnc_taskChildren;
            private _childTaskStillNotComplete = [
                _parentChildren,
                {!(_x call BIS_fnc_taskCompleted)}
            ] call KISKA_fnc_findIfBool;

            if (_childTaskStillNotComplete) exitWith {};

            [_parentTask] call KISKA_fnc_endTask;
        }]
    ] call KISKA_fnc_setupMultiKillEvent;

    [_task] call KISKA_fnc_createTaskFromConfig;

    nil
};

[
    ["Site2","Site2_clearTask"],
    ["Site3","Site3_clearTask"],
    ["Site4","Site4_clearTask"],
    ["Site5","Site5_clearTask"],
    ["Site6","Site6_clearTask"],
    ["Site7","Site7_clearTask"],
    ["Site8","Site8_clearTask"],
    ["Site9","Site9_clearTask"],
    ["Site10","Site10_clearTask"],
    ["Site11","Site11_clearTask"]
] apply {
    _x call _fnc_createEnemyBase;
};

private _site1Base = ["Site1"] call KISKA_fnc_bases_createFromConfig;
private _unitsToKill = _site1Base get "unit list";
[
    _unitsToKill,
    {
        ["site1_killInfantry_task"] call KISKA_fnc_endTask;
    }
] call KISKA_fnc_setupMultiKillEvent;

[
    ["Site 1 Mortars"] call KISKA_fnc_getMissionLayerObjects,
    {
        ["site1_destroyMortars_task"] call KISKA_fnc_endTask;
    }
] call KISKA_fnc_setupMultiKillEvent;


/* ----------------------------------------------------------------------------
    Supports and Traits
---------------------------------------------------------------------------- */
["KOR_120_arty"] call KISKA_fnc_supportManager_addToPool_global;
["KOR_120_arty"] call KISKA_fnc_supportManager_addToPool_global;
["KOR_120_arty"] call KISKA_fnc_supportManager_addToPool_global;
["KOR_F35_CAS"] call KISKA_fnc_supportManager_addToPool_global;
["KOR_F35_CAS"] call KISKA_fnc_supportManager_addToPool_global;
["KOR_A164_CAS"] call KISKA_fnc_supportManager_addToPool_global;
["KOR_A164_CAS"] call KISKA_fnc_supportManager_addToPool_global;
["KOR_humvee_drop"] call KISKA_fnc_supportManager_addToPool_global;
["KOR_humvee_drop"] call KISKA_fnc_supportManager_addToPool_global;
["KOR_humvee_drop"] call KISKA_fnc_supportManager_addToPool_global;
["KOR_humvee_drop"] call KISKA_fnc_supportManager_addToPool_global;
["KOR_arsenalDrop"] call KISKA_fnc_supportManager_addToPool_global;
["KOR_arsenalDrop"] call KISKA_fnc_supportManager_addToPool_global;

["COMMANDER"] call KISKA_fnc_traitManager_addToPool_global;
["jtac"] call KISKA_fnc_traitManager_addToPool_global;
["jtac"] call KISKA_fnc_traitManager_addToPool_global;
["medic"] call KISKA_fnc_traitManager_addToPool_global;
["medic"] call KISKA_fnc_traitManager_addToPool_global;
["engineer"] call KISKA_fnc_traitManager_addToPool_global;

/* ----------------------------------------------------------------------------
    Misc
---------------------------------------------------------------------------- */
private _logicGroupMap = call KISKA_fnc_ambientAnim_getAttachLogicGroupsMap;
(values _logicGroupMap) apply {
    _x enableDynamicSimulation true;
};


[
    ["Arsenals"] call KISKA_fnc_getMissionLayerObjects
] call KISKA_fnc_addArsenal;

0 setOvercast 0.25;
forceWeatherChange;

private _timeForWeather = 7200; // 2hrs
_timeForWeather setOvercast 1;
_timeForWeather setRain 1;
_timeForWeather setLightnings 1;
// call KOR_fnc_effect_weatherTimeline;

[
    -1,
    [
        "CCM_se_CinematicSuspenseSeriesEpisode004",
        "CCM_se_CinematicSuspenseSeriesEpisode005",
        "CCM_se_CinematicSuspenseSeriesEpisode007",
        "CCM_sb_Permafrost",
        "CCM_sb_AKindofHope",
        "CCM_sb_inSearchOfSolitude",
        "CCM_sb_aurora",
        "CCM_SAV_incandescent",
        "CCM_KE_CurtainsAreAlwaysDrawn",
        "CCM_KE_MistAndClouds",
        "CCM_SQ_LivedYears",
        "CCM_HF_grace",
        "CCM_SQ_SuspensePiano",
        "CCM_AV_SunnyWinterDay",
        "CCM_KE_Imminence",
        "CCM_KE_Scenery",
        "CCM_KE_Denouement",
        "CCM_HF_impending",
        "CCM_sb_sleep",
        "CCM_KE_Plague",
        "CCM_sb_sheMovedMountains",
        "CCM_KE_Harbor",
        "CCM_HF_theWayOutLonging",
        "CCM_KE_ColdWarEcho"
    ],
    [60,120,180]
] call KISKA_fnc_randomMusic;