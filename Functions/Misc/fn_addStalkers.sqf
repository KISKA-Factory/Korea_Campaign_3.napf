#include "..\..\Headers\Unit Classes.hpp"

scriptName "KOR_fnc_addStalkers";
params ["_layer","_musicScene"];

[
    {
        _this call KOR_fnc_effect_playMusicForScene;
    },
    [_musicScene],
    30
] call CBA_fnc_waitAndExecute;


private _afterFastropeFunction = {
    _thisArgs params ["_stalkerGroup"];
    _stalkerGroup enableDynamicSimulation true;

    _this spawn {
        params ["_heli"];

        private _pilot = currentPilot _heli;
        [[_pilot],(getPosATL KOR_deletePos_enemy)] remoteExec ["doMove",_pilot];

        waitUntil {
            sleep 2;
            _heli distance2D KOR_deletePos_enemy <= 400;
        };

        deleteVehicleCrew _heli;
        deleteVehicle _heli;
    };

    

    [
        {
            params ["_stalkerGroup"];
            if !([_stalkerGroup] call KISKA_fnc_isGroupAlive) exitWith {true};

            private _leader = leader _stalkerGroup;
            private _players = [true] call KISKA_fnc_alivePlayers; 
            if (_players isEqualTo []) exitWith {false};

            private _nearestPlayerGroup = grpNull;
            private _distance = -1;
            _players apply {
                private _group = group _x;
                if (_group isEqualTo _nearestGroup) then {continue};

                private _currentDistance = _leader distance (leader _group);
                if (isNull _nearestPlayerGroup) then {
                    _nearestPlayerGroup = _group;
                    _distance = _currentDistance;
                    continue;
                };

                if (_currentDistance < _distance) then {
                    _nearestPlayerGroup = _group;
                    _distance = _currentDistance;
                };  
            };

            if !(isNull _nearestPlayerGroup) exitWith {
                _this pushBack _nearestPlayerGroup;
                true
            };

            false
        },
        {
            params [
                "_stalkerGroup",
                ["_nearestPlayerGroup",grpNull]
            ];

            if (
                !([_stalkerGroup] call KISKA_fnc_isGroupAlive) OR
                !([_nearestPlayerGroup] call KISKA_fnc_isGroupAlive)
            ) exitWith {};

            [
                _stalkerGroup,
                _nearestPlayerGroup
            ] spawn KISKA_fnc_stalk;
        },
        5,
        [_stalkerGroup]
    ] call KISKA_fnc_waitUntil;
};





private _landingZones = [_layer] call KISKA_fnc_getMissionLayerObjects;
if (_landingZones isEqualTo []) exitWith {
    [["Did not find any lzs for ",_layer],true] call KISKA_fnc_log;
    nil
};



private _spawnPositions = ["stalker heli spawns"] call KISKA_fnc_getMissionLayerObjects;
{
    private _spawnPosition = _spawnPositions select _forEachIndex;

    private _heliInfo = [
        _spawnPosition,
        180,
        KOREAN_LIGHT_HELI_CLASS,
        OPFOR,
        false,
        [ENEMEY_HELI_PILOT_UNIT_CLASS]
    ] call KISKA_fnc_spawnVehicle;


    private _stalkerGroup = [
        6,
        [ ENEMY_INFANTRY_UNIT_CLASSES ],
        OPFOR,
        [0,0,0],
        false
    ] call KISKA_fnc_spawnGroup;


    
    private _heli = _heliInfo select 0;
    _heli flyInHeight 30;
    (units _stalkerGroup) apply {
        _x moveInCargo _heli;
    };


    [
        _heli,
        _x,
        _stalkerGroup,
        [[_stalkerGroup],_afterFastropeFunction],
        28
    ] call KISKA_fnc_ACE_fastRope;
} forEach _landingZones;
