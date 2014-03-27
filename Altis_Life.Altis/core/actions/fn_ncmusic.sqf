private["_unit"];
_unit = cursorTarget;
if(nightclub_playing) exitWith
{
	hint "Wait for the Music to turn Off !";
	sleep  7;
	hint "";
	nightclub_playing = false;

};

nightclub_playing = true;
while {nightclub_playing} do
{

[[_unit, "nightclub",15],"life_fnc_playSound",true,false] spawn BIS_fnc_MP;
	sleep 38;



};