/*
	File: fn_hudUpdate.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the HUD when it needs to.
*/
private["_ui","_food","_water","_health","_weight","_fatigue"];
disableSerialization;

_ui = uiNameSpace getVariable ["playerHUD",displayNull];
if(isNull _ui) then {[] call life_fnc_hudSetup;};
_food = _ui displayCtrl 23500;
_water = _ui displayCtrl 23510;
_health = _ui displayCtrl 23515;
_weight = _ui displayCtrl 23520;
_fatigue = _ui displayCtrl 23525;

//Update food
_food ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.548];
_food ctrlSetText format["%1 %2", life_hunger,"%"];
_food ctrlCommit 0;
//Update Water
_water ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.502];
_water ctrlSetText format["%1 %2", life_thirst, "%"];
_water ctrlCommit 0;
//Update Health
_health ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.456];
_health ctrlSetText format["%1 %2", round((1 - (damage player)) * 100), "%"];
_health ctrlCommit 0;
//Update Weight
_weight ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.410];
_weight ctrlSetText format["%1 %2", playerFatigue, "%"];
_weight ctrlCommit 0;
//Update Fatigue
_fatigue ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.365];
_fatigue ctrlSetText format["%1 %2", playerWeight, "kg"];
_fatigue ctrlCommit 0;