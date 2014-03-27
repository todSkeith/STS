class Life_cell_from {
	idd = 3200;
	name= "life_cell_from";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_cell_from";
	
	class controlsBackground {
		class phone_img_from: Life_RscPicture
		{
			idc = -1;
			style = 48;
			text = "images\cell_from.paa";
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.44 * safezoneH;
		};
	};
	
	class controls {

		class FromPlayer: Life_RscText
		{
			idc = 3201;
			text = "Penis";
			x = 0.80755 * safezoneW + safezoneX;
			y = 0.66369 * safezoneH + safezoneY;
			w = 0.078 * safezoneW;
			h = 0.0155 * safezoneH;
		};
		class MessageBox: Life_RscEdit
		{
			idc = 3202;
			type = 0;
			style = 16+0x200;
			lineSpacing = 0.8;
			shadow = 1;
			colorShadow[] = {0, 0, 0, 0.5};
			colorBackground[] = {0,0,0,0};
			text = "test test test tes ttes t asd  gffg sdf gf df gh h hfghfghfgh fghsfd asdasdasd sgdgfdf sdfsdfsfdfg ghfghfgh sdfsdf ";
			x = 0.79205 * safezoneW + safezoneX;
			y = 0.71 * safezoneH + safezoneY;
			w = 0.0973 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class ReplyButton : Life_RscButtonTextOnly
		{
			idc = 3203;

			text = "";
			x = 0.7864 * safezoneW + safezoneX;
			y = 0.8888 * safezoneH + safezoneY;
			w = 0.036 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0;";
		};
		class BackButton: Life_RscButtonTextOnly
		{
			idc = 3204;

			text = "";
			x = 0.855 * safezoneW + safezoneX;
			y = 0.8888 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0; createDialog ""Life_cell_inbox"";";
		};
		class CloseButton: Life_RscButtonTextOnly
		{
			idc = -1;
			text = "";
			x = 0.828094 * safezoneW + safezoneX;
			y = 0.918 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
			onButtonClick = "closeDialog 0; createDialog ""Life_cell_phone"";";
		};
	};
};