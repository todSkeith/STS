if(isNil nightclub_playing) then {nightclub_playing = true; publicVariable "nightclub_playing";d};
if(nightclub_playing) exitWith
{
	hint "Wait for the Music to turn off !";
	sleep 1;
	hint "";
	nightclub_playing = false;
	publicVariable "nightclub_playing";

};

nightclub_playing = true;
publicVariable "nightclub_playing";

while {nightclub_playing} do
{
	[[ee1, "nightclub",30],"life_fnc_playSound",true,false] spawn BIS_fnc_MP;
	sleep 47;
};