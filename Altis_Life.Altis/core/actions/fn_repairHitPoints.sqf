/*
	File: fn_repairHitPoints.sqf
	Author: Bobbus
	
	Description:
	Allow for repairing hitpoints of a vehicle owned by someone else
*/
private["_vehHPs","_veh","_unit"]
_veh = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_unit = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _veh || isNull _unit) exitWith {};

_vehHPs = ["HitRGlass","HitLGlass","HitGlass1","HitGlass2","HitGlass3","HitGlass4","HitGlass5","HitGlass6","HitBody","HitFuel","HitLFWheel","HitLBWheel","HitLMWheel","HitLF2Wheel","HitRFWheel","HitRBWheel","HitRMWheel","HitRF2Wheel","HitEngine","HitHull","HitAvionics","HitVRotor","HitHRotor"];
{
	if (_this getHitPointDamage _x > 0.35) then {
		_this setHitPointDamage [_x,0.35];
	};
	//systemChat format ["%1 repaired on %2",_x,_this];
} forEach _vehHPs;