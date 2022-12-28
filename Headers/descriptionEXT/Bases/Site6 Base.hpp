class Site6
{
    side = SIDE_OPFOR;
    infantryClasses[] = {
        ENEMY_INFANTRY_UNIT_CLASSES
    };

    class reinforce_A
    {
        canCall[] = {
            "site_6_patrol_A"
        };
    };
    class reinforce_B
    {
        canCall[] = {
            "site_6_patrol_B"
        };
    };

    class infantry
    {
        class site_6_static_A
        {
            positions = "Site 6 A Static Unit Markers";
            numberOfUnits = 8;
            unitsPerGroup = 4;
            canPath = OFF;
            dynamicSim = ON;
            
            class reinforce : reinforce_A
            {};
        };
        class site_6_static_B : site_6_static_A
        {
            positions = "Site 6 B Static Unit Markers";
            numberOfUnits = 4;
            unitsPerGroup = -1;
            class reinforce : reinforce_B
            {};
        };

        class site_6_ambient_A
        {
            positions = "Site 6 A Ambient Unit Markers";
            numberOfUnits = 12;
            unitsPerGroup = 4;
            canPath = ON;
            dynamicSim = ON;

            class ambientAnim
            {
                animationSet[] = {
                    "STAND_ARMED_1",
                    "STAND_ARMED_2"
                    // "BRIEFING",
                    // "SIT_GROUND_ARMED",
                    // "KNEEL",
                    // "WATCH_1",
                    // "WATCH_2"
                };
                exitOnCombat = ON;
            };

            class reinforce : reinforce_A
            {};
        };
        class site_6_ambient_B : site_6_ambient_A
        {
            positions = "Site 6 B Ambient Unit Markers";
            numberOfUnits = 5;
            unitsPerGroup = -1;
            class reinforce : reinforce_B
            {};
        };
    };	

    class Patrols
    {
        class site_6_patrol_A
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
                    "site_6_patrol_B",
                    "site_6_ambient_A"
                };
            };
        };
        class site_6_patrol_B : site_6_patrol_A
        {
            spawnPosition = "KOR_site6B_patrolSpawn";
            class SpecificPatrol : SpecificPatrol
            {
                patrolPoints = "Site 6 B Patrol Markers";
            };

            class reinforce
            {
                canCall[] = {
                    "site_6_patrol_A",
                    "site_6_ambient_B"
                };
            };
        };
    };
};