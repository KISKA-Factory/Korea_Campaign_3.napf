#include "..\..\Headers\Unit Classes.hpp"
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

// TODO add maintainer loadouts to loadouts.hpp
// TODO have cobras take off too at some point
// TODO add in helipad facing correct direction

private _timeline = [
	[
		{
			params ["","","_timelineMap"];

			
			private _heli = MARINE_CH53_HELI_CLASS createVehicle (getPosATL KOR_ambientHeliSpawn);
			_heli setPosASL (getPosASL KOR_ambientHeliSpawn);
			_heli setDir (getDir KOR_ambientHeliSpawn);
			_heli allowDamage false;
			_heli lock true;
			[_heli] call KISKA_fnc_clearCargoGlobal;
			_timelineMap set ["transportHeli",_heli];

			private _createUnitsForGroup = {
				params ["_spawnPositions","_unitClasses"];
				
				private _group = createGroup BLUFOR;
				{
					private _spawnPos = _spawnPositions select _forEachIndex;
					private _unit = _group createUnit [_x,_spawnPos,[],0,"NONE"];
					_unit setPosASL (getPosASL _spawnPos);
					_unit setDir (getDir _spawnPos);
					_unit allowDamage false;
				} forEach _classes;


				_group
			};

			private _crewGroup = [
				["Airfield Timeline Heli Crew Positions"] call KISKA_fnc_getMissionLayerObjects,
				[MARINE_HELI_PILOT_UNIT_CLASS,MARINE_HELI_PILOT_UNIT_CLASS,MARINE_HELI_CREW_UNIT_CLASS]
			] call _createUnitsForGroup;
			_timelineMap set ["heliCrewGroup",_crewGroup];

			[
				(units _crewGroup),
				["STAND_UNARMED_1","STAND_UNARMED_2","STAND_UNARMED_3"]
			] call KISKA_fnc_ambientAnim;


			private _maintainerGroup = private _crewGroup = [
				["Airfield Timeline Heli Maintainer Spawns"] call KISKA_fnc_getMissionLayerObjects,
				[MARINE_MISC_UNIT_CLASS,MARINE_MISC_UNIT_CLASS]
			] call _createUnitsForGroup;
			_timelineMap set ["heliMaintainerGroup",_maintainerGroup];

			
		},
		2
	]
	// [
	// 	{
	// 		params ["","","_timelineMap","_heli"];
	// 		hint str (_timelineMap getOrDefault ["helo",objNull]);
	// 		_heli engineOn true;
	// 	}
	// ]
];

[_timeline] call KISKA_fnc_startTimeline;