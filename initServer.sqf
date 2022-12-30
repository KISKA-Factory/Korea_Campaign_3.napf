// add helicopter for inital infil
// add main gate objects
// add ambient men on airfield
// add guards around airfield
/* ----------------------------------------------------------------------------
    Misc setup
---------------------------------------------------------------------------- */
[] call KOR_fnc_setupClassEventHandlers;

[
    ["Arsenals"] call KISKA_fnc_getMissionLayerObjects
] call KISKA_fnc_addArsenal;

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
call KOR_fnc_createPlayerVehicles;
[] spawn KOR_fnc_effect_ambientArty;
// [] spawn KOR_fnc_site1_insert;
// [] call KOR_fnc_effect_ambientHelicopter;
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

/* ----------------------------------------------------------------------------
    Misc
---------------------------------------------------------------------------- */
private _logicGroupMap = call KISKA_fnc_ambientAnim_getAttachLogicGroupsMap;
(values _logicGroupMap) apply {
    _x enableDynamicSimulation true;
};

/*
heli setVariable ["KISKA_ACEFastRope_ropeDeploymentTime",4];
player moveInCargo heli;
[
    heli,
    spot,
    (fullCrew [heli,"cargo"]) apply {
        _x select 0
    },
    {},
    28,
    [
        [-0.573,-6.031,-1.695],
        [0.573,-6.031,-1.695]
    ]
] call KISKA_fnc_ACE_fastRope;
*/


