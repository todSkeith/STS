class Life_cell_message {
	idd = 3200;
	name= "life_cell_message";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class phone_img_message: Life_RscPicture
		{
			idc = -1;
			style = 48;
			text = "images\cell_message.paa";
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.44 * safezoneH;
		};
	};
	
	class controls {

		class PlayerList: Life_RscCombo
		{
			idc = 3201;

			x = 0.80755 * safezoneW + safezoneX;
			y = 0.66369 * safezoneH + safezoneY;
			w = 0.078 * safezoneW;
			h = 0.0155 * safezoneH;
		};
		class MessageBox: Life_RscEdit
		{
			idc = 3202;
			style= 16;
			lineSpacing = 0.8;
			shadow = 1;
			colorShadow[] = {0, 0, 0, 0.5};
			text = "test";
			x = 0.79205 * safezoneW + safezoneX;
			y = 0.71 * safezoneH + safezoneY;
			w = 0.0973 * safezoneW;
			h = 0.16 * safezoneH;
		};
		class SendButton : Life_RscButtonTextOnly
		{
			idc = 3203;

			text = "";
			x = 0.7864 * safezoneW + safezoneX;
			y = 0.8888 * safezoneH + safezoneY;
			w = 0.036 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0;";
		};
		class CancelButton: Life_RscButtonTextOnly
		{
			idc = 3204;

			text = "";
			x = 0.855 * safezoneW + safezoneX;
			y = 0.8888 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0; [] spawn life_fnc_cell_textRefresh;";
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
			onButtonClick = "closeDialog 0; closeDialog 0; [""home""] call life_fnc_cellHandle;";
		};
	};
};