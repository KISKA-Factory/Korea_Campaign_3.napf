class Site5
{
	side = SIDE_OPFOR;
    infantryClasses[] = {
        ENEMY_INFANTRY_UNIT_CLASSES
    };

	class reinforceBase
	{
		id = "";
		canCall[] = {
			"patrol1",
			"patrol2"
		};
	};

	class infantry
	{
		class interior_1
		{
			positions = "Site 5 Interior Unit Markers 1";
			numberOfUnits = 8;
			unitsPerGroup = 2;
			canPath = ON;
			class reinforce : reinforceBase
			{
				id = "interior_1";
			};
		};	

		// class standingUnits
		// {
		// 	positions = "Site 4 Standing Unit Markers";
		// 	numberOfUnits = 12;
		// 	unitsPerGroup = 4;
		// 	canPath = ON;
		// 	class reinforce : reinforceBase
		// 	{
		// 		id = "standingUnits";
		// 	};

		// 	class ambientAnim
        //     {
        //         animationSet[] = {
        //             "STAND_ARMED_1",
        //             "STAND_ARMED_2",
        //             "BRIEFING",
		// 			"SIT_GROUND_ARMED",
		// 			"KNEEL",
		// 			"WATCH_1",
		// 			"WATCH_2"
        //         };
		// 		exitOnCombat = ON;
        //     };
		// };
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