#include "..\..\Headers\Unit Classes.hpp"

scriptName "KOR_fnc_site1_extraction";

["Extraction is inbound to your position, please standby."] remoteExecCall ["KISKA_fnc_dataLinkMsg",0];
["extraction"] call KISKA_fnc_createTaskFromConfig;

private _afterLandCode = {
    params ["_heli"];

    [
        {
            params ["_heli"];
            if !(localNamespace getVariable ["KOR_extractionPickedUp", false]) then {
                (units KOR_site1_marineSupportGroup) apply {
                    _x moveInCargo _heli;
                };
            };
        },
        60,
        [_heli]
    ] call CBA_fnc_waitAndExecute;

    // [_heli,_thisArgs] spawn {
    //     params ["_heli","_thisArgs"];
    //     _thisArgs params ["_crewCount"];

    //     private _supportMarines = units KOR_site1_marineSupportGroup;
    //     _supportMarines apply {
    //         _x assignAsCargo _heli;
    //     };
    //     _supportMarines orderGetIn true;

    //     waitUntil {
    //         sleep 2;

    //         private _unitsInHeli = count (crew _heli);
    //         private _playerCount = count ([true] call KISKA_fnc_alivePlayers);
    //         _unitsInHeli isEqualTo (_marineCount + _playerCount + _crewCount)
    //     };

    //     localNamespace setVariable ["KOR_extractionPickedUp", true];

    //     [
    //         _heli,
    //         KOR_site1_heliSpawn_1,
    //         "LAND"
    //     ] call KISKA_fnc_heliLand;
    // };

    [
        [_thisArgs,{
            params ["_heli"];
            _thisArgs params ["_crewCount"];
            
            private _unitsInHeli = count (crew _heli);
            private _playerCount = count ([true] call KISKA_fnc_alivePlayers);
            _unitsInHeli isEqualTo (_marineCount + _playerCount + _crewCount)
        }],
        {
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
        }
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
        [
            _heliCrewGroup,
            KOR_extractionHeliGroup,
            2
        ] spawn KISKA_fnc_stalk;
    };
} forEach [
    KOR_extractionHeliSpawn_1,
    KOR_extractionHeliSpawn_2
];