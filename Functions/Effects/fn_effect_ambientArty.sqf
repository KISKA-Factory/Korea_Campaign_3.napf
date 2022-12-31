#include "..\..\Headers\Player Radius Defines.hpp"

KOR_ambientArty = [KOR_ambientArty_1,KOR_ambientArty_2];
KOR_ambientArty apply {
    private _group = group (gunner _x);
    [_group,true] call KISKA_fnc_ACEX_setHCTransfer;
};


KOR_ambientArtilleryTargets = ["Ambient Artillery Targets"] call KISKA_fnc_getMissionLayerObjects;
KOR_ambientArty apply {
    [_x] spawn {
        params ["_arty"];

        while {sleep (random [10,20,30]); localNamespace getVariable ["KOR_doAmbientArtyFire",true]} do {
            sleep (random [1,3,7]);
            [
                _arty,
                selectRandom KOR_ambientArtilleryTargets,
                random [1,3,5]
            ] call KISKA_fnc_arty;
        };
    };
};


[
    {
        CONDITION_NO_PLAYER_WITHIN_RADIUS_2D(KOR_ambientArty_1,700);
    },
    {
        hint "no ambient";
        localNamespace setVariable ["KOR_doAmbientArtyFire",false]
    },
    5
] call KISKA_fnc_waitUntil;

nil
