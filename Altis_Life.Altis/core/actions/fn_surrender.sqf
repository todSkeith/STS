/*
	File: fn_surrender.sqf
	Author: Skalicon
	
	Description:
	Surrender Animation test
*/
if((player getVariable "restrained")||(player getVariable "Escorting")) exitWith {};
if(vehicle player != player) exitWith{};
private["_surrender"];
[[player],"life_fnc_surrenderAction",player,false] spawn BIS_fnc_MP;