#include "..\..\Headers\Unit Classes.hpp"

scriptName "KOR_fnc_site1_ambush";

private _ambushFunction = {
    params ["_spawns"];

    private _units = [];
    _spawns apply {
        private _group = [
            selectRandom [6,8],
            [ENEMY_INFANTRY_UNIT_CLASSES],
            OPFOR,
            _x
        ] call KISKA_fnc_spawnGroup;

        [
            _group,
            [15487.6,3918.7,0],
            10,
            "AWARE"
        ] call KISKA_fnc_attack;

        _units append (units _group);
    };

    _units;
};



private _firstWaveUnits = [[
    [15109.7,3984.62,0],
    [15165.2,4040.81,0],
    [15462.8,4228.24,0], // flank
    [15584.7,4297.85,0] // flank
]] call _ambushFunction;

[
    _firstWaveUnits,
    [[_ambushFunction],{
        hint "spawn second ambush";
        _thisArgs params ["_ambushFunction"];
        [[
            [15063.1,3850.61,0],
            [15109.7,3984.62,0],
            [15462.8,4228.24,0] // flank
        ]] call _ambushFunction;
    }],
    0.5
] call KISKA_fnc_setupMultiKillEvent;
