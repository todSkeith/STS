/*
	File: fn_copInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Replaces the mass addactions for various cop actions towards another player.
*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Btn9 37458
#define Title 37401

//Too many rebels refusing to stop fighting
//if((player getVariable "unconscious")) exitWith {};

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9"];
if(!dialog) then {
	createDialog "pInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {closeDialog 0;}; //Bad side check?
_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Btn9 = _display displayCtrl Btn9;
life_pInact_curTarget = _curTarget;

//Button 1: Unrestrain
if((_curTarget getVariable["zipTie",false]) || (_curTarget getVariable["restrained",false]) && !(_curTarget getVariable["Escorting",false]) && !(_curTarget getVariable["unconscious",false])) then { _Btn1 ctrlEnable true; } else { _Btn1 ctrlEnable false; };

_Btn1 ctrlSetText localize "STR_pInAct_Unrestrain";
_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;";


//Button 2: Check Licenses
if(!(_curTarget getVariable["unconscious",false])) then { _Btn1 ctrlEnable true; } else { _Btn1 ctrlEnable false; };
_Btn2 ctrlSetText localize "STR_pInAct_checkLicenses";
_Btn2 buttonSetAction "[[player],""life_fnc_licenseCheck"",life_pInact_curTarget,FALSE] spawn life_fnc_MP";


//Button 3: Search Player
_Btn3 ctrlSetText localize "STR_pInAct_SearchPlayer";
_Btn3 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_searchAction; closeDialog 0;";


//Button 4: Escort
if((_curTarget getVariable["restrained",false])) then { _Btn4 ctrlEnable true; } else { _Btn4 ctrlEnable false; };

if((_curTarget getVariable["Escorting",false])) then {
	_Btn4 ctrlSetText localize "STR_pInAct_StopEscort";
	_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscorting; [life_pInact_curTarget] call life_fnc_copInteractionMenu;";
} else {
	_Btn4 ctrlSetText localize "STR_pInAct_Escort";
	_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
};


//Button 5: Give Ticket
if(!(_curTarget getVariable["unconscious",false])) then { _Btn1 ctrlEnable true; } else { _Btn1 ctrlEnable false; };
_Btn5 ctrlSetText localize "STR_pInAct_TicketBtn";
_Btn5 buttonSetAction "[life_pInact_curTarget] call life_fnc_ticketAction;";


//Button 6: Send to Jail
//Check that you are near a place to jail them.
if(!((player distance (getMarkerPos "police_hq_1") < 30) OR  (player distance (getMarkerPos "police_hq_2") < 30) OR (player distance (getMarkerPos "cop_spawn_3") < 30) OR (player distance (getMarkerPos "cop_spawn_5") < 30))) then
{
	_Btn6 ctrlEnable false;
};

_Btn6 ctrlSetText localize "STR_pInAct_Arrest";
_Btn6 buttonSetAction "[life_pInact_curTarget] call life_fnc_arrestAction;";


//Button 7: Put in Vehicle
if(!(_curTarget getVariable["unconscious",false])) then { _Btn1 ctrlEnable true; } else { _Btn1 ctrlEnable false; };
_Btn7 ctrlSetText localize "STR_pInAct_PutInCar";
_Btn7 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar;";


//Button 8: Sieze Weapons
_Btn8 ctrlSetText localize "STR_pInAct_SeizeWeapons";
_Btn8 buttonSetAction "[life_pInact_curTarget] call life_fnc_seizePlayerWeapon;";


//Button 9: Sieze Objects from Ground
_Btn9 ctrlSetText localize "STR_pInAct_SeizeObjectFromGround";
_Btn9 buttonSetAction "[life_pInact_curTarget] call life_fnc_seizeObjects;";