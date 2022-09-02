#include "..\..\Headers\Unit Classes.hpp"

scriptName "KOR_fnc_setupClassEventHandlers";

// private _enemyClasses = [
//     "O_T_Soldier_GL_F",
//     "O_T_Soldier_AT_F",
//     "O_T_Soldier_A_F",
//     "O_T_Soldier_AHAT_F",
//     "O_T_Soldier_AAA_F",
//     "O_T_Soldier_AAT_F",
//     "O_T_Soldier_AR_F",
//     "O_T_Medic_F",
//     "O_T_Crew_F",
//     "O_T_Engineer_F",
//     "O_T_Soldier_Exp_F",
//     "O_T_Helicrew_F",
//     "O_T_Helipilot_F",
//     "O_T_Soldier_M_F",
//     "O_T_soldier_mine_F",
//     "O_T_Soldier_AA_F",
//     "O_T_Pilot_F",
//     "O_T_Soldier_Repair_F",
//     "O_T_Soldier_LAT_F",
//     "O_T_Soldier_HAT_F",
//     "O_T_Soldier_unarmed_F",
//     "O_T_Soldier_TL_F",
//     "O_T_Soldier_SL_F",
//     "O_T_Soldier_F",
//     "O_T_Soldier_AAR_F"
// ];
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
    ] spawn KISKA_fnc_assignUnitLoadout;
};
_enemyClasses apply {
    [_x, "init", _enemySpawnCode] call CBA_fnc_addClassEventHandler;
};




[MARINE_MISC_UNIT_CLASS,"init",{
	params ["_unit"];
	[
        missionConfigFile >> "KOR_marine_loadouts",
        _unit
    ] spawn KISKA_fnc_assignUnitLoadout;
}] call CBA_fnc_addClassEventhandler;


nil
