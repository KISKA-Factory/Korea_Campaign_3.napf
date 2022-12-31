scriptName "KOR_fnc_site1_insert";

["site1_boardHeli"] call KISKA_fnc_createTaskFromConfig;

private _heliDropOffScript = {
    params ["_vehicleInfo"];

    /* ----------------------------------------------------------------------------
        Wait for players to board heli
    ---------------------------------------------------------------------------- */
    private _crew = _vehicleInfo select 1;
    private _heliCrewCount = count _crew;
    waituntil {
        sleep 1;
        private _alivePlayers = count ([] call KISKA_fnc_alivePlayers);
        (
            (_alivePlayers > 0) AND
            {count (crew KOR_site1_insertHeli) isEqualTo (_heliCrewCount + _alivePlayers)}
        )
    };

    private _supportMarines = units KOR_site1_marineSupportGroup;
    KOR_site1_marineSupportGroup addVehicle KOR_site1_insertHeli;
    _supportMarines apply {
        _x assignAsCargo KOR_site1_insertHeli;
        [_x] call KISKA_fnc_ambientAnim_stop;
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

    private _heli = _vehicleInfo select 0;
    _heli engineOn true;
    
    sleep 9;

    localNamespace setVariable ["KOR_site1HeliTakingOff",true];
    ["site1_boardHeli"] call KISKA_fnc_endTask;

    // keep players from exiting while heli takes off
    [KOR_site1_insertHeli, true] remoteExecCall ["lock",KOR_site1_insertHeli];
    [] spawn {
        sleep 15;
        // let people switch seats
        [KOR_site1_insertHeli, false] remoteExecCall ["lock",KOR_site1_insertHeli];
    };



    /* ----------------------------------------------------------------------------
        Drop off Units
    ---------------------------------------------------------------------------- */
    private _afterDropCode = {
        private _leader = leader KOR_site1_marineSupportGroup;
        [KOR_site1_marineSupportGroup, KOR_site1_insertHeli] remoteExec ["leaveVehicle",_leader];

        // tell heli to move to deleteion
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

        [KOR_site1_marineSupportGroup] remoteExec ["KOR_fnc_site1_marineOrders",_leader];
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

};

private _pairedHeliScript = {
    params ["_vehicleInfo"];

    private _vehicle = _vehicleInfo select 0;
    _vehicle engineOn true;

    waitUntil {
        sleep 1;
        localNamespace getVariable ["KOR_site1HeliTakingOff",false];
    };

    private _group = _vehicleInfo select 2;
    [
        _group,
        (group ((crew KOR_site1_insertHeli) select 0)),
        2,
        {
            KOR_site1InsertHeliPairedHeli_info params ["_vehicle","_crew"];
            deleteVehicleCrew _vehicle;
            deleteVehicle _vehicle;
        }
    ] spawn KISKA_fnc_stalk;
}; 



{
    _x params ["_vehicleInfo","_script"];
    
    private _heliGroup = _vehicleInfo select 2;
    [_heliGroup, true] call KISKA_fnc_ACEX_setHCTransfer;
    _heliGroup setBehaviour "CARELESS";
    _heliGroup setCombatMode "BLUE";

    [_vehicleInfo] spawn _script;

} forEach [
    [
        KOR_site1InsertHeli_info,
        _heliDropOffScript
    ],
    [
        KOR_site1InsertHeliPairedHeli_info,
        _pairedHeliScript
    ]
];


/* [KOR_musicMap get "Goldwil Insert"] remoteExec ["KISKA_fnc_playMusic", [0,-2] select isDedicated]; */



nil
