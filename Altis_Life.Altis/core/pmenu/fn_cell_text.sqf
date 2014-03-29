/*
	File: fn_cell_text.sqf
	Author: Alan
	
	Description:
	Opens the cellphone text message menu
*/
private["_display","_units"];

disableSerialization;

createDialog "Life_cell_text";
_display = findDisplay 3100;
_units = _display displayCtrl 3101;
lbClear _units;
[] spawn life_fnc_cell_textRefresh;
