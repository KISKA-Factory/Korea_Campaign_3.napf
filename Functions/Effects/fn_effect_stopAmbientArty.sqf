missionNamespace setVariable ["KOR_doAmbientArtyFire", false];
KOR_ambientArty apply {
    [_x, true] remoteExec ["enableDynamicSimulation",2];
};

nil
