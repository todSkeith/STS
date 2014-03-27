/*
	File: fn_equipGear.sqf
	Author: John "Paratus" VanderZwet

	Description:
	Initializes custom gear textures
*/

 if (playerSide == west) then {
	if ((uniform player) == "U_Rangemaster") then
	{
		[[player,"images\poucad.jpg"], "life_fnc_setUniform", true, true] spawn BIS_fnc_MP;
	};
	if ((uniform player) == "U_B_CombatUniform_mcam") then
	{
		[[player,"images\GenC.jpg"], "life_fnc_setUniform", true, true] spawn BIS_fnc_MP;
	};
};

 if (playerSide == independent) then {
	if ((uniform player) == "U_I_CombatUniform") then
	{
		[[player,"images\ems_uni.jpg"], "life_fnc_setUniform", true, true] spawn BIS_fnc_MP;
	};
};
