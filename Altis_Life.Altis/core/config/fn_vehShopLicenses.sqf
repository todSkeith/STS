/*
	@file Version: 1.Bf
	@file name: buy.sqf
	@file Author: TAW_Tonic
	@file edit: 5/19/2013
	Copyright © 2013 Bryan Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
*/
private["_veh","_ret"];
_veh = _this select 0;
_ret = false;

switch (life_veh_shop) do
{
	case "civ_car_1": {_ret = license_civ_driver;};
	case "civ_car_2": {_ret = license_civ_driver;};
	case "civ_car_3": {_ret = license_civ_driver;};
	case "civ_car_4": {_ret = license_civ_driver;};
	case "civ_ship_1": {_ret = license_civ_boat;};
	case "civ_ship_2": {_ret = license_civ_boat;};
	case "civ_ship_3": {_ret = license_civ_boat;};
	case "civ_air_1": {_ret = license_civ_air;};
	case "civ_air_2": {_ret = license_civ_air;};
	case "cop_air_1": {_ret = license_cop_air;};
	case "cop_air_2": {_ret = license_cop_air;};
	case "donator_1": {_ret = true;};
	case "donator_2": {_ret = true;};
	case "civ_truck_1":	{_ret = license_civ_truck;};
	case "civ_truck_2":	{_ret = license_civ_truck;};
	case "civ_servt_1": {_ret = license_civ_driver;};
	case "reb_v_1": {_ret = license_civ_rebel;};
	case "reb_v_2": {_ret = license_civ_rebel;};
	case "cop_car_1": {_ret = true;};
	case "cop_car_2": {_ret = true;};
	case "cop_car_3": {_ret = true;};
	case "cop_car_5": {_ret = true;};
	case "fed_car": {_ret = true;};
	case "fed_air": {_ret = true;};
	case "cop_ship_1": {_ret = license_cop_cg;};
	case "cop_ship_2": {_ret = license_cop_cg;};
	case "medic_car_1": {_ret = true;};
	case "medic_air_1": {_ret = license_medic_air;};

};

_ret;