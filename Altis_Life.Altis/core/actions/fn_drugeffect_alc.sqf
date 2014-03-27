 //developed by JackLags
 //Usable by only the Seal Team Sloth Community
 //Any configurations are only permitted by the Seal Team Sloth DEV Team
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [1.5];
"dynamicBlur" ppEffectCommit 1;
"chromAberration" ppEffectEnable true;
"chromAberration" ppEffectAdjust [0.3,0.3,true];
"chromAberration" ppEffectCommit 1;
		sleep 130;
"dynamicBlur" ppEffectEnable false;
"chromAberration" ppEffectEnable false;
if(!alive player) exitWith {};