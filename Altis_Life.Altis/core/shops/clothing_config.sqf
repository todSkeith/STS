/*
	File: fn_clothingConfig.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config for clothing shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
		["U_C_Poloshirt_blue","Poloshirt STS",250],
		["U_C_Poloshirt_burgundy","Poloshirt Burgundy",275],
		["U_C_Poloshirt_redwhite","Poloshirt Red/White",150],
		["U_C_Poloshirt_salmon","Poloshirt Salmon",175],
		["U_C_Poloshirt_stripped","Poloshirt stripped",125],
		["U_C_Poloshirt_tricolour","Poloshirt Tricolor",350],
		["U_C_Poor_2","Rag tagged clothes",250],
		["U_IG_Guerilla2_2","Green stripped shirt & Pants",650],
		["U_IG_Guerilla3_1","Brown Jacket & Pants",735],
		["U_IG_Guerilla2_3","The Outback Rangler",1200],
		["U_C_HunterBody_grn","The Hunters Look",1500],
		["U_C_WorkerCoveralls","Mechanic Coveralls",2500],
		["U_OrestesBody","Surfing On Land",1100],
		["U_NikosBody","Bad Ass Uniform",5000]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_Bandanna_camo","Camo Bandanna",120],
			["H_Bandanna_surfer","Surfer Bandanna",130],
			["H_Bandanna_gry","Grey Bandanna",150],
			["H_Bandanna_cbr",nil,165],
			["H_Bandanna_surfer",nil,135],
			["H_Bandanna_khk","Khaki Bandanna",145],
			["H_Bandanna_sgg","Sage Bandanna",160],
			["H_StrawHat","Straw Fedora",225],
			["H_BandMask_blk","Hat & Bandanna",300],
			["H_Booniehat_tan",nil,425],
			["H_Hat_blue",nil,310],
			["H_Hat_brown",nil,276],
			["H_Hat_checker",nil,340],
			["H_Hat_grey",nil,280],
			["H_Hat_tan",nil,265],
			["H_Cap_blu",nil,150],
			["H_Cap_grn",nil,150],
			["H_Cap_grn_BI",nil,150],
			["H_Cap_oli",nil,150],
			["H_Cap_red",nil,150],
			["H_Cap_tan",nil,150],
			["H_Cap_blk_CMMG","Black Cap",200],
			["H_Cap_headphones","HeadPhones Cap",800],
			["H_Cap_tan",nil,150]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Squares",nil,10],
			["G_Aviator",nil,100],
			["G_Lady_Mirror",nil,150],
			["G_Lady_Dark",nil,150],
			["G_Lady_Blue",nil,150],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_PlateCarrierIA1_dgtl",nil,2500],
			["V_PlateCarrierIA2_dgtl",nil,1500]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_Kitbag_mcamo",nil,1250],
			["B_FieldPack_ocamo",nil,3000],
			["B_Bergen_sgg",nil,5000]
		];
	};
};