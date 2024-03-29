class Site3
{
    side = SIDE_OPFOR;
    infantryClasses[] = {
        ENEMY_INFANTRY_UNIT_CLASSES
    };

    class reinforceBase
    {
        canCall[] = {"site_3_patrol1"};
    };

    class infantry
    {
        class site_3_staticUnits
        {
            positions = "Site 3 Static Unit Markers";
            numberOfUnits = 5;
            unitsPerGroup = -1;
            canPath = ON;
            dynamicSim = ON;

            class reinforce : reinforceBase
            {
            };
        };    

        class site_3_standingUnits
        {
            positions = "Site 3 Standing Unit Markers";
            numberOfUnits = -1;
            unitsPerGroup = -1;
            canPath = ON;
            dynamicSim = ON;
            
            class reinforce : reinforceBase
            {
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

    class Patrols
    {
        class site_3_patrol1
        {
            spawnPosition = "KOR_site3_patrolSpawn";
            numberOfUnits = 6;
            behaviour = "SAFE";
            speed = "LIMITED";
            formation = "STAG COLUMN";
            dynamicSim = ON;

            class SpecificPatrol
            {
                patrolPoints = "Site 3 Patrol Points";
                random = OFF;
                numberOfPoints = -1;
            };

            class reinforce
            {
            };
        };
    };
};