//////////////////////////////////////////////////////////////////
// Created by: Tonic and Adapted by DirtDiver for STS
// Function Name: life_fnc_jailDialog
// Description: Creates Dialog for jail
//////////////////////////////////////////////////////////////////

life_arrestTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

diag_log "Creating Dialog";
createDialog "Life_jail_ui";
diag_log "Dialog Created";

systemChat format ["fn_jailDialog: cursorTarget is %1 || name %2",life_arrestTarget,name life_arrestTarget];