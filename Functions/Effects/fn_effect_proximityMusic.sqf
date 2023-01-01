#include "..\..\Player Radius Defines.hpp"

[
	[],
	[]
] apply {
	[
		{
			params ["_position","_radius"];
			CONDITION_PLAYER_WITHIN_RADIUS_3D(_position,_radius)
		},
		{
			params ["","","_song"];
			[_song] remoteExec ["KISKA_fnc_playMusic",[0,-2] select isDedicated];
		},
		5,
		_x
	] call KISKA_fnc_waitUntil;
};