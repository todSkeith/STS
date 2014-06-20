/*
	File: fn_arrestAction.sqf
	
	Description:
	Arrests the targeted person.
*/
private["_unit","_id"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {}; //Not valid
if(isNil "_unit") exitwith {}; //Not Valid
if(!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if(!isPlayer _unit) exitWith {}; //Not a human
if(!(_unit getVariable "restrained")) exitWith {}; //He's not restrained.
if(side _unit != civilian) exitWith {}; //Not a civ
if(isNull _unit) exitWith {}; //Not valid
if(player distance _unit > 4) exitWith {};

detach _unit;
//[[_unit,false],"life_fnc_jailDialog",player,false] spawn life_fnc_MP;
[_unit,false] call life_fnc_jailDialog;
//[[0,format[(localize "STR_NOTF_Arrested_1"), name _unit, name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;