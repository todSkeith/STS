#include <macro.h>
/*
	File: fn_equipGear.sqf
	Author: John "Paratus" VanderZwet

	Description:
	Initializes custom gear textures
*/
switch (true) do {
	case ((uniform player) == "U_Rangemaster" && playerSide == west): {
		switch (__GETC__(life_coplevel)) do {
			case 1: { [[player,"images\Cadet_Uni.jpg"], "life_fnc_setUniform", true, false] spawn BIS_fnc_MP; };
			case 2: { [[player,"images\PO_Uni.jpg"], "life_fnc_setUniform", true, false] spawn BIS_fnc_MP; };
			case 3: { [[player,"images\SPO_Uni.jpg"], "life_fnc_setUniform", true, false] spawn BIS_fnc_MP; };
			case 4: { [[player,"images\Corp_Uni.jpg"], "life_fnc_setUniform", true, false] spawn BIS_fnc_MP; };
			case 5: { [[player,"images\Serg_Uni.jpg"], "life_fnc_setUniform", true, false] spawn BIS_fnc_MP; };
			case 6: { [[player,"images\Lieut_Uni.jpg"], "life_fnc_setUniform", true, false] spawn BIS_fnc_MP; };
			case 7: { [[player,"images\Capt_Uni.jpg"], "life_fnc_setUniform", true, false] spawn BIS_fnc_MP; };
			case 8: { [[player,"images\SuperInt_Uni.jpg"], "life_fnc_setUniform", true, false] spawn BIS_fnc_MP; };
			case 9: { [[player,"images\Chief_Uni.jpg"], "life_fnc_setUniform", true, false] spawn BIS_fnc_MP; };
		};		
	};
	
	case ((uniform player) == "U_B_CombatUniform_mcam" && playerSide == west): {
		[[player,"images\GenC.jpg"], "life_fnc_setUniform", true, false] spawn BIS_fnc_MP;
	};

	case ((uniform player) == "U_I_CombatUniform" && playerSide == independent): {
		[[player,"images\ems_uni.jpg"], "life_fnc_setUniform", true, false] spawn BIS_fnc_MP;
	};
	
	case ((uniform player) == "U_C_Poloshirt_salmon"): {
		[[player,"images\pol3.jpg"], "life_fnc_setUniform", true, false] spawn BIS_fnc_MP;
	};
	case ((uniform player) == "U_C_Scientist"): {
		[[player,"images\mech.jpg"], "life_fnc_setUniform", true, false] spawn BIS_fnc_MP;
	};
	case ((uniform player) == "U_OG_Guerilla3_2"): {
		[[player,"images\tiee11.jpg"], "life_fnc_setUniform", true, false] spawn BIS_fnc_MP;
	};
};
