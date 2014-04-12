/*
	File: fn_reviveAction.sqf
	
	Author: Skeith
	
	Description: This gets sent to the unconscious client to revive them
*/

hintSilent "";
sleep 4;
player setVariable ["unconscious",false,true];
deleteMarker name player;
player enableSimulation true;
player allowDamage true;
player setDamage 0;
player setCaptive false;
player playMoveNow "amovppnemstpsraswrfldnon";