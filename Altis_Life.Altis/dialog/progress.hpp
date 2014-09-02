class life_progress
{
	name = "life_progress";
	idd = 38200;
	fadein=0;
	duration = 99999999999;
	fadeout=0;
	movingEnable = 0;
	onLoad="uiNamespace setVariable ['life_progress',_this select 0]";
	objects[]={};

	class controlsBackground 
	{
		class background : Life_RscText
		{
			idc = -1;
			colorBackground[] = {0,0,0,0.7};
			x = safeZoneX+safeZoneW-0.521;
			y = safeZoneY+safeZoneH-0.3;
			w = 0.492;
			h = 0.05;
		};
		class ProgressBar : Life_RscProgress
		{
			idc = 38201;
			colorFrame[] = {0,0,0,0.7};
			colorBar[] = {0.62,0.012,0.004,1};
			x = safeZoneX+safeZoneW-0.52;
			y = safeZoneY+safeZoneH-0.25;
			w = 0.49;
			h = 0.05;
		};
		
		class ProgressText : Life_RscText
		{
			idc = 38202;
			text = "Servicing Chopper (50%)...";
			x = safeZoneX+safeZoneW-0.52;
			y = safeZoneY+safeZoneH-0.3;
			w = 0.49;
			h = (1 / 25);
		};
	};
};

class life_timer
{
	name = "life_timer";
	idd = 38300;
	fadeIn = 1;
	duration = 99999999999;
	fadeout = 1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable['life_timer',_this select 0]";
	objects[] = {};
	
	class controlsBackground
	{
		class TimerIcon : life_RscPicture
		{
			idc = -1;
			text = "\a3\ui_f\data\IGUI\RscTitles\MPProgress\timer_ca.paa";
			x = 0.00499997 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.04;
			h = 0.045;
		};

		class TimerText : life_RscText
		{
			colorBackground[] = {0,0,0,0};
			idc = 38301;
			text = "";
			x = 0.0204688 * safezoneW + safezoneX;
			y = 0.2778 * safezoneH + safezoneY;
			w = 0.09125 * safezoneW;
			h = 0.055 * safezoneH;
		};
	};
};
