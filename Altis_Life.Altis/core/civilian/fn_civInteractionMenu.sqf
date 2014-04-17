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


private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9"];
if(!dialog) then {
	createDialog "cInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
if(!isPlayer _curTarget && side _curTarget == civilian && side _curTarget == west) exitWith {closeDialog 0;}; //Bad side check?
//Can't interact while restrained or dead
if (player getVariable["zipTie",false] || player getVariable["restrained",false] || player getVariable["surrender",false] || player getVariable ["unconscious",false]) exitWith {closeDialog 0;};
//Can't interact with medics
if (side _curTarget == independent) exitWith {closeDialog 0;};


_tRest = _curTarget getVariable ["restrained",false];
_tZip = _curTarget getVariable ["zipTie",false];
_tUnc = _curTarget getVariable ["unconscious",false];
_tEsc = _curTarget getVariable ["Escorting",false];
_tSur = _curTarget getVariable ["surrender",false];
if (_curTarget animationState == "Incapacitated") then { _tKout = true; } else { _tKout = false; };

life_pInact_curTarget = _curTarget;


_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
//Not used:
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Btn9 = _display displayCtrl Btn9;
_Btn5 ctrlShow false;
_Btn6 ctrlShow false;
_Btn7 ctrlShow false;
_Btn8 ctrlShow false;
_Btn9 ctrlShow false;


//Button 1: Restrain / unrestrain
if(!_tZip && !_tKout && !_tSur) then { _Btn1 ctrlEnable true; } else { _Btn1 ctrlEnable false; };
if (_tUnc) then {
	_Btn1 ctrlSetText localize "STR_pInAct_Stabilise";
	_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_stabilise; closeDialog 0;";
} else {
	if (_tZip) then {
		_Btn1 ctrlSetText localize "STR_pInAct_Unrestrain";
		_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_unzip; closeDialog 0;";
	} else {
		_Btn1 ctrlSetText localize "STR_pInAct_Restrain";
		_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_zipTie; closeDialog 0;";
	};
};

//Button 2: Put in Vehicle
if(_tEsc) then { _Btn2 ctrlEnable true; } else { _Btn2 ctrlEnable false; };

_Btn2 ctrlSetText localize "STR_pInAct_PutInCar";
_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar; closeDialog 0;";


//Button 3: Escort
if(_tZip) then { _Btn3 ctrlEnable true; } else { _Btn3 ctrlEnable false; };

if((_curTarget getVariable["Escorting",false])) then {
	_Btn3 ctrlSetText localize "STR_pInAct_StopEscort";
	_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscorting; closeDialog 0;";
} else {
	_Btn3 ctrlSetText localize "STR_pInAct_Escort";
	_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
};


//Button 4: Rob person
if((_tZip || _tSur || _tKout) && !_tEsc) then { _Btn4 ctrlEnable true; } else { _Btn4 ctrlEnable false; };

_Btn4 ctrlSetText localize "STR_pInAct_RobPerson";
_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_robAction; closeDialog 0;";