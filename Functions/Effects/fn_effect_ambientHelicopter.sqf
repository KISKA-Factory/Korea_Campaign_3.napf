#include "..\..\Headers\Unit Classes.hpp"
// aircrew spawn
// maintainers spawn
// marines spawn
// all ambient anim
// aircrew and maintainers stand chatting at the aircraft
// aircrew boards aircraft
// maintainers take up positions
// aircrew start engines
// crewchief stays outside
// Marines break from ambient anim and walk to aircraft and board
// crew chief boards
// aircraft waits for a few seconds,
// aircraft lifts off towards the north
// after a few minutes aircraft returns and lands facing the same way
// aircrew disembarks
// aircrew start ambient anim

private _timeline = [
	[
		{

			private _heli = MARINE_CH53_HELI_CLASS createVehicle (getPosATL KOR_ambientHeliSpawn);
			_heli setDir (getDir KOR_ambientHeliSpawn);
			_heli allowDamage false;
			_heli lock true;

			_heli
		},
		2
	],
	[
		{
			params ["","","_heli"];
			_heli engineOn true;
		}
	]
];

[_timeline] call KISKA_fnc_startTimeline;