/*
	File: fn_stabilise
	
	Author: Bobbus
	
	Description: is used to extend bleedout time of players
*/

_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if (isNull _target) exitWith {};
if (!isPlayer _target) exitWith {};
if(!_unit getVariable "[unconscious",false]) exitWith {};

player playMove "AinvPknlMstpSnonWnonDnon_medic0";
[[player], "life_fnc_stabiliseAction", _target, false] spawn BIS_fnc_MP;