/*
EXILE-Z Project v3.0 - Edit for EXILE by SAM and CaptionJack of RelentlessServers.com
Thanks to code34 for better spawn system the core is based on Civilian Life by code34
*/
	if(!(isserver) and !(ZOMusehclient)) exitwith {};
	if(!(!hasInterface && !isServer && name player == ZOMhclientname) and ZOMusehclient) exitwith {};

 private ["_allunits","_back","_buildings","_civil","_civiltype","_civilrole","_index","_group","_number","_position","_positions","_target"];	

while {alive _civil} do {

		_target = player;
		{
			if (_civil distance position _x < _civil distance position _target) then
			{
				_target = _x;
			};
			sleep 0.01;
		}foreach _targets;
	
		if (_civil distance getposATL _target < 1.5 && alive _target  && _target != _civil) then 
		{
			_civil switchMove "AwopPercMstpSgthWnonDnon_end";
			_civil setDamage (damage _target + 0.34);
			sleep 0.1;
		};
	
	sleep 0.1;
};


