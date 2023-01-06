class Airfield
{
    infantryClasses[] = {"rhsusf_usmc_marpat_wd_rifleman_m4"};

    class sittingAnimationBase
    {
        backupAnimations[] = {
            "STAND_UNARMED_1",
            "STAND_UNARMED_2",
            "STAND_UNARMED_3",
            "STAND_ARMED_1",
            "STAND_ARMED_2",
            "BRIEFING"
        };
    };


    class Agents
    {
        class standingMaintainers
        {
            infantryClasses[] = {MARINE_MISC_UNIT_CLASS};

            positions = "Airfield Standing Maintainer Spawns";
            numberOfAgents = -1;
            class ambientAnim
            {
                animationSet[] = {
                    "STAND_UNARMED_1",
                    "STAND_UNARMED_2",
                    "STAND_UNARMED_3",
                    "BRIEFING"
                };
                equipmentLevel = "NONE";
            };

            dynamicSim = ON;
        };
        class sittingMaintainers
        {
            infantryClasses[] = {MARINE_MISC_UNIT_CLASS};
            
            positions = "Airfield Sitting Maintainer Spawns";
            numberOfAgents = -1;
            class ambientAnim
            {
                class animationSet : sittingAnimationBase
                {
                    snapToAnimations[] = {
                        "SIT_CHAIR_UNARMED_1",
                        "SIT_CHAIR_UNARMED_2",
                        "SIT_CHAIR_UNARMED_3",
                        "SIT_HIGH_1",
                        "SIT_LOW"
                    };
                };
                
                equipmentLevel = "LIGHT";
            };

            dynamicSim = ON;
        };

        class StandingChattingMarines
        {
            infantryClasses[] = {
                MARINE_INFANTRY_UNIT_CLASSES,
                MARINE_ARMOR_CREW_UNIT_CLASS
            };

            positions = "Airfield Standing Chatting Unit Spawns";
            numberOfAgents = 25;
            dynamicSim = ON;
            class ambientAnim
            {
                animationSet[] = {
                    "STAND_UNARMED_1",
                    "STAND_UNARMED_2",
                    "STAND_UNARMED_3",
                    "STAND_ARMED_1",
                    "STAND_ARMED_2",
                    "BRIEFING"
                };
            };
        };
        class sittingChattingMarines
        {
            positions = "Airfield Sitting Unit Spawns";
            numberOfAgents = -1;
            dynamicSim = ON;
            class ambientAnim
            {
                class animationSet : sittingAnimationBase
                {
                    snapToAnimations[] = {
                        "SIT_CHAIR_UNARMED_1",0.5,
                        "SIT_CHAIR_UNARMED_2",0.5,
                        "SIT_CHAIR_ARMED_1",1,
                        "SIT_CHAIR_ARMED_2",1
                    };
                };
            };
        };

        class standingGuards
        {
            positions = "Airfield Standing Guard Spawns";
            numberOfAgents = -1;
            dynamicSim = ON;
            class ambientAnim
            {
                animationSet[] = {
                    "WATCH_1",
                    "WATCH_2",
                    "STAND_ARMED_1",
                    "STAND_ARMED_2"
                };

                equipmentLevel = "";
            };
        };
    };


    class simples
    {
        class helicopters
        {
            positions = "Airfield Simple Helicopters";
            class lightHelicopter
            {
                type = MARINE_HUEY_CLASS;
                offset[] = {0,0,2.45};
                selections[] = {
                    {"zasleh",1},
                    {"zasleh_1",1},
                    {"velka vrtule blur",1},
                    {"mala vrtule blur",1},
                    {"velka vrtule staticka",0},
                    {"mala vrtule staticka",0},
                    {"clan_sign",1},
                    {"clan",1}
                };
            };
        };
    };
};
