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

switch (true) do
{
	case (!(str(player) in ["medic_nil"])):
	{
		switch (true) do
		{
			case(__GETC__(life_medicLvl) > 0) : {}; // Do nothing
			case (__GETC__(life_adminlevel) > 0) : {}; //Do nothing
			default {endMission "Loser"};
		};
	};
};
player setPos getMarkerPos "medic_spawn_1";
[] call life_fnc_medicLoadGear;
[] call life_fnc_equipGear;
