/*
	File: fn_equipGear.sqf
	Author: John "Paratus" VanderZwet

	Description:
	Initializes custom gear textures
*/

 
	if ((uniform player) == "U_Rangemaster") then
	{
		[[player,"images\poucad.jpg"], "life_fnc_setUniform", true, true] spawn BIS_fnc_MP;
	};
	if ((uniform player) == "U_B_CombatUniform_mcam") then
	{
		[[player,"images\GenC.jpg"], "life_fnc_setUniform", true, true] spawn BIS_fnc_MP;
	};

	if ((uniform player) == "C_man_hunter_1_F") then
	{
		[[player,"images\ems_uni.jpg"], "life_fnc_setUniform", true, true] spawn BIS_fnc_MP;
	};
	
	if ((uniform player) == "U_C_Poloshirt_stripped") then
	{
		[[player,"images\pol3.jpg"], "life_fnc_setUniform", true, true] spawn BIS_fnc_MP;
	};
	if ((uniform player) == "U_C_Scientist") then
	{
		[[player,"images\mech.jpg"], "life_fnc_setUniform", true, true] spawn BIS_fnc_MP;
	};
