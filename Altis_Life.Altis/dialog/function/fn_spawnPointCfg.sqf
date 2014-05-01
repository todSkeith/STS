/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration for available spawn points depending on the units side.

	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		[
			["cop_spawn_1","Kavala HQ","icons\policeIcon.paa"],
			["cop_spawn_2","Pyrgos HQ","icons\policeIcon.paa"],
			["cop_spawn_3","Athira HQ","icons\policeIcon.paa"],
			["cop_spawn_4","Air HQ","icons\policeIcon.paa"],
			["cop_spawn_5","HW Patrol","icons\policeIcon.paa"],
			["cop_spawn_6","Coast Guard HQ","icons\policeIcon.paa"]
		];
	};

	case civilian:
	{
		[
			["civ_spawn_1","Kavala","icons\IconSloth.paa"],
			["civ_spawn_2","Pyrgos","icons\IconSloth.paa"],
			["civ_spawn_3","Athira","icons\IconSloth.paa"],
			["civ_spawn_4","Sofia","icons\IconSloth.paa"]
		];
	};

	case independent:
	{
		[
			["medic_spawn_1","Kavala","icons\IconSloth.paa"],
			["medic_spawn_2","Rodopoli","icons\IconSloth.paa"]

		];

	};
};