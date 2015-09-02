_suoni =  ["zomb1","zomb2","zomb3"];
_zombie = _this select 0;

		_zombie disableAI "FSM";
		_zombie disableAI "AUTOTARGET";
		_zombie disableAI "TARGET";
		_zombie setBehaviour "CARELESS";
		_zombie disableConversation true;
		_zombie addRating -10000;
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
	//	if (_ntargets < 1) then
	//	{
	//		zarray = zarray - [_zombie];
	//		deletevehicle _zombie;
	//	};
			if (player distance position _zombie > 400) then
		{
			zarray = zarray - [_zombie];
			deletevehicle _zombie;
		};
	};
	sleep 0.5;
};

//player addRating 2000;
_zombie setdamage 1;
sleep respawntime;
zarray = zarray - [_zombie];
deletevehicle _zombie;