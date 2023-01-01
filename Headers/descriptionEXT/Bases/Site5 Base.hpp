class Site5
{
    side = SIDE_OPFOR;
    infantryClasses[] = {
        ENEMY_INFANTRY_UNIT_CLASSES
    };

    class reinforceBase
    {
        onEnemyDetected = "['site5',_this select 1] call KOR_fnc_effect_playMusicForScene; false";
    };

    class infantry
    {
        class site_5_interior_1
        {
            positions = "Site 5 Interior Unit Markers 1";
            numberOfUnits = -1;
            unitsPerGroup = -1;
            canPath = OFF;
            dynamicSim = ON;
            
            class reinforce : reinforceBase
            {
                canCall[] = {
                    "site_5_exterior_1",
                    "site_5_exterior_2",
                    "site_5_exterior_3",
                    "site_5_patrol_1",
                    "site_5_patrol_2"
                };
            };
        };

        class site_5_interior_2 : site_5_interior_1
        {
            positions = "Site 5 Interior Unit Markers 2";
            numberOfUnits = 6;
            unitsPerGroup = 3;
            canPath = ON;
        };
        

        class site_5_interior_3
        {
            positions = "Site 5 Interior Unit Markers 3";
            numberOfUnits = 3;
            unitsPerGroup = -1;
            canPath = OFF;
            dynamicSim = ON;
            
            class reinforce : reinforceBase
            {
                canCall[] = {
                    "site_5_exterior_4",
                    "site_5_exterior_5",
                    "site_5_patrol_3"
                };
            };
        };
        class site_5_interior_4 : site_5_interior_3
        {
            positions = "Site 5 Interior Unit Markers 4";
        };
        class site_5_interior_5 : site_5_interior_3
        {
            positions = "Site 5 Interior Unit Markers 5";
            canPath = ON;
        };

        class site_5_interior_6
        {
            positions = "Site 5 Interior Unit Markers 6";
            numberOfUnits = -1;
            unitsPerGroup = -1;
            canPath = OFF;
            dynamicSim = ON;

        };

        class site_5_interior_7
        {
            positions = "Site 5 Interior Unit Markers 7";
            numberOfUnits = 6;
            unitsPerGroup = 3;
            canPath = ON;
            dynamicSim = ON;
        };



        class site_5_exterior_1
        {
            positions = "Site 5 Exterior Unit Markers 1";

            numberOfUnits = 6;
            unitsPerGroup = 3;
            canPath = ON;
            dynamicSim = ON;

            class reinforce : reinforceBase
            {
                canCall[] = {
                    "site_5_exterior_2",
                    "site_5_exterior_3",
                    "site_5_patrol_1",
                    "site_5_patrol_2"
                };
            };

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
        };

        class site_5_exterior_2
        {
            positions = "Site 5 Exterior Unit Markers 2";

            numberOfUnits = 4;
            unitsPerGroup = -1;
            canPath = ON;
            dynamicSim = ON;

            class reinforce : reinforceBase
            {
                canCall[] = {
                    "site_5_exterior_1",
                    "site_5_exterior_3",
                    "site_5_patrol_1",
                    "site_5_patrol_2"
                };
            };
        };
        class site_5_exterior_2_static
        {
            positions = "Site 5 Exterior Unit Markers 2 (STATIC)";

            numberOfUnits = -1;
            unitsPerGroup = -1;
            canPath = OFF;
            dynamicSim = ON;

            class reinforce : reinforceBase
            {
                canCall[] = {
                    "site_5_exterior_1",
                    "site_5_exterior_2",
                    "site_5_exterior_3",
                    "site_5_patrol_1",
                    "site_5_patrol_2"
                };
            };
        };

        class site_5_exterior_3 : site_5_exterior_2
        {
            positions = "Site 5 Exterior Unit Markers 3";

            class reinforce : reinforceBase
            {
                canCall[] = {
                    "site_5_exterior_1",
                    "site_5_exterior_2",
                    "site_5_patrol_1",
                    "site_5_patrol_2"
                };
            };
        };
        class site_5_exterior_4 : site_5_exterior_2
        {
            positions = "Site 5 Exterior Unit Markers 4";

            class reinforce : reinforceBase
            {
                canCall[] = {
                    "site_5_exterior_5",
                    "site_5_patrol_3"
                };
            };
        };
        class site_5_exterior_5
        {
            positions = "Site 5 Exterior Unit Markers 5";
            numberOfUnits = 6;
            unitsPerGroup = 3;
            canPath = ON;
            dynamicSim = ON;

            class reinforce : reinforceBase
            {
                canCall[] = {
                    "site_5_exterior_4",
                    "site_5_patrol_3"
                };
            };
        };

    };

    class Patrols
    {
        class site_5_patrol_1
        {
            spawnPosition = "KOR_site5_patrol1_spawn";
            numberOfUnits = 8;
            dynamicSim = ON;
            
            class SpecificPatrol
            {
                patrolPoints = "Site 5 Patrol 1 Markers";
                random = OFF;
                numberOfPoints = -1;
            };

            class reinforce
            {
                canCall[] = {
                    "site_5_patrol_2"
                };
            };
        };
        class site_5_patrol_2 : site_5_patrol_1
        {
            spawnPosition = "KOR_site5_patrol2_spawn";
            numberOfUnits = 6;

            class SpecificPatrol : SpecificPatrol
            {
                patrolPoints = "Site 5 Patrol 2 Markers";
            };

            class reinforce
            {
                canCall[] = {
                    "site_5_patrol_1",
                    "site_5_patrol_3"
                };
            };
        };
        class site_5_patrol_3 : site_5_patrol_1
        {
            spawnPosition = "KOR_site5_patrol3_spawn";
            numberOfUnits = 3;

            class SpecificPatrol : SpecificPatrol
            {
                patrolPoints = "Site 5 Patrol 3 Markers";
            };

            class reinforce
            {
                canCall[] = {
                    "site_5_patrol_1"
                };
            };
        };
    };

    class Turrets
    {
        class siteTurrets 
        {
            turrets = "Site 5 Turrets";
            dynamicSim = ON;
        };
    };

};