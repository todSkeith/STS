/*
	Adapted from BWG Joe
	Function for marker placement for medics
*/
private ["_markers","_cops"];

_markers = [];
_medics = [];

while {true} do {
	waitUntil {visibleMap};

	{
		if (_x call life_fnc_isMedic) then { _medics set [count _medics, _x]; };
	} forEach playableUnits; //Fetch list of cops / blufor

	// Create markers
	{
		_marker = createMarkerLocal [format ["%1_marker", _x], getPos _x];
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format ["%1", name _x];
		_markers set [count _markers, [_marker,_x]];
	} forEach _medics;

	while {visibleMap} do {
		{
			private ["_marker","_unit"];
			_marker = _x select 0;
			_unit = _x select 1;
			if (!isNil "_unit" && {!isNull _unit}) then {
				_marker setMarkerPosLocal (getPos _unit);
			};
		} forEach _markers;
		if (!visibleMap) exitWith {};
		sleep 0.02;
	};

	{ deleteMarkerLocal (_x select 0); } forEach _markers;
	_markers = [];
	_medics = [];
};