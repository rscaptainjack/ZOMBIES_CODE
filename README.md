# ZOMBIES_CODE
Main ALPHA code for zombie spawner EXILE
This is a pull request for EXILE-Z ALPHA MOD FILES

All files in this area are needed to add zombies to an active server without need to edit main server configs. Files go into the mpmissions pbo it's easy edit.

NOTE: If you want to add zombies without the @Ryanzombies don't use the mission.sqm file and replace

This Line in: fnc_ZMarkers.sqf and fnc_ZProximity.sqf
_units = ["C_man_polo_1_F_euro","C_man_polo_2_F_asia","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_p_fugitive_F","C_scientist_F","C_man_hunter_1_F","C_journalist_F","C_Nikos2","C_Driver_1_F", "RyanZombieC_man_1slow", "RyanZombieC_man_polo_1_Fslow", "RyanZombieC_man_polo_2_Fslow", "RyanZombieC_man_polo_4_Fslow", "RyanZombieC_man_polo_5_Fslow", "RyanZombieC_man_polo_6_Fslow", "RyanZombieC_man_p_fugitive_Fslow", "RyanZombieC_man_w_worker_Fslow", "RyanZombieC_scientist_Fslow", "RyanZombieC_man_hunter_1_Fslow", "RyanZombieC_man_pilot_Fslow", "RyanZombieC_journalist_Fslow", "RyanZombieC_Orestesslow", "RyanZombieC_Nikosslow", "RyanZombieB_Soldier_02_fslow", "RyanZombieB_Soldier_02_f_1slow", "RyanZombieB_Soldier_02_f_1_1slow", "RyanZombieB_Soldier_03_fslow", "RyanZombieB_Soldier_03_f_1slow", "RyanZombieB_Soldier_03_f_1_1slow", "RyanZombieB_Soldier_04_fslow", "RyanZombieB_Soldier_04_f_1slow", "RyanZombieB_Soldier_04_f_1_1slow", "RyanZombieB_Soldier_lite_Fslow", "RyanZombieB_Soldier_lite_F_1slow", "RyanZombieboss1", "RyanZombieB_RangeMaster_Fmedium", "RyanZombieSpider1"];

WITH THIS: 
_units = ["C_man_polo_1_F_euro","C_man_polo_2_F_asia","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_p_fugitive_F","C_scientist_F","C_man_hunter_1_F","C_journalist_F","C_Nikos2","C_Driver_1_F"];
