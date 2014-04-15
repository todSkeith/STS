/*
	File: fn_medicInteractionMenu.sqf
	Author: Skeith
	
	Description:
	Replaces the mass addactions for various medic actions towards another player.
*/
#define Btn1 37450
#define Btn2 37451
//#define Btn3 37452
//#define Btn4 37453
//#define Btn5 37454
//#define Btn6 37455
//#define Btn7 37456
//#define Btn8 37457
//#define Btn9 37458
#define Title 37401

if((player getVariable "unconscious")) exitWith {};

private["_display","_curTarget","_Btn1","_Btn2"];

if(!(cursorTarget getVariable "unconscious")) exitWith {};

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
//_Btn3 = _display displayCtrl Btn3;
//_Btn4 = _display displayCtrl Btn4;
//_Btn5 = _display displayCtrl Btn5;
//_Btn6 = _display displayCtrl Btn6;
//_Btn7 = _display displayCtrl Btn7;
//_Btn8 = _display displayCtrl Btn8;
//_Btn9 = _display displayCtrl Btn9;
life_pInact_curTarget = _curTarget;

//Button 1: Revive
if(_curTarget getVariable["unconscious",false]) then { _Btn1 ctrlEnable true; } else { _Btn1 ctrlEnable false; };

_Btn1 ctrlSetText localize "STR_pInAct_Revive";
_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_revive; closeDialog 0;";


//Button 2: Drag
if(_curTarget getVariable["unconscious",false]) then { _Btn2 ctrlEnable true; } else { _Btn2 ctrlEnable false; };

_Btn2 ctrlSetText localize "STR_pInAct_Drag";
_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_drag; closeDialog 0;";