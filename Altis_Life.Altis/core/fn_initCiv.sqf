/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the civilian.
*/
private["_spawnPos"];
_positionArray = playerPosition;
if(_positionArray select 0 != 0 && _positionArray select 1 != 0 && _positionArray select 2 != 0 &&) then 
{
	player setpos _positionArray;
}
else
{


	civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_i_House_Big_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_03_V1_F"],250];
	civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_i_House_Big_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_03_V1_F"],250];
	civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_i_House_Big_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_03_V1_F"],250];
	civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_i_House_Big_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_03_V1_F"],250];

	waitUntil {!(isNull (findDisplay 46))};



	if(life_is_arrested) then
	{
		life_is_arrested = false;
		[player,true] spawn life_fnc_jail;
	}
		else
	{
		[] call life_fnc_spawnMenu;
		waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
		waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	};
};
//[] call life_fnc_initHouses;
[] call life_fnc_zoneCreator;

if((license_civ_bh)) then {
	player setVariable ["bountyHunter", true, true];
};
player addRating 9999999;