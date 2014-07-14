//////////////////////////////////////////////////////////////////
// Created by: Bobbus
// Function Name: life_fn_jailFeed.sqf
// Description: Feed and water prisoner
//////////////////////////////////////////////////////////////////

private["_unit"];
_unit = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _unit) exitWith {};
if(!life_is_arrested) exitWith {titleText["The prison guard will only feed prisoners.","PLAIN"];}; then

life_thirst = 100;
life_hunger = 100;
[] call life_fnc_hudUpdate;
titleText["The prison guard has provided you with food and water.","PLAIN"];
