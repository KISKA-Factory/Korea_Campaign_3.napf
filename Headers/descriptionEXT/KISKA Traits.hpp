class KISKA_cfgTraits
{
    /*
    class myTraitName
    {
        managerCondition = ""; // condition that will get compiled and called before player can take the trait
        errorMessage = "Your steam ID is not capable of taking this trait"; // a message that will show when a player cant take the trait
    };
    */
    class COMMANDER
    {
        managerCondition = "(getPlayerUID player) in ['76561198112206863','76561198048005668','76561198084310695','76561198135283115']";
        errorMessage = "Your steam ID is not capable of being COMMANDER";
    };
    class JTAC
    {
        managerCondition = "(getPlayerUID player) in ['76561198112206863','76561198048005668','76561198084310695']";
        errorMessage = "Your steam ID is not capable of being a JTAC";
    };
};
