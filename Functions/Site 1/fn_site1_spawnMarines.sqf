#include "..\..\Headers\Unit Classes.hpp"

scriptName "KOR_fnc_site1_spawnMarines";

private _animatePositions = ["Site 1 Marine Animate Positions"] call KISKA_fnc_getMissionLayerObjects;
KOR_site1_marineSupportGroup = [
    6,
    [MARINE_RECON_LIGHT_UNIT_CLASSES],
    BLUFOR,
    [0,0,0],
    false
] call KISKA_fnc_spawnGroup;

{
    private _animatePosition = _animatePositions select _forEachIndex;
    _x setPosASL (getPosASL _animatePosition);
    _x setDir (getDir _animatePosition);

    [
        _x,
        selectRandom ["STAND","SIT_LOW"],
        "ASIS"
    ] call BIS_fnc_ambientAnim;
} forEach (units KOR_site1_marineSupportGroup);


nil
