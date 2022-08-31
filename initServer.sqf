// add helicopter for inital infil
// add main gate objects
// add ambient men on airfield
// add guards around airfield

[
    ["Arsenals"] call KISKA_fnc_getMissionLayerObjects
] call KISKA_fnc_addArsenal;

[] spawn KOR_fnc_effect_ambientArty;
call KOR_fnc_createPlayerVehicles;

[] spawn KOR_fnc_site1_insert;

private _radioChatterPositions = ["Airfield Radio Chatter Markers"] call KISKA_fnc_getMissionLayerObjects;
_radioChatterPositions apply {
    [
        false,
        [
            _x
        ]
    ] call KISKA_fnc_radioChatter;
};


[] call KOR_fnc_effect_ambientHelicopter;

["Airfield"] call KISKA_fnc_bases_createFromConfig;

// private _ambientAnimLogicGroup = missionNamespace getVariable ["KISKA_ambientAnim_attachToLogicGroup",grpNull];
// _ambientAnimLogicGroup enableDynamicSimulation true;

["Site1"] call KISKA_fnc_bases_createFromConfig;
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
