EXILE-Z Project - Add Zombies to Exile

Updated on 10/09/2015
New script is setup for Proximity spawns only script will trigger zombie spawns if in or new a building anywhere on the map (any map).
if you want the map custom trigger system see old code folder.

WARNING
If you have old files you will need to delete the zombie folder and replace it with the new one and remove the sound cfg added to description.ext then check install steps below.

What's been changed?
* Removed extra sound files Ryanzombies has it's own and work well
* AI clean-up check was fixed
* Removed broken zombies from _units list 
* Added check if zombies reach over max spawn number
* Script looping has been cleaned up
* Added safe-zone AI remove script that looks for ExileTrader trigger it's disabled the trigger is not detecting when tested it
* Fixed spawner timers from jamming up
* Added small loot table to zombies
* Zombies will be more aggressive now if player is not moving

*zombie loot change note*
Added loot/vest good idea Ancient came up with lets players loot a vest if in bambi gear we originally added to zombies clothes.

For repackaged tested server go to here:  


How to install:
1. Download the script from: https://github.com/rscaptainjack/ZOMBIES_CODE
2. Add zombie folder into your mpmission folder
3. Update mission.sqm with one in the download it's custom made to run Ryanzombies
4. Add updated version of @Ryanzombies to server folder download at http://www.armaholic.com/page.php?id=28958
5. Add @Ryanzombies RyanD.bikey to keys folder in server folder
6. edit your custom init.sqf to be same as one in download or use the one supplied
7. Edit zombie\init.sqf for custom loot and spawn rates
8. Repack your mission .pbo

Start Server with command -mod=@Exile;@Ryanzombies if you uncertain see the .bat in the repackaged build

Battleye filters that I know of: !="zombie\fnc_Zcontact.sqf" !="zombie\fnc_ZProximity.sqf" !="zombie\init.sqf"
The mod is tested without filters so I don't know them all sorry.

known issues: 
* Zombies may stop spawning if server FPS is under 8
* Safe-Zone AI remove script needs trigger detecting fixed
* Server fps could drop on full server is using virtual server host (Lower the zombies in zombie\init.sqf)
* Players may die and not see zombies if mission.sqm wasn't replaced with one in folder
* Zombies may not spawn for a player if player has been alive and away from a building triggers for long time
* Using admin teleportation can brake zombies on admins it won't effect other players unless they are ported by admin
* Zombie cleanup can missfire on player death exile should clean it up if no players are near area


Note: This script more stable then before but it's nowhere near perfect if see a way to improve it please let us all know by adding note to github or posting in forum.


with below you will also need old code folder for sounds from github
--------------------- OLD INFO BELOW ---------------------------
# ZOMBIES_CODE
Main ALPHA code for zombie spawner EXILE
This is a pull request for EXILE-Z ALPHA MOD FILES

All files in this area are needed to add zombies to an active server without need to edit main server configs. Files go into the mpmissions pbo it's easy edit.

NOTE: If you want to add zombies without the @Ryanzombies don't use the mission.sqm file and replace

This Line in: fnc_ZMarkers.sqf and fnc_ZProximity.sqf
_units = ["C_man_polo_1_F_euro","C_man_polo_2_F_asia","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_p_fugitive_F","C_scientist_F","C_man_hunter_1_F","C_journalist_F","C_Nikos2","C_Driver_1_F", "RyanZombieC_man_1slow", "RyanZombieC_man_polo_1_Fslow", "RyanZombieC_man_polo_2_Fslow", "RyanZombieC_man_polo_4_Fslow", "RyanZombieC_man_polo_5_Fslow", "RyanZombieC_man_polo_6_Fslow", "RyanZombieC_man_p_fugitive_Fslow", "RyanZombieC_man_w_worker_Fslow", "RyanZombieC_scientist_Fslow", "RyanZombieC_man_hunter_1_Fslow", "RyanZombieC_man_pilot_Fslow", "RyanZombieC_journalist_Fslow", "RyanZombieC_Orestesslow", "RyanZombieC_Nikosslow", "RyanZombieB_Soldier_02_fslow", "RyanZombieB_Soldier_02_f_1slow", "RyanZombieB_Soldier_02_f_1_1slow", "RyanZombieB_Soldier_03_fslow", "RyanZombieB_Soldier_03_f_1slow", "RyanZombieB_Soldier_03_f_1_1slow", "RyanZombieB_Soldier_04_fslow", "RyanZombieB_Soldier_04_f_1slow", "RyanZombieB_Soldier_04_f_1_1slow", "RyanZombieB_Soldier_lite_Fslow", "RyanZombieB_Soldier_lite_F_1slow", "RyanZombieboss1", "RyanZombieB_RangeMaster_Fmedium", "RyanZombieSpider1"];

WITH THIS: 
_units = ["C_man_polo_1_F_euro","C_man_polo_2_F_asia","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_p_fugitive_F","C_scientist_F","C_man_hunter_1_F","C_journalist_F","C_Nikos2","C_Driver_1_F"];
