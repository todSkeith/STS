/*
	File: fn_cellHandle.sqf
	Author: Alan
	
	Description:
	Handles all menus and scripts for the cellphone.
*/
private ["_type"];
if(!isNull findDisplay 3000) then {findDisplay 3000 closeDisplay IDC_OK;};
if(!isNull findDisplay 3100) then {findDisplay 3100 closeDisplay IDC_OK;};
if(!isNull findDisplay 3200) then {findDisplay 3200 closeDisplay IDC_OK;};
if(!isNull findDisplay 3300) then {findDisplay 3300 closeDisplay IDC_OK;};
if(!isNull findDisplay 3400) then {findDisplay 3400 closeDisplay IDC_OK;};

_type = _this select 0;
hint format["%1 - %2", _type, str(_type)];
switch (_type) do
{
	case "home": {[] spawn life_fnc_cellphone;};
	case "text": {[] spawn life_fnc_cell_text;};
	case "message": {[] spawn life_fnc_cell_message;};
	case "inbox": {[] spawn life_fnc_cell_inbox;};
	case "from": {[] spawn life_fnc_cell_from;};
	default {};
};