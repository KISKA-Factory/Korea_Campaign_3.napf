class Airfield
{
    infantryClasses[] = {"rhsusf_usmc_marpat_wd_rifleman_m4"};

    class Agents
    {
        class maintainers
        {
            positions = "Airfield Maintainer Spawns";
            numberOfAgents = -1;
            class ambientAnim
            {
                animationSet[] = {
                    "SIT_LOW_U",
                    "STAND_U1",
                    "STAND_U2",
                    "STAND_U3",
                    "BRIEFING"
                };

                equipmentLevel[] = {"NONE","LIGHT"};
            };
        };

        class chattingMarines
        {
            infantryClasses[] = {
                MARINE_INFANTRY_UNIT_CLASSES
            };

            positions = "Airfield Chatting Unit Spawns";
            numberOfAgents = 25;
            class ambientAnim
            {
                animationSet[] = {
                    "STAND_U1",
                    "STAND_U2",
                    "STAND_U3",
                    "BRIEFING"
                };

                equipmentLevel = "ASIS";
                dontAttachToLogic = ON;
            };
        };

        class guards
        {
            positions = "Airfield Guard Spawns";
            numberOfAgents = -1;

            class ambientAnim
            {
                animationSet[] = {
                    "WATCH",
                    "WATCH2",
                    "STAND",
                    "GUARD"
                };

                equipmentLevel = "ASIS";
                dontAttachToLogic = 1;
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
