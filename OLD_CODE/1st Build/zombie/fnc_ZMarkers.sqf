_units = ["C_man_polo_1_F_euro","C_man_polo_2_F_asia","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_p_fugitive_F","C_scientist_F","C_man_hunter_1_F","C_journalist_F","C_Nikos2","C_Driver_1_F", "RyanZombieC_man_1slow", "RyanZombieC_man_polo_1_Fslow", "RyanZombieC_man_polo_2_Fslow", "RyanZombieC_man_polo_4_Fslow", "RyanZombieC_man_polo_5_Fslow", "RyanZombieC_man_polo_6_Fslow", "RyanZombieC_man_p_fugitive_Fslow", "RyanZombieC_man_w_worker_Fslow", "RyanZombieC_scientist_Fslow", "RyanZombieC_man_hunter_1_Fslow", "RyanZombieC_man_pilot_Fslow", "RyanZombieC_journalist_Fslow", "RyanZombieC_Orestesslow", "RyanZombieC_Nikosslow", "RyanZombieB_Soldier_02_fslow", "RyanZombieB_Soldier_02_f_1slow", "RyanZombieB_Soldier_02_f_1_1slow", "RyanZombieB_Soldier_03_fslow", "RyanZombieB_Soldier_03_f_1slow", "RyanZombieB_Soldier_03_f_1_1slow", "RyanZombieB_Soldier_04_fslow", "RyanZombieB_Soldier_04_f_1slow", "RyanZombieB_Soldier_04_f_1_1slow", "RyanZombieB_Soldier_lite_Fslow", "RyanZombieB_Soldier_lite_F_1slow", "RyanZombieboss1", "RyanZombieB_RangeMaster_Fmedium", "RyanZombieSpider1"];
_suoni =  ["zomb1","zomb2","zomb3"];

_marker = zombiemkr select 0;

	while {true} do {
		{
			if (player distance getmarkerpos _x < player distance getmarkerpos _marker) then
			{
				_marker = _x;
			};
			sleep 0.01;
		}foreach zombiemkr;

		if (player distance getmarkerpos _marker < markerdist) then
		{
			if (count zarray < zombielimit) then {
				_pos = [(position player select 0) + floor (random 400)-200, (position player select 1) +floor (random 400)-200, 0];
				_type = _units call BIS_fnc_selectRandom;
				_type createUnit [_pos, groupZMB,"[this]spawn fncZcontact;"];
				sleep 0.2;
			};
		}
		else {sleep 3;};
		sleep 1;
		_rand = floor (random 2);
		if (count zarray >2 && _rand > 0) then
		{
			_one = zarray call BIS_fnc_selectRandom;
			_two = _suoni call BIS_fnc_selectRandom;
			_one say3d _two;
		};

	};
