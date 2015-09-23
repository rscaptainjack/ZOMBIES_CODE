/*
EXILE-Z Modless Project v1.5B - Edit for EXILE by CaptionJack and co-admins of RelentlessServers.com
Thanks to Corvobrok for the basic framework for Proximity triggers
*/
waitUntil {!isNull player};
//Edit zombielimit and ztriggerrange to be lower if FPS is high
 
zombielimit=9;		//zombies max spawn amount 
zombiedamage=20;	//Damage of a zombie for a punch Default 20% HP on each hit
zombierun =0; 		//Leave on 0 it's not working in 1.50 patch correctly
respawntime =180;	//time for respawn killed zombies
ztrigger ="House";  //Object type that triggers zombies when player in range use HouseL for A2 maps if no spawns
ztriggerrange =120; //trigger range from object 

//Headless Client Settings - not currently supported 
ZOMusehclient = false; //set to true if using HC
ZOMhclientname = "HC"; //Name of headless Client
 
//Zombies loots adds one random item and vest per zombie from this list
zvest = ["V_TacVest_blk_POLICE","V_Rangemaster_belt","V_BandollierB_khk","V_Press_F"];
zloot = ["Exile_Item_Matches","Exile_Item_Surstromming","Exile_Item_PlasticBottleFreshWater","Exile_Item_ChristmasTinner","Chemlight_red"]; //loot in vest 
 

/* XXXXXXXXXXXXXXXXXXXXX  DON'T EDIT BELOW!  XXXXXXXXXXXXXXXXXXXXXXXXX */ 
SideZMB = createCenter civilian;
groupZMB = createGroup civilian;
sleep 0.1;
fncZcontact = compile preprocessFile "zombie\fnc_Zcontact.sqf";
fncZproximity = compile preprocessFile "zombie\fnc_ZProximity.sqf";
zarray=[];
[]call fncZproximity;
/* XXXXXXXXXXXXXXXXXXXXX  DON'T EDIT XXXXXXXXXXXXXXXXXXXXXXXXX */
