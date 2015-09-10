//Zombie Spawner for EXILE - edits by captionjack 
//Script will only support random spawns set markers is removed in this version see old code for custom map markers .sqf

//Zombie Seettings
zombielimit=8;	    //Amount of Zombies in a group (More then 15 will cause FPS issues on full server)
zombiedamage=20;	//HP damage done when hit by zombie
zombierun = 0; 		//Broken may not work set to 1 for running
respawntime = 180;	//time for re-spawn killed zombies in random trigger zone
zvest = ["V_TacVest_blk_POLICE","V_Rangemaster_belt","V_BandollierB_khk"]; //vest bags looked funny so vest was 2nd on list to use
zloot = ["Exile_Item_Matches","Exile_Item_Surstromming","Exile_Item_PlasticBottleFreshWater","Exile_Item_ChristmasTinner","Chemlight_red","30Rnd_556x45_Stanag_Tracer_Red","Exile_Item_DuctTape","FlareRed_F"]; //loot in vest 


// ***************  DON'T EDIT  ***************
SideZMB = createCenter east; //force zombies to be on east team used to be civilian
groupZMB = createGroup east; //force zombies to be on east team used to be civilian
fncZcontact = compile preprocessfilelinenumbers "zombie\fnc_Zcontact.sqf";
zarray=[];
call compile preprocessFileLineNumbers "zombie\fnc_ZProximity.sqf";
// ***************  DON'T EDIT  ***************