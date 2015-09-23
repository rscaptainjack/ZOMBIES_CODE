/*
EXILE-Z Modless Project v1.5B - Edit for EXILE by CaptionJack and co-admins of RelentlessServers.com
Thanks to Corvobrok for the basic framework for Proximity triggers
*/
	
private ["_zbag","_izloot","_suoni","_zombie","_chosenFace","_ntargets","_nearunits"];

_izloot = zloot call BIS_fnc_selectRandom;
_zbag = zvest call BIS_fnc_selectRandom;
_suoni =  ["zomb1","zomb2","zomb3"];
_zombie = _this select 0;			
		_zombie disableAI "FSM";
		_zombie disableAI "AUTOTARGET";
		_zombie disableAI "TARGET";
		_zombie setBehaviour "CARELESS";
		_zombie addRating -10000;
		_zombie addVest _zbag; 
		_zombie addItemToVest _izloot;		
        _zombie setCaptive true;
		zarray=zarray+[_zombie];
		if (zombierun < 1) then {_zombie setdamage 0.5;};
	
while {alive _zombie} do {
	_unitsaround = _zombie nearEntities ["Man", 500];
	_targets = [];
	{
		if (group _x != groupZMB && side _x != SideZMB) then
		{
			_targets = _targets +[_x];
		};
		sleep 0.01;
	}foreach _unitsaround;	
	
	_ntargets = count _targets;	
	
	if (_ntargets> 0) then 
	{
		_target = player;
		{
			if (_zombie distance position _x < _zombie distance position _target) then
			{
				_target = _x;
			};
			sleep 0.01;
		}foreach _targets;
	
		if (_zombie distance getposATL _target < 160) then {_zombie doMove getposATL _target;};
		if (_zombie distance getposATL _target < 1.5 && alive _target  && _target != _zombie) then 
		{
			_zombie switchMove "AwopPercMstpSgthWnonDnon_end";
			_target setDamage (damage _target + (zombiedamage/100));
			_zombie say3d "zomb2";
			sleep 1.5;
		};
	};
	
	if (ExilePlayerInSafezone) then {
		_nearunits = getposATL player nearEntities ["Man",100]; 
		{
			zarray = zarray - [_zombie];
			deletevehicle _zombie;
		} forEach _nearunits;
		};
	
	if (!isDedicated) then
	{
		if (player distance position _zombie > 400) then
		{
			zarray = zarray - [_zombie];
			deletevehicle _zombie;
		};
	}
	else
	{
		if (_ntargets < 1) then
		{
		zarray = zarray - [_zombie];
			deletevehicle _zombie;
		};

	};
	sleep 1.5;
};

_zombie setdamage 1;
sleep respawntime;
zarray = zarray - [_zombie];
deletevehicle _zombie;