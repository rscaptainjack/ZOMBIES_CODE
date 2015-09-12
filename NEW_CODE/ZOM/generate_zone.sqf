/*
EXILE-Z Project v3.0 - Edit for EXILE by SAM and CaptionJack of RelentlessServers.com
Thanks to code34 for better spawn system the core is based on Civilian Life by code34
*/
	if(!(isserver) and !(ZOMusehclient)) exitwith {};
	if(!(!hasInterface && !isServer && name player == ZOMhclientname) and ZOMusehclient) exitwith {};

 private ["_allunits","_back","_buildings","_civil","_civiltype","_civilrole","_index","_group","_number","_position","_positions","_start","_trigger","_zvest","_zloot","_zbag","_izloot","_target","_ntargets","_targets","_unitsaround"];

    _zbag = zvest call BIS_fnc_selectRandom;
    _izloot = zloot call BIS_fnc_selectRandom;
	_position = _this select 0;

	if (isnil "_position") exitwith { hint "ZOM: empty position";};
	if (count _position < 1) exitwith { hint "ZOM: required a position ARRAY";};
	if (surfaceiswater _position) exitwith { hint "ZOM: position is in the water";};

	_allunits = [];
	_back = [];
	_positions = [];
	_start = true;

	ZOMcountplayer = {
		private ["_array", "_count"];
		_array = _this select 0;
		_count = 0;
		if (isnil "_array") exitwith {_count = 0; _count;};
		{
			if(isplayer _x) then {
				_count = _count + 1;
			};
			sleep 0.0001;
		}foreach _array;
		_count;
	};

	// List all units in Zone
	_trigger = createTrigger["EmptyDetector", _position];
	_trigger setTriggerArea[ZOMdistancepop, ZOMdistancepop, 0, false];
	_trigger setTriggerActivation["ANY", "PRESENT", TRUE];
	_trigger setTriggerStatements["", "", ""];
	
	while { ([(list _trigger)] call ZOMcountplayer == 0) } do { sleep (random 5); };

	_buildings = nearestObjects[_position,["House_F"], 150];
	sleep 1;
	{
		_index = 0;
		while { format ["%1", _x buildingPos _index] != "[0,0,0]" } do {
			_positions = _positions + [(_x buildingPos _index)];
			_index = _index + 1;
		};
	}foreach _buildings;

	_number = 1 + round (random ZOMgroupsize);
	_group = creategroup ZOMcivilianside;
	for "_x" from 0 to _number do {
		_civiltype = civilclass call BIS_fnc_selectRandom;
		_position = _positions call BIS_fnc_selectRandom;
		_civilrole = "civil";
		_back = _back + [[_civiltype, _position, _civilrole]];

	};

	while { true } do {
		// restore civils
		if(([(list _trigger)] call ZOMcountplayer == 0) or _start) then {
			_start = false;
			{
				if(alive _x) then {
					_civilrole = _x getvariable "civilrole";
					_back = _back + [[typeof _x, position _x, _civilrole]];
					_x setdammage 1;
					deletevehicle _x;
				};
				sleep 0.1;
			}foreach (units _group);
			deletegroup _group;
			while { ([(list _trigger)] call ZOMcountplayer == 0) } do { sleep (random 5); };
			_group = creategroup ZOMcivilianside;
			{
				_civiltype = _x select 0;
				_civil = _group createUnit [_civiltype, (_x select 1), [], 0, "FORM"];
				_position = _positions call BIS_fnc_selectRandom;
				_civil addVest _zbag; 
				_civil addItemToVest _izloot; 
				_civil setvariable ["civilrole", (_x select 2), true];
				_civil setvariable ["destination", _position, false];
				_civil setvariable ["wcprotected", true, false];
		        _civil disableAI "FSM";
		        _civil disableAI "AUTOTARGET";
		        _civil disableAI "TARGET";
		        _civil setBehaviour "CARELESS";
		        _civil disableConversation true;	
                _civil setCaptive true;	//Fixes zombies attacking each other			
				sleep 0.1;
			}foreach _back;
			wcgarbage = [_group] spawn walk;
			_back = [];	
			
		};
		sleep 5;
	};

