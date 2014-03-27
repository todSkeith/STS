/*
	File: fn_jailMe.sqf
	Author Bryan "Tonic" Boardwine

	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/
private["_ret","_bad","_time","_bail","_esc","_countDown","_unit"];
_unit = player;
_ret = [_this,0,[],[[]]] call BIS_fnc_param;
_bad = [_this,1,false,[false]] call BIS_fnc_param;
player setPos (getMarkerPos "jail_marker");
player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];
if(_bad) then { _time = time + 1100; } else { _time = time + (15 * 60); };

if(count _ret > 0) then { life_bail_amount = (_ret select 3); } else { life_bail_amount = 1500; _time = time + (10 * 60); };
_esc = false;
_bail = false;

[_bad] spawn
{
	life_canpay_bail = false;
	if(_this select 0) then
	{
		sleep (1 * 60);
	}
		else
	{
		sleep (1 * 60);
	};
	life_canpay_bail = nil;
};

life_bail_amount = 15000;
_copname = _this select 0;
_jailTime = _this select 1;
life_jail_val = _jailTime;
_time = time + (_jailTime * 60);
_esc = false;
_bail = false;

while {true} do
{
	if((round(_time - time)) > 0) then
	{
		_countDown = if(round (_time - time) > 60) then {format["%1 minute(s)",round(round(_time - time) / 60)]} else {format["%1 second(s)",round(_time - time)]};
		hintSilent format["Time Remaining:\n %1\n\nCan pay bail: %3\nBail Price: $%2",_countDown,[life_bail_amount] call life_fnc_numberText,if(isNil "life_canpay_bail") then {"Yes"} else {"No"}];
	};

	if(player distance (getMarkerPos "jail_marker") > 60) exitWith
	{
		_esc = true;
	};

	if(life_bail_paid) exitWith
	{
		_bail = true;
	};

	if((round(_time - time)) < 1) exitWith {hint ""};
	if(!alive player && ((round(_time - time)) > 0)) exitWith
	{

	};
	sleep 1;
};


switch (true) do
{
	case (_bail) :
	{
		life_is_arrested = false;
		life_bail_paid = false;
		hint "You have paid your bail and are now free.";
		serv_wanted_remove = [player];
		publicVariableServer "serv_wanted_remove";
		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
		player setPos (getMarkerPos "jail_release");
		[1,false] call life_fnc_sessionHandle;
	};

	case (_esc) :
	{
		life_is_arrested = false;
		hint "You have escaped from jail, you still retain your previous crimes and now have a count of escaping jail.";
		[[0,format["%1 has escaped from jail!",name player]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
		[[getPlayerUID player,name player,"901"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		serv_killed = [player,"901"];
		publicVariableServer "serv_killed";
	};

	case (alive player && !_esc && !_bail) :
	{
		life_is_arrested = false;
		hint "You have served your time in jail and have been released.";
		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
		serv_wanted_remove = [player];
		publicVariableServer "serv_wanted_remove";
		player setPos (getMarkerPos "jail_release");
		[1,false] call life_fnc_sessionHandle;
	};
};
hint = "";