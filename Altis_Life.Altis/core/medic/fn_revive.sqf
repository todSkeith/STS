/*
	File: fn_revive
	
	Author: Skeith
	
	Description: is used by the medics to revive players
*/

_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if (isNull _target) exitWith {};
if (!isPlayer _target) exitWith {};
if(!(_unit getVariable ["unconscious",false])) exitWith {};

[[player], "life_fnc_reviveAction", _target, false] spawn BIS_fnc_MP;
player playMove "AinvPknlMstpSnonWnonDr_medic0";
sleep 9.090;
player playMoveNow "AinvPknlMstpSnonWnonDr_medic1";
sleep 4.761;
player playMoveNow "AinvPknlMstpSnonWnonDr_medic2";
sleep 7.592;
player playMoveNow "AinvPknlMstpSnonWnonDr_medic3";
sleep 7.592;
player playMoveNow "AinvPknlMstpSnonWnonDr_medic4";
sleep 4.545;
player playMoveNow "AinvPknlMstpSnonWnonDr_medic5";


/*
if (alive _target) then
	{
		player playMove "AinvPknlMstpSnonWnonDnon_medic0";
		hint format ["setvariable %1", _target];
		_target setVariable ["unconscious",false,true];
		hint format ["enable sim %1", _target];
		_target enableSimulation true;
		hint format ["allowdamage %1", _target];
		_target allowDamage true;
		hint format ["setdamage %1", _target];
		_target setDamage 0;
		hint format ["setcaptive %1", _target];
		_target setCaptive false;
		hint format ["animation %1", _target];
		_target playMove "amovppnemstpsraswrfldnon";
		hint format ["done %1", _target];
	};
*/