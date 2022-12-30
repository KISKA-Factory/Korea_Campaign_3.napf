//import KISKA_basicSupport_baseClass from CfgCommunicationMenu;
//import KISKA_artillery_baseClass from CfgCommunicationMenu;
import KISKA_CAS_baseClass from CfgCommunicationMenu;
//import KISKA_attackHelicopterCAS_baseClass from CfgCommunicationMenu;
//import KISKA_helicopterCAS_baseClass from CfgCommunicationMenu;
//import KISKA_arsenalSupplyDrop_baseClass from CfgCommunicationMenu;
import KISKA_ARTY_155_templateClass from CfgCommunicationMenu;
import KISKA_ARTY_120_templateClass from CfgCommunicationMenu;
//import KISKA_ARTY_82_templateClass from CfgCommunicationMenu;
//import KISKA_ARTY_230_templateClass from CfgCommunicationMenu;
import KISKA_supplyDrop_aircraft_baseClass from CfgCommunicationMenu;

#include "\KISKA_Functions\Supports\Support Framework\Headers\Support Type IDs.hpp"
#include "\KISKA_Functions\Supports\Support Framework\Headers\Support Icons.hpp"
#include "\KISKA_Functions\Supports\Support Framework\Headers\CAS Type IDs.hpp"
#include "\KISKA_Functions\Supports\Support Framework\Headers\Arty Ammo Type IDs.hpp"

/*
    This master function for supports is used as go between for error cases such as when
     a player provides an invalid position (looking at the sky). It will then refund the
     support back to the player.
*/
#define CALL_SUPPORT_MASTER(CLASS) "["#CLASS",_this,%1] call KISKA_fnc_callingForSupportMaster"
#define EXPRESSION_CALL_MASTER(CLASS) expression = CALL_SUPPORT_MASTER(CLASS);

#define CONDITION_BE_JTAC managerCondition = "player getUnitTrait 'JTAC'";
#define CONDITION_BE_JTAC_OR_COMMANDER managerCondition = "(player getUnitTrait 'JTAC') OR (player getUnitTrait 'COMMANDER')";

#define CONDITION_MESSAGE_BE_JTAC conditionMessage = "You must have the JTAC trait to take this support";
#define CONDITION_MESSAGE_BE_JTAC_OR_COMMANDER conditionMessage = "You must have the JTAC or COMMANDER traits to take this support";

/*
// expression arguments

[caller, pos, target, is3D, id]
    caller: Object - unit which called the item, usually player
    pos: Array in format Position - cursor position
    target: Object - cursor target
    is3D: Boolean - true when in 3D scene, false when in map
    id: String - item ID as returned by BIS_fnc_addCommMenuItem function
*/

/*
    if a class is to be solely a base one, you need to include _baseClass (EXACTLY AS IT IS CASE SENSITIVE)
     somewhere in the class name so that it can be excluded from being added to the shop
*/
/*
class KISKA_basicSupport_baseClass
{
    text = "I'm a support!"; // text in support menu
    expression = ""; // code to compile upon call of menu item
    icon = CALL_ICON; // icon in support menu
    removeAfterExpressionCall = 1;

    supportTypeId = SUPPORT_TYPE_CUSTOM;

    // used for support selection menu
    // _this select 0 is the classname
    managerCondition = "";
};
*/

class KOR_155_arty : KISKA_ARTY_155_templateClass
{
    text = "155mm Artillery (3 rounds HE)";
    EXPRESSION_CALL_MASTER(KOR_155_arty)
    ammoTypes[] = {
        AMMO_155_HE_ID
    };

    radiuses[] = {50,100};
    roundCount = 3;

    CONDITION_BE_JTAC_OR_COMMANDER
    CONDITION_MESSAGE_BE_JTAC_OR_COMMANDER
};


class KOR_120_arty : KISKA_ARTY_120_templateClass
{
    text = "120mm Artillery (3 rounds HE)";
    EXPRESSION_CALL_MASTER(KOR_120_arty)
    ammoTypes[] = {
        AMMO_120_HE_ID
    };

    radiuses[] = {50,100};
    roundCount = 3;

    CONDITION_BE_JTAC_OR_COMMANDER
    CONDITION_MESSAGE_BE_JTAC_OR_COMMANDER
};

class KOR_F35_CAS : KISKA_CAS_baseClass
{
    text = "F35 Guns & Rockets - CAS";
    EXPRESSION_CALL_MASTER(KOR_F35_CAS)
    attackTypes[] = {
        GUN_RUN_ID,
        GUNS_AND_ROCKETS_HE_ID,
        ROCKETS_HE_ID
    };
    vehicleTypes[] = {
        "CUP_B_F35B_USMC"
    };

    CONDITION_BE_JTAC
    CONDITION_MESSAGE_BE_JTAC
};

class KOR_A164_CAS : KISKA_CAS_baseClass
{
    text = "A164 Guns & Rockets - CAS";
    EXPRESSION_CALL_MASTER(KOR_A164_CAS)
    attackTypes[] = {
        GUN_RUN_ID,
        GUNS_AND_ROCKETS_HE_ID,
        ROCKETS_HE_ID
    };
    vehicleTypes[] = {
        "B_Plane_CAS_01_dynamicLoadout_F"
    };

    CONDITION_BE_JTAC
    CONDITION_MESSAGE_BE_JTAC
};

class KOR_humvee_drop : KISKA_supplyDrop_aircraft_baseClass
{
    text = "1x Recon HMMV Drop";
    addArsenals = OFF;
    deleteCargo = ON;

    crateList[] = {
        "CUP_B_nM1025_SOV_M2_USMC_WDL"
    };

    flyinHeights[] = {250};
    vehicleTypes[] = {
        "RHS_C130J"
    };

    EXPRESSION_CALL_MASTER(KOR_humvee_drop)

    CONDITION_BE_JTAC_OR_COMMANDER
    CONDITION_MESSAGE_BE_JTAC_OR_COMMANDER
};
class KOR_arsenalDrop : KISKA_supplyDrop_aircraft_baseClass
{
    text = "Arsenal Supply Drop";
    addArsenals = ON;
    deleteCargo = ON;

    crateList[] = {"B_supplyCrate_F","B_supplyCrate_F"};
    flyinHeights[] = {250};
    vehicleTypes[] = {
        "RHS_C130J"
    };

    EXPRESSION_CALL_MASTER(KOR_arsenalDrop)

    CONDITION_BE_JTAC_OR_COMMANDER
    CONDITION_MESSAGE_BE_JTAC_OR_COMMANDER
};
