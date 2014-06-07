/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main key handler for event 'keyDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;

_interactionKey = if(count (actionKeys "User10") == 0) then {219} else {(actionKeys "User10") select 0};
_mapKey = actionKeys "ShowMap" select 0;
//hint str _code;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

if(life_action_inUse) exitWith {
	if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

switch (_code) do
{

	//1 Key
	case 2:
	{
		[] call life_fnc_p_openMenu;
		[] call life_fnc_wantedMenu;
	};

	//Map Key
	case _mapKey:
	{
		if(playerSide == west && !visibleMap) then {
			[] spawn life_fnc_copMarkers;
		};
		if(playerSide == independent && !visibleMap) then {
			[] spawn life_fnc_medicMarkers;
		};
	};
		
	//ESC
	case 1:
	{
		[] spawn life_fnc_abortEnabled;
	};

	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey:
	{
		if(!life_action_inUse) then {
			[] spawn
			{
				private["_handle"];
				_handle = [] spawn life_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
	};

	//Restraining (Shift + R)
	case 19:
	{
		//Test to stop reload while restrained
		if(_shift || (player getVariable "restrained" || player getVariable "zipTie" || player getVariable "surrender" || player getVariable "unconscious")) then {_handled = true;};
		if(_shift && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5) then
		{
			switch (playerSide) do {
				case west:		{ [cursorTarget] call life_fnc_restrainAction; };
				case civilian:	{ [cursorTarget] call life_fnc_zipTie; };
			};
		};
	};
		
	 // O Key, police gate opener
        case 24:
	{
		if (!_shift && !_alt && !_ctrlKey && (playerSide == west)) then {
			[] call life_fnc_copOpener;
		};
	};	
	
		
	//Shift+G Knock out, this is experimental and yeah...
	case 34:
	{
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1 && (animationState cursorTarget != "Incapacitated") && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["restrained",false]) && !(player getVariable["zipTie",false]) && !(player getVariable["surrender",false]) && !(player getVariable["unconscious",false]) && !life_istazed && vehicle player == player) then
		{
			[cursorTarget] spawn life_fnc_knockoutAction;
		};
	};

	//2 key Surrender
	case 3:
	{
		if (!_shift && !_alt && !_ctrlKey) then
		{
			if (vehicle player == player && !(player getVariable ["restrained", false]) && !(player getVariable ["Escorting", false]) && !(player getVariable ["zipTie", false])) then {
				if (player getVariable ["surrender", false]) then {
					player setVariable ["surrender", false, true];
				} else {
					[] spawn life_fnc_surrender;
				};
			};
			_handled = true;
		};
	};
	
	//Holster (Shift - H for now)
	case 35: {
		if (_shift && !_alt && !_ctrlKey) then {
			if ((time - life_holster_time) > 4) then {
				life_holster_time = time;
				[] spawn life_fnc_holsterWeapon;
			};
		};
	};

	//T Key (Trunk)
	case 20:
	{
		if(!_alt && !_ctrlKey) then
		{
			if(vehicle player != player && alive vehicle player) then
			{
				if((vehicle player) in life_vehicles) then
				{
					[vehicle player] call life_fnc_openInventory;
				};
			}
				else
			{
				if((cursorTarget isKindOf "Car" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship") && player distance cursorTarget < 7 && vehicle player == player && alive cursorTarget) then
				{
					if(cursorTarget in life_vehicles) then
					{
						[cursorTarget] call life_fnc_openInventory;
					};
				};
			};
		};
	};
	//L Key?
	case 38:
	{
		//If cop run checks for turning lights on.
		if(_shift && playerSide == west) then {
			if(vehicle player != player && (typeOf vehicle player) in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F"]) then {
				if(!isNil {vehicle player getVariable "lights"}) then {
					[vehicle player] call life_fnc_sirenLights;
					_handled = true;
				};
			};
		};
		if(_shift && playerSide == independent) then {
			if(vehicle player != player && (typeOf vehicle player) in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F"]) then {
				if(!isNil {vehicle player getVariable "lights"}) then {
					[vehicle player] call life_fnc_medicSirenLights;
					_handled = true;
				};
			};
		};

		if(!_alt && !_ctrlKey) then { [] call life_fnc_radar; };
	};
	//Y Player Menu
	case 21:
	{
		if(!_alt && !_ctrlKey && !dialog) then
		{
			[] call life_fnc_p_openMenu;
		};
	};
	//V Key
	case 47:
	{
		if(player getVariable "restrained" OR player getVariable "transporting" OR player getVariable "zipTie") then {_handled = true;};
	};
	//F Key
	case 33:
	{
		if(playerSide == west && vehicle player != player && !life_siren_active && ((driver vehicle player) == player)) then
		{
			[] spawn
			{
				life_siren_active = true;
				sleep 4.7;
				life_siren_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
			if((_veh getVariable "siren")) then
			{
				titleText ["Sirens Off","PLAIN"];
				_veh setVariable["siren",false,true];
			}
				else
			{
				titleText ["Sirens On","PLAIN"];
				_veh setVariable["siren",true,true];
				[[_veh],"life_fnc_copSiren",nil,true] spawn life_fnc_MP;
			};
		};

		if(playerSide == independent && vehicle player != player && !life_siren_active && ((driver vehicle player) == player)) then
		{
			[] spawn
			{
				life_siren_active = true;
				sleep 1;
				life_siren_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
			if((_veh getVariable "siren")) then
			{
				titleText ["Sirens Off","PLAIN"];
				_veh setVariable["siren",false,true];
			}
				else
			{
				titleText ["Sirens On","PLAIN"];
				_veh setVariable["siren",true,true];
				[[_veh],"life_fnc_medicSiren",nil,true] spawn life_fnc_MP;
			};
		};
	};
	//H Key
	case 35:
	{
		if(playerSide != civilian && vehicle player != player && ((driver vehicle player) == player)) then
		{
			    _veh = vehicle player;
				[[_veh],"life_fnc_copHorn"] spawn life_fnc_MP;
				sleep 1;
		};
	};
	//U Key
	case 22:
	{
		if(!_alt && !_ctrlKey) then
		{
			if(vehicle player == player) then
			{
				_veh = cursorTarget;
			}
				else
			{
				_veh = vehicle player;
			};

			_locked = locked _veh;
			_owners = _veh getvariable "vehicle_info_owners";
			_uid = getPlayerUID player;

			if((_veh in life_vehicles || (_uid in (_owners select 0)) && player distance _veh < 8))then
			{
				if(_locked == 2) then
				{
					if(local _veh) then
					{
						_veh lock 0;
					}
						else
					{
						[[_veh,0], "life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
					};
					[[_veh, "car_lock",10],"life_fnc_playSound",true,false] spawn life_fnc_MP;
					systemChat "You have unlocked your vehicle.";
				}
					else
				{
					if(local _veh) then
					{
						_veh lock 2;
					}
						else
					{
						[[_veh,2], "life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
					};
					[[_veh, "car_unlock",10],"life_fnc_playSound",true,false] spawn life_fnc_MP;
					systemChat "You have locked your vehicle.";
				};
			};
		};
	};
};

//Thanks to Asylum
if (_code in (actionKeys "TacticalView")) then
{
	hint "Tactical View is disabled.";
	_handled = true;
};

_handled;