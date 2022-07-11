KOR_ambientArty = [KOR_ambientArty_1,KOR_ambientArty_2];
KOR_ambientArty apply {
    private _group = group (gunner _x);
    [_group,true] call KISKA_fnc_ACEX_setHCTransfer;
};


KOR_ambientArtilleryTargets = ["Ambient Artillery Targets"] call KISKA_fnc_getMissionLayerObjects;
[] spawn {
    while {sleep (random [70,80,90]); missionNamespace getVariable ["KOR_doAmbientArtyFire",true]} do {
    	KOR_ambientArty apply {
    		sleep (random [5,10,15]);
    		[
                _x,
                selectRandom KOR_ambientArtilleryTargets,
                random [1,3,5]
            ] spawn KISKA_fnc_arty;
    	};
    };
};


nil
