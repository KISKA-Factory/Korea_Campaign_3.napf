class Site7
{
    side = SIDE_OPFOR;
    infantryClasses[] = {
        ENEMY_INFANTRY_UNIT_CLASSES
    };

	class reinforceBase
	{
		canCall[] = {

		};
	};

	class infantry
	{
		class site7_static1
        {
            positions = "Site 7 Static Unit Markers 1";
            numberOfUnits = 8;
            unitsPerGroup = 4;
            canPath = OFF;
            dynamicSim = ON;
            
            class reinforce : reinforceBase
            {};
        };
	};

	class turrets
	{
		class site7_turrets
		{
			turrets = "Site 7 Turrets";
			dynamicSim = ON;
		};
	};
};