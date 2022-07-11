#include "..\..\Headers\Unit Classes.hpp"

#define NUMBER_OF_CREW 3

scriptName "KOR_fnc_site1_insert";

if (!canSuspend) exitWith {
    _this spawn KOR_fnc_site1_insert;
};


[] call KOR_fnc_site1_spawnMarines;

private _vehicleInfo = [
    KOR_site1_heliSpawn,
    -1,
    MARINE_CH53_HELI_CLASS
] call KISKA_fnc_spawnVehicle;

KOR_site1_insertHeli = _vehicleInfo select 0;

[KOR_site1_insertHeli, false] remoteExec ["allowDamage", 0, true];
private _crew = _vehicleInfo select 1;
_crew apply {
    [_x, false] remoteExec ["allowDamage", 0, true];
};

private _heliGroup = _vehicleInfo select 2;
[_heliGroup, true] call KISKA_fnc_ACEX_setHCTransfer;
_heliGroup setBehaviour "CARELESS";
_heliGroup setCombatMode "BLUE";

/* [KOR_musicMap get "Goldwil Insert"] remoteExec ["KISKA_fnc_playMusic", [0,-2] select isDedicated]; */

/* ----------------------------------------------------------------------------
    Wait for players to board heli
---------------------------------------------------------------------------- */
waituntil {
	sleep 1;
	private _alivePlayers = count (call KISKA_fnc_alivePlayers);
	(
        (_alivePlayers > 0) AND
        {count (crew KOR_site1_insertHeli) isEqualTo (NUMBER_OF_CREW + _alivePlayers)}
    )
};


private _supportMarines = units KOR_site1_marineSupportGroup;
KOR_site1_marineSupportGroup addVehicle KOR_site1_insertHeli;
_supportMarines apply {
    _x assignAsCargo KOR_site1_insertHeli;
    [_x] call BIS_fnc_ambientAnim__terminate;
};
_supportMarines orderGetIn true;

/* ----------------------------------------------------------------------------
    Wait for support troops to board heli
---------------------------------------------------------------------------- */

private _waitingToBoardTime = 0;
waituntil {
	sleep 1;
    _waitingToBoardTime = _waitingToBoardTime + 1;
    if (_waitingToBoardTime > 30) exitWith {
        (call CBA_fnc_players) apply {
            if !(_x in KOR_site1_insertHeli) then {
                _x moveInCargo KOR_site1_insertHeli;
            };
        };

        _supportMarines apply {
            if !(_x in KOR_site1_insertHeli) then {
                _x moveInCargo KOR_site1_insertHeli;
            };

        };

        true
    };

	private _unitIsNotInHelicopter = [
        _supportMarines,
        {!(_x in KOR_site1_insertHeli)}
    ] call KISKA_fnc_findIfBool;

    !_unitIsNotInHelicopter
};

// keep players from exiting while heli takes off
[KOR_site1_insertHeli, true] remoteExecCall ["lock",KOR_site1_insertHeli];
[] spawn {
    sleep 15;
    // let people switch seats
    [KOR_site1_insertHeli, false] remoteExecCall ["lock",KOR_site1_insertHeli];
};



/* ----------------------------------------------------------------------------
    Drop off players
---------------------------------------------------------------------------- */
private _afterDropCode = {
    private _leader = leader KOR_site1_marineSupportGroup;
    [KOR_site1_marineSupportGroup, KOR_site1_insertHeli] remoteExec ["leaveVehicle",_leader];


    _this spawn {
        params ["_heli"];

        private _pilot = currentPilot _heli;
        [[_pilot],(getPosATL KOR_deletePos)] remoteExec ["doMove",_pilot];

        waitUntil {
            sleep 2;
            _heli distance2D KOR_deletePos <= 400;
        };

        deleteVehicleCrew _heli;
        deleteVehicle _heli;
    };
};


private _unitsToDrop = (fullCrew [KOR_site1_insertHeli,"cargo"]) apply {
    _x select 0
};

KOR_site1_insertHeli setVariable ["KISKA_ACEFastRope_ropeDeploymentTime",4];
[
    KOR_site1_insertHeli,
    KOR_site1_insertPos,
    _unitsToDrop,
    _afterDropCode,
    28,
    [
        [-0.573,-6.031,-1.695],
        [0.573,-6.031,-1.695]
    ]
] call KISKA_fnc_ACE_fastRope;


nil
