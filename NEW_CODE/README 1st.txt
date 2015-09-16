UPDATE v3.1 For EXILE 0.9.20T - This version should work with upcoming patches
Change notes:
* Removed need for custom mission.sqm to be added should be more map friendly now
* Removed damage.sqf due to move of damage code into generate_zone.sqf
* Removed repacked files form GitHub - Work is holding me up I cant keep this updated on patch days
* Settings in ZOM\init.sqf have been updated
* Handle Damage function added - kinda works is buggy on old mod versions - unused if using zRLogic
* Use Ryan's Mod logic added "zRLogic" to settings for when Ryan updates the mod script will then use zombie damage from Ryan's mod
* Added search setting for A2 buildings you can enable that in settings - used if zombies are not spawning for you on A2 Maps
* Added setting to make Mission AI attack Zombies again - can cause FPS issues if on 

Install has had a slight change see Setup below: - TIP! Always update Zombies & Demons 1st
1. Download the script - https://github.com/rscaptainjack/ZOMBIES_CODE
2. unpack your mpmission of choice
3. Add folder ZOM to your mpmission of choice
3. Add this to top of initPlayerLocal.sqf or custom init.sqf

  [] execVM "ZOM\init.sqf";
  
4. repack mpmission of choice
5. unpack server exile_server_config.pbo
6. add this to config.cpp to line 15

//edit
		requiredAddons[] = {};
//to
		requiredAddons[] = {"ryanzombies"};	 //checks players to have mod before they join so they can see zombies
		
7. save and repack exile_server_config.pbo
8. Download/Update Zombies & Demons Mod + key to server folder Download Here: http://www.armaholic.com/page.php?id=28958
9. Load server with parameters:  -mod=@Exile;@Ryanzombies 


Known issues:
* If zom_fuc_realDamagehandler is not working try setting zRLogic to 1 - the handler damages single body parts
* If zRLogic on setting 0 and getting FPS spikes change it to 1 and hope Ryan's Mod logic picks up on damage.
* Random FPS issues in new update of Ryan's Mod have been noticed
* Ryan's Mod check for clients can file if so they can be killed by invisible AI

BE Filters: 
scripts.txt add to execVM line
!="ZOM\generate_zone.sqf" !="ZOM\init.sqf" !="ZOM\walk.sqf" !="zom_fuc_realDamagehandler"

createvehicle.txt
!="C_man_polo" !="RyanZombieC_man_1" !="RyanZombieC_man_polo_1" !="RyanZombieC_man_polo_2" !="RyanZombieC_man_polo_4" !="RyanZombieC_man_polo_5" !="RyanZombieC_man_polo_6" !="RyanZombieC_man_p_fugitive" !="RyanZombieC_man_w_worker" !="RyanZombieC_scientist_"" !="RyanZombieC_man_hunter_1" !="RyanZombieC_man_pilot" !="RyanZombieC_journalist" !="RyanZombieC_Orestesslow" !="RyanZombieC_Nikosslow" !="RyanZombieB_Soldier_02" !="RyanZombieB_Soldier_02_f" !="RyanZombieB_Soldier_02" !="RyanZombieB_Soldier_03" !="RyanZombieB_Soldier_03" !="RyanZombieB_Soldier_03w" !="RyanZombieB_Soldier_04" !="RyanZombieB_Soldier_04" !="RyanZombieB_Soldier_04" !="RyanZombieB_Soldier_lite" !="RyanZombieB_Soldier_lite_F" !="RyanZombieboss1" !="RyanZombieB_RangeMaster_Fmedium" !="RyanZombieSpider1"

setpos.txt - add all to stop the client kicks for zombie movement
1 "" !"Exile_" !="RyanZombieC_man_1" !="RyanZombieC_man_polo_1" !="RyanZombieC_man_polo_2" !="RyanZombieC_man_polo_4" !="RyanZombieC_man_polo_5" !="RyanZombieC_man_polo_6" !="RyanZombieC_man_p_fugitive" !="RyanZombieC_man_w_worker" !="RyanZombieC_scientist_"" !="RyanZombieC_man_hunter_1" !="RyanZombieC_man_pilot" !="RyanZombieC_journalist" !="RyanZombieC_Orestesslow" !="RyanZombieC_Nikosslow" !="RyanZombieB_Soldier_02" !="RyanZombieB_Soldier_02_f" !="RyanZombieB_Soldier_02" !="RyanZombieB_Soldier_03" !="RyanZombieB_Soldier_03" !="RyanZombieB_Soldier_03w" !="RyanZombieB_Soldier_04" !="RyanZombieB_Soldier_04" !="RyanZombieB_Soldier_04" !="RyanZombieB_Soldier_lite" !="RyanZombieB_Soldier_lite_F" !="RyanZombieboss1" !="RyanZombieB_RangeMaster_Fmedium" !="RyanZombieSpider1"
