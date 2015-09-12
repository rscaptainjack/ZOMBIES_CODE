EXILE-Z Build v3.0 Remake 

what's new
* Full replacement of AI spawn system
* Works on triggers only now
* Zombies have basic loot
* Zombies will enter/exit buildings it can be disabled in settings I know Arma path finding is not the best
* Headless Client support added (I know you love HC)
* Big city's will see hordes if using HC will be no FPS drop is some on client otherwise on 1st entry
* way less looping of code to help FPS
* Runs from mpmission calling in isserver checks so codes not over looping and laging clients now
* Fixed AI attacking each other adding setCaptive only boss zombies can attack others 
* Zombies will now work as a pack to kill players near them
* Added instant clean up on leaving a trigger zone and on death

Few issues
* Zombies will hit players but damage handler is not picking it up  - See Notice below
* Zombies hordes can be FPS issue! as it is now the size is counted by how many houses are in a city by a % amount in 
* 1st player to load in will get some lag while scripts load after that should be smooth - HC will remove this
* Ryans's mod can add in lots errors that are not important however can make log big on full server
to fix this add -noLogs to your server startup this will also help ram use.

NOTICE: damage handler issue
I ran into this handle damage part in A2 was due to fact AI where running server side like they are now setup to do.
Adding in a handle damage script was the fix for clients but it's not working for me this time round. I put all damage 
stuff is in file called damage.sqf and did a cleanup to make it easy for others to edit. 
I hope you guys in the community work it out the hard work is done just need this now ;) maybe I did a typo.. Beer and code do mix well. 


How to install script:
1. Download Here: https://github.com/rscaptainjack/ZOMBIES_CODE
2. unpack mpmission .pbo 
3. remove old zombie folder if have one add new folder ZOM
4. add this to init.sqf or top of initPlayerLocal.sqf
   [] execVM "ZOM\init.sqf";
5. update and install Ryan's mod if dont have it here: 
6. Add mod keys to keys folder in A3 Server
7. repack mpmission .pbo
9. Download and add Zombies & Demons + key to server folder Download Here: http://www.armaholic.com/page.php?id=28958
8. Load server wih parameters:  -mod=@Exile;@Ryanzombies      
Your all done!

How to install Repacked server:
1. Download here: https://github.com/rscaptainjack/EXILE_Z
2. Drop all files into a fresh A3 server folder
3. edit passwors in configs
4. load server with .bat
See readme for more info on setup in downloaded file.

How to edit maps coods:
add new coordinates to ZOM\init.sqf in ZOMaltistownpositions
You can edit zombie loots in ZOM\init.sqf

Plans upcoming:
* Make zombies attracted to gun shots faster
* make zombies attracted to smoke/flairs
* Fix zombies attack damage to players

Battleye filters that I know of: !="ZOM\damage.sqf.sqf" !="ZOM\generate_zone.sqf" !="ZOM\init.sqf" !="ZOM\walk.sqf"
The mod is tested without filters so I don't know them all sorry.



------------- OLD INFO BELOW ---------------------

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

Battleye filters that I know of: !="ZOM\damage.sqf.sqf" !="ZOM\generate_zone.sqf" !="ZOM\init.sqf" !="ZOM\walk.sqf"
The mod is tested without filters so I don't know them all sorry.


--- NEW INFO ---
what's new
* Full replacement of AI spawn system
* Works on triggers only now
* Zombies have basic loot
* Zombies will enter/exit buildings it can be disabled in settings I know Arma path finding is not the best
* Headless Client support added (I know you love HC)
* Big city's will see hordes if using HC will be no FPS drop is some on client otherwise on 1st entry
* way less looping of code to help FPS
* Runs from mpmission calling in isserver checks so codes not over looping and laging clients now
* Fixed AI attacking each other adding setCaptive only boss zombies can attack others 
* Zombies will now work as a pack to kill players near them
* Added instant clean up on leaving a trigger zone and on death

Few issues
* Zombies will hit players but damage handler is not picking it up  - See Notice below
* Zombies hordes can be FPS issue! as it is now the size is counted by how many houses are in a city by a % amount in 
* 1st player to load in will get some lag while scripts load after that should be smooth - HC will remove this
* Ryans's mod can add in lots errors that are not important however can make log big on full server
to fix this add -noLogs to your server startup this will also help ram use.

NOTICE: damage handler issue
I ran into this handle damage part in A2 was due to fact AI where running server side like they are now setup to do.
Adding in a handle damage script was the fix for clients but it's not working for me this time round. I put all damage 
stuff is in file called damage.sqf and did a cleanup to make it easy for others to edit. 
I hope you guys in the community work it out the hard work is done just need this now ;) maybe I did a typo.. Beer and code do mix well.

More info at: https://github.com/rscaptainjack/ZOMBIES_CODE
