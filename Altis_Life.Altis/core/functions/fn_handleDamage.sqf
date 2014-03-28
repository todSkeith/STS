/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master damage handling system for Stratis / Altis Life
*/
private["_unit","_damage","_source","_projectile","_sel","_curWep"];
_unit = _this select 0;
_sel = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;
_curWep = "";
if(isPlayer _source && _source isKindOf "Man") then {_curWep = currentWeapon _source;};

if(_source != _unit && isPlayer _source && _curWep in ["hgun_P07_snds_F","arifle_SDAR_F"]) then
{
	if(_projectile in ["B_9x21_Ball","B_556x45_dual"]) then
	{
		_damage = false;
		if(_curwep == "arifle_SDAR_F") then
		{	
			if(!life_istazed && !(player getVariable["restrained",false]) && player distance _source < 100) then
			{
				_damage = 0;
				if(typeOf (vehicle player) == "B_Quadbike_01_F") then
				{
					player action ["Eject",vehicle player];
					[_unit,_source] spawn life_fnc_tazed;
				};

				if(vehicle player == player) then
				{
					[_unit,_source] spawn life_fnc_tazed;
				};
			};
		}
			else
		{
			if(!life_istazed && !(player getVariable["restrained",false]) && player distance _source < 100) then
			{
				_damage = 0;
				if(typeOf (vehicle player) == "B_Quadbike_01_F") then
				{
					player action ["Eject",vehicle player];
					[_unit,_source] spawn life_fnc_tazed;
				};

				if(vehicle player == player) then
				{
					[_unit,_source] spawn life_fnc_tazed;
				};
			};
		};
	}
		else
	{
		//player allowDamage true;
		if(_projectile == "") then
		{
			_damage = 0;
		};
	};
};

if((player getVariable["restrained",false])) then
{
	_damage = 0;
};

if(playerSide == west && side _source == west) then
{
	_damage = false;
};

if(_selection == "" || _selection == "head_hit" || _selection =="body") then
		{
			if (_damage >= 0.9) then
			{
				_unit setDamage 0;
				_unit allowDamage false;
				_amountOfDamage = 0;
				[_unit, _source] spawn life_fnc_unconscious;
			};
		};

if (alive _unit && !(player getVariable ["wounded",false])) then {
	life_gear = [] call life_fnc_fetchGear;
};



[] call life_fnc_hudUpdate;
_damage;