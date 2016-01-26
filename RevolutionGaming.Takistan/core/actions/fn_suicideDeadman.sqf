/*
	ALAH SNACKBAR! 
	Taken from a midgetgrimm post
	Edit: blaster



[[0,format["%1 has set off their suicide vest.",name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
*/
private["_boom"];
if(vest player != "V_HarnessOGL_gry") exitWith {};
if(life_isSuiciding) exitWith {};
if(life_isDeadman) exitWith {};
life_isDeadman = true;

waitUntil {vest player != "V_HarnessOGL_gry" or !(alive player)};


_boom = "Bo_Mk82" createVehicle [0,0,9999];
_boom setPos (getPos player);
_boom setVelocity [100,0,0];

if(alive player) then {player setDamage 1;};


removeVest player;
removeHeadgear player:
removeGoggles player;
removeVest player;
removeBackpack player;
removeUniform player;
removeAllWeapons player:
removeAllAssignedItems player;

life_isDeadman = false;
[] call SOCK_fnc_updateRequest;

[[0,format["A suicide vest was detonated by %1!",profileName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
