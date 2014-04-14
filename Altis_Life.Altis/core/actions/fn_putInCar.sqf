/*
	File: fn_putInCar.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Finds the nearest vehicle and loads the target into the vehicle.
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit OR !isPlayer _unit OR _unit getVariable ["unconscious",false]) exitWith {};

_nearestVehicle = nearestObjects[getPosATL player,["Car","Ship","Submarine","Air"],10] select 0;
if(isNil "_nearestVehicle") exitWith {hint "There isn't a vehicle near by.."};

detach _unit;
[[_nearestVehicle],"life_fnc_moveIn",_unit,false] call life_fnc_MP;
_unit setVariable["Escorting",false,true];
_unit setVariable["transporting",true,true];