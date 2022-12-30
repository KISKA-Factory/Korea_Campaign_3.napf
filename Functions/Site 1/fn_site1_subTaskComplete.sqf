scriptName "KOR_fnc_site1_subTaskComplete";

private _completedTaskNumber = (localNamespace getVariable ["KOR_completedSite1TaskNumber",0]) + 1;
localNamespace setVariable ["KOR_completedSite1TaskNumber",_completedTaskNumber];

if (_completedTaskNumber < 2) exitWith {};

["site1_Task"] call KISKA_fnc_endTask;

call KOR_fnc_site1_extraction;
