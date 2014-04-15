/*
	File: fn_medicMarkers.sqf
	Author: Skeith
	
	Description:
	Marks medics on the map for other medics. Only initializes when the actual map is open.
*/
private["_mMarkers","_vMarkers","_medics","_victims"];
_mMarkers = [];
_vMarkers = [];
_medics = [];
_victims = [];

sleep 0.5;
if(visibleMap) then {
	{
		if(side _x == independent) then { _medics set[count _medics,_x]; };
		if(_x getVariable ["unconscious",false]) then { _victims set[count _medics,_x]; };
			} foreach playableUnits; //Fetch list of medics / blufor
	
	//Create markers
	{
		_mMarker = createMarkerLocal [format["%1_mMarker",_x],visiblePosition _x];
		_mMarker setMarkerColorLocal "ColorBlue";
		_mMarker setMarkerTypeLocal "Mil_dot";
		_mMarker setMarkerTextLocal format["%1", name _x];
	
		_markers set[count _markers,[_marker,_x]];
	} foreach _medics;
	{
		_vMarker = createMarkerLocal [format["%1_vMarker",_x],visiblePosition _x];
		_vMarker setMarkerColorLocal "ColorRed";
		_vMarker setMarkerTextLocal format["%1 is unconscious", name _unit];
		_vMarker setMarkerTypeLocal "waypoint";
	
		_vMarkers set[count _vMarkers,[_vMarker,_x]];
	} foreach _victims;
	while {visibleMap} do
	{
		{
			private["_marker","_unit"];
			_marker = _x select 0;
			_unit = _x select 1;
			if(!isNil "_unit") then
			{
				if(!isNull _unit) then
				{
					_marker setMarkerPosLocal (visiblePosition _unit);
				};
			};
		} foreach _mMarkers;
		if(!visibleMap) exitWith {};
		sleep 0.02;
	};

	{deleteMarkerLocal (_x select 0);} foreach _mMarkers;
	{deleteMarkerLocal (_x select 0);} foreach _vMarkers;
	_mMarkers = [];
	_vMarkers = [];
	_medics = [];
	_victims = [];
};