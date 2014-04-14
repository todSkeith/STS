/*
	File: fn_zipTie.sqf
	Author: Bad^^Eye
	
	Description:
	Main functionality for civ restrain
*/
private["_attacker","_victim","_chance"];
_attacker = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_victim = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
if((isNull _attacker)||(isNull _victim)) exitWith {};


_chance = random(100);

if (_chance < 101) then 
{	
	_victim setVariable["zipTie",true,true];
	[[format["%1 has turned to a life of kidnapping!",name _attacker]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	[[getPlayerUID _attacker,name _attacker,"207"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
}
else
{
	_victim setVariable ["zipTie",false,true];
	[[format["%1 was seen trying to kidnap someone!",name _attacker]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	[[getPlayerUID _attacker,name _attacker,"207A"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
};
	
while {_victim getVariable "zipTie"} do
{
	[[_victim,"AmovPercMstpSnonWnonDnon_Ease"],"life_fnc_animSync",nil,false] spawn life_fnc_MP;
	waitUntil {animationState _victim != "AmovPercMstpSnonWnonDnon_Ease" || !(_victim getVariable "zipTie")};
	if(!alive _victim) then
	{
		_victim setVariable ["zipTie",false,true];
	};
	if(vehicle player != player) then
	{
		if(driver (vehicle player) == player) then {player action["eject",vehicle player];};
	};
};
	