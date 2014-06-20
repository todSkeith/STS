
_house = getPos player nearestObject "House_F"; 
_owners = _house getVariable["life_homeOwners", []];
_uid = getPlayerUID player;

_box= "Box_IND_WpsSpecial_F" createVehicle [0,0,0];
_box attachTo[player,[0,2,0]];
_box setDir 90;

life_storage2_box = _box;
life_action_storageBoxDeploy = player addAction["Place Storage Box",{if(!isNull life_storage2_box) then {detach life_storage2_box; life_storage2_box = ObjNull;}; player removeAction life_action_storageBoxDeploy; life_action_storageBoxDeploy = nil;},"",999,false,false,"",'!isNull life_storage2_box'];
hint "Placing storage container...";
waitUntil {isNull life_storage2_box;};
if(!isNil life_action_storageBoxDeploy) then {player removeAction life_action_storageBoxDeploy;};

clearWeaponCargoGlobal _box; 
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;

_houseId = [_house] call life_fnc_getBuildID;
_containerId = format ["%1_%2", _houseId, _count];
_storageData = [_containerId, _item, typeOf _box];
_containers set [count _containers, _storageData];
_house setVariable ["containers", _containers, true];
_box setVariable["owner", getPlayerUID player, true];

_handle = [] spawn life_fnc_sessionUpdate;

[[_house, _containers, playerSide, [[],0]],"BRUUUDIS_fnc_updateHouseStorage",false,false] spawn BIS_fnc_MP;