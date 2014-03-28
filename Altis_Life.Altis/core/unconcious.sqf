/*
	File Name: unconcious.sqf
	
	Author: Skeith
	
	Description: init file for people getting knocked unconscious
*/

bleedOut = 900;

if (isDedicated) exitWith {};


//if the player dies, spawn them with the ability to be unconscious again
player addEventHandler
	[
		"Respawn",
		{
			[] spawn unconsciousInit;
		}
	];
	
unconsciousInit =
{
	//removes vanilla handleDamage EH
	player removeAllEventHandlers "HandleDamage";
	//adds new one with a my script attached.
	player addEventHandler ["HandleDamage", unconsciousCheck];
	
}

//added to the HandleDamage EH, checks to see if player is dead before putting them as unconscious instead.
unconsciousCheck =
{
		_unit = _this select 0;
		_selection = _this select 1;
		_damage = _this select 2;
		_source = _this select 3;
		_projectile = _this select 4;
		
		if(_selection == "" || _selection == "head_hit" || _selection =="body") then
		{
			if (_damage >= 0.9) then
			{
				_unit setDamage 0;
				_unit allowDamage false;
				_amountOfDamage = 0;
				hint str _this;
			};
		};
}