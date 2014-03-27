if(strobe1) exitWith
{
	hint "Flashing Light is Now Off!";
	sleep 2;
	hint "";
	strobe1 = false;
};


private["_vehicle", "_pos"];
_vehicle = cursorTarget;
_pos = this select 1;

strobe1 = true;
sleep 0.5;
while {strobe1} do 
{
	
	sleep 0.09;
	_pos setVariable["#lightpoint",FALSE,TRUE] spawn BIS_FNC_MP;
	_pos = lightsource6;
	flash = createVehicle ["#lightpoint", getPos _pos, [], 0, "CAN_COLLIDE"];
	flash setLightBrightness 0.06; 
	//COLOR #0AF9B4
	flash setLightColor[255,255,255]; 
	flash lightAttachObject [_lightsource6, [0,0,2]];
	sleep 0.1;
	deleteVehicle  flash;

	
	};




