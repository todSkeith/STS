/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master damage handling system for Stratis / Altis Life
*/
private["_who"];
_who = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
life_reviver = _who;
life_revived = true;