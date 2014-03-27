/*
	File: fn_unrestrainAction.sqf
	Author: Skalicon

	Description:
	Unrestrains player
*/
private["_unit"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;

_unit playMoveNow "AmovPercMstpSnonWnonDnon";
_unit setVariable["restrained",false,true];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["zipTie",false,true];
detach _unit;


//[[47, player, format["Unrestrained %1", name _unit]],"ASY_fnc_logIt",false,false] spawn BIS_fnc_MP;