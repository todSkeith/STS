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
_unit attachTo [player, [0, 1.1, 0.092]];
_unit setDir 180;
player playMoveNow "AcinPknlMstpSnonWnonDnon";
_id = player addAction ["<t color=""#C90000"">" + "Release" + "</t>", { 
	player setVariable["isDragging",false,true];
	_unit = cursorTarget;
	_unit switchMove "AinjPpneMstpSnonWrflDnon"; 
	player playMoveNow "AmovPercMstpSnonWnonDnon"; 
	detach _unit; 
	removeAllActions player;
}];

while {(player getVariable "isDragging")} do {
	if(!(player getVariable "isDragging")) then {player removeAction _id;};
};