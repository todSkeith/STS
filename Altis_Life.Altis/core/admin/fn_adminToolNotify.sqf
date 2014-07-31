#include <macro.h>
/*
	File: fn_adminToolNotify.sqf
	Author: Bobbus

	Description:
	Reduce babbitude by notifying other admins when a tool is used.
*/
_who = [_this,0,"Unknown",[""]] call BIS_fnc_param;
_what = [_this,1,"Unknown Tool",[""]] call BIS_fnc_param;
_target = [_this,2,"Unknown",[""]] call BIS_fnc_param;
_extra = [_this,3,"N/A",[""]] call BIS_fnc_param;

if (__GETC__(life_adminlevel) > 0) then {
	systemChat format ["%1 has used %2 on %3 (%4)",_who,_what,_target,_extra];
};