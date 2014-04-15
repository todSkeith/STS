   /*
            File: fn_playerTags.sqf
            Author: Bryan "Tonic" Boardwine

            Description:
            Adds the tags above other players heads when close and have visible range.
    */
    onEachFrame
    {
        private["_vis","_pos","_near","_name","_icon","_width","_height"];
        _near = getPos player nearEntities ["Man",20];
        {
            if(player distance _x < 20 && isPlayer _x && _x != player) then
            {
                _vis = lineIntersects [eyePos player, eyePos _x,player, _x];
                if(!_vis) then
                {
                    _pos = visiblePosition _x;
                    _pos set[2,(getPosATL _x select 2) + 2.2];
					switch (_x getVariable["coplevel", 0]) do
					{
							case 0: {_name = name _x};
							case 1: {_name = format["Cadet %1", name _x];};
							case 2: {_name = format["Patrol Officer %1", name _x];};
							case 3: {_name = format["Senior Patrol Officer %1", name _x];};
							case 4: {_name = format["Corporal %1", name _x];};
							case 5: {_name = format["Sergeant %1", name _x];};
							case 6: {_name = format["CO %1", name _x];};
							case 7: {_name = format["Superintendent %1", name _x];};
							case 8: {_name = format["Chief %1", name _x];};
							default {_name = name _x;}
					};
                    drawIcon3D ["",[1,1,1,1],_pos,0,0,0,_name,0,0.04];
                };
            };
        } foreach _near;
    }