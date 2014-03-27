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
			_ret set[count _ret,["H_HelmetB","PO Helmet",100]];
			_ret set[count _ret,["H_Cap_blk_CMMG","PO Hat",100]];
		};
		if(__GETC__(life_copLevel) > 2) then
		{
			_ret set[count _ret,["H_Booniehat_mcamo","SPO Hat",100]];
		};
		if(__GETC__(life_copLevel) > 3) then
		{
			_ret set[count _ret,["H_MilCap_mcamo",nil,100]];
			_ret set[count _ret,["H_Cap_blk",nil,100]];
		};
		if(__GETC__(life_copLevel) > 4) then
		{
			_ret set[count _ret,["H_Watchcap_khk",nil,100]];
		};
		if(__GETC__(life_copLevel) > 5) then
		{
			_ret set[count _ret,["H_Beret_02",nil,100]];
		};
		if(__GETC__(life_copLevel) > 6) then
		{
			_ret set[count _ret,["H_Beret_red",nil,100]];
		};
		if(__GETC__(life_copLevel) > 7) then
		{
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
			["G_Combat",nil,55]
		];
	};

	//Vest
	case 3:
	{
		_ret set[count _ret,["V_Rangemaster_belt",nil,800]];
		if(__GETC__(life_coplevel) > 2) then
		{
			_ret set[count _ret,["V_BandollierB_khk",nil,1500]];
		};
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret set[count _ret,["V_TacVest_blk_POLICE",nil,1500]];
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_ret set[count _ret,["V_PlateCarrierSpec_rgr",nil,1500]];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_ret set[count _ret,["V_PlateCarrier1_blk",nil,1500]];
		};
		if(__GETC__(life_copLevel) > 7) then
		{
			_ret set[count _ret,["V_PlateCarrierIA2_dgtl",nil,1500]];
		};
	};

	//Backpacks
	case 4:
	{
		_ret set[count _ret,["B_AssaultPack_mcamo",nil,500]];
		if(__GETC__(life_coplevel) > 0) then
		{
			_ret set[count _ret,["B_FieldPack_cbr",nil,650]];
		};
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret set[count _ret,["B_TacticalPack_mcamo",nil,800]];
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_ret set[count _ret,["B_Kitbag_mcamo",nil,1000]];
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_ret set[count _ret,["B_Carryall_mcamo",nil,1200]];
		};
	};
};

_ret;