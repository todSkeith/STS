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
sleep 0.1;
if(getPos player select 2 < 0) then {player setPos [getPos player select 0, getPos player select 1, 0];};

//Rez sickness feat. broke ass legs
[] spawn {
	player setFatigue 1;
	player setHitPointDamage ["hitLegs",1];
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [5];
	"dynamicBlur" ppEffectCommit 0;
	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit 10;
	sleep 10;
	"dynamicBlur" ppEffectEnable false;
};