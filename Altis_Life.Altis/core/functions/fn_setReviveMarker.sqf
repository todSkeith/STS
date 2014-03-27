/*
	@Version: 3.0
	@Author: [BWG] Joe
	@Edited: 29.11.2013
*/
private ["_pos"];

_pos = [_this, 0, [], [[]]] call BIS_fnc_param;
_unit = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

if !(player call life_fnc_isMedic) exitWith {};
if (count _pos == 0) exitWith {};
if (isNull _unit) exitWith {};

_marker = format ["revive_%1", _pos];
createMarkerLocal [_marker, _pos];
_marker setMarkerTypeLocal "mil_box";
_marker setMarkerTextLocal format ["Revive: %1", name _unit];
_marker setMarkerColorLocal "ColorRed";
_marker setMarkerSizeLocal [1, 1];

while { !(isNull _unit) && alive _unit && (_unit getVariable ["wounded", false]) } do {
	_marker setMarkerPosLocal getPosATL _unit;
	sleep 1;
};

deleteMarker _marker;