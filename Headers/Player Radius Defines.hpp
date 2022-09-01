#define CONDITION_PLAYER_WITHIN_RADIUS_3D(pos,radius) !(((call CBA_fnc_players) findIf {(_x distance pos) <= radius}) isEqualTo -1)
#define CONDITION_PLAYER_WITHIN_RADIUS_2D(pos,radius) !(((call CBA_fnc_players) findIf {(_x distance2d pos) <= radius}) isEqualTo -1)

#define CONDITION_NO_PLAYER_WITHIN_RADIUS_3D(pos,radius) !(((call CBA_fnc_players) findIf {(_x distance pos) >= radius}) isEqualTo -1)
#define CONDITION_NO_PLAYER_WITHIN_RADIUS_2D(pos,radius) !(((call CBA_fnc_players) findIf {(_x distance2d pos) >= radius}) isEqualTo -1)

// could be faster means of finding this, however, it does not support object as pos. must be posAGL
// ((call CBA_fnc_players) inAreaArray [pos, radius, radius, false, radius]) isEqualTo []