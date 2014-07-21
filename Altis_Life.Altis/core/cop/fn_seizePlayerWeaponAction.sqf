//////////////////////////////////////////////////////////////////
// Created by: DirtDiver for STS
// Function Name: life_fnc_seizeIllegal
// Description: Removes Players Illegal Items & Weapons
// Adapted from: Skalicon
//////////////////////////////////////////////////////////////////

_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};

removeAllWeapons player;

player setVariable ["life_holstered_weapon",""];
player setVariable["holstered",["",""]];

//license_civ_gun = false;
life_holstered_weapon = nil;
[] call life_fnc_civFetchGear;
[] call life_fnc_sessionUpdate; //Should make weapon remove persistent
[] call life_fnc_civLoadGear;
titleText [format["Your weapons have been seized by %1.", name _unit],"PLAIN"];
