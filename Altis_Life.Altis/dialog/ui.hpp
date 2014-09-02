	class playerHUD
   	{
		idd=-1;
		movingEnable=0;
	  	fadein=0;
		duration = 99999999999999999999999999999999999999999999;
	  	fadeout=0;
		name="playerHUD";
		onLoad="uiNamespace setVariable ['playerHUD',_this select 0]";
		objects[]={};
		
		class controlsBackground 
		{

			class HealthBackground:Life_RscText {
				colorBackground[] = {0, 0, 0, 0.7};
				idc = -1;
				x = safeZoneX+safeZoneW-0.18;
				y = safeZoneY+safeZoneH-0.18;
				w = 0.15;
				h = 0.15;
			};

			class ThirstBackground:Life_RscText {
				colorBackground[] = {0, 0, 0, 0.7};
				idc = -1;
				x = safeZoneX+safeZoneW-0.35;
				y = safeZoneY+safeZoneH-0.18;
				w = 0.15;
				h = 0.15;
			};

			class HungerBackground:Life_RscText {
				colorBackground[] = {0, 0, 0, 0.7};
				idc = -1;
				x = safeZoneX+safeZoneW-0.52;
				y = safeZoneY+safeZoneH-0.18;
				w = 0.15;
				h = 0.15;
			};

			class healthHIcon : life_RscPicture
			{
				idc = -1;
				text = "icons\health_ca.paa";
				x = safeZoneX+safeZoneW-0.145;
				y = safeZoneY+safeZoneH-0.145;
				w = 0.08;
				h = 0.08;
			};
			
			class waterHIcon : life_RscPicture 
			{
			
				idc = -1;
				text = "icons\thirst_ca.paa";
				x = safeZoneX+safeZoneW-0.315;
				y = safeZoneY+safeZoneH-0.145;
				w = 0.08;
				h = 0.08;
			};
			
			class foodHIcon : life_RscPicture 
			{
			
				idc = -1;
				text = "icons\hunger_ca.paa";
				x = safeZoneX+safeZoneW-0.485;
				y = safeZoneY+safeZoneH-0.145;
				w = 0.08;
				h = 0.08;
			};

		};
		
		class controls
		{
			
			class hungerTitle
			{
				type=0;
				idc=-1;
				style=0;
				x = safeZoneX+safeZoneW-0.515;
				y = safeZoneY+safeZoneH-0.19;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="Hunger";
			};

			class foodtext
			{
				type=0;
				idc=23500;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};
			
			class thirstTitle
			{
				type=0;
				idc=-1;
				style=0;
				x = safeZoneX+safeZoneW-0.345;
				y = safeZoneY+safeZoneH-0.19;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="Thirst";
			};
			
			class watertext
			{
				type=0;
				idc=23510;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};
			
			class healthTitle
			{
				type=0;
				idc=-1;
				style=0;
				x = safeZoneX+safeZoneW-0.175;
				y = safeZoneY+safeZoneH-0.19;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="Health";
			};

			class healthtext
			{
				type=0;
				idc=23515;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};
		};   
 	};