_item = [_this,0,"",[""]] call BIS_fnc_param;
_house = nearestObject [player, "House"]; 
_owners = _house getVariable["life_homeOwners", []];
_uid = getPlayerUID player;
_containers = _house getVariable ["containers", []];

if (_item == "storage1") then {
	_box = nearestObject [player,"Land_Box_AmmoOld_F"];
} else {
	_box = nearestObject [player,"Box_IND_WpsSpecial_F"];
};

_boxPosition = [(getPos _box select 0),(getPos _box select 1),(getPos _box select 2)-1];

_houseId = [_house] call life_fnc_getBuildID;
_containerId = format ["%1_%2", _houseId, _count];
_storageData = [_containerId, _item, typeOf _box, boxposition];
_containers set [count _containers, _storageData];
_house setVariable ["containers", _containers, true];
_box setVariable["owner", getPlayerUID player, true];

[false,_item,1] call life_fnc_handleInv;
_handle = [] spawn life_fnc_sessionUpdate;
//sleep 0.5;

[[_house, _containers, playerSide, [[],0]],"BRUUUDIS_fnc_updateHouseStorage",false,false] spawn BIS_fnc_MP;