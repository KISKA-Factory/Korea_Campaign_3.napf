#include "..\..\Headers\Unit Classes.hpp"

scriptName "KOR_fnc_setupClassEventHandlers";

private _enemyClasses = [
    ENEMY_INFANTRY_UNIT_CLASSES,
    ENEMEY_PILOT_UNIT_CLASS,
    ENEMEY_HELI_PILOT_UNIT_CLASS,
    ENEMEY_ARMOR_CREW_UNIT_CLASS,
    ENEMEY_HELI_CREW_UNIT_CLASS
];

private _enemySpawnCode = {
    if (KOR_testing) exitWith {};

    params ["_unit"];

    [
        configFile >> "KISKA_loadouts" >> "KISKA_loadouts_koreaRatnik",
        _unit
    ] call KISKA_fnc_assignUnitLoadout;
};
_enemyClasses apply {
    [_x, "init", _enemySpawnCode] call CBA_fnc_addClassEventHandler;
};




[MARINE_MISC_UNIT_CLASS,"init",{
    params ["_unit"];
    [
        missionConfigFile >> "KOR_marine_loadouts",
        _unit
    ] call KISKA_fnc_assignUnitLoadout;
}] call CBA_fnc_addClassEventhandler;


nil
