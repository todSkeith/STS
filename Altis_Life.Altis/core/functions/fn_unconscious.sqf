/*
	File: fn_unconscious
	
	Author: Skeith
	
	Description: when handle damage calls this file, it will do all of the actions needed to be unconscious.
*/

private["_unit", "_source"];
_unit = _this select 0;
hint format ["_unit is %1", _unit];
_source = _this select 1;
_bleedout = time + (60*10);

_unit setVariable["unconscious",true,true];
[[0,format["%1 was critically wounded by %2", name _unit, name _source]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	
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
	[[_unit],"life_fnc_unconsciousMarker", true, false] spawn Bis_fnc_MP; 
	
	_unit setDamage 0;
	_unit setVelocity [0,0,0];
	_unit allowDamage false;
	_unit setCaptive true;
	_unit playMoveNow "amovppnemstpsraswrfldnon";


	while {_unit getVariable "unconscious"} do
{
		_unit playMoveNow "AinjPpneMstpSnonWrflDnon_rolltoback";
		_unit enablesimulation false;
		if(vehicle player != player) then
		{
			player action ["Eject",vehicle player];
		};

		if (_bleedout >= time) then {
			hintSilent format["Bleedout in %1 seconds\n\n%2", round (_bleedout - time)];
			sleep 1;
		}
		else {
			hintSilent "";
			_unit enablesimulation false;
			player setDamage 1;
		};
};

	_unit enableSimulation true;
	_unit allowDamage true;
	_unit setDamage 0;
	_unit setCaptive false;
	_unit playMove "amovppnemstpsraswrfldnon";