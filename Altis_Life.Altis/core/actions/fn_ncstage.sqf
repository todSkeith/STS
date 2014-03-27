private["_unit"];
_unit = cursorTarget;


if(ncstagelights) exitWith
{
	hint "Stage Lights Are Now Off!";
	deleteVehicle  stagelight;
	sleep 1;
	hint "";
	ncstagelights = false;
	sleep 0.02;
};
_pos = ligh;


ncstagelights = true;
sleep 1;
if(ncstagelights) then
{
	_unit setVariable["stagelight",FALSE,TRUE] spawn BIS_FNC_MP;
	stagelight = createVehicle ["#lightpoint", getPos _pos, [], 0, "CAN_COLLIDE"];
	
	this setPos [getPos this select 0, getPos this select 1, 0.40];

	stagelight setLightBrightness 0.05;
	//COLOR #FFFFFF	
	stagelight setLightColor[255,255,255];
	hint "Stage Lights Are Now On!";
	sleep 3;
	hint "";	
};

