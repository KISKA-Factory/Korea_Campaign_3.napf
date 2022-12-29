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
["Site1"] call KISKA_fnc_bases_createFromConfig;
["Site2"] call KISKA_fnc_bases_createFromConfig;
["Site3"] call KISKA_fnc_bases_createFromConfig;
["Site4"] call KISKA_fnc_bases_createFromConfig;
["Site5"] call KISKA_fnc_bases_createFromConfig;
["Site6"] call KISKA_fnc_bases_createFromConfig;
["Site7"] call KISKA_fnc_bases_createFromConfig;
["Site8"] call KISKA_fnc_bases_createFromConfig;
["Site9"] call KISKA_fnc_bases_createFromConfig;
["Site10"] call KISKA_fnc_bases_createFromConfig;
["Site11"] call KISKA_fnc_bases_createFromConfig;



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



/* ----------------------------------------------------------------------------
    Tasks
---------------------------------------------------------------------------- */
["Area1_Task"] call KISKA_fnc_createTaskFromConfig;
["Site2_clearTask"] call KISKA_fnc_createTaskFromConfig;
["Site3_clearTask"] call KISKA_fnc_createTaskFromConfig;

["Area2_Task"] call KISKA_fnc_createTaskFromConfig;
["Site7_clearTask"] call KISKA_fnc_createTaskFromConfig;
["Site8_clearTask"] call KISKA_fnc_createTaskFromConfig;
["Site9_clearTask"] call KISKA_fnc_createTaskFromConfig;

["Area3_Task"] call KISKA_fnc_createTaskFromConfig;
["Site11_clearTask"] call KISKA_fnc_createTaskFromConfig;

["Area4_Task"] call KISKA_fnc_createTaskFromConfig;
["Site10_clearTask"] call KISKA_fnc_createTaskFromConfig;

["Area5_Task"] call KISKA_fnc_createTaskFromConfig;
["Site4_clearTask"] call KISKA_fnc_createTaskFromConfig;
["Site6_clearTask"] call KISKA_fnc_createTaskFromConfig;

["Area6_Task"] call KISKA_fnc_createTaskFromConfig;
["Site5_clearTask"] call KISKA_fnc_createTaskFromConfig;
