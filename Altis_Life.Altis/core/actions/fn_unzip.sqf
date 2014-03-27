/*
	File: fn_unzip.sqf
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit || !(_unit getVariable "zipTie")) exitWith {};

[[_unit, "zip_tie",10],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[_unit],"life_fnc_unrestrainAction",_unit,false] spawn life_fnc_MP;