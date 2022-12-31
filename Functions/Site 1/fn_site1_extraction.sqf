#include "..\..\Headers\Unit Classes.hpp"

scriptName "KOR_fnc_site1_extraction";

["Extraction is inbound to your position, please standby."] remoteExecCall ["KISKA_fnc_dataLinkMsg",0];
["extraction"] call KISKA_fnc_createTaskFromConfig;

private _afterLandCode = {
    params ["_heli"];

    [KOR_site1_marineSupportGroup] call KISKA_fnc_clearWaypoints;
    private _supportMarines = units KOR_site1_marineSupportGroup;
    private _waypoint = KOR_site1_marineSupportGroup addWaypoint [_heli,0];
    _waypoint setWaypointType "GETIN";
    _waypoint waypointAttachVehicle _heli;

    [
        {
            params ["_heli"];
            if !(localNamespace getVariable ["KOR_extractionPickedUp", false]) then {
                (units KOR_site1_marineSupportGroup) apply {
                    _x moveInCargo _heli;
                };
            };
        },
        [_heli],
        60
    ] call CBA_fnc_waitAndExecute;

    [
        {
            params ["_heli","_crewCount","_marineCount"];
            
            private _unitsInHeli = count (crew _heli);
            private _playerCount = count ([true] call KISKA_fnc_alivePlayers);
            _unitsInHeli isEqualTo (_marineCount + _playerCount + _crewCount)
        },
        {
            // everyone is picked up, RTB
            params ["_heli"];
            
            ["extraction"] call KISKA_fnc_endTask;
            localNamespace setVariable ["KOR_extractionPickedUp", true];

            [
                _heli,
                KOR_site1_heliSpawn_1,
                "LAND",
                true,
                {
                    ["EveryoneWon"] call BIS_fnc_endMissionServer;
                }
            ] call KISKA_fnc_heliLand;

        },
        3,
        [
            _heli,
            _thisArgs select 0,
            count (units KOR_site1_marineSupportGroup)
        ]
    ] call KISKA_fnc_waitUntil;
};



{
    private _spawnPoint = _x;
    private _vehicleInfo = [
        _spawnPoint,
        294,
        MARINE_CH53_HELI_CLASS,
        BLUFOR,
        false
    ] call KISKA_fnc_spawnVehicle;

    private _vehicle = _vehicleInfo select 0; 
    _vehicle setCaptive true;
    [_vehicle] call KISKA_fnc_clearCargoGlobal;
    [_vehicle,false] remoteExecCall ["allowDamage",0];
    private _crew = _vehicleInfo select 1;
    _crew apply {
        [_x,false] remoteExecCall ["allowDamage",0];
    };

    private _heliCrewGroup = _vehicleInfo select 2;

    if (_forEachIndex isEqualTo 0) then {
        KOR_extractionHeli = _vehicle;
        KOR_extractionHeliGroup = _heliCrewGroup;

        [
            _vehicle,
            KOR_extractionLZ,
            "GET IN",
            true,
            [[count _crew],_afterLandCode]
        ] call KISKA_fnc_heliLand;

    } else {
        KOR_pairedExtractionHeli = _vehicle;
        [
            _heliCrewGroup,
            KOR_extractionHeliGroup,
            2,
            {
                [
                    KOR_pairedExtractionHeli,
                    KOR_site1_heliSpawn_2,
                    "LAND"
                ] call KISKA_fnc_heliLand;

            },
            {localNamespace getVariable ["KOR_extractionPickedUp", false]}
        ] spawn KISKA_fnc_stalk;
    };
} forEach [
    KOR_extractionHeliSpawn_1,
    KOR_extractionHeliSpawn_2
];