/*
        Version: 1.0
       
        Author: Stephen "Aceshooter11" MacDonald
        Edited: 2.9.2013
        Updated By: N/A
        This is for Use only on Seal Team Sloth
*/
private ["_pos"];
player setVariable ["surrender", true, true];

while { player getVariable ["surrender", false] }  do {
	player playMove "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon";
	_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL _unit);
	_obj setPosATL (getPosATL _unit);
	player attachTo [_obj,[0,0,0]];
	
	waitUntil {animationState player != "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon" || !(player getVariable "surrender") || vehicle player != player || (player getVariable "restrained") || (player getVariable "zipTie")};
	player setVariable ["surrender", false, true];
	
	// Check if player still alive.
	if (!alive player) then {
		player setVariable ["surrender", false, true];
		detach player;
	};
	deleteVehicle _obj;
};
[[player,"amovppnemstpsraswrfldnon";],"life_fnc_animSync",true,false] spawn life_fnc_MP;