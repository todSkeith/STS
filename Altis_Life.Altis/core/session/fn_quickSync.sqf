/*
	File: fn_quickSync.sqf
	Author: Skeith
	
	Description:
	Sends the quick update. ONLY WORKS WITH PLAYER POS RIGHT NOW.
*/
private["_packet"];
_paramName = [_this,0,"",[""]] call BIS_fnc_param;
_param = [_this,1,[],[[]]] call BIS_fnc_param;

//if (_param == "") exitWith{}; //empty
_packet = [player,name player,playerSide,getPlayerUID player,_paramName,_param];

[_packet,"TON_fnc_quickUpdate",false,false] spawn BIS_fnc_MP;