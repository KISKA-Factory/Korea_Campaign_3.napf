class Site6
{
    side = SIDE_OPFOR;
    infantryClasses[] = {
        ENEMY_INFANTRY_UNIT_CLASSES
    };

    class reinforce_A
    {
        canCall[] = {
            "patrol_A"
        };
    };
    class reinforce_B
    {
        canCall[] = {
            "patrol_B"
        };
    };

    class infantry
    {
        class static_A
        {
            positions = "Site 6 A Static Unit Markers";
            numberOfUnits = 5;
            unitsPerGroup = -1;
            canPath = OFF;
            dynamicSim = ON;
            
            class reinforce : reinforce_A
            {};
        };
        class static_B : static_A
        {
            positions = "Site 6 B Static Unit Markers";
            numberOfUnits = 4;
            unitsPerGroup = -1;
            class reinforce : reinforce_B
            {};
        };

        class ambient_A
        {
            positions = "Site 6 A Ambient Unit Markers";
            numberOfUnits = 8;
            unitsPerGroup = 4;
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

            class reinforce : reinforce_A
            {};
        };
        class ambient_B : ambient_A
        {
            positions = "Site 6 B Ambient Unit Markers";
            numberOfUnits = 5;
            unitsPerGroup = -1;
            class reinforce : reinforce_B
            {};
        };

        class patrol_A
        {
            spawnPosition = "KOR_site6A_patrolSpawn";
            numberOfUnits = 5;
            dynamicSim = ON;

            class SpecificPatrol
            {
                patrolPoints = "Site 6 A Patrol Markers";
                random = OFF;
                numberOfPoints = -1;
            };

            class reinforce
            {
                canCall[] = {
                    "patrol_B",
                    "ambient_A"
                };
            };
        };
        class patrol_B : patrol_A
        {
            spawnPosition = "KOR_site6A_patrolSpawn";
            class SpecificPatrol : SpecificPatrol
            {
                patrolPoints = "Site 6 B Patrol Markers";
            };

            class reinforce
            {
                canCall[] = {
                    "patrol_A",
                    "ambient_B"
                };
            };
        };

    };	
};