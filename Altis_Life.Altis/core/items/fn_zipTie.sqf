/*
	File: fn_zipTie.sqf
	Author: Bad^^Eye
	
	Description:
	Main functionality for civ restrain
*/
private["_unit"];
_unit = cursorTarget;

if((_unit getVariable "restrained")||(_unit getVariable "Escorting")||(_unit getVariable "zipTie")) exitWith {};
if(isNull _unit) exitWith {}; //Not valid
if(player == _unit) exitWith {};
if(life_inv_zip == 0) exitWith {};
life_inv_zip = life_inv_zip - 1;
	
[[_unit, "zip_tie",10],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[player,_unit],"life_fnc_zipTieAction",_unit,false] spawn life_fnc_MP;

