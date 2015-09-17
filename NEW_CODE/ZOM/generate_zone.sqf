/*
EXILE-Z Project v3.1 - Edit for EXILE by SAM and CaptionJack of RelentlessServers.com
Thanks to code34 for better spawn system the core is based on Civilian Life by code34
*/
	if(!(isserver) and !(ZOMusehclient)) exitwith {};
	if(!hasInterface && !isServer && name player != ZOMhclientname) exitwith {}; 

 private ["_selections","_selection","_olddamage","_damage","_target","_allunits","_back","_buildings","_civil","_civiltype","_civilrole","_index","_group","_number","_position","_positions","_start","_trigger","_zvest","_zloot","_zbag","_izloot","_target","_ntargets","_targets","_unitsaround"];

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

	_trigger = createTrigger["EmptyDetector", _position];
	_trigger setTriggerArea[ZOMdistancepop, ZOMdistancepop, 0, false];
	_trigger setTriggerActivation["ANY", "PRESENT", TRUE];
	_trigger setTriggerStatements["", "", ""];
	
	while { ([(list _trigger)] call ZOMcountplayer == 0) } do { sleep (random 5); };

if (zA2Building == 1) then {_buildings = nearestObjects[_position,["Land_House_L_1_EP1"], 150];
}else{ _buildings = nearestObjects[_position,["House_F"], 150]; };

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

zom_fnc_realDamageHandler =
{
    private ["_unit", "_selection", "_newDamage", "_projectile", "_oldHeadDamage", "_oldBodyDamage", "_oldHandsDamage", "_oldLegsDamage"];
    _unit = player; //_this select 0;
    _selection = _this select 1;
    _newDamage = _this select 2;
    _projectile = _this select 3;
    //diag_log format ["%1 %2", str _this, if (_selection != "") then {player getHit _selection} else {getDammage player}];
    _retVal = _newDamage;
    if (_selection == "") then
    {
        _retVal = damage _unit;
    }
    else
    {
            _addedOverallDamage = _newDamage - (_unit getHit _selection);;
            if (_selection == "head" || _selection == "body") then
            {
                _addedOverallDamage = _addedOverallDamage * 0.8;
            }
            else
            {
                _addedOverallDamage = _addedOverallDamage * 0.12;
            };
            if (_addedOverallDamage > 0.01) then
            {
                // Save old selection damage.
                _oldHeadDamage = _unit getHit "head";
                _oldBodyDamage = _unit getHit "body";
                _oldHandsDamage = _unit getHit "hands";
                _oldLegsDamage =  _unit getHit "legs";
                //diag_log format ["old damage: %1, new damage: %2, selection: %3", damage _unit, (damage _unit) + _addedOverallDamage, _selection];
                _unit setDamage ((damage _unit) + _addedOverallDamage);
                _unit setHit ["head", _oldHeadDamage];
                _unit setHit ["body", _oldBodyDamage];
                _unit setHit ["hands", _oldHandsDamage];
                _unit setHit ["legs", _oldLegsDamage];
            };       
    };   
    _retVal
}; 
	
	while { true } do {
		if(([(list _trigger)] call ZOMcountplayer == 0) or _start) then {
			_start = false;
			{
				if(alive _x) then {
					_civilrole = _x getvariable "civilrole";
					_back = _back + [[typeof _x, position _x, _civilrole]];
					_x setDamage 1;
					deletevehicle _x;
				};
				sleep 0.1;
			}foreach (units _group);
			deletegroup _group;
			while { ([(list _trigger)] call ZOMcountplayer == 0) } do { sleep (random 5); };
			
			if (ZOMBAD == 1) then {				
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
	            _civil addRating -10000;
                _civil setCaptive false;
				
				sleep 0.1;
			}foreach _back;				
}else{
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
                _civil setCaptive true;	
				
				sleep 0.1;
			}foreach _back;
};
			wcgarbage = [_group] spawn walk;
			_back = [];	

if (zRLogic == 0) then {
		_target = player;
		if (_civil distance getposATL _target < 100) then {_civil doMove getposATL _target;};
		if (_civil distance getposATL _target < 1.5 && alive _target  && _target != _civil) then 
		{
			_target addEventHandler ["HandleDamage", {_this call zom_fnc_realDamageHandler}];
		};			
			
		};
	};
		
		sleep 1.5;						
	};

	
	