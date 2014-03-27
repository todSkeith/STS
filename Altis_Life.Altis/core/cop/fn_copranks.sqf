if (side player == west) then {
		_coplevel = call life_coplevel;
		_rank = switch (_coplevel) do {
						case 1: {"Recruit"};
						case 2: {"Patrol Officer"};
						case 3: {"Senior Patrol Officer"};
						case 4: {"Corporal"};
						case 5: {"Sergeant"};
						case 6: {"Lieutenant"};
						case 7: {"Lieutenant"};
						case 8: {"Superintendent"};
						case 9: {"Chief"};
						case 10: {"Admin"};
					};
		player setVariable ["copRank",_rank,true];
	};
	_adminlevel = call life_adminlevel;
	if (_adminlevel > 0) then {
		player setVariable ["copRank","ADMIN",true];
	};
};