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
			[_heli,false] remoteExec ["allowDamage",0,true];
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
					[_unit,false] remoteExec ["allowDamage",0,true];
				} forEach _unitClasses;


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


			private _maintainerGroup = [
				["Airfield Timeline Heli Maintainer Spawns"] call KISKA_fnc_getMissionLayerObjects,
				[MARINE_MISC_UNIT_CLASS,MARINE_MISC_UNIT_CLASS]
			] call _createUnitsForGroup;
			_timelineMap set ["heliMaintainerGroup",_maintainerGroup];
			[
				(units _maintainerGroup),
				["STAND_UNARMED_1","STAND_UNARMED_2","STAND_UNARMED_3"]
			] call KISKA_fnc_ambientAnim;


			private _reconGroup = [
				["Airfield Timeline Heli Recon Spawns"] call KISKA_fnc_getMissionLayerObjects,
				[MARINE_RECON_FAST_UNIT_CLASSES] // count of 8
			] call _createUnitsForGroup;
			_timelineMap set ["heliReconGroup",_reconGroup];
			[
				(units _reconGroup),
				["STAND_ARMED_1","STAND_ARMED_2","SIT_GROUND_ARMED","SIT_GROUND_ARMED"]
			] call KISKA_fnc_ambientAnim;

		},
		5
	],
	[
		{
			params ["","","_timelineMap"];

			private _crewGroup = _timelineMap get "heliCrewGroup";
			private _heliCrewUnits = units _crewGroup;
			_heliCrewUnits apply {
				[_x,false] call KISKA_fnc_ambientAnim_stop;
			};

			private _heli = _timelineMap get "transportHeli";
			_crewGroup addVehicle _heli;
			_heliCrewUnits orderGetIn true;

			private _heliInfo = [_heli,_heliCrewUnits];
			[
				{
					params ["_heli","_heliCrewUnits"];
					_heliCrewUnits apply {
						if !(_x in _heli) then {
							_x moveInAny _heli;
						};
					};
				},
				_heliInfo,
				25
			] call CBA_fnc_waitAndExecute;
			
			
			_heliInfo
		},
		{
			params ["","","","_heliArgs"];
			_heliArgs params ["_heli","_heliCrewUnits"];

			private _allCrewInHeli = true;
			_heliCrewUnits apply {
				if !(_x in _heli) then {
					_allCrewInHeli = false; 
					break; 
				};
			};


			_allCrewInHeli
		},
		2
	],
	[
		{
			hint "units boarded";
			params ["","","_timelineMap"];
			
			private _heli = _timelineMap getOrDefault ["transportHeli",objNull];
			_heli engineOn true;
		}
	]
];

[_timeline] call KISKA_fnc_startTimeline;