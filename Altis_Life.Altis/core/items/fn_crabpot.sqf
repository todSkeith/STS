/*
	File: fn_pickaxeUse.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for pickaxe in mining.
*/
closeDialog 0;
private["_mine","_itemWeight","_diff","_itemName","_val","_array","_random","catch"];
_catch = ["fcrab","fcrabp","mcrab","mcrabs"] call BIS_fnc_selectRandom;
_val = round(random 5);

switch (true) do
{
	case (player distance (getMarkerPos "crab_1") < 350): {_mine = _catch; _val;};
	case (player distance (getMarkerPos "crab_2") < 350): {_mine = _catch; _val;};
	case (player distance (getMarkerPos "crab_3") < 350): {_mine = _catch; _val;};
	case (player distance (getMarkerPos "crab_4") < 350): {_mine = _catch; _val;};

	default {_mine = "";};
};

hint titleText ["Dropping Pot...", "PLAIN"];
sleep 1.5;

//Mine check
if(_mine == "") exitWith {hint "You need to be in the crabbing zone!"};
//if(vehicle player !isKindOf "Ship") exitWith {hint "You can only crab from the boat!";};


_diff = [_mine,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint "Your inventory is full."};
life_action_inUse = true;

sleep 10;

if(([true,_mine,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_mine,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format["You got %2 %1",_itemName,_diff],"PLAIN"];
};

life_action_inUse = false;