class Site7
{
    side = SIDE_OPFOR;
    infantryClasses[] = {
        ENEMY_INFANTRY_UNIT_CLASSES
    };

	class reinforceBase
	{
		canCall[] = {
			"site7_patrol1"
		};
	};

	class infantry
	{
		class site7_static1
        {
            positions = "Site 7 Static Unit Markers 1";
            numberOfUnits = 9;
            unitsPerGroup = 3;
            canPath = OFF;
            dynamicSim = ON;
            
            class reinforce : reinforceBase
            {};
        };
		class site7_path1
        {
            positions = "Site 7 Path Unit Markers 1";
            numberOfUnits = 10;
            unitsPerGroup = 5;
            canPath = ON;
            dynamicSim = ON;
            
            class reinforce : reinforceBase
            {};
        };
	};

	class Patrols
	{
		class site7_patrol1
		{
			spawnPosition = "KOR_site7_patrolSpawn_1";
            numberOfUnits = 8;
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