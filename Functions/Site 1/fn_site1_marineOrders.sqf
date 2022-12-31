scriptName "KOR_fnc_site1_marineOrders";

params ["_marineGroup"];

[
    _marineGroup,
    [15088.5,3960.04,0],
    20,
    "MOVE",
    "AWARE"
] call CBA_fnc_addWaypoint;

[
    _marineGroup,
    [15014.5,4225.69,0],
    20,
    "MOVE",
    "AWARE"
] call CBA_fnc_addWaypoint;
