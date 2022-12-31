#include "..\..\Headers\Player Radius Defines.hpp"

scriptName "KOR_fnc_areaTaskComplete";

params ["_task","_config","_state"];

private _marker = getText(_config >> "marker");
deleteMarker _marker;

private _completedTaskNumber = (localNamespace getVariable ["KOR_completedTaskNumber",0]) + 1;
localNamespace setVariable ["KOR_completedTaskNumber",_completedTaskNumber];

// if all areas have been cleared
if (_completedTaskNumber < 6) exitWith {};


call KOR_fnc_site1_enable;
