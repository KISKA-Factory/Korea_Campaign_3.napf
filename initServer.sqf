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

private _map = ["Airfield"] call KISKA_fnc_bases_createFromConfig;
hint str _map;

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
