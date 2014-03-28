/*
	File: fn_cell_text.sqf
	Author: Alan
	
	Description:
	Opens the cellphone text message menu
*/
private["_display","_units","_type"];
disableSerialization;
_display = findDisplay 3100;
_units = _display displayCtrl 3101;
lbClear _units;

{
	if(alive _x) then //&& _x != player
	{
		switch (side _x) do
		{
			case west: {_type = "Cop"};
			case civilian: {_type = "Civ"};
			case independent: {_type = "Medic"};
		};
		_units lbAdd format["%1 (%2)",name _x,_type];
		hint format["%3 added: %1 (%2)",name _x,_type, _units];
		_units lbSetData [(lbSize _units)-1,str(_x)];
	};
} forEach playableUnits;

lbSort _units;
lbSetCurSel [3101,0];