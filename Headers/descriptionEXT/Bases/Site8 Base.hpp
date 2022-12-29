class Site8
{
    side = SIDE_OPFOR;
    infantryClasses[] = {
        ENEMY_INFANTRY_UNIT_CLASSES
    };

    class reinforceBase_1
    {
        canCall[] = {
            "site8_patrol1"
        };
    };

    class reinforceBase_2
    {
        canCall[] = {
            "site8_patrol2"
        };
    };

    class infantry
    {
        class site8_static1
        {
            positions = "Site 8 Static Unit Markers 1";
            numberOfUnits = 8;
            unitsPerGroup = 4;
            canPath = OFF;
            dynamicSim = ON;
            
            class reinforce : reinforceBase_1
            {};
        };
        class site8_path1
        {
            positions = "Site 8 Path Unit Markers 1";
            numberOfUnits = 7;
            unitsPerGroup = 4;
            canPath = ON;
            dynamicSim = ON;
            
            class reinforce : reinforceBase_1
            {};
        };

        class site8_static2 : site8_static1
        {
            positions = "Site 8 Static Unit Markers 2";
            numberOfUnits = 6;
            unitsPerGroup = 3;

            class reinforce : reinforceBase_2
            {};
        };
        class site8_path2 : site8_path1
        {
            positions = "Site 8 Path Unit Markers 2";
            numberOfUnits = 8;
            unitsPerGroup = 4;

            class reinforce : reinforceBase_2
            {};
        };

        class site8_static3 : site8_static1
        {
            positions = "Site 8 Static Unit Markers 3";
            numberOfUnits = 9;
            unitsPerGroup = 3;
        };
        class site8_path3 : site8_path1
        {
            positions = "Site 8 Path Unit Markers 3";
            numberOfUnits = 8;
            unitsPerGroup = 4;
        };
        
        class site8_static4 : site8_static1
        {
            positions = "Site 8 Static Unit Markers 4";
            numberOfUnits = 6;
            unitsPerGroup = 3;

            class reinforce : reinforceBase_2
            {};
        };
        class site8_path4 : site8_path1
        {
            positions = "Site 8 Path Unit Markers 4";
            numberOfUnits = 6;
            unitsPerGroup = 3;

            class reinforce : reinforceBase_2
            {};
        };
    };

    class Patrols
    {
        class site8_patrol1
        {
            spawnPosition = "KOR_site8_patrolSpawn_1";
            numberOfUnits = 6;
            behaviour = "SAFE";
            speed = "LIMITED";
            formation = "STAG COLUMN";
            dynamicSim = ON;

            class SpecificPatrol
            {
                patrolPoints = "Site 8 Patrol Markers 1";
                random = OFF;
                numberOfPoints = -1;
            };

            class reinforce : reinforceBase_2
            {};
        };

        class site8_patrol2 : site8_patrol1
        {
            spawnPosition = "KOR_site8_patrolSpawn_2";
            numberOfUnits = 6;

            class SpecificPatrol : SpecificPatrol
            {
                patrolPoints = "Site 8 Patrol Markers 2";
            };

            class reinforce : reinforceBase_1
            {};
        };
    };

    class turrets
    {
        class site8_turrets
        {
            turrets = "Site 8 Turrets";
            dynamicSim = ON;
        };
    };
};