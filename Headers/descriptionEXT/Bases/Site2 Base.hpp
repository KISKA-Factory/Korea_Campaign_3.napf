class Site2
{
    side = SIDE_OPFOR;
    infantryClasses[] = {
        ENEMY_INFANTRY_UNIT_CLASSES
    };

    class reinforceBase
    {
        canCall[] = {
            "site_2_patrol1",
            "site_2_patrol2"
        };
    };

    class infantry
    {
        class site_2_staticUnits
        {
            positions = "Site 2 Static Unit Markers";
            numberOfUnits = 12;
            unitsPerGroup = 3;
            dynamicSim = ON;

            class reinforce : reinforceBase
            {
            };
        };

        class site_2_sittingAnimatedUnits
        {
            positions = "Site 2 Sitting Animated Unit Markers";
            numberOfUnits = -1;
            unitsPerGroup = -1;
            canPath = ON;
            dynamicSim = ON;

            class ambientAnim
            {
                animationSet[] = {
                    "SIT_CHAIR_ARMED_1",
                    "SIT_CHAIR_ARMED_2",
                    "SIT_CHAIR_RELAXED"
                };
                exitOnCombat = ON;
            };
            class reinforce : reinforceBase
            {
            };
        };

        class site_2_animatedUnits
        {
            positions = "Site 2 Standing Animated Unit Markers";
            numberOfUnits = -1;
            unitsPerGroup = 3;
            canPath = ON;
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
            };
        };
    };

    class Turrets
    {
        class campTurrets 
        {
            turrets = "Site 2 Turrets";
            dynamicSim = ON;
        };
    };

    class Patrols
    {
        class site_2_patrol1
        {
            spawnPosition = "KOR_site2_patrolSpawn";
            numberOfUnits = 4;
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

            class reinforce
            {
                canCall[] = {
                    "site_2_patrol2"
                };
            };
        };
        class site_2_patrol2 : site_2_patrol1
        {
            numberOfUnits = 4;

            class reinforce
            {
                canCall[] = {
                    "site_2_patrol1"
                };
            };
        };
    };
};