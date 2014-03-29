/*
	File: fn_revive
	
	Author: Skeith
	
	Description: is used by the medics to revive players
*/

_target = cursorTarget;

sendRevive = {
	life_isUnconscious = false;
	cursorTarget enableSimulation true;
	cursorTarget allowDamage true;
	cursorTarget setDamage 0;
	cursorTarget setCaptive false;
	disableUserInput false;
	cursorTarget playMove "amovppnemstpsraswrfldnon";
};

if (alive _target) then
	{
		player playMove "AinvPknlMstpSnonWnonDnon_medic0";
		sleep 2.5;//wait for animation to finish
		[[_target],sendRevive,cursorTarget,false] spawn life_fnc_MP;
		
	};
		