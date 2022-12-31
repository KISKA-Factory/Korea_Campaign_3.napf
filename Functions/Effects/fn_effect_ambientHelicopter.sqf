#include "..\..\Headers\Unit Classes.hpp"

private _timeline = [
    /* ----------------------------------------------------------------------------
        Init
    ---------------------------------------------------------------------------- */
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



            private _maintSpawns = ["Airfield Timeline Heli Maintainer Spawns"] call KISKA_fnc_getMissionLayerObjects;
            private _maintainers = [];
            _maintSpawns apply {
                private _group = [
                    [_x],
                    [MARINE_MISC_UNIT_CLASS]
                ] call _createUnitsForGroup;
                _maintainers pushBack (leader _group);
            };
            
            _timelineMap set ["heliMaintainers",_maintainers];

            [
                _maintainers,
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
        random [60,120,180] // time till take off sequence
    ],
    /* ----------------------------------------------------------------------------
        Crew Board
    ---------------------------------------------------------------------------- */
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

            private _boardingInfo = [_heli,_heliCrewUnits];
            [
                {
                    params ["_heli","_heliCrewUnits"];
                    _heliCrewUnits apply {
                        if !(_x in _heli) then {
                            _x moveInAny _heli;
                        };
                    };
                },
                _boardingInfo,
                25
            ] call CBA_fnc_waitAndExecute;
            
            
            _boardingInfo
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
    /* ----------------------------------------------------------------------------
        Engine start/Marshllers move
    ---------------------------------------------------------------------------- */
    [
        {
            params ["","","_timelineMap"];
            
            private _heli = _timelineMap get "transportHeli";

            private _maintUnits = _timelineMap get "heliMaintainers";
            _maintUnits apply {
                [_x,false] call KISKA_fnc_ambientAnim_stop;
            };
            
            private _marshaller = _maintUnits select 0;
            _marshaller doMove (getPosATL KOR_marshallerPos);
            (group _marshaller) setSpeedMode "LIMITED";

            private _otherMaint = _maintUnits select 1;
            _otherMaint doMove (getPosATL KOR_MaintPos_1);
            (group _otherMaint) setSpeedMode "LIMITED";

            
            // KOR_MaintPos_2
            [_marshaller,_otherMaint]
        },
        {
            params ["","","","_maintainers"];
            _maintainers params ["_marshaller","_otherMaint"];
            
            ((_marshaller distance2D KOR_marshallerPos) <= 0.75) AND ((_otherMaint distance2D KOR_MaintPos_1) <= 0.75)
        },
        1
    ],
    /* ----------------------------------------------------------------------------
        Move maintainers
    ---------------------------------------------------------------------------- */
    [
        {
            params ["","","_timelineMap","_maintUnits"];
            
            _maintUnits params ["_marshaller","_otherMaint"];
            private _heli = _timelineMap get "transportHeli";
            _marshaller doWatch _heli;
            _otherMaint doWatch _heli;

            _maintUnits
        },
        2
    ],
    /* ----------------------------------------------------------------------------
        Board Recon team
    ---------------------------------------------------------------------------- */
    [
        {
            params ["","","_timelineMap"];
            
            private _reconGroup = _timelineMap get "heliReconGroup";
            private _heli = _timelineMap get "transportHeli";
            private _reconUnits = units _reconGroup;
            _reconUnits apply {
                [_x,false] call KISKA_fnc_ambientAnim_stop;
            };

            _reconGroup addVehicle _heli;
            _reconUnits orderGetIn true;

            private _boardingInfo = [_heli,_reconUnits];
            [
                {
                    params ["_heli","_reconUnits"];
                    _reconUnits apply {
                        if !(_x in _heli) then {
                            _x moveInAny _heli;
                        };
                    };
                },
                _boardingInfo,
                45
            ] call CBA_fnc_waitAndExecute;
            
            
            _boardingInfo
        },
        {
            params ["","","","_heliArgs"];
            _heliArgs params ["_heli","_reconUnits"];

            private _reconIsBoarded = true;
            _reconUnits apply {
                if !(_x in _heli) then {
                    _reconIsBoarded = false; 
                    break; 
                };
            };

            _reconIsBoarded
        },
        2
    ],
    /* ----------------------------------------------------------------------------
        Marshall
    ---------------------------------------------------------------------------- */
    [
        {
            params ["","","_timelineMap"];
            private _heli = _timelineMap get "transportHeli";
            private _marshaller = (_timelineMap get "heliMaintainers") select 0;

            [_heli,_marshaller] spawn {
                params ["_heli","_marshaller"];

                _heli engineOn true;
                
                sleep 10;

                _marshaller switchMove "Acts_JetsMarshallingStraight_in";
                _marshaller setVariable ["KOR_isMarshalling",true];
                sleep 6;

                _marshaller playMove "Acts_JetsMarshallingStraight_out";
                sleep 0.5;

                _marshaller playMoveNow "AmovPercMstpSnonWnonDnon_SaluteIn";
                sleep 2;

                _marshaller playMove "AmovPercMstpSnonWnonDnon_Saluteout";
                _marshaller setVariable ["KOR_isMarshalling",false];
            };

            _marshaller
        },
        {
            params ["","","","_marshaller"];

            _marshaller getVariable ["KOR_isMarshalling",false]
        },
        0.1
    ],
    /* ----------------------------------------------------------------------------
        fly away
    ---------------------------------------------------------------------------- */
    [
        {
            params ["","","_timelineMap","_marshaller"];

            private _heli = _timelineMap get "transportHeli";
            _heli flyInHeight 20;
            private _driverGroup = group (driver _heli);
            
            private _waypoints = [KOR_timelineHeli_wp_1,KOR_timelineHeli_wp_2,KOR_timelineHeli_wp_3];
            _waypoints apply {
                [
                    _driverGroup,
                    getPosASL _x,
                    -1,
                    "MOVE",
                    "CARELESS",
                    "BLUE",
                    "FULL"
                ] call CBA_fnc_addWaypoint;
            };


            _marshaller
        },
        {
            params ["","","","_marshaller"];
            !(_marshaller getVariable ["KOR_isMarshalling",true])
        },
        1
    ],
    [
        {
            params ["","","_timelineMap"]; 
            
            private _maintainers = _timelineMap get "heliMaintainers";
            _maintainers params ["_marshaller"];

            _marshaller doMove (getPosATL KOR_maintPos_2);
            (group _marshaller) setSpeedMode "LIMITED";

            _maintainers
        },
        {
            params ["","","","_maintainers"];
            _maintainers params ["_marshaller","_otherMaint"];
            
            ((_marshaller distance2D KOR_MaintPos_2) <= 1) AND ((_otherMaint distance2D KOR_MaintPos_1) <= 0.75)
        }
    ],
    [
        {
            params ["","","_timelineMap","_maintainers"];
            _maintainers params ["_marshaller","_otherMaint"];
            _marshaller doWatch _otherMaint;
            _otherMaint doWatch _marshaller;
            
            [
                _maintainers,
                ["STAND_UNARMED_1","STAND_UNARMED_2","STAND_UNARMED_3"]
            ] call KISKA_fnc_ambientAnim;

            private _heli = _timelineMap get "transportHeli";
            _heli
        },
        {
            params ["","","","_heli"];
            _heli distance2D KOR_timelineHeli_wp_3 <= 200
        },
        3
    ],
    [
        {
            params ["","","","_heli"];
            deleteVehicleCrew _heli;
            deleteVehicle _heli;
        }
    ]
];

[_timeline] call KISKA_fnc_startTimeline;