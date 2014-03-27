if(strobe) exitWith
{
	hint "Lights Are Now Off!";
	sleep 2;
	hint "";
	strobe = false;
};


private["_vehicle", "_pos"];
_vehicle = cursorTarget;
_pos = this select 1;

strobe = true;
sleep 0.5;
while {strobe} do 
{
	_pos setVariable["#lightpoint",FALSE,TRUE] spawn BIS_FNC_MP;
	_pos = lightsource1;
	light = createVehicle ["#lightpoint", getPos _pos, [], 0, "CAN_COLLIDE"];
	light setLightBrightness 0.07; 
	//COLOR #0AF9B4
	light setLightColor[0,255,181]; 
	light lightAttachObject [_lightsource1, [0,0,2]];
	
	sleep 0.5;
	_pos = lightsource2;
	light2 = createVehicle ["#lightpoint", getPos _pos, [], 0, "CAN_COLLIDE"];
	light2 setLightBrightness 0.07; 
	//COLOR #EAFF00
	light2 setLightColor[234,255,0]; 
	light2 lightAttachObject [_lightsource2, [0,0,2]];
	deleteVehicle  light;
	
	sleep 0.5;
	_pos = lightsource3;
	light3 = createVehicle ["#lightpoint", getPos _pos, [], 0, "CAN_COLLIDE"];
	light3 setLightBrightness 0.07; 
	//COLOR #EA00FF
	light3 setLightColor[234,0,255]; 
	light3 lightAttachObject [_lightsource3, [0,0,2]];
	deleteVehicle  light2;

	sleep 0.5;
	_pos = lightsource4;
	light4 = createVehicle ["#lightpoint", getPos _pos, [], 0, "CAN_COLLIDE"];
	light4 setLightBrightness 0.07;  
	//COLOR #FF0000
	light4 setLightColor[255,0,0]; 
	light4 lightAttachObject [_lightsource4, [0,0,2]];	
	deleteVehicle  light3;
	
	
	
	sleep 0.5;
	_pos = lightsource5;
	light5 = createVehicle ["#lightpoint", getPos _pos, [], 0, "CAN_COLLIDE"];
	light5 setLightBrightness 0.07;  
	light5 setLightColor[50,20,0]; 
	light5 lightAttachObject [_lightsource5, [0,0,2]];	
	deleteVehicle  light3;
	sleep 0.5;
	deleteVehicle  light4;
	deleteVehicle  light5;
	
	};




