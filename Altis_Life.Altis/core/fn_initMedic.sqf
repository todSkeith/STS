#include <macro.h>
/*
	File: fn_initMedic.sqf
	Author: Skeith

	Description:
	Initializes the medic.
*/
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
[] spawn life_fnc_medicMarkers;

//switch (true) do
//{
//	case (!(str(player) in ["medic_nil"])):
//	{
		if((__GETC__(life_mediclvl)) > 0 || (__GETC__(life_adminlevel)) > 0) then {
			systemChat format ["Medic login accepted. Medic level: %1 Admin level: %2",__GETC__(life_mediclvl),__GETC__(life_adminlevel)];
		}
		else {
			default {endMission "Loser"};
		};
//	};
//};
player setPos getMarkerPos "medic_spawn_1";
[] call life_fnc_medicLoadGear;
[] call life_fnc_equipGear;
