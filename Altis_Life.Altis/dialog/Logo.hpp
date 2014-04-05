class Life_logo {
	idd=-1;
	movingEnable=0;
	fadein=0;
	duration = 99999999999999999999999999999999999999999999;
	fadeout=0;
	name= "life_logo";
	onLoad="uiNamespace setVariable ['Life_logo',_this select 0]";
	objects[]={};
	
	class controlsBackground {
		class logo : life_RscPicture {
			idc = -1;
			text = "images\sstss_logo.paa";
			x = safeZoneX+safeZoneW-0.22; y = safeZoneY+safeZoneH-0.28;
			w = 0.2; h = 0.29;
			
			
		};
	};
	
	
	};