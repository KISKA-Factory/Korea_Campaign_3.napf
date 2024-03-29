class Site4
{
    side = SIDE_OPFOR;
    infantryClasses[] = {
        ENEMY_INFANTRY_UNIT_CLASSES
    };

    class reinforceBase
    {
        id = "";
        canCall[] = {"site_4_patrol1"};
    };

    class infantry
    {
        class site_4_staticUnits
        {
            positions = "Site 4 Static Unit Markers";
            numberOfUnits = 8;
            unitsPerGroup = 2;
            canPath = ON;
            dynamicSim = ON;
            
            class reinforce : reinforceBase
            {
                id = "site_4_staticUnits";
            };
        };    

        class site_4_standingUnits
        {
            positions = "Site 4 Standing Unit Markers";
            numberOfUnits = 12;
            unitsPerGroup = 4;
            canPath = ON;
            dynamicSim = ON;

            class reinforce : reinforceBase
            {
                id = "site_4_standingUnits";
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
    };

    class Turrets
    {
        class campTurrets 
        {
            turrets = "Site 4 Turrets";
            dynamicSim = ON;
        };
    };


    class Patrols
    {
        class site_4_patrol1
        {
            spawnPosition = "KOR_site4_patrolSpawn";
            numberOfUnits = 6;
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
                id = "site_4_patrol1";
            };
        };
    };
};