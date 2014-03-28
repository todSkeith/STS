/*
	File: fn_revive
	
	Author: Skeith
	
	Description: is used by the medics to revive players
*/

_target = cursorTarget;

sendRevive = {
	life_isUnconscious = false;
	_this select 0 enableSimulation true;
	_this select 0 allowDamage true;
	_this select 0 setDamage 0;
	_this select 0 setCaptive false;
}

if (alive _target) then
	{
		player playMove "AinvPknlMstpSnonWnonDnon_medic0";
		sleep 2.5;//wait for animation to finish
		[[_target],sendRevive,cursorTarget,false] spawn life_fnc_MP;
		
	}
		