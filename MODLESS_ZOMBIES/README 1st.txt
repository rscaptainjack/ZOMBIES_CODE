Modless Zombies system v1.5Beta

This is a rebuild of the 1st zombie spawner system used for the Exile-Z mod it's made to run client side with no need for server owners to add/edit mods.
The Script can support other mod skins if used all you need to do is replace skins in the code with mod skins you want.

Features:
* Dynamic spawns map wide - looks for houses near players
* Zombies damage takes HP off target if close
* Basic loots added to zombies edit in config
* Zombies will find players no matter where they are if in 120m range
* Safezone cleanup check added - checks for ExilePlayerInSafezone 

Known issues:
* Ramdom FPS spikes in patch 1.50
* Zombies might not spawn 1st time on some players when they login after a restart
* Zombies Die on 1 shot - will be fixing this soon 
* Zombies using base models in game has blood effect to them for the zombie look nothing fancy
* Admins Teleportation can brake spawns for admins only seen this on old admin tool
* Running is causing strange BE kicks removed it for now

What's going to be done: (No ETA on this it takes time Real Life comes first)
* Fix one shot zombie kills
* Clean up errors/functions
* Add custom skins/sounds to zombies
* make zombies hurt legs/arms ect 
* Cleanup code 


HOW TO INSTALL - backup your mpmission 1st
1 Download the Script form HERE: https://github.com/rscaptainjack/ZOMBIES_CODE/tree/master/MODLESS_ZOMBIES
2 copy files in .rar/.zip file to your mpmission folder of choice
3 update your init.sqf with command in scripts init.sqf or add the init.sqf file to your mpmission
4 add #include "zombie\zed.cpp" just above #include "config.cpp" in description.ext
5 edit zombie/config.sqf 
6 repack mpmission and load server!

NOTE: The onplayerrespawn.sqf is used to re-trigger on respawn seems to be a issue in 1.50 patch this is a temp fix found by Ancientevil. Place the 
file into mpmission if you don't have it or add command inside your custom onplayerrespawn.sqf - it works like the init.sqf retriggers code when respawned. 

Battleye Filters: some maybe missing you will have to filter as they show. 

scripts.txt add to execVM line
!"onPlayerRespawn.sqf" !"zombie\config.sqf" !"zombie\fnc_Zcontact.sqf" !"zombie\fnc_ZProximity.sqf" !"compile preprocessFile \"\zombie\fnc_Zcontact.sqf\"\;" !"compile preprocessFile \"\zombie\fnc_ZProximity.sqf\"\;" 

add in Setpos.txt & createVehicule.txt first line :
!"C_man_polo_1_F_euro" !"C_man_polo_2_F_asia" !"C_man_polo_3_F" !"C_man_polo_4_F" !"C_man_polo_5_F" !"C_man_polo_6_F" !"C_man_p_fugitive_F" !"C_scientist_F" !"C_man_hunter_1_F" !"C_journalist_F" !"C_Nikos2" !"C_Driver_1_F" 

setpos.txt - add all to stop the client kicks for zombie movement
1 "" !"Exile_" !"C_man_polo_1_F_euro" !"C_man_polo_2_F_asia" !"C_man_polo_3_F" !"C_man_polo_4_F" !"C_man_polo_5_F" !"C_man_polo_6_F" !"C_man_p_fugitive_F" !"C_scientist_F" !"C_man_hunter_1_F" !"C_journalist_F" !"C_Nikos2" !"C_Driver_1_F" 


Credit to Corvobrok for the basic framework for Proximity triggers it's been reworked to run this script for you all :)			