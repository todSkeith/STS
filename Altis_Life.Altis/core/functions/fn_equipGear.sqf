/*
	File: fn_equipGear.sqf
	Author: John "Paratus" VanderZwet

	Description:
	Initializes custom gear textures
*/
	
		if ((__GETC__(life_coplevel) = 1) then
	{
		[[player,"images\Cadet_Uni.jpg"], "life_fnc_setUniform", true, false] spawn BIS_fnc_MP;
	};
	
	if ((__GETC__(life_coplevel) = 2) then
	{
		[[player,"images\PO_Uni.jpg"], "life_fnc_setUniform", true, false] spawn BIS_fnc_MP;
	};
	if ((__GETC__(life_coplevel) = 3) then
	{
		[[player,"images\SPO_Uni.jpg"], "life_fnc_setUniform", true, false] spawn BIS_fnc_MP;
	};
	if ((__GETC__(life_coplevel) = 4) then
	{
		[[player,"images\Corp_Uni.jpg"], "life_fnc_setUniform", true, false] spawn BIS_fnc_MP;
	};
	if ((__GETC__(life_coplevel) = 5) then
	{
		[[player,"images\Serg_Uni.jpg"], "life_fnc_setUniform", true, false] spawn BIS_fnc_MP;
	};
	if ((__GETC__(life_coplevel) = 6) then
	{
		[[player,"images\Lieut_Uni.jpg"], "life_fnc_setUniform", true, false] spawn BIS_fnc_MP;	
	};
	if ((__GETC__(life_coplevel) = 7) then
	{
		[[player,"images\Capt_Uni.jpg"], "life_fnc_setUniform", true, false] spawn BIS_fnc_MP;		
	};
	if ((__GETC__(life_coplevel) = 8) then
	{
		[[player,"images\SuperInt_Uni.jpg"], "life_fnc_setUniform", true, false] spawn BIS_fnc_MP;	
	};
	if ((__GETC__(life_coplevel) = 9) then
	{
		[[player,"images\Chief_Uni.jpg"], "life_fnc_setUniform", true, false] spawn BIS_fnc_MP;
	};		
		
		
		
	if ((uniform player) == "U_B_CombatUniform_mcam") then
	{
		[[player,"images\GenC.jpg"], "life_fnc_setUniform", true, false] spawn BIS_fnc_MP;
	};

	if (playerSide == independent) then 
	{
		if ((uniform player) == "U_I_CombatUniform") then
		{
			[[player,"images\ems_uni.jpg"], "life_fnc_setUniform", true, false] spawn BIS_fnc_MP;
		};
	};
	
	if ((uniform player) == "U_C_Poloshirt_salmon") then
	{
		[[player,"images\pol3.jpg"], "life_fnc_setUniform", true, false] spawn BIS_fnc_MP;
	};
	if ((uniform player) == "U_C_Scientist") then
	{
		[[player,"images\mech.jpg"], "life_fnc_setUniform", true, false] spawn BIS_fnc_MP;
	};
	if ((uniform player) == "U_OG_Guerilla3_2") then
	{
		[[player,"images\tiee11.jpg"], "life_fnc_setUniform", true, false] spawn BIS_fnc_MP;
	};
