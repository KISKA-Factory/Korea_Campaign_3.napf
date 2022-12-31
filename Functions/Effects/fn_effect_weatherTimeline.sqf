scriptName "KOR_fnc_effect_weatherTimeline";

private _increaseOvercastEvent = [
    {
        1800 setOvercast (overcastForecast + 0.1);
        0 setRain (rain + 0.1);
        0 setLightnings (lightnings + 0.1);
        forceWeatherChange;
    },
    1800
];

private _timeline = 
[
    _increaseOvercastEvent,
    _increaseOvercastEvent,
    _increaseOvercastEvent,
    _increaseOvercastEvent,
    _increaseOvercastEvent,
    _increaseOvercastEvent,
    _increaseOvercastEvent,
    _increaseOvercastEvent
];

[_timeline] call KISKA_fnc_startTimeline;
