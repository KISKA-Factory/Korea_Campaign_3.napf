class Site9
{
    side = SIDE_OPFOR;
    infantryClasses[] = {
        ENEMY_INFANTRY_UNIT_CLASSES
    };

    class infantry
    {
        class site9_static
        {
            positions = "Site 9 Static Unit Markers 1";
            numberOfUnits = 10;
            unitsPerGroup = 5;
            canPath = OFF;
            dynamicSim = ON;
        };

        class site9_path
        {
            positions = "Site 9 Path Unit Markers 1";
            numberOfUnits = 9;
            unitsPerGroup = 3;
            canPath = ON;
            dynamicSim = ON;
        };
    };
};