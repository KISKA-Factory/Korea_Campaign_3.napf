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
    };
};
