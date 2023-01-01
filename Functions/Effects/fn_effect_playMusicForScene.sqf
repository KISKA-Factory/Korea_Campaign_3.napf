scriptName "KOR_fnc_effect_playMusicForScene";

params ["_scene","_detectedTarget"];

if !(_detectedTarget in (call CBA_fnc_players)) exitWith {};

private _var = "KOR_" + _scene + "_musicPlayed";
if (localNamespace getVariable [_var,false]) exitWith {};

private _music = (localNamespace getVariable "KOR_musicSceneMap") getOrDefault [_scene,""];

if (_music isEqualTo "") exitWith {
	[[_music," is not valid"],true] call KISKA_fnc_log;
	nil
};

[_music] remoteExec ["KISKA_fnc_playMusic",[0,-2] select isDedicated];
localNamespace setVariable [_var,true];
