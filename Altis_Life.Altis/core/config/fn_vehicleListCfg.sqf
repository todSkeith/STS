#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
	case "kart_shop":
	{
		_return = [
			["C_Kart_01_Blu_F",15000],
			["C_Kart_01_Fuel_F",15000],
			["C_Kart_01_Red_F",15000],
			["C_Kart_01_Vrana_F",15000]
		];
	};
	case "med_shop":
	{
		_return = [
			["C_SUV_01_F",14000],
			["C_Hatchback_01_F",8000]
		];
	};
	
	case "med_air": {
		_return = [
			["O_Heli_Light_02_unarmed_F",150000],
			["B_Heli_Light_01_F",60000]
		];
	};
	
	case "civ_car":
	{
		_return = 
		[
			["B_Quadbike_01_F",2500],
			["C_Hatchback_01_F",9500],
			["C_Offroad_01_F",12500],
			["C_SUV_01_F",35000],
			["C_Van_01_transport_F",40000],
			["C_Hatchback_01_sport_F",75000]
		];
	};
	
	case "civ_truck":
	{
		_return =
		[
			["C_Offroad_01_F",15000],
			["C_Van_01_box_F",60000],
			["I_Truck_02_transport_F",75000],
			["I_Truck_02_covered_F",100000],
			["B_Truck_01_transport_F",200000],
			["B_Truck_01_box_F",375000]
		];	
	};
	
	
	case "reb_car":
	{
		_return =
		[
			["B_Quadbike_01_F",1000],
			["C_Offroad_01_F",15000],
			["I_G_Offroad_01_armed_F",750000],
			["B_Heli_Light_01_F",375000],
			["O_MRAP_02_F",250000]
		];
	};

	case "reb_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",200000],
			["O_Heli_Light_02_unarmed_F",600000]
		];
	};
	
	case "cop_car":
	{
		_return set[count _return,
		["C_Hatchback_01_F",9000]];
		_return set[count _return,
		["C_Offroad_01_F",5000]];
		_return set[count _return,
		["C_SUV_01_F",20000]];
		_return set[count _return,
		["C_Hatchback_01_sport_F",35000]];

		if(__GETC__(life_coplevel) > 4) then
		{
			_return set[count _return,
			["B_MRAP_01_F",50000]];
		};
	};
	
	case "civ_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",253000],
			["O_Heli_Light_02_unarmed_F",750000],
			["I_Heli_Transport_02_F",1800000]
		];
	};
	
	case "cop_air":
	{
		_return set[count _return,
		["B_Heli_Light_01_F",75000]];
		if(__GETC__(life_coplevel) > 4) then
		{
			_return set[count _return,
			["I_Heli_light_03_unarmed_F",200000]];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_return set[count _return,
			["B_Heli_Transport_01_F",50000]];
		};
	};
	
	case "cop_airhq":
	{
		_return set[count _return,
		["B_Heli_Light_01_F",75000]];
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,
			["B_Heli_Transport_01_F",200000]];
			_return set[count _return,
			["B_MRAP_01_hmg_F",750000]];
		};
	};
	
	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",22000]
		];
	};

	case "cop_ship":
	{
		_return =
		[
			["B_Boat_Transport_01_F",3000],
			["C_Boat_Civil_01_police_F",20000],
			["B_SDV_01_F",100000]
		];
	};
};

_return;
