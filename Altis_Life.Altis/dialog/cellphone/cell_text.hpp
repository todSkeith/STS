class Life_cell_text {
	idd = 3100;
	name= "life_cell_text";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_cell_text";
	
	class controlsBackground {
		class phone_img_text: Life_RscPicture
		{
			idc = -1;
			style = 48;
			text = "images\cell_text.paa";
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.44 * safezoneH;
		};
	};
	
	class controls {

		class ContactsList: Life_RscListBox
		{
			idc = 3101;
			x = 0.79 * safezoneW + safezoneX;
			y = 0.75 * safezoneH + safezoneY;
			w = 0.10 * safezoneW;
			h = 0.155 * safezoneH;
		};
		class EMSButton: Life_RscButtonTextOnly
		{
			idc = 3102;
			text = ""; 
			x = 0.8 * safezoneW + safezoneX;
			y = 0.694 * safezoneH + safezoneY;
			w = 0.084 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class PoliceButton: Life_RscButtonTextOnly
		{
			idc = 3103;

			text = "";
			x = 0.8 * safezoneW + safezoneX;
			y = 0.667 * safezoneH + safezoneY;
			w = 0.084 * safezoneW;
			h = 0.02 * safezoneH;
		};
		class AdminButton: Life_RscButtonTextOnly
		{
			idc = 3104;

			text = "";
			x = 0.8 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.084 * safezoneW;
			h = 0.02 * safezoneH;
			onButtonClick = "closeDialog 0; createDialog ""Life_cell_message"";";
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