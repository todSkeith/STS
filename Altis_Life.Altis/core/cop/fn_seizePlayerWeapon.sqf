//////////////////////////////////////////////////////////////////
// Created by: DirtDiver for STS
// Function Name:life_fnc_seizePlayerIllegalAction
// Description: Action for seizing illegal items
// Adapted from: Skalicon
//////////////////////////////////////////////////////////////////


[[],"life_fnc_seizePlayerWeaponAction",cursorTarget,false] spawn BIS_fnc_MP;
titleText format["Seized weapons from %1", name cursorTarget];
//[[52, player, format["Seized weapons from %1", name cursorTarget]],"ASY_fnc_logIt",false,false] spawn BIS_fnc_MP;