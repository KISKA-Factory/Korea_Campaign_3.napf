// add helicopter for inital infil
// add main gate objects
// add ambient men on airfield
// add guards around airfield
// spawn other recon marines that will help with the first mission

[
    ["Arsenals"] call KISKA_fnc_getMissionLayerObjects
] call KISKA_fnc_addArsenal;

[] spawn KOR_fnc_effect_ambientArty;
call KOR_fnc_createPlayerVehicles;
