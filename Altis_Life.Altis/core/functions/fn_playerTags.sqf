/*
	File: fn_playerTags.sqf
	Author: Bryan "Tonic" Boardwine
	Developed by: Egypt~Seal
	
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
				_width = 0.7;
				_height = 0.7;
				switch (_x getVariable["coplevel", 0]) do
				{
					case 1 : {_name = format["Recrut %1", name _x];_icon = MISSION_ROOT + "images\cadet_icon.paa";};
					case 2 : {_name = format["Officer %1", name _x];_icon = MISSION_ROOT + "images\PO_icon.paa";};
                    case 3 : {_name = format["Detective %1", name _x];_icon = MISSION_ROOT + "images\SPO_icon.paa";};					
					case 4 : {_name = format["Sergeant %1", name _x];_icon = MISSION_ROOT + "images\Copr_icon.paa";};
					case 5 : {_name = format["Lieutenant %1", name _x];_icon = MISSION_ROOT + "images\Srg_icon.paa";};
					case 6 : {_name = format["Captain %1", name _x];_icon = MISSION_ROOT + "images\Luiet_icon.paa";};
					case 7 : {_name = format["Major %1", name _x];_icon = MISSION_ROOT + "images\Capt_icon.paa";};
					case 8 : {_name = format["General %1", name _x];_icon = MISSION_ROOT + "images\SuperInt_icon.paa";};
					case 9 : {_name = format["General %1", name _x];_icon = MISSION_ROOT + "images\Chief_icon.paa";};
					default {_name = name _x;}
				};
                
                drawIcon3D [_icon,[1,1,1,1],_pos,_width,_height,0,_name,0,0.04];
            };
        };
    } foreach _near;
};