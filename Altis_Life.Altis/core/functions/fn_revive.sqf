/*
	File: fn_revive
	
	Author: Skeith
	
	Description: is used by the medics to revive players
*/

_target = _this select 0;

sendRevive = {
	life_isUnconscious = false;
	_target enableSimulation true;
	_target allowDamage true;
	_target setDamage 0;
	_target setCaptive false;
	_target playMove "amovppnemstpsraswrfldnon";
};

if (alive _target) then
	{
		player playMove "AinvPknlMstpSnonWnonDnon_medic0";
		sleep 2.5;//wait for animation to finish
		_target setVariable ["unconscious",false,true];
		_target enableSimulation true;
		_target allowDamage true;
		_target setDamage 0;
		_target setCaptive false;
		_target playMove "amovppnemstpsraswrfldnon";
	};
		