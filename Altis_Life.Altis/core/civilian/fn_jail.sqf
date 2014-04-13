//////////////////////////////////////////////////////////////////
// Created by: Tonic and Adapted by DirtDiver for STS
// Function Name: life_fn_jail.sqf
// Description: Starts jailing process.
//////////////////////////////////////////////////////////////////

private["_ret","_bad","_time","_bail","_esc","_countDown","_unit"];
_ret = [_this,0,[],[[]]] call BIS_fnc_param;
_bad = [_this,1,false,[false]] call BIS_fnc_param;
_unit = player;

hint format["%1", _unit];
if(isNull _unit) exitWith {}; //Dafuq?
if(_unit != player) exitWith {}; //Dafuq?
if(life_is_arrested) exitWith {}; //Dafuq i'm already arrested

titleText["You have been arrested, wait your time out. If you attempt to respawn or reconnect your time will increase!","PLAIN"];
hint "For being arrested you have lost the following licenses if you own them\n\nFirearms License\nRebel License";

player setPos (getMarkerPos "jail_marker");

//Double Check that player has been sent to jail!
if(player distance (getMarkerPos "jail_marker") > 40) then
{
	player setPos (getMarkerPos "jail_marker");
};

license_civ_gun = false;
if(life_inv_heroinu > 0) then {[false,"heroinu",life_inv_heroinu] call life_fnc_handleInv;};
if(life_inv_heroinp > 0) then {[false,"heroinp",life_inv_heroinp] call life_fnc_handleInv;};
if(life_inv_coke > 0) then {[false,"cocaine",life_inv_coke] call life_fnc_handleInv;};
if(life_inv_cokep > 0) then {[false,"cocainep",life_inv_cokep] call life_fnc_handleInv;};
if(life_inv_turtle > 0) then {[false,"turtle",life_inv_turtle] call life_fnc_handleInv;};
if(life_inv_cannabis > 0) then {[false,"cannabis",life_inv_cannabis] call life_fnc_handleInv;};
if(life_inv_marijuana > 0) then {[false,"marijuana",life_inv_marijuana] call life_fnc_handleInv;};
life_is_arrested = true;
life_holstered=nil;
removeAllWeapons player;
{player removeMagazine _x} foreach (magazines player);



[[player,_bad],"life_fnc_jailSys",false,false] spawn life_fnc_MP;
[1,false] call life_fnc_sessionHandle;
