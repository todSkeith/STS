/*
	File: fn_revive
	
	Author: Skeith
	
	Description: is used by the medics to revive players
*/

_target = _this select 0;

player playMove "AinvPknlMstpSnonWnonDnon_medic0";
[[], "life_fnc_reviveAction", _target, false] spawn BIS_fnc_MP;
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