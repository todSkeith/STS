/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the medic out with the default gear.
*/
removeAllContainers player;
removeAllWeapons player;
removeGoggles player;
removeHeadGear player;
player forceAddUniform "U_I_CombatUniform";
player addBackpack "B_Kitbag_cbr";
player additem "NVGoggles";
player assignitem "NVGoggles";
player addItem "Medikit";
player addItem "ToolKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
if(hmd player != "") then {
	player unlinkItem (hmd player);
};

[[player,0,"images\ems_uni.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;