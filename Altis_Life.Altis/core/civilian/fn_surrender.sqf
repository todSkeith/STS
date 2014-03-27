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
	
	// Check if player still alive.
	if (!alive player) then {
		player setVariable ["surrender", false, true];
	};
};
player switchMove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon";