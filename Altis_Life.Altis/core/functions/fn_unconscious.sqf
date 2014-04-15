/*
	File: fn_unconscious
	
	Author: Skeith
	
	Description: when handle damage calls this file, it will do all of the actions needed to be unconscious.
*/

private["_unit", "_source","_bleedout"];
_unit = _this select 0;
hint format ["_unit is %1", _unit];
_source = _this select 1;
_bleedout = time + (60*15);

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
	//[[_unit],"life_fnc_unconsciousMarker", true, false] spawn Bis_fnc_MP; --- Included into medicMarkers
	
	_unit setDamage 0;
	_unit setVelocity [0,0,0];
	_unit allowDamage false;
	_unit setCaptive true;
	_unit playMoveNow "AinjPpneMstpSnonWrflDnon_rolltoback";


	while {_unit getVariable "unconscious"} do
{
		_unit switchMove "AinjPpneMstpSnonWrflDnon";
		_unit enablesimulation false;
		if(vehicle player != player) then
		{
			player action ["Eject",vehicle player];
		};

		if (_bleedout >= time) then {
			
			_hintbleedout = format["Bleedout in %1 seconds<br/>",round (_bleedout - time)];
			_nearest=objNull;
			_nearestdist=50000;
			{
				_dist=vehicle _x distance player;
				if (isPlayer _x && _dist < _nearestdist && side _x == independent && !(_x getVariable ["unconscious",false])) then {
					_nearest=_x;
					_nearestdist=_dist;
				};
			} forEach playableUnits;
			if (!isNull _nearest && _nearestdist < 50000 && playersNumber independent != 0) then {
				hintSilent parseText format["Bleedout in %1 seconds<br/>Closest medic: %2m",round (_bleedout - time),floor _nearestdist];
			} else {
				hintSilent parseText format["Bleedout in %1 seconds<br/>No medics available",round (_bleedout - time)];
			};
			sleep 1;
		} else {
			hintSilent "";
			player setDamage 1;
		};
};
	hintSilent "";
	_unit enableSimulation true;
	_unit allowDamage true;
//	_unit setDamage 0;
	_unit setCaptive false;
	_unit playMove "amovppnemstpsraswrfldnon";