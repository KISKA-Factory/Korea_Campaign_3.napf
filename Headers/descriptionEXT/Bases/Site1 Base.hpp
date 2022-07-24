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
    };
};
