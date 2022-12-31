#include "..\..\Headers\Player Radius Defines.hpp"

["site1_Task"] call KISKA_fnc_createTaskFromConfig;

[
    {
        CONDITION_PLAYER_WITHIN_RADIUS_2D(KOR_site1_insertHeli,50)
    },
    {
        [] call KOR_fnc_site1_insert;
    },
    5
] call KISKA_fnc_waitUntil;

[
    {
        CONDITION_PLAYER_WITHIN_RADIUS_3D(KOR_site1_insertPos,5)
    },
    {
        ["site1_destroyMortars_task"] call KISKA_fnc_createTaskFromConfig;
        ["site1_killInfantry_task"] call KISKA_fnc_createTaskFromConfig;
        [] call KOR_fnc_site1_ambush;
    },
    3
] call KISKA_fnc_waitUntil;
