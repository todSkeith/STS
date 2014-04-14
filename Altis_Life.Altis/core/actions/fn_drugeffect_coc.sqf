 //developed by JackLags
 //Usable by only the Seal Team Sloth Community
 //Any configurations are only permitted by the Seal Team Sloth DEV Team

private["_force"];
for "_i" from 0 to 200 do
{
        _force = random 15;
		"chromAberration" ppEffectEnable true;
		"chromAberration" ppEffectAdjust [0.3,0.3,true];
		"chromAberration" ppEffectCommit 1;
        waituntil {ppEffectCommitted "chromAberration"};
        sleep 90;
};
 "chromAberration" ppEffectEnable false;
 if(!alive player) exitWith {};
