class Site2
{
    side = SIDE_OPFOR;
    infantryClasses[] = {
        ENEMY_INFANTRY_UNIT_CLASSES
    };

    class reinforceBase
    {
        id = "";
        canCall[] = {
            "patrol1",
            "patrol2"
        };
    };

    class infantry
    {
        class staticUnits
        {
            positions = "Site 2 Static Unit Markers";
            numberOfUnits = 12;
            unitsPerGroup = 3;

            class reinforce : reinforceBase
            {
                id = "staticNormal";
            };
        };

        class sittingAnimatedUnits
        {
            positions = "Site 2 Sitting Animated Unit Markers";
            numberOfUnits = -1;
            unitsPerGroup = -1;
            canPath = ON;

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
                id = "staticSitting";
            };
        };

        class animatedUnits
        {
            positions = "Site 2 Standing Animated Unit Markers";
            numberOfUnits = -1;
            unitsPerGroup = 3;
            canPath = ON;

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
                id = "staticStanding";
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
        class patrol1
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
                id = "patrol1";
                canCall[] = {
                    "patrol2"
                };
            };
        };
        class patrol2 : patrol1
        {
            numberOfUnits = 4;

            class reinforce
            {
                id = "patrol2";
                canCall[] = {
                    "patrol1"
                };
            };
        };
    };
};