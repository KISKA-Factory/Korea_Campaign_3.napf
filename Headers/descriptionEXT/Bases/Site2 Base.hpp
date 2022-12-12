class Site2
{
    side = SIDE_OPFOR;
    infantryClasses[] = {
        ENEMY_INFANTRY_UNIT_CLASSES
    };

	class infantry
	{
		class staticUnits
		{
			positions = "Site 2 Static Unit Markers";
			numberOfUnits = 12;
			unitsPerGroup = 3;
			canPath = ON;
		};

		class sittingAnimatedUnits
		{
			positions = "Site 2 Sitting Animated Unit Markers";
			numberOfUnits = -1;
			unitsPerGroup = -1;

			class ambientAnim
            {
                animationSet[] = {
                    "SIT_CHAIR_ARMED_1",
                    "SIT_CHAIR_ARMED_2",
					"SIT_CHAIR_RELAXED"
                };
				exitOnCombat = ON;
            };
		};

		class animatedUnits
		{
			positions = "Site 2 Standing Animated Unit Markers";
			numberOfUnits = -1;
			unitsPerGroup = 3;
			class ambientAnim
            {
                animationSet[] = {
                    "STAND_ARMED_1",
                    "STAND_ARMED_2",
                    "BRIEFING",
					"SIT_GROUND_ARMED"
                };
				exitOnCombat = ON;
            };
		};
	};

	class Turrets
	{
		class campTurrets 
		{
			turrets = "Site 2 Turrets";
			dynamicSim = ON;
		};
	};
};