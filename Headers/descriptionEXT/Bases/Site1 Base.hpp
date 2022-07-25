class Site1
{
    //Camp 1 Path Spawns
    side = SIDE_OPFOR;
    infantryClasses[] = {
        ENEMY_INFANTRY_UNIT_CLASSES
    };

    class infantry
    {
        class Camp1_path
        {
            numberOfUnits = 25;
            unitsPerGroup = 5;
            canPath = ON;

            positions = "Camp 1 Path Spawns";
            dynamicSim = ON;

            class reinforce
            {
                id = "Camp1_Pathing";
                canCall[] = {
                    "Camp2_path_1"
                };
            };
        };

        class Camp1_static
        {
            numberOfUnits = -1;
            unitsPerGroup = 1;
            canPath = OFF;

            positions = "Camp 1 Static Spawns";
            dynamicSim = ON;

            class reinforce
            {
                id = "Camp1_static";
                canCall[] = {
                    "Camp1_Pathing"
                };
            };
        };

        class Camp2_mortarBuilding
        {
            numberOfUnits = 5;
            unitsPerGroup = -1;
            canPath = OFF;

            positions = "Camp 2 Mortar Building Spawns";
            dynamicSim = ON;

            class reinforce
            {
                id = "Camp2_mortarBuilding";
                canCall[] = {
                    "Camp1_Pathing",
                    "Camp2_path_1"
                };
            };
        };

        class Camp2_overlook_1
        {
            numberOfUnits = 9;
            unitsPerGroup = -1;
            canPath = OFF;
            dynamicSim = ON;
            positions = "Camp 2 Overlook Spawns 1";

            class reinforce
            {
                id = "Camp2_overlook_1";
                canCall[] = {
                    "Camp1_Pathing",
                    "Camp2_path_1"
                };
            };
        };

        class Camp2_overlook_2 : Camp2_overlook_1
        {
            numberOfUnits = 4;
            positions = "Camp 2 Overlook Spawns 2";
        };

        class Camp2_path_1
        {
            numberOfUnits = 6;
            unitsPerGroup = -1;
            canPath = ON;
            dynamicSim = ON;
            positions = "Camp 2 Path Spawns 1";

            class reinforce
            {
                id = "Camp2_path_1";
                canCall[] = {
                    "Camp1_Pathing"
                };
            };
        };
        class Camp2_path_2 : Camp2_path_1
        {
            positions = "Camp 2 Path Spawns 2";
            class reinforce
            {
                id = "Camp2_path_2";
                canCall[] = {
                    "Camp2_path_3"
                };
            };
        };
        class Camp2_path_3 : Camp2_path_1
        {
            positions = "Camp 2 Path Spawns 3";
            class reinforce
            {
                id = "Camp2_path_3";
                canCall[] = {
                    "Camp2_path_2"
                };
            };
        };
    };
};
