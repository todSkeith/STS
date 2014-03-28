/*
	File: cell_phone.hpp
	Author: Alan from Seal Team Sloth
	Phone Image By: Egypt~Seal from Seal Team Sloth
	
	The cell phone feature in Altis Life RPG was created by Alan, and the original cell function was permitted to Tonic to be given out and distributed. 
	This updated cell phone design and functionality is however sole proprietary to Seal Team Sloth.
	
*/
class Life_cell_phone {
	idd = 3000;
	name= "life_cell_phone";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class phone_img: Life_RscPicture
		{
			idc = -1;
			style = 48;
			text = "images\cell_home.paa";
			x = 0.711406 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.44 * safezoneH;
		};
	};
	
	class controls {

		class TextButton: Life_RscButtonTextOnly
		{
			idc = 3001;
			text = "";
			x = 0.791 * safezoneW + safezoneX;
			y = 0.845 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
			onButtonClick = "closeDialog 0; [""text""] call life_fnc_cellHandle;";
			
		};
		class MessagesButton: Life_RscButtonTextOnly
		{
			idc = 3002;
			text = "";
			x = 0.827094 * safezoneW + safezoneX;
			y = 0.845 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
			onButtonClick = "[""inbox""] call life_fnc_cellHandle;";
		};
		class SettingsButton: Life_RscButtonTextOnly
		{
			idc = 3003;
			text = "";
			x = 0.863188 * safezoneW + safezoneX;
			y = 0.845 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {0,0,0,0};
			colorBackground[] = {0,0,0,0};
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
			onButtonClick = "closeDialog 0;";
		};

/*		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 3001;
			text = "$STR_CELL_Title";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class TextToSend : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 3002;
			text = "$STR_CELL_TextToSend";
			x = 0.1;
			y = 0.25;
			w = 0.6;
			h = (1 / 25);
		};
		
		class textEdit : Life_RscEdit {
		
		idc = 3003;
		
		text = "";
		sizeEx = 0.030;
		x = 0.11; y = 0.3;
		w = 0.62; h = 0.03;
		
		};
		
		class TextMsgButton : life_RscButtonMenu 
		{
			idc = 3015;
			text = "$STR_CELL_TextMSGBtn";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call fnc_cell_textmsg";
			
			x = 0.11;
			y = 0.35;
			w = 0.2;
			h = (1 / 25);
		};
		
		class PlayerList : Life_RscCombo 
		{
			idc = 3004;
			
			x = 0.11; y = 0.4;
			w = 0.2; h = (1 / 25);
		};

		class TextCopButton : life_RscButtonMenu 
		{
			idc = 3016;
			text = "$STR_CELL_TextPolice";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call fnc_cell_textcop";
			
			x = 0.32;
			y = 0.35;
			w = 0.2;
			h = (1 / 25);
		};
		
		class TextAdminButton : life_RscButtonMenu 
		{
			idc = 3017;
			text = "$STR_CELL_TextAdmins";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call fnc_cell_textadmin";
			
			x = 0.53;
			y = 0.35;
			w = 0.2;
			h = (1 / 25);
		};
		
		class AdminMsgButton : life_RscButtonMenu 
		{
			idc = 3020;
			text = "$STR_CELL_AdminMsg";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call fnc_cell_adminmsg";
			
			x = 0.32;
			y = 0.4;
			w = 0.2;
			h = (1 / 25);
		};
		
		class AdminMsgAllButton : life_RscButtonMenu 
		{
			idc = 3021;
			text = "$STR_CELL_AdminMSGAll";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call fnc_cell_adminmsgall";
			
			x = 0.53;
			y = 0.4;
			w = 0.2;
			h = (1 / 25);
		};
		
		
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.46 + (1 / 50);
			w = (6.25 / 40);
			h = (1 / 25);
		};*/
	};
};