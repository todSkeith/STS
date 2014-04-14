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

if((player getVariable "unconscious")) exitWith {};

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9"];
if(!dialog) then {
	createDialog "cInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
if(!isPlayer _curTarget && side _curTarget == civilian && side _curTarget == west) exitWith {closeDialog 0;}; //Bad side check?
if (player getVariable["zipTie",false] || player getVariable["restrained",false] || player getVariable["surrender",false]) exitWith {closeDialog 0;}; //Can't interact while restrained
_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
/*
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Btn9 = _display displayCtrl Btn9;
*/

life_cInact_curTarget = _curTarget;

//Set Unrestrain Button
_Btn1 ctrlSetText localize "STR_cInAct_Unrestrain";
if((_curTarget getVariable["zipTie",false])) then {
	_Btn1 buttonSetAction "[life_cInact_curTarget] call life_fnc_unzip; closeDialog 0;";
} else {
	_Btn1 ctrlEnable false;
};

//Set Put in Car
_Btn2 ctrlSetText localize "STR_cInAct_PutInCar";
if((_curTarget getVariable["Escorting",false])) then {
_Btn2 buttonSetAction "[life_cInact_curTarget] call life_fnc_putInCar; closeDialog 0;";
} else {
	_Btn2 ctrlEnable false;
};

//Set Escort Button
_Btn3 ctrlSetText localize "STR_cInAct_Escort";
if((_curTarget getVariable["zipTie",false])) then {
	if((_curTarget getVariable["Escorting",false])) then {
		_Btn3 ctrlSetText localize "STR_cInAct_StopEscort";
		_Btn3 buttonSetAction "[life_cInact_curTarget] call life_fnc_stopEscorting; [life_cInact_curTarget] call life_fnc_civInteractionMenu;";
	} else {
		_Btn3 ctrlSetText localize "STR_cInAct_Escort";
		_Btn3 buttonSetAction "[life_cInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
	};
} else {
	_Btn3 ctrlEnable false;
};

/*
if(license_civ_bh && side cursorTarget == civilian) then {
	_Btn4 ctrlSetText localize "STR_cInAct_Arrest";
	_Btn4 buttonSetAction "[life_cInact_curTarget] call life_fnc_arrestAction;";
} else {
	_Btn4 ctrlEnable false;
};
*/

//Rob person
_Btn4 ctrlSetText localize "STR_cInAct_RobPerson";
if(player distance cursorTarget < 3.5 && ((_curTarget getVariable["zipTie",false]) || (_curTarget getVariable["surrender",false]) || (animationState _curTarget == "Incapacitated")) && !(_curTarget getVariable["Escorting",false])) then
	{
	_Btn4 buttonSetAction "[life_cInact_curTarget] call life_fnc_robAction; closeDialog 0;";
} else {
	_Btn4 ctrlEnable false;
};


/*
//Set Ticket Button
_Btn5 ctrlSetText localize "STR_cInAct_TicketBtn";
_Btn5 buttonSetAction "[life_cInact_curTarget] call life_fnc_ticketAction;";

//SeT Jail
_Btn6 ctrlSetText localize "STR_cInAct_Arrest";
_Btn6 buttonSetAction "[life_cInact_curTarget] call life_fnc_jailDialog;";

//Set PutinCar
_Btn7 ctrlSetText localize "STR_cInAct_PutInCar";
_Btn7 buttonSetAction "[life_cInact_curTarget] call life_fnc_putInCar;";

//Test
_Btn8 ctrlSetText localize "STR_cInAct_SeizeWeapons&Items";
_Btn8 buttonSetAction "[life_cInact_curTarget] call life_fnc_seizePlayerWeapon;";

_Btn9 ctrlSetText localize "STR_cInAct_SeizeObjectFromGround";
_Btn9 buttonSetAction "[life_cInact_curTarget] call life_fnc_seizeObjects;";
*/
