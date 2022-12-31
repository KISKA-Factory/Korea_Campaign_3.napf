#include "..\..\Headers\Unit Classes.hpp"

scriptName "KOR_fnc_site1_createHelicopters";

{
    _x params ["_vehicleInfoGlobal","_jipDamageId","_spawnGlobal"];
    
    private _spawnPoint = missionNamespace getVariable _spawnGlobal;
    private _vehicleInfo = [
        _spawnPoint,
        -1,
        MARINE_CH53_HELI_CLASS
    ] call KISKA_fnc_spawnVehicle;

    missionNamespace setVariable [_vehicleInfoGlobal,_vehicleInfo];

    private _vehicle = _vehicleInfo select 0; 
    _vehicle setCaptive true;
    [_vehicle] call KISKA_fnc_clearCargoGlobal;

    if (_forEachIndex isEqualTo 0) then {
        KOR_site1_insertHeli = _vehicle;
    } else {
        _vehicle lock true;
    };

    [_vehicle, false] remoteExec ["allowDamage", 0, _jipDamageId];
    private _crew = _vehicleInfo select 1;
    _crew apply {
        [_x, false] remoteExec ["allowDamage", 0, _jipDamageId];
    };

} forEach [
    [
        "KOR_site1InsertHeli_info",
        "KOR_site1_insertHeli_damage",
        "KOR_site1_heliSpawn_1"
    ],
    [
        "KOR_site1InsertHeliPairedHeli_info",
        "KOR_site1_insertHeliPaired_damage",
        "KOR_site1_heliSpawn_2"
    ]
];

