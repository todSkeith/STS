/*
	File: fn_unconscious
	
	Author: Skeith
	
	Description: when handle damage calls this file, it will do all of the actions needed to be unconscious.
*/

private["_unit", "_source"];
_unit = _this select 0;
_source = _this select 1;
life_bleedout = time + (60*15);

_unit setVariable["unconscious",true,true];
_unit setVariable["restrained",false,true];
_unit setVariable["Escorting",false,true];
_unit setVariable["zipTie",false,true];
_unit setVariable["surrender",false,true];

[] call life_fnc_sessionUpdate;

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
	//[[_unit],"life_fnc_unconsciousMarker", true, false] spawn Bis_fnc_MP; --- Included into medicMarkers
	
	_unit setDamage 0;
	_unit setVelocity [0,0,0];
	_unit allowDamage false;
	_unit playMoveNow "AinjPpneMstpSnonWrflDnon_rolltoback";


	while {_unit getVariable "unconscious"} do
{
		_unit switchMove "AinjPpneMstpSnonWrflDnon";
		_unit enablesimulation false;
		if(vehicle player != player && driver vehicle player == player) then
		{
			player action ["Eject",vehicle player];
			titleText ["You can't drive in that state...","PLAIN"];
		};

		if (life_bleedout >= time) then {
			
			_hintbleedout = format["Bleedout in %1 seconds<br/>",round (life_bleedout - time)];
			_nearest=objNull;
			_nearestdist=50000;
			{
				_dist=vehicle _x distance player;
				if (isPlayer _x && _dist < _nearestdist && side _x == independent && !(_x getVariable ["unconscious",false])) then {
					_nearest=_x;
					_nearestdist=_dist;
				};
			} forEach playableUnits;
			switch (true) do {
				case (playersNumber independent == 0):	{ hintSilent parseText format["Bleedout in %1 seconds<br/>No medics available. You can respawn for free.",round (life_bleedout - time)]; };
				case (!isNull _nearest): 				{ hintSilent parseText format["Bleedout in %1 seconds<br/>Closest medic: %2m",round (life_bleedout - time),floor _nearestdist]; };
				default 								{ hintSilent parseText format["Bleedout in %1 seconds<br/>No medics available. You can respawn for free.",round (life_bleedout - time)]; };
			};
			sleep 1;
		} else {
			hintSilent "";
			player setDamage 1;
		};
};
	hintSilent "";
	//_unit enableSimulation true;
	//_unit allowDamage true;
	//_unit playMove "amovppnemstpsraswrfldnon";