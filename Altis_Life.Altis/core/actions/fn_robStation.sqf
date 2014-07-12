/*
Author: CDawg
*/

private["_robber"];

_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_pos = GetPos player;
_station = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

_denied1 = false;

if(playerSide == west) exitWith 
{
	hint "What do you think your doing your a cop not a criminal!";
};

if(_station getVariable["gaswait",true]) exitWith 
{
	hint "This store was recently robbed come back later.";
};

if(_station getVariable["robProgress",true]) exitWith 
{
	hint "This store is in the process of being robbed please wait.";
};

// if(playersNumber west < 5) exitWith {hint "The till appears to be empty.\nTry again when more Altis civillians and officers are around."}; 

if(vehicle player != player) exitWith {hint "Im not giving you anything until you step out of that vehicle...";};

if((currentWeapon player !="") && (currentWeapon player !="Binocular")) then 

	{
		[[2,"A station is being robbed!"],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
		[[getPlayerUID _robber,name _robber,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		_station setVariable["robProgress",true, true];
		_stationPos = position _station;
		_marker = createMarker [format["mk_%1",getPlayerUID _robber], _stationPos];
		_marker setMarkerColor "ColorRed";
		_marker setMarkerText "Station is being robbed!";
		_marker setMarkerType "mil_warning";
		_number = ceil(random 10);
		if (_number == 0) then {robberyreward = 500;};
		if (_number == 1) then {robberyreward = 1000;};
		if (_number == 2) then {robberyreward = 1500;};						
		if (_number == 3) then {robberyreward = 2000;};
		if (_number == 4) then {robberyreward = 2500;};
		if (_number == 5) then {robberyreward = 5000;};
		if (_number == 6) then {robberyreward = 10000;};
		if (_number == 7) then {robberyreward = 15000;};
		if (_number == 8) then {robberyreward = 20000;};
		if (_number == 9) then {robberyreward = 25000;};
		if (_number == 10) then {robberyreward = 30000;};
		life_action_inUse = true;
		hint "marker success";
	} else {hint "HAHA! You think you can hold me up with your bare hands! What a joke!"; _denied1 = true;};		

if(_denied1) exitwith {};

if(!alive player) exitWith {
	life_action_inUse = false; 
	deleteMarker [format["mk_%1",getPlayerUID _robber];
	_station setVariable["robProgress",false, true];
};

_robberycash = robberyreward;
_timer = 300;	
_toFar = false;
hint "preloop success";

while {true} do
{
	hint "loop success";
	hint format["Time Left: %1m %2s\nPlease stay within 15 meters to continue the robbery.", (_timer / 60), _timer];
	_timer = _timer - 1;
	sleep 1;

	if(player distance _station > 15) exitWith {_toFar = true;};
	if(_timer = 0) exitWith {_sucess = true;};
	if(!alive player) exitWith {};
	if(life_istazed) exitWith {};
	if(vehicle player != player) exitWith {};
};

switch(true) do
{
	case (vehicle player != player):
	{
		hint "Where the hell are you going? ROB LIKE A MAN!";
		[[2,"A station robbery failed..."],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
		deleteMarker [format["mk_%1",getPlayerUID _robber];
		_denied1 = false;
		_station setVariable["robProgress",false, true];
		life_action_inUse = false;
		_station setVariable["gaswait",true, true];
		sleep 180;
		_station setVariable["gaswait",false, true];
	};

	case (_toFar):
	{
		hint "You are too far away!";
		[[2,"A station robbery failed..."],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
		deleteMarker [format["mk_%1",getPlayerUID _robber];
		_denied1 = false;
		_station setVariable["robProgress",false, true];
		life_action_inUse = false;
		_station setVariable["gaswait",true, true];
		sleep 180;
		_station setVariable["gaswait",false, true];
	};
	
	case (!alive player):
	{
		hint "Because you died the robbery failed.";
		_denied1 = false;
		[[2,"A station robbery failed..."],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
		deleteMarker [format["mk_%1",getPlayerUID _robber];
		_station setVariable["robProgress",false, true];
		life_action_inUse = false;
		_station setVariable["gaswait",true, true];
		sleep 180;
		_station setVariable["gaswait",false, true];
	};
	
	case (life_istazed):
	{
		hint "You were tazed, the robbery has failed!";
		[[2,"A station robbery failed..."],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
		deleteMarker [format["mk_%1",getPlayerUID _robber];
		_denied1 = false;
		_station setVariable["robProgress",false, true];
		life_action_inUse = false;
		_station setVariable["gaswait",true, true];
		sleep 180;
		_station setVariable["gaswait",false, true];
	};
	
	case (_success):
	{
		hint format["You have successfully robbed $%1", _robberycash];
		life_cash = life_cash + _robberycash;
		[[2,"A station was successfully robbed!"],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
		[[getPlayerUID _source,name _source,"211A"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		_station setVariable["robProgress",false, true];
		_station setVariable["gaswait",true, true];
		deleteMarker [format["mk_%1",getPlayerUID _robber];
		_denied1 = false;
		life_action_inUse = false;
	};	
};

sleep 2700;
_station setVariable["gaswait",false,true];
life_action_inUse = false;