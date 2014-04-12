#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master config file for Cop clothing store.
*/

private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Altis Police Department Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret set[count _ret,["U_Rangemaster","Cadet Uniform",25]];
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret set[count _ret,["U_B_CombatUniform_mcam","Altis Police Uniform",350]];
		};
	};

	//Hats
	case 1:
	{
		if(__GETC__(life_coplevel) > 0) then
		{
			_ret set[count _ret,["H_Cap_blk","Cadet Hat",75]];
		};

		if(__GETC__(life_copLevel) > 1) then
		{
			_ret set[count _ret,["H_MilCap_gry",nil,100]];
			_ret set[count _ret,["H_HelmetB_light_black",nil,100]];
			_ret set[count _ret,["H_HelmetB_black",nil,100]];
			_ret set[count _ret,["H_Cap_blk_CMMG",nil,100]];
			_ret set[count _ret,["H_Cap_blk",nil,100]];
			_ret set[count _ret,["H_Watchcap_khk",nil,100]];
			_ret set[count _ret,["H_Beret_02",nil,100]];
			_ret set[count _ret,["H_Beret_red",nil,100]];
			_ret set[count _ret,["H_Beret_grn",nil,100]];
		};
	};

	//Glasses
	case 2:
	{
		_ret =
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Aviator",nil,75],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Tatical_Clear",nil,50],
			["G_Combat",nil,55]
		];
	};

	//Vest
	case 3:
	{
		_ret set[count _ret,["V_Rangemaster_belt",nil,800]];
		if(__GETC__(life_coplevel) > 2) then
		{
			_ret set[count _ret,["V_PlateCarrier1_blk",nil,1500]];
		};

	};

	//Backpacks
	case 4:
	{
		_ret set[count _ret,["B_AssaultPack_mcamo",nil,500]];
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret set[count _ret,["B_Bergen_blk",nil,650]];
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_ret set[count _ret,["B_TacticalPack_Base",nil,800]];
			_ret set[count _ret,["B_TacticalPack_rgr",nil,800]];
			_ret set[count _ret,["B_TacticalPack_mcamo",nil,800]];
			_ret set[count _ret,["B_TacticalPack_ocamo",nil,800]];
			_ret set[count _ret,["B_TacticalPack_blk",nil,800]];
			_ret set[count _ret,["B_TacticalPack_oli",nil,800]];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_ret set[count _ret,["B_Kitbag_Base",nil,1000]];
			_ret set[count _ret,["B_Kitbag_rgr",nil,1000]];
			_ret set[count _ret,["B_Kitbag_sgg",nil,1000]];
			_ret set[count _ret,["B_Kitbag_cbr",nil,1000]];
			_ret set[count _ret,["B_Kitbag_mcamo",nil,1000]];
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_ret set[count _ret,["B_Carryall_Base",nil,1200]];
			_ret set[count _ret,["B_Carryall_ocamo",nil,1200]];
			_ret set[count _ret,["B_Carryall_oucamo",nil,1200]];
			_ret set[count _ret,["B_Carryall_mcamo",nil,1200]];
			_ret set[count _ret,["B_Carryall_khk",nil,1200]];
			_ret set[count _ret,["B_Carryall_cbr",nil,1200]];
		};
	};
};

_ret;