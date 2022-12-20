class Site5
{
    side = SIDE_OPFOR;
    infantryClasses[] = {
        ENEMY_INFANTRY_UNIT_CLASSES
    };

    class infantry
    {
        class interior_1
        {
            positions = "Site 5 Interior Unit Markers 1";
            numberOfUnits = -1;
            unitsPerGroup = -1;
            canPath = OFF;
            dynamicSim = ON;
            
            class reinforce
            {
                canCall[] = {
                };
            };
        };

        class interior_2 : interior_1
        {
            positions = "Site 5 Interior Unit Markers 2";
            numberOfUnits = 6;
            unitsPerGroup = 3;
            canPath = ON;

            class reinforce : reinforce
            {
            };
        };
        

        class interior_3
        {
            positions = "Site 5 Interior Unit Markers 3";
            numberOfUnits = 3;
            unitsPerGroup = -1;
            canPath = OFF;
            dynamicSim = ON;
            
            class reinforce : reinforce
            {
                canCall[] = {

                };
            };
        };
        class interior_4 : interior_3
        {
            positions = "Site 5 Interior Unit Markers 4";
            class reinforce : reinforce
            {
            };
        };
        class interior_5 : interior_3
        {
            positions = "Site 5 Interior Unit Markers 5";
            canPath = ON;
            
            class reinforce : reinforce
            {
            };
        };

        class interior_6
        {
            positions = "Site 5 Interior Unit Markers 6";
            numberOfUnits = -1;
            unitsPerGroup = -1;
            canPath = OFF;
            dynamicSim = ON;
            
            class reinforce
            {
                canCall[] = {

                };
            };
        };

        class interior_7
        {
            positions = "Site 5 Interior Unit Markers 7";
            numberOfUnits = 6;
            unitsPerGroup = 3;
            canPath = ON;
            dynamicSim = ON;
            
            class reinforce
            {
                canCall[] = {

                };
            };
        };

        class exterior_1
        {
            positions = "Site 5 Exterior Unit Markers 1";

            numberOfUnits = 6;
            unitsPerGroup = 3;
            canPath = ON;
            dynamicSim = ON;

            class reinforce
            {
                canCall[] = {

                };
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

        class exterior_2
        {
            positions = "Site 5 Exterior Unit Markers 2";

            numberOfUnits = 4;
            unitsPerGroup = -1;
            canPath = OFF;
            dynamicSim = ON;

            class reinforce
            {
                canCall[] = {

                };
            };
        };

        class exterior_3
        {
            positions = "Site 5 Exterior Unit Markers 3";

            numberOfUnits = 4;
            unitsPerGroup = -1;
            canPath = OFF;
            dynamicSim = ON;

            class reinforce
            {
                canCall[] = {

                };
            };
        };

        // class standingUnits
        // {
        //     positions = "Site 4 Standing Unit Markers";
        //     numberOfUnits = 12;
        //     unitsPerGroup = 4;
        //     canPath = ON;
        //     class reinforce : reinforceBase
        //     {
        //         id = "standingUnits";
        //     };

        //     class ambientAnim
        //     {
        //         animationSet[] = {
        //             "STAND_ARMED_1",
        //             "STAND_ARMED_2",
        //             "BRIEFING",
        //             "SIT_GROUND_ARMED",
        //             "KNEEL",
        //             "WATCH_1",
        //             "WATCH_2"
        //         };
        //         exitOnCombat = ON;
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