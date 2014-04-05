/*
	File: fn_drag.sqf
	
	Author Skeith
	
	Description: action that makes medic drag player.
*/

_victim = cursorTarget;

_victim attachTo [player, [0, 1.1, 0.092]];
_victim setDir 180;
player playMoveNow "AcinPknlMstpSnonWnonDnon";
_id = player addAction ["<t color=""#C90000"">" + "Release" + "</t>", {
	_victim switchMove "AinjPpneMstpSnonWrflDnon"; 
	detach _victim; 
	player removeAction _id;
}];