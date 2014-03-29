/*
	File: fn_unconscious
	
	Author: Skeith
	
	Description: when handle damage calls this file, it will do all of the actions needed to be unconscious.
*/

private["_unit", "_killer"];
_unit = _this select 0;
_source = _this select 1;

_unit setVariable["unconscious",true,true];
	
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
	_unit setVelocity [0,0,0];
	_unit allowDamage false;
	_unit setCaptive true;
	_marker = createMarker [format["%1", name player], getpos player];
	name player setMarkerColor "ColorRed";
	name player setMarkerText format["%1 is unconscious", name player];
	name player setMarkerType "waypoint";
	
	
while {_unit getVariable "unconscious"} do
{
	_unit setDamage 0;
	_unit setVelocity [0,0,0];
	_unit allowDamage false;
	_unit setCaptive true;
	_unit playMove "AinjPpneMstpSnonWrflDnon_rolltoback";
	waitUntil {animationState _victim != "AinjPpneMstpSnonWrflDnon_rolltoback" || !(_victim getVariable "zipTie")};
};

_unit enableSimulation true;
	_unit allowDamage true;
	_unit setDamage 0;
	_unit setCaptive false;
	disableUserInput false;
	_unit playMove "amovppnemstpsraswrfldnon";

while {player == _unit} do
{
	if(player != _unit) then {
		deleteMarker name player;
	};
};