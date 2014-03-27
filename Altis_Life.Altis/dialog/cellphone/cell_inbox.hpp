class Life_cell_inbox {
	idd = 3300;
	name= "life_cell_inbox";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_cell_inbox";
	
	class controlsBackground {
		class phone_img_inbox: Life_RscPicture
		{
			idc = -1;
			style = 48;
			text = "images\cell_inbox.paa";
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.44 * safezoneH;
		};
	};
	
	class controls {

		class MessageList: Life_RscListBox
		{
			idc = 3301;
			x = 0.788 * safezoneW + safezoneX;
			y = 0.64 * safezoneH + safezoneY;
			w = 0.104 * safezoneW;
			h = 0.27202 * safezoneH;
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
			onButtonClick = "closeDialog 0; createDialog ""Life_cell_from"";";
		};
	};
};