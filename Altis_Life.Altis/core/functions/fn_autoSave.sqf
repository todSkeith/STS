/*
	@Author: =IFD= Cryptonat
	@Created: 2/22/14

	Description:
	Saves the player's gear every 10 minutes.
*/
while {true} do {   
	sleep 600;   
	if (alive player) then   
        {
		[false] call life_fnc_sessionUpdate;  
		hint "Session Synced";  
		if (rating player < 100000) then { player addRating 999999; };
	};
};