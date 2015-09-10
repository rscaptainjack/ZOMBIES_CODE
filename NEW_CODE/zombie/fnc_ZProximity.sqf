_maxnum = zombielimit;
_units = ["C_man_polo_1_F_euro", "RyanZombieC_man_polo_2_Fslow", "RyanZombieC_man_polo_4_Fslow", "RyanZombieC_man_polo_5_Fslow", "RyanZombieC_man_polo_6_Fslow", "RyanZombieC_man_p_fugitive_Fslow", "RyanZombieC_man_w_worker_Fslow", "RyanZombieC_scientist_Fslow", "RyanZombieC_man_hunter_1_Fslow", "RyanZombieC_man_pilot_Fslow", "RyanZombieC_journalist_Fslow", "RyanZombieC_Orestesslow", "RyanZombieC_Nikosslow", "RyanZombieB_Soldier_02_fslow", "RyanZombieB_Soldier_02_f_1slow", "RyanZombieB_Soldier_02_f_1_1slow", "RyanZombieB_Soldier_03_fslow", "RyanZombieB_Soldier_03_f_1slow", "RyanZombieB_Soldier_03_f_1_1slow", "RyanZombieB_Soldier_04_fslow", "RyanZombieB_Soldier_04_f_1slow", "RyanZombieB_Soldier_04_f_1_1slow", "RyanZombieB_Soldier_lite_Fslow", "RyanZombieB_Soldier_lite_F_1slow", "RyanZombieboss1", "RyanZombieB_RangeMaster_Fmedium", "RyanZombieSpider1"];
_zombienum=0;

	while {true} do {

		_house= getPos player nearObjects ["House",9000]; 
		_nhouse =count _house;
		if (zombielimit > 50) then {_zombienum = _nhouse;};
		if (zombielimit > 20 && zombielimit < 51)then {_zombienum =floor (_nhouse/2);};
		if (zombielimit < 21) then {_zombienum =floor (_nhouse/3);};
		if (_zombienum > _maxnum) then {_zombienum = _maxnum;};
        if (count zarray < _zombienum) then {
			_pos = [(position player select 0) + floor (random 400)-200, (position player select 1) +floor (random 400)-200, 0];
			_type = _units call BIS_fnc_selectRandom;
			_zombie = groupZMB createUnit [_type, _pos, [], 0, "NONE"];
			[_zombie]spawn fncZcontact;
			sleep 0.2;
		};
		sleep 1;
		_rand = floor (random 2);
		if (count zarray >2 && _rand > 0) then
		{
			_one = zarray call BIS_fnc_selectRandom;
		};
		
		//Safe-zone ai cleanup code has trigger detection issue when searching ExileTrader is disabled for now
	/*
        _trigger = "ExileTrader";
		if (!isNil _inTrigger) then {
		_nearunits = player nearEntities ["Man",100];  // Increase or decrease the number to adjust the range (in meters).
		{
		{if ((side _x == east) && (!isPlayer _x)) then {deleteVehicle _x}} forEach _nearunits;
        };
	  };
	                      */
     sleep 0.5;
};

