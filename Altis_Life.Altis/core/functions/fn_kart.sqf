/*
	Title: fn_kart.sqf
	
	Author: Johnathen Chilcher "Skeith"
	
	Desciption: initiates the  Go Karts!
*/

_kart = "C_Kart_01_Vrana_F" createVehicle getPos KartGuy;
_spawned = true;

while {_spawned} do 
{ 
	waitUntil{_kart distance (getMarkerPos "kart_1")) > 75};
	if((_kart distance (getMarkerPos "kart_1")) > 75) then 
	{
		hint "Please stay within the track";
		_kart setVelocity [0, 0, 0];
		deleteVehicle _kart;
		_spawned = false;
	};
};