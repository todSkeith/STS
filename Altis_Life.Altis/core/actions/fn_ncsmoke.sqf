if(ncsmoke) exitWith
{
	hint "Smoke is Off!";
	sleep 3;
	hint "";
	ncsmoke = false;
};


ncsmoke = true;
sleep 1;
if(ncsmoke) then
{
	_Smoke = "SmokeShell" createVehicle getMarkerPos "smoke";
		hint "Smoke is On!";
		sleep 3;
		hint "";

};