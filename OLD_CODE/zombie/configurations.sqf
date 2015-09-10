zombielimit=9;		//zombies respawn afterdead, but for each unit in zone, 7 zombies will spawn
zombiedamage=20;	//% of the damage of a zombie for a punch
zombierun = 0; 		//set 1 if zombie must run, 0 if they must walk
respawntime = 180;	//time for respawn killed zombies
zdebugging = 0;	//show the debug stats; enable with 1

//with this function, zombies will spawn only near markers
zombiemkr=[]; //EXAMPLE: zombiemkr=["marker1",marker2"]; zombiemkr=[]; is no markers used 

markerdist = 600;  //distance from markers where zombies spawn/despawn

//XXXXXXXXXXXXXXXXXXXXX  DON'T EDIT BELOW!  XXXXXXXXXXXXXXXXXXXXXXXXX
SideZMB = createCenter civilian;
groupZMB = createGroup civilian;
sleep 0.1;
fncZcontact = compile preprocessFile "zombie\fnc_Zcontact.sqf";
fncZproximity = compile preprocessFile "zombie\fnc_ZProximity.sqf";
fncZMarkers = compile preprocessFile "zombie\fnc_ZMarkers.sqf";
zarray=[];

if (count zombiemkr > 0) then
{[]call fncZMarkers;}
else
{[]call fncZproximity;};
