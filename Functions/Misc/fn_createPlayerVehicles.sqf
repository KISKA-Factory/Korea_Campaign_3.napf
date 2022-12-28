#include "..\..\Headers\Unit Classes.hpp"

private _spawns = ["Player Humvee Spawns"] call KISKA_fnc_getMissionLayerObjects;

KOR_playerVehicles = [];
_spawns apply {
    private _vehicle = createVehicle [
        RECON_VEHICLE_CLASS,
        _x,
        [],
        0,
        "NONE"
    ];

    _vehicle setDir (getDir _x);
    // [_vehicle, true] remoteExecCall ["lock", _vehicle];
    // [_vehicle, false] remoteExec ["allowDamage", 0, true];
    [_vehicle, true] remoteExec ["enableDynamicSimulation", 0, true];

    KOR_playerVehicles pushBack _vehicle;
};


nil
