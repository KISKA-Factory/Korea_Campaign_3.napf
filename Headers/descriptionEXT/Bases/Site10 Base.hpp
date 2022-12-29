class Site8
{
    side = SIDE_OPFOR;
    infantryClasses[] = {
        ENEMY_INFANTRY_UNIT_CLASSES
    };

    class infantry
    {
        class site10_static1
        {
            positions = "Site 10 Static Unit Markers 1";
            numberOfUnits = 10;
            unitsPerGroup = 5;
            canPath = OFF;
            dynamicSim = ON;
            
            class reinforce
            {
                canCall[] = {
                    "site10_path2",
                    "site10_path3"
                };
            };
        };
        class site10_static2 : site10_static1
        {
            positions = "Site 10 Static Unit Markers 2";
            numberOfUnits = -1;
            unitsPerGroup = -1;

            class reinforce
            {
                canCall[] = {
                    "site10_path1",
                    "site10_path3"
                };
            };
        };
        class site10_static3 : site10_static1
        {
            positions = "Site 10 Static Unit Markers 3";
            numberOfUnits = 6;
            unitsPerGroup = -1;

            class reinforce
            {
                canCall[] = {
                    "site10_path1",
                    "site10_path2"
                };
            };
        };

        class site10_path1
        {
            positions = "Site 10 Path Unit Markers 1";
            numberOfUnits = 10;
            unitsPerGroup = 5;
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
            class reinforce
            {
                canCall[] = {
                    "site10_patrol1"
                };
            };
        };
        class site10_path2 : site10_path1
        {
            positions = "Site 10 Path Unit Markers 2";
            numberOfUnits = 6;
            unitsPerGroup = 3;

            class reinforce
            {
                canCall[] = {
                    "site10_patrol1"
                };
            };
        };
        class site10_path3 : site10_path1
        {
            positions = "Site 10 Path Unit Markers 3";
            numberOfUnits = 6;
            unitsPerGroup = 3;

            class reinforce
            {
                canCall[] = {
                    "site10_patrol1"
                };
            };
        };
    };

    class Patrols
    {
        class site10_patrol1
        {
            spawnPosition = "KOR_site10_patrolSpawn_1";
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

            class reinforce
            {
                canCall[] = {
                    "site10_path1"
                };
            };
        };
    };
};