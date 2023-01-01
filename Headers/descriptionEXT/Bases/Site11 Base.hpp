class Site11
{
    side = SIDE_OPFOR;
    infantryClasses[] = {
        ENEMY_INFANTRY_UNIT_CLASSES
    };

    class reinforceBase
    {
        onEnemyDetected = "['site11',_this select 1] call KOR_fnc_effect_playMusicForScene; false";
    };

	class infantry
    {
        class site11_static1
        {
            positions = "Site 11 Static Unit Markers 1";
            numberOfUnits = 10;
            unitsPerGroup = 5;
            canPath = OFF;
            dynamicSim = ON;
            
            class reinforce : reinforceBase
            {
                canCall[] = {
                    "site11_patrol1"
                };
            };
        };
        class site11_path1
        {
            positions = "Site 11 Path Unit Markers 1";
            numberOfUnits = 10;
            unitsPerGroup = 5;
            canPath = ONs;
            dynamicSim = ON;

			class ambientAnim
            {
                animationSet[] = {
                    "STAND_ARMED_1",
                    "STAND_ARMED_2",
                    "BRIEFING",
                    "SIT_GROUND_ARMED",
                    "KNEEL",
                    "WATCH_1",
                    "WATCH_2"
                };
                exitOnCombat = ON;
            };
            
            class reinforce : reinforceBase
            {
                canCall[] = {
                    "site11_patrol1"
                };
            };
        };
	};

	class Patrols
    {
        class site11_patrol1
        {
            spawnPosition = "KOR_site11_patrolSpawn_1";
            numberOfUnits = 8;
            behaviour = "SAFE";
            speed = "LIMITED";
            formation = "STAG COLUMN";
            dynamicSim = ON;

            class RandomPatrol
            {
                numberOfPoints = 4;
                radius = 300;
                waypointType = "MOVE";
            };

            class reinforce : reinforceBase
            {
                canCall[] = {
                    "site11_path1"
                };
            };
        };
    };

	class turrets
    {
        class site11_turrets
        {
            turrets = "Site 11 Turrets";
            dynamicSim = ON;
        };
    };
};