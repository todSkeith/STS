/*
	File: fn_drag.sqf
	
	Author Skeith
	
	Description: action that makes medic drag player.
*/

_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if(!(_unit isKindOf "Man")) exitWith {}; //Not a 'Man'
if(!isPlayer _unit) exitWith {}; //Not a human player

_unit = cursorTarget;
player setVariable["isDragging",true,true];
player setVariable["dragging",_unit,true];
_unit attachTo [player, [0, 1.1, 0.092]];
_unit setDir 180;
[[player,"AcinPknlMstpSnonWnonDnon"],"life_fnc_animSync",nil,false] spawn life_fnc_MP;
_id = player addAction ["<t color=""#C90000"">" + "Release" + "</t>", { 
	player setVariable["isDragging",false,true];
	_unit = player getVariable "dragging";
	[[_unit,"AinjPpneMstpSnonWrflDnon"],"life_fnc_animSync",nil,false] spawn life_fnc_MP;
	[[player,"AmovPercMstpSnonWnonDnon"],"life_fnc_animSync",nil,false] spawn life_fnc_MP;
	detach _unit; 
	removeAllActions player;
}];

while {(player getVariable "isDragging")} do {
	if(!(player getVariable "isDragging")) then {player removeAction _id;};
};