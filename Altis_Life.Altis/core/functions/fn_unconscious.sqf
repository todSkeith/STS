/*
	File: fn_unconscious
	
	Author: Skeith
	
	Description: when handle damage calls this file, it will do all of the actions needed to be unconscious.
*/

private["_unit", "_killer"];
_unit = _this select 0;
hint format ["_unit is %1", _unit];
_source = _this select 1;
_bleedout = time + (60*10);

_unit setVariable["unconscious",true,true];
	
if(vehicle player != player) then
{
	player action ["Eject",vehicle player];
};

if (isPlayer _unit) then
	{
		titleText ["", "BLACK FADED"];
		
		sleep 2.5;
	};
	titleText ["", "BLACK IN", 1];
	
	_unit setDamage 0;
	_unit setVelocity [0,0,0];
	_unit allowDamage false;
	_unit setCaptive true;
	_marker = createMarker [format["%1", name player], getpos player];
	name player setMarkerColor "ColorRed";
	name player setMarkerText format["%1 is unconscious", name player];
	name player setMarkerType "waypoint";
	
	_unit setDamage 0;
	_unit setVelocity [0,0,0];
	_unit allowDamage false;
	_unit setCaptive true;
	_unit playMoveNow "amovppnemstpsraswrfldnon";


	while {_unit getVariable "unconscious"} do
{
		_unit playMove "AinjPpneMstpSnonWrflDnon_rolltoback";
		onPlayerDisconnected {deleteMarker name player;};
		if (_bleedout >= time) then {
			hintSilent format["Bleedout in %1 seconds\n\n%2", round (_bleedout - time)];
			sleep 1;
		}
		else {
			player setDamage 1;
			deleteMarker name player;
		};
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