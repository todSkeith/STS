/*
	File: fn_unconscious
	
	Author: Skeith
	
	Description: when handle damage calls this file, it will do all of the actions needed to be unconscious.
*/

private["_unit", "_killer"];
_unit = _this select 0;
_source = _this select 1;
	
if(vehicle player != player) then
{
	player action ["Eject",vehicle player];
};

if (isPlayer _unit) then
	{
		disableUserInput true;
		titleText ["", "BLACK FADED"];
	};
	
_unit setDamage 0;
_marker = createMarker [format["%1", name player], getpos player];
_unit setVelocity [0,0,0];
_unit allowDamage false;
_unit setCaptive true;
_unit playMove "AinjPpneMstpSnonWrflDnon_rolltoback";
life_isUnconscious = true;
name player setMarkerColor "ColorRed";
name player setMarkerText format["%1 is unconscious", name player];
name player setMarkerType "waypoint";

while {life_isUnconscious && player == _unit} do
{
	if(!life_isUnconscious || player != _unit) then {
		deleteMarker name player;
	};
};