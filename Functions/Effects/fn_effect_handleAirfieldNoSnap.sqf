params [
    "_animSetSelection",
    "_unit",
    "_animSet",
    "_exitOnCombat",
    "_equipmentLevel",
    "_snapToRange",
    "_fallbackFunction",
    "_animationMap"
];

private _newAnimSet = +_animSet;
_newAnimSet deleteAt (_newAnimSet find _animSetSelection);

if (_newAnimSet isEqualTo []) then {
    _newAnimSet = [
        "STAND_UNARMED_1",
        "STAND_UNARMED_2",
        "STAND_UNARMED_3",
        "STAND_ARMED_1",
        "STAND_ARMED_2",
        "BRIEFING"
    ];
};

private _args = [
    _unit,
    _newAnimSet,
    _exitOnCombat,
    _equipmentLevel,
    _snapToRange,
    _fallbackFunction,
    _animationMap
];

_args call KISKA_fnc_ambientAnim;


nil
