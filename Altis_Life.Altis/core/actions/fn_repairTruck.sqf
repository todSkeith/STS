/*
	File: fn_repairTruck.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for toolkits, to be revised in later version.
*/
private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName","_vehHPs"];
_veh = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
life_interrupted = false;
if(isNull _veh) exitwith {};

if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then
{
	if("ToolKit" in (items player)) then
	{
		life_action_inUse = true;
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_upp = format["Repairing %1",_displayName];
		//Setup our progress bar.
		disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNameSpace getVariable "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
		_progress progressSetPosition 0.01;
		_cP = 0.01;
				
		
		//Set vehicle hitpoints to 35% damage if higher
		if (local _veh) then {
			_veh spawn {
				_vehHPs = ["HitRGlass","HitLGlass","HitGlass1","HitGlass2","HitGlass3","HitGlass4","HitGlass5","HitGlass6","HitBody","HitFuel","HitLFWheel","HitLBWheel","HitLMWheel","HitLF2Wheel","HitRFWheel","HitRBWheel","HitRMWheel","HitRF2Wheel","HitEngine","HitHull","HitAvionics","HitVRotor","HitHRotor"];
				{
					if (_this getHitPointDamage _x > 0) then {
						_this setHitPointDamage [_x,0];
					};
					//systemChat format ["%1 repaired on %2",_x,_this];
					sleep 1.15;
					if(!alive player) exitWith {};
					if(player != vehicle player) exitWith {};
					if(life_interrupted) exitWith {};
				} forEach _vehHPs;
			};
		};
		
		while{true} do
		{
			if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
				[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
				player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
				player removeItem "ToolKit";
			};
			sleep 0.27;
			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
			if(_cP >= 1) exitWith {};
			if(!alive player) exitWith {};
			if(player != vehicle player) exitWith {};
			if(life_interrupted) exitWith {};
		};
		
		life_action_inUse = false;
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(life_interrupted) exitWith {life_interrupted = false; titleText["Action cancelled","PLAIN"]; life_action_inUse = false;};
		if(player != vehicle player) exitWith {titleText["You must be outside of the vehicle to fix it.","PLAIN"];};
		if(!local _veh) then { _veh setDamage 0; };
		titleText["You have repaired that vehicle.","PLAIN"];
	};
};