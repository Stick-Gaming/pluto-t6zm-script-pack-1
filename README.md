# Stick Gaming Pluto Script Pack 1
These were the first two scripts I created for Pluto, These have been on the Stick Gaming server since the beginning of the year. I always wanted to release this to the public whenever I felt like these were complete. Since it is Christmas I wanted to give you guys something cool to add to your servers. Merry Christmas from the Stick Gaming community.


# Features
-  **AFK Beta 4.3.2** 
    - Togable AFK mode
    - when AFK milestones (require milestone script)
    - Auto turn on AFK mode when players aren't moving
    - Auto turn off AFK mode
    - Auto kick feature
    - Tell other players if the player is AFK
    - Message to the AFK person that they are AFK
    - Auto-restart if a player joins when the whole alive team is AFK
    - Changes Player Clan Tag to [AFK] when AFK
    - Custom Kick message
    - Easy to config
    - Progress bar to show you how long until you get kick


-  **Milestone 0.5.1** (kinda like cold war but more useful)
    - Easy to config
    - Give points to the player on milestone round
    - Give extra perk slot on milestone round
    - Give random perk to the player on milestone round
    - Give a random power-up on milestone round
    - Give a max ammo on milestone round
    - Preset milestone rounds up and rewards up to round 40
    - Rewards GUI for milestone round

## Requirements
- Have a copy of Black ops 2 with all DLC.
- Have a copy of Feddddd [t6-gsc-utils](https://github.com/fedddddd/t6-gsc-utils) install (THIS IS NEEDED FOR THE AFK SCRIPT TO WORK)
- Have the latest version of Project [Plutonium](https://plutonium.pw/)
- Have a copy of the complier from [Plutonium forum](https://plutonium.pw/docs/modding/loading-mods/#t6), in the GSC Example Toolkit

## Installation
- Compile the script or for a pre-compile go look in our [release](https://github.com/Stick-Gaming/pluto-t6zm-script-pack-1/releases) 

- Copy the compile files to your `AppData/Local/Plutonium/storage/t6/scripts/zm` folder 

- Once copy you will need to rename each script to remove -complied from there name

- Add this to your Server .cfg file
```
//////////////////////////
// AFK System beta 4.3 ///
//////////////////////////
set afk_cooldown 30 		       // Cooldown untill player can turn on afk again (1min - 60, 2min - 90, 3min - 180, 4min - 240, 5min - 300)
set afk_autokick 300		       // Timer to Auto kick the player if they in AFK for to long (5min - 300, 10min - 600, 15min - 900, 30min - 1800, 45min - 2700)
set afk_distoturnoff 15                // the amount of distance the player need to move before AFK mode will turn off
set afk_AutoAFK 60                     // Timer for auto afk to turn on when player is not moving or pressing a button
set afk_allowautoAFK 1		       // Turn off auto AFK system (0 = off, 1 = on)
```
- Start your server


## Contributors
-	[Nathan3197](https://twitter.com/nathan3197) - Owner/developer
-   MrMrE - Developer
-   The hundreds of people who tested this on our servers
