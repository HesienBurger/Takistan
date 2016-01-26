#include <macro.h>
/*
	File: fn_setupActions.sqf
	
	Description:
	Master addAction file handler for all client-based actions.
*/
switch (playerSide) do
{
	case civilian:
	{
		//Drop fishing net
		life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
		//Rob person
		life_actions = life_actions + [player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && ((animationState cursorTarget == "Incapacitated") OR (animationState cursorTarget == "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon")) && !(cursorTarget GVAR["robbed",FALSE]) ']];
		//ORGAN THEFT
		//
		//SUICIDE BOMB
		 life_actions = life_actions + [player addAction["<t color='#FF0000'>Detonate</t>",life_fnc_suicideBomb,"",0,false,false,"", 'vest player == "V_HarnessOGL_gry" && alive player && playerSide == civilian && !life_istazed && !life_isSuicide && !life_isDeadman && !(player getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting")']];
		//DEADMAN SWITCH
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Deadman Switch</t>",life_fnc_suicideDeadman,"",0,false,false,"", 'vest player == "V_HarnessOGL_gry" && alive player && playerSide == civilian && !life_istazed && !life_isSuicide && !life_isDeadman && !(player getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting")']];
	};
	case west: {
    // ...
    //Seize PlayerWeapons
    //life_actions = life_actions + [player addAction["Seize weapons/magazines",life_fnc_seizePlayerWeapon,cursorTarget,0,false,false,"",'!isNull cursorTarget && (player distance cursorTarget) < 6 && speed cursorTarget < 2 && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget == civilian) && (cursorTarget getVariable "restrained")']];
   
	//Call backup
	life_actions pushBack (player addAction["<t color='#FF9900'>Request Backup</t>",life_fnc_panicButton,"",0,FALSE,FALSE,""]);
	life_actions pushBack (player addAction["<t color='#AA0000'>Seize Weapons</t>","deleteVehicle cursorTarget","",0,FALSE,FALSE,"",'cursorTarget isKindOf "GroundWeaponHolder"']);
	};
};
