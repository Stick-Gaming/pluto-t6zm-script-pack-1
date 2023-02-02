#include maps/mp/zombies/_zm_utility;
#include maps/mp/_utility;
#include maps/_utility;
#include common_scripts/utility;
#include maps/mp/zombies/_zm_spawner;
#include maps/mp/gametypes_zm/_hud_message;
#include maps/mp/gametypes_zm/_hud_util;
#include maps/mp/zombies/_zm_perks;
// Stick Gaming Milestones V0.5
// Some code in the script have been use or remix from other people round the internet
//
// Any contributors will be credited down below
// Nathan3197
// MrE
//
//
// Big thanks to the pluto team for all there hard efforts to allow us to play BO2 with mods and servers.
	// Milestone v0.5
	// created by Nathan3197 & MrE
	// For StickGaming T6ZM Servers
	// Recomend Client to install this HD Zombies Rank Shader Pack:https://mega.nz/file/88gAhB5D#C5WsE55K5qTMixvIJDaAS95UEYV-muZwXWi8yoX0L34

	/*
	TODO
	for V0.6
	[] - Allow for custom milestone for each map (Each map could have it own MilestoneDOReward() function)
	[] - Reward - PaP current weapon
	[] - Reward - give weapon
	[] - Gameplay modifyers example extra health, speed incress, extra knife damage etc
	[] - easier config - Global milestone(Level round = milestone round to give reward) or local milestone(each player must go though X amount of round before hitting a milestone)
	*/


init()
{
	// precache shaders
	precacheShader("zombies_rank_1");
	precacheShader("zombies_rank_2");
	precacheShader("zombies_rank_3");
	precacheShader("zombies_rank_4");
	precacheShader("zombies_rank_5");
	precacheShader("zombies_rank_3_ded");
	precacheShader("zombies_rank_4_ded");
	precacheShader("zombies_rank_5_ded");
	setdvar("usingMilestoneSystem", 1);
	level thread onplayerconnect();

}


onplayerconnect()
{
	for ( ;; )
	{
        level waittill( "connected", player );
		// when a player connect they will thread this.
		player thread Milestone_setup();

	}
}

// START OF MILESTONE System
// Milestone Created by Nathan3197
Milestone_setup()
{

    self endon("disconnect");
    level endon("end_game");
	self endon("end_game");
	self.milestonedebug = false;
    wait 5;
	if(self.milestonedebug == true)
	{
		self IPrintLn("Threaded Milestone_setup");
	}
	// Milestone Round Config (To add more milestone round copy and paste self.MileStoneRound_8 and incress the number by 1)
	self.MileStoneRound_1 = 5;    // First   Milestone Round (default round 5)   
	self.MileStoneRound_2 = 10;   // Second  Milestone Round (default round 10) 
	self.MileStoneRound_3 = 15;   // Third   Milestone Round (default round 15)  
	self.MileStoneRound_4 = 20;   // Fourth  Milestone Round (default round 20)
	self.MileStoneRound_5 = 25;   // Fivth   Milestone ROund (default round 25)
	self.MileStoneRound_6 = 30;   // Sixth   Milestone Round (default round 30)
	self.MileStoneRound_7 = 35;   // Seventh Milestone Round (default round 35) 
	self.MileStoneRound_8 = 40;   // Eighth  Milestone Round (default round 40)  
		


	// Setup DONT TOUCH
	self.moneyreward = false;
	self.PerkSlotReward = false;
	self.RandPerkReward = false;
	self.healthreward = false;
	self.Maxammoreward = false;
	self.RandPowerUp = false;
	self.GivePowerUp = false;
	self.Textsetup1 = false;
	self.GiveXpReward = false;
	self.MileStoneShaderLevel = ""; 
	level.milepowerupspawn = false;
	self.All_Perk_in_level = [];
	self.perk_shader = [];
	self.All_Power_Ups_in_level = [];

	// Calling Milestone threads DONT TOUCH
	self thread Level_Check_Perk();
	self thread MileStoneTextsetup();
	self thread Power_Up_check();
	wait 3;
	self thread Milestone_Check();
}

Milestone_Check()
{
	//Check if the current round is over
	if(self.milestonedebug == true)
	{
		self IPrintLn("Threaded Milestone_Check");
	}
	self endon("disconnect");
    level endon("end_game");
	self endon("end_game");
	self iprintln("Milestone V0.5 Created by ^2Nathan3197");
	for (;;)
	{
		level waittill( "end_of_round" );
		wait 5;
		if(self.isAFK == false)
		{
			self MilestoneDORward();
		}	
		wait 2;
	}


}

MilestoneDORward()
{
	//Check if the current round = to a milestone round
	self endon("disconnect");
    level endon("end_game");
	self endon("end_game");
	level waittill( "start_of_round" );

	if(self.milestonedebug == true)
	{
		self iprintln("Round over checking if it a milestone round"); 
	}

	// Milestone Preset 1
	if (level.round_number == self.MileStoneRound_1 && self.milestone_round_done1 == false) 
	{	
		// Debuging
		if(self.milestonedebug == true)
		{
			self iprintln("Round 5 giving Milestone rewards"); 
		}

		// MILESTONE CONFIG START

		// MILESTONE REWARD CONFIG
		self.moneyreward = true;     // give points on reward
			self.cashreward = 1250;  // how much points
		self.PerkSlotReward = false; // add extra perk slot
		self.PerkSlotRewardnum = 0;  // how many slot you want to give
		self.Maxammoreward = false;  // Give a Max ammo
		self.RandPerkReward = false; // give a random perk
		self.RandPowerUp = false;    // give a random power up
		self.GiveXpReward = true; 	 // Give XP on reward
			//self.xpReward = 250;		 // how much XP (require Progression system)

		// MILESTONE SHADER CONFIG
		self.MileStoneShaderLevel = "zombies_milestone_rank_1";  
		/* 
		List of shader to select
		zombies_milestone_rank_1
		zombies_milestone_rank_2
		zombies_milestone_rank_3
		zombies_milestone_rank_3_ded
		zombies_milestone_rank_4
		zombies_milestone_rank_4_ded
		zombies_milestone_rank_5
		zombies_milestone_rank_5_ded    Note: This changes the Milestone Reach text to final milestone
		*/

		// MILESTONE CONFIG END
		self.milestone_round_done1 = true;
		self thread MilestoneRewardTrigger();
		self waittill("Milestone_over");
	}

	// Milestone Preset 2
	if (level.round_number == self.MileStoneRound_2 && self.milestone_round_done2 == false)
	{
		// Debuging
		if(self.milestonedebug == true)
		{
		 	self iprintln("Round 10 giving Milestone rewards"); 
		}

		// MILESTONE CONFIG START

		// MILESTONE REWARD CONFIG
		self.moneyreward = true;     // give points on reward
			self.cashreward = 1750;  // how much points
		self.PerkSlotReward = false; // add extra perk slot
		self.PerkSlotRewardnum = 0;  // how many slot you want to give
		self.RandPerkReward = true;  // give a random perk
		self.Maxammoreward = false;  // Give a Max ammo
		self.RandPowerUp = true;	 // give a random power up
		self.GiveXpReward = true; 	 // Give XP on reward
			//self.xpReward = 500;	 // How much XP (require Progression system)

		// MILESTONE SHADER CONFIG
		self.MileStoneShaderLevel = "zombies_milestone_rank_2";  
		/* 
		List of shader to select
		zombies_milestone_rank_1
		zombies_milestone_rank_2
		zombies_milestone_rank_3
		zombies_milestone_rank_3_ded
		zombies_milestone_rank_4
		zombies_milestone_rank_4_ded
		zombies_milestone_rank_5
		zombies_milestone_rank_5_ded    Note: This changes the Milestone Reach text to final milestone
		*/

		// MILESTONE CONFIG END
		self.milestone_round_done2 = true;
		self thread MilestoneRewardTrigger();
		self waittill("Milestone_over");
	}

	// Milestone Preset 3
	if (level.round_number == self.MileStoneRound_3 && self.milestone_round_done3 == false)
	{		
		// Debuging
		if(self.milestonedebug == true)
		{
		 	self iprintln("Round 15 giving Milestone rewards"); 
		}

		// MILESTONE CONFIG START

		// MILESTONE REWARD CONFIG
		self.moneyreward = true;     // give points on reward
			self.cashreward = 2500;  // how much points
		self.PerkSlotReward = true;  // add extra perk slot
		self.PerkSlotRewardnum = 1;  // how many slot you want to give
		self.RandPerkReward = true;  // give a random perk
		self.Maxammoreward = false;  // Give a Max ammo
		self.RandPowerUp = true;	 // give a random power up
		self.GiveXpReward = true; 	 // Give XP on reward
			//self.xpReward = 750;		 // How much XP (require Progression system)

		// MILESTONE SHADER CONFIG
		self.MileStoneShaderLevel = "zombies_milestone_rank_3";  
		/* 
		List of shader to select
		zombies_milestone_rank_1
		zombies_milestone_rank_2
		zombies_milestone_rank_3
		zombies_milestone_rank_3_ded
		zombies_milestone_rank_4
		zombies_milestone_rank_4_ded
		zombies_milestone_rank_5
		zombies_milestone_rank_5_ded    Note: This changes the Milestone Reach text to final milestone
		*/

		// MILESTONE CONFIG END
		self.milestone_round_done3 = true;
		self thread MilestoneRewardTrigger();
		self waittill("Milestone_over");
	}

	// Milestone Preset 4
	if (level.round_number == self.MileStoneRound_4 && self.milestone_round_done4 == false)
	{		
		// Debuging	
		if(self.milestonedebug == true)
		{
		 	self iprintln("Round 15 giving Milestone rewards"); 
		}

		// MILESTONE CONFIG START

		// MILESTONE REWARD CONFIG
		self.moneyreward = true;     // give points on reward
			self.cashreward = 7500;  // how much points
		self.PerkSlotRewardnum = 1;  // how many slot you want to give
		self.PerkSlotReward = true;	 // add extra perk slot
		self.RandPerkReward = true;  // give a random perk
		self.Maxammoreward = true;   // Give a Max ammo
		self.RandPowerUp = true;	 // give a random power up
		self.GiveXpReward = true; 	 // Give XP on reward
			//self.xpReward = 1000;	 // How much XP (require Progression system)
		

		// MILESTONE SHADER CONFIG
		self.MileStoneShaderLevel = "zombies_milestone_rank_3_ded";  
		/* 
		List of shader to select
		zombies_milestone_rank_1
		zombies_milestone_rank_2
		zombies_milestone_rank_3
		zombies_milestone_rank_3_ded
		zombies_milestone_rank_4
		zombies_milestone_rank_4_ded
		zombies_milestone_rank_5
		zombies_milestone_rank_5_ded    Note: This changes the Milestone Reach text to final milestone
		*/

		// MILESTONE CONFIG END
		self.milestone_round_done4 = true;
		self thread MilestoneRewardTrigger();
		self waittill("Milestone_over");
	}

	// Milestone Preset 5
	if (level.round_number == self.MileStoneRound_5 && self.milestone_round_done5 == false)
	{
		// Debuging
		if(self.milestonedebug == true)
		{
		 	self iprintln("Round 15 giving Milestone rewards"); 
		}

		// MILESTONE CONFIG START

		// MILESTONE REWARD CONFIG
		self.moneyreward = true;     // give points on reward
			self.cashreward = 8000;  // how much points
		self.PerkSlotRewardnum = 1;  // how many slot you want to give
		self.PerkSlotReward = true;	 // add extra perk slot
		self.RandPerkReward = true;  // give a random perk
		self.Maxammoreward = true;   // Give a Max ammo
		self.RandPowerUp = true;	 // give a random power up
		self.GiveXpReward = true; 	 // Give XP on reward
			//self.xpReward = 1250;	 // How much XP (require Progression system)
		

		// MILESTONE SHADER CONFIG
		self.MileStoneShaderLevel = "zombies_milestone_rank_4";  
		/* 
		List of shader to select
		zombies_milestone_rank_1
		zombies_milestone_rank_2
		zombies_milestone_rank_3
		zombies_milestone_rank_3_ded
		zombies_milestone_rank_4
		zombies_milestone_rank_4_ded
		zombies_milestone_rank_5
		zombies_milestone_rank_5_ded    Note: This changes the Milestone Reach text to final milestone
		*/

		// MILESTONE CONFIG END
		self.milestone_round_done5 = true;
		self thread MilestoneRewardTrigger();
		self waittill("Milestone_over");
	}

	// Milestone Preset 6
	if (level.round_number == self.MileStoneRound_6 && self.milestone_round_done6 == false)
	{
		// Debuging
		if(self.milestonedebug == true)
		{
		 	self iprintln("Round 15 giving Milestone rewards"); 
		}

		// MILESTONE CONFIG START

		// MILESTONE REWARD CONFIG
		self.moneyreward = true;     // give points on reward
			self.cashreward = 15000; // how much points
		self.PerkSlotRewardnum = 1;  // how many slot you want to give
		self.PerkSlotReward = true;	 // add extra perk slot
		self.RandPerkReward = true;  // give a random perk
		self.Maxammoreward = true;   // Give a Max ammo
		self.RandPowerUp = true;	 // give a random power up
		self.GiveXpReward = true; 	 // Give XP on reward
			//self.xpReward = 1500;	 // How much XP (require Progression system)

		// MILESTONE SHADER CONFIG
		self.MileStoneShaderLevel = "zombies_milestone_rank_4_ded";  
		/* 
		List of shader to select
		zombies_milestone_rank_1
		zombies_milestone_rank_2
		zombies_milestone_rank_3
		zombies_milestone_rank_3_ded
		zombies_milestone_rank_4
		zombies_milestone_rank_4_ded
		zombies_milestone_rank_5
		zombies_milestone_rank_5_ded    Note: This changes the Milestone Reach text to final milestone
		*/

		// MILESTONE CONFIG END
		self.milestone_round_done6 = true;
		self thread MilestoneRewardTrigger();
		self waittill("Milestone_over");
	}

	// Milestone Preset 7
	if (level.round_number == self.MileStoneRound_7 && self.milestone_round_done7 == false)
	{
		// Debuging
		if(self.milestonedebug == true)
		{
		 	self iprintln("Round 15 giving Milestone rewards"); 
		}

		// MILESTONE CONFIG START

		// MILESTONE REWARD CONFIG
		self.moneyreward = true;     // give points on reward
			self.cashreward = 20000; // how much points
		self.PerkSlotRewardnum = 1;  // how many slot you want to give
		self.PerkSlotReward = true;	 // add extra perk slot
		self.RandPerkReward = true;  // give a random perk
		self.Maxammoreward = true;   // Give a Max ammo
		self.RandPowerUp = true;	 // give a random power up
		self.GiveXpReward = true; 	 // Give XP on reward
			//self.xpReward = 1750;		 // How much XP (Require Progression system)

		// MILESTONE SHADER CONFIG
		self.MileStoneShaderLevel = "zombies_milestone_rank_5";  
		/* 
		List of shader to select
		zombies_milestone_rank_1
		zombies_milestone_rank_2
		zombies_milestone_rank_3
		zombies_milestone_rank_3_ded
		zombies_milestone_rank_4
		zombies_milestone_rank_4_ded
		zombies_milestone_rank_5
		zombies_milestone_rank_5_ded    Note: This changes the Milestone Reach text to final milestone
		*/

		// MILESTONE CONFIG END
		self.milestone_round_done7 = true;
		self thread MilestoneRewardTrigger();
		self waittill("Milestone_over");
	}

	// Milestone Preset 8 (Final Milestone)
	if (level.round_number == self.MileStoneRound_8 && self.milestone_round_done8 == false)
	{
		// Debuging
		if(self.milestonedebug == true)
		{
		 	self iprintln("Round 15 giving Milestone rewards"); 
		}

		// MILESTONE CONFIG START

		// MILESTONE REWARD CONFIG
		self.moneyreward = true;     // give points on reward
			self.cashreward = 25000; // how much points
		self.PerkSlotRewardnum = 0;  // how many slot you want to give
		self.PerkSlotReward = false; // add extra perk slot
		self.RandPerkReward = true;  // give a random perk
		self.Maxammoreward = true;   // Give a Max ammo
		self.RandPowerUp = true;	 // give a random power up
		self.GiveXpReward = true; 	 // Give XP on reward
			self.xpReward = 2000;    // How much XP

		// MILESTONE SHADER CONFIG
		self.MileStoneShaderLevel = "zombies_milestone_rank_5_ded";  
		/* 
		List of shader to select
		zombies_milestone_rank_1
		zombies_milestone_rank_2
		zombies_milestone_rank_3
		zombies_milestone_rank_3_ded
		zombies_milestone_rank_4
		zombies_milestone_rank_4_ded
		zombies_milestone_rank_5
		zombies_milestone_rank_5_ded    Note: This changes the Milestone Reach text to final milestone
		*/

		// MILESTONE CONFIG END
		self.milestone_round_done8 = true;
		self thread MilestoneRewardTrigger();
		self waittill("Milestone_over");
	}

	//Custom Milestone Below Here (Copy and past any preset milestone but you need to change self.MileStoneRound_8 to your custom self.MileStoneRound_X)



	if(self.milestonedebug == true)
	{
		self iprintln("Minestone Over Destorying"); 
	}
	self Destroy();
	return;
}


MilestoneRewardTrigger()
{
	//Giving the player thier rewards
	self endon("disconnect");
    level endon("end_game");
	self endon("end_game");

	//prerandom perk and shader
	if(self.All_Perk_in_level.size > 0)//hotfix //bus depot or custom maps will bug if milestone tries giving perks to a no perk map-fixed
	{
		//this need to have a check if player has the perk
		self.All_Perk_in_level = array_randomize(self.All_Perk_in_level);
		self.thePerk = random(self.All_Perk_in_level);
		testnum = 0;
		while(self hasperk(self.thePerk))
		{
			if(testnum >= 50)
			{
				self.RandPerkReward = false;
				self iprintln("you have all perks on the map. no free perk this time");
				break;
			}
			testnum++;
			self.All_Perk_in_level = array_randomize(self.All_Perk_in_level);
			self.thePerk = random(self.All_Perk_in_level);
			wait 0.05;
		}			
		self SetRandPerkShader(self.thePerk);
	}

	//Gui setup
	self notify("Prep_Rank_Shader");
	self waittill("MileGui_Ready");

	if(self.milestonedebug == true)
	{
		self iprintln("Milestone Gui Ready");
		wait 1;
	}

	self notify("MileGui_on");

	if(self.milestonedebug == true)
	{
		self iprintln("Turning on GUI");
		wait 1;
	}

	//Money reward
	if (self.moneyreward == true)
	{
		self.score += self.cashreward;
		if(self.milestonedebug == true)
		{
		 self IPrintLn("Milestone reach giving ^2" + self.cashreward + "^7 points");
		}
	}

	//Perkslot reward
	if (self.PerkSlotReward == true && isDefined(level.perk_purchase_limit) && level.perk_purchase_limit != 0 ) 
	{
		level.perk_purchase_limit += self.PerkSlotRewardnum;

		if(self.milestonedebug == true)
		{
			self IPrintLn("Milestone reach giving ^2" + self.PerkSlotRewardnum + "^7 perk slots");
			self IPrintLn("You now have ^2" + level.perk_purchase_limit + "^7 perk slots");
		}
	}

	//Max ammo reward
	if (self.Maxammoreward == true)
	{
		self GivePowerUp("full_ammo");

		if(self.milestonedebug == true)
		{
			self IPrintLn("MileStone reach Max ammo has been drop");
		}
	}

	//Random Perk Reward
	if (self.RandPerkReward == true)
	{
		self doGivePerk(self.thePerk);
		if(self.milestonedebug == true)
		{
			self iprintln("Milestone reach giving random perk " + self.thePerk);
		}
	}
	
	//Random Power Up Reward
	if (self.RandPowerUp == true)
	{	
		level.milepowerupspawn = false;

		self GivePowerUp(self.ThePowerup);
		if(self.milestonedebug == true)
		{
			self IPrintLn("MileStone reach random power up has been drop");	
		}
	}
	
	// give xp (require Progression system)
	// if(self.GiveXpReward == true && getdvar("usingProgressionSystem") == 1)
	// {
	// 	self notify("Milestone_reward_xp", self.xpReward, true);
	// 	if(self.milestonedebug == true)
	// 	{
	// 		self iprintln("Milestone reach Giving XP:" + self.xpReward);
	// 	}
	// }


	wait 6;
	self notify("MileGui_off");
	self notify("Milestone_over");
	//resetting
	self.moneyreward = false;
	self.cashreward = 0;
	self.PerkSlotRewardnum = 0;
	self.PerkSlotReward = false;
	self.RandPerkReward = false;
	self.Maxammoreward = false;
	self.RandPowerUp = false;
	self.GiveXpReward = false;
	self.MileStoneShaderLevel = "";
	self Destroy();
	return;
}


MileStoneTextsetup()
{
	//Setting up Milestone rounds GUI
	self endon("disconnect");
    level endon("end_game");
	self endon("end_game");

	if(self.milestonedebug == true)
	{
		self iprintln("threading MielstoneTextSetup"); 
	}

	if (self.textsetup1 == false)
	{
		if(self.milestonedebug == true)
		{
		 	self iprintln("Setting up milestone Text and shaders"); 
		}
		// create text for milestone
		self.MilestoneText = CreateFontString("bigfixed", 2);
		self.MilestoneText setPoint("CENTER", "CENTER", -10, -140);
		self.MilestoneText.alpha = 0;
		self.MilestoneText.archived = 0;
		self.MilestoneText.hidewheninmenu = 1;
		self.MilestoneText SetText("Milestone Reach!!");

		// create shader
		self.MilestoneIcon = newclienthudelem( self );
		self.MilestoneIcon.horzalign = "center";
		self.MilestoneIcon.vertalign = "center";
		self.MilestoneIcon.x = -34;
		self.MilestoneIcon.y = 120;
		self.MilestoneIcon.alpha = 0;
		self.MilestoneIcon.archived = 0;
		self.MilestoneIcon.hidewheninmenu = 1;
		width = 64;
		hight = 64;
		self.textsetup1 = true;
		self.PreshaderPerk = "";

		//shader mover system make placing them easy
		self.MilestoneCashRewardText = CreateFontString("bigfixed", 1);
		self.MilestoneCashRewardText setPoint("CENTER", "CENTER", 343, -94);
		self.MilestoneCashRewardText.alpha = 0;
		self.MilestoneCashRewardText.archived = 0;
		self.MilestoneCashRewardText.hidewheninmenu = 1;
		self.MilestoneCashRewardText SetText("^3Cash ^7Reward");

		//shader mover system make placing them easy
		self.MilestoneRandomPerkText = CreateFontString("bigfixed", 1);
		self.MilestoneRandomPerkText setPoint("CENTER", "CENTER", 313, -48);
		self.MilestoneRandomPerkText.alpha = 0;
		self.MilestoneRandomPerkText.archived = 0;
		self.MilestoneRandomPerkText.hidewheninmenu = 1;
		self.MilestoneRandomPerkText SetText("^1R^2a^3n^4d^5o^6m ^1P^2e^3r^4k ^7Reward");

		//shader mover system make placing them easy
		self.MilestonePerkSlotText = CreateFontString("bigfixed", 1);
		self.MilestonePerkSlotText setPoint("CENTER", "CENTER", 304 , 30);
		self.MilestonePerkSlotText.alpha = 0;
		self.MilestonePerkSlotText.archived = 0;
		self.MilestonePerkSlotText.hidewheninmenu = 1;
		self.MilestonePerkSlotText SetText("^6Extra Perk Slot ^7Reward");
		//icon shader cash
		rewardWidth = 32;
		rewardHight = 32;
		if(int(level.usingachivement) == 1)
		{
			self.CashRewarIcon = newclienthudelem( self );
			self.CashRewarIcon.horzalign = "center";
			self.CashRewarIcon.vertalign = "center";
			self.CashRewarIcon.x = 390; 
			self.CashRewarIcon.y = 138; 
			self.CashRewarIcon.alpha = 0;
			self.CashRewarIcon.archived = 0;
			self.CashRewarIcon.hidewheninmenu = 1;
			self.CashRewarIcon.color = (255,255,0);
			self.CashRewarIcon setshader("specialty_doublepoints_zombies", rewardWidth, rewardHight);
			//shader mover system make placing them easy
			self.MilestoneCashRewardText = CreateFontString("bigfixed", 1);
			self.MilestoneCashRewardText setPoint("CENTER", "CENTER", 343, -94);
			self.MilestoneCashRewardText.alpha = 0;
			self.MilestoneCashRewardText.archived = 0;
			self.MilestoneCashRewardText.hidewheninmenu = 1;
			self.MilestoneCashRewardText SetText("^3Cash ^7Reward");
		}
		//icon shader random perk
		self.RandomPerkReward1Icon = newclienthudelem( self );
		self.RandomPerkReward1Icon.horzalign = "center";
		self.RandomPerkReward1Icon.vertalign = "center";
		self.RandomPerkReward1Icon.x = 390;
		self.RandomPerkReward1Icon.y = 180;
		self.RandomPerkReward1Icon.alpha = 0;
		self.RandomPerkReward1Icon.archived = 0;
		self.RandomPerkReward1Icon.hidewheninmenu = 1;
		self.RandomPerkReward1Icon setshader("specialty_ads_zombies", rewardWidth, rewardHight);
		//icon shader Max ammo
		if(int(level.usingachivement) == 1 )
		{
			self.MaxAmmoRewardIcon = newclienthudelem( self );
			self.MaxAmmoRewardIcon.horzalign = "center";
			self.MaxAmmoRewardIcon.vertalign = "center";
			self.MaxAmmoRewardIcon.x = 390;
			self.MaxAmmoRewardIcon.y = 220;
			self.MaxAmmoRewardIcon.alpha = 0;
			self.MaxAmmoRewardIcon.archived = 0;
			self.MaxAmmoRewardIcon.hidewheninmenu = 1;
			self.MaxAmmoRewardIcon.color = (228,135,0);
			self.MaxAmmoRewardIcon setshader("specialty_fastreload_zombies", rewardWidth, rewardHight);

			//shader mover system make placing them easy
			self.MilestoneMaxAmmoText = CreateFontString("bigfixed", 1);
			self.MilestoneMaxAmmoText setPoint("CENTER", "CENTER", 320, -8);
			self.MilestoneMaxAmmoText.alpha = 0;
			self.MilestoneMaxAmmoText.archived = 0;
			self.MilestoneMaxAmmoText.hidewheninmenu = 1;
			self.MilestoneMaxAmmoText SetText("^2Max Ammo ^7Reward");
		}
		//icon shader Perk slot
		self.PerkSlotRewardIcon = newclienthudelem( self );
		self.PerkSlotRewardIcon.horzalign = "center";
		self.PerkSlotRewardIcon.vertalign = "center";
		self.PerkSlotRewardIcon.x = 390;
		self.PerkSlotRewardIcon.y = 260;
		self.PerkSlotRewardIcon.alpha = 0;
		self.PerkSlotRewardIcon.archived = 0;
		self.PerkSlotRewardIcon.hidewheninmenu = 1;
		self.PerkSlotRewardIcon.color = (228,135,0);
		self.PerkSlotRewardIcon setshader("specialty_doubletap_zombies", rewardWidth, rewardHight);
	}

	//Milestone Gui Text/image change and On/Off
	for(;;)
	{		
		self waittill("Prep_Rank_Shader");
		if(self.milestonedebug == true)
		{
			self iprintln("Text will display are " + self.moneyreward + self.PerkSlotReward + self.Maxammoreward + self.RandPerkReward);
		}

		// Milestone Shader Level 1
		if (self.MileStoneShaderLevel == "zombies_milestone_rank_1")
		{
			// Debuging
			if(self.milestonedebug == true)
			{
				self iprintln("Shader change to rank 1"); 
			}

			self.MilestoneIcon setshader( "zombies_rank_1", width, hight );
		}

		// Milestone Shader Level 2
		if (self.MileStoneShaderLevel == "zombies_milestone_rank_2")
		{
			// Debuging
			if(self.milestonedebug == true)
			{
				self iprintln("Shader change to rank 2"); 
			}

			self.MilestoneIcon setshader( "zombies_rank_2", width, hight );
		}

		// Milestone Shader Level 3
		if (self.MileStoneShaderLevel == "zombies_milestone_rank_3")
		{
			if(self.milestonedebug == true)
			{
				self iprintln("Shader change to rank 3"); 
			}

			self.MilestoneIcon setshader( "zombies_rank_3", width, hight );
		}

		// Milestone Shader Level 4
		if(self.MileStoneShaderLevel == "zombies_milestone_rank_3_ded")
		{
			// Debuging
			if(self.milestonedebug == true)
			{
				self iprintln("Shader change to rank 3_ded"); 
			}

			self.MilestoneIcon setshader( "zombies_rank_3_ded", width, hight );
		}

		// Milestone Shader Level 5
		if(self.MileStoneShaderLevel == "zombies_milestone_rank_4")
		{
			// Debuging
			if(self.milestonedebug == true)
			{
				self iprintln("Shader change to rank 4"); 
			}

			self.MilestoneIcon setshader( "zombies_rank_4", width, hight );
		}

		// Milestone Shader Level 6
		if(self.MileStoneShaderLevel == "zombies_milestone_rank_4_ded")
		{
			// Debuging
			if(self.milestonedebug == true)
			{
				self iprintln("Shader change to rank 4_ded"); 
			}

			self.MilestoneIcon setshader( "zombies_rank_4_ded", width, hight );
		}

		// Milestone Shader Level 7
		if(self.MileStoneShaderLevel == "zombies_milestone_rank_5")
		{	
			// Debuging		
			if(self.milestonedebug == true)
			{
				self iprintln("Shader change to rank 5"); 
			} 

			self.MilestoneIcon setshader( "zombies_rank_5", width, hight );
		}

		// Milestone Shader Level 8 (Final Milestone)
		if(self.MileStoneShaderLevel == "zombies_milestone_rank_5_ded")
		{
			// Debuging
			if(self.milestonedebug == true)
			{
				self iprintln("Shader change to rank 5_ded"); 
			}

			self.MilestoneIcon setshader( "zombies_rank_5_ded", width, hight );
			self.MilestoneText SetText("^2Final ^6Milestone ^7Reach!!");
			self notify("final_milestone");
		}


		self notify("MileGui_Ready");
		self waittill("MileGui_on");

		//Turning On Shaders
		if(self.milestonedebug == true)
		{
			self iprintln("Turning on milestone shader"); 
		}
		self.MilestoneText fadeovertime(0.50);
		self.MilestoneText.alpha = 1;
		self.MilestoneIcon fadeovertime(0.50);
		self.MilestoneIcon.alpha = 1;

		if(self.moneyreward == true)
		{
			if(self.milestonedebug == true)
			{
				self iprintln("Turning on milestone shader Moneyreward"); 
			}
			if(int(level.usingachivement) == 1)
			{
				self.MilestoneCashRewardText fadeovertime(0.50);
				self.MilestoneCashRewardText.alpha = 1;
				self.CashRewarIcon fadeovertime(0.50);
				self.CashRewarIcon.alpha = 1;
			}
		}
		
		if(self.PerkSlotReward == true)
		{
			if(self.milestonedebug == true)
			{
				self iprintln("Turning on milestone shader perkslotreward"); 
			}
			self.MilestonePerkSlotText fadeovertime(0.50);
			self.MilestonePerkSlotText.alpha = 1;
			self.PerkSlotRewardIcon fadeovertime(0.50);
			self.PerkSlotRewardIcon.alpha = 1;
		}

		if(self.RandPerkReward == true)
		{	
			self SetRandPerkShader(self.thePerk);
			self.RandomPerkReward1Icon setshader(self.PreshaderPerk, rewardWidth, rewardHight);
			if(self.milestonedebug == true)
			{
				self iprintln("Turning on milestone shader randperkreward1"); 
				self iprintln("Setting rand perk shader to ^2" + self.PreshaderPerk);
			}
			self.MilestoneRandomPerkText fadeovertime(0.50);
			self.MilestoneRandomPerkText.alpha = 1;
			self.RandomPerkReward1Icon fadeovertime(0.50);
			self.RandomPerkReward1Icon.alpha = 1;
		}

		if(self.Maxammoreward == true)
		{
			if(self.milestonedebug == true)
			{
				self iprintln("Turning on milestone shader maxammoreward"); 
			}
			if(int(level.usingachivement) == 1)
			{
				self.MilestoneMaxAmmoText fadeovertime(0.50);
				self.MilestoneMaxAmmoText.alpha = 1;
				self.MaxAmmoRewardIcon fadeovertime(0.50);
				self.MaxAmmoRewardIcon.alpha = 1;
			}
		}

		self waittill("MileGui_off");
		//Turing off Shaders

		if(self.milestonedebug == true)
		{
			self iprintln("Turning off milestone shader"); 
		}

		wait 1;
		self.MilestoneText fadeovertime(0.50);
		self.MilestoneText.alpha = 0;
		self.MilestoneIcon fadeovertime(0.50);
		self.MilestoneIcon.alpha = 0;	

		if(int(level.usingachivement) == 1)
		{
		self.MilestoneCashRewardText fadeovertime(0.50);
		self.MilestoneCashRewardText.alpha = 0;
		self.CashRewarIcon fadeovertime(0.50);
		self.CashRewarIcon.alpha = 0;
		}
		self.MilestonePerkSlotText fadeovertime(0.50);
		self.MilestonePerkSlotText.alpha = 0;
		self.PerkSlotRewardIcon fadeovertime(0.50);
		self.PerkSlotRewardIcon.alpha = 0;

		self.MilestoneRandomPerkText fadeovertime(0.50);
		self.MilestoneRandomPerkText.alpha = 0;
		self.RandomPerkReward1Icon fadeovertime(0.50);
		self.RandomPerkReward1Icon.alpha = 0;

		if(int(level.usingachivement) == 1)
		{
		self.MilestoneMaxAmmoText fadeovertime(0.50);
		self.MilestoneMaxAmmoText.alpha = 0;
		self.MaxAmmoRewardIcon fadeovertime(0.50);
		self.MaxAmmoRewardIcon.alpha = 0;
		}
		wait 3;
	}
}

GivePowerUp(powerup_name)
{
	if(self.milestonedebug == true)
	{
		self iprintln("Spawning Power up ^2" + powerup_name); 
	}
	if (level.milepowerupspawn == false)
	{
    if (!isDefined(level.zombie_include_powerups) || (!(level.zombie_include_powerups.size > 0)))     
        self iprintln("Power Ups ^1Not Supported ^7On This Map");
    else
    {
		level.milepowerupspawn = true;
        level.powerup_drop_count = 0;
        powerup = level maps/mp/zombies/_zm_powerups::specific_powerup_drop(powerup_name, self.origin);
        if (powerup_name == "teller_withdrawl")
            powerup.value = 1000;
        powerup thread maps/mp/zombies/_zm_powerups::powerup_timeout();
        level.milepowerupspawn = false;
    }
	}
    self Destroy();
} 

doGivePerk(perk)
{
    self endon("disconnect");
    //self endon("death");
	self endon("end_game");
    level endon("end_game");
    self endon("perk_abort_drinking");
    if (!(self hasperk(perk) || (self maps/mp/zombies/_zm_perks::has_perk_paused(perk))))
    {
        gun = self maps/mp/zombies/_zm_perks::perk_give_bottle_begin(perk);
        evt = self waittill_any_return("fake_death", "death", "player_downed", "weapon_change_complete");
        if (evt == "weapon_change_complete")
            self thread maps/mp/zombies/_zm_perks::wait_give_perk(perk, 1);
        self maps/mp/zombies/_zm_perks::perk_give_bottle_end(gun, perk);
        if (self maps/mp/zombies/_zm_laststand::player_is_in_laststand() || isDefined(self.intermission) && self.intermission)
            return;
        self notify("burp");
    }
}

Level_Check_Perk()
{	
	if(self.milestonedebug == true)
	{
		self iprintln("^2Thread Level_check_perk"); 
	}
	// Check the level what perks are being using in the level
    if (isDefined(level.zombiemode_using_juggernaut_perk) && level.zombiemode_using_juggernaut_perk)
	{
        self.All_Perk_in_level[0] = "specialty_armorvest"; // Jug
		self.perk_shader[0] = "specialty_juggernaut_zombies";
	}
    if (isDefined(level.zombiemode_using_sleightofhand_perk) && level.zombiemode_using_sleightofhand_perk)
	{
      	self.All_Perk_in_level[1] = "specialty_fastreload"; //Speed
		self.perk_shader[1] = "specialty_fastreload_zombies";
	}
    if (isDefined(level.zombiemode_using_revive_perk) && level.zombiemode_using_revive_perk)
    {
		self.All_Perk_in_level[2] = "specialty_quickrevive"; //Quick
		self.perk_shader[2] = "specialty_quickrevive_zombies"; 
	}
    if (isDefined(level.zombiemode_using_doubletap_perk) && level.zombiemode_using_doubletap_perk) 
    {
	 	self.All_Perk_in_level[3] = "specialty_rof"; //doubletop
		self.perk_shader[3] = "specialty_doubletap_zombies";
	}
    if (isDefined(level.zombiemode_using_marathon_perk) && level.zombiemode_using_marathon_perk)
	{
        self.All_Perk_in_level[4] = "specialty_longersprint"; //stamina
		self.perk_shader[4] = "specialty_marathon_zombies";
	}
    if(isDefined(level.zombiemode_using_additionalprimaryweapon_perk) && level.zombiemode_using_additionalprimaryweapon_perk)
	{
        self.All_Perk_in_level[5] = "specialty_additionalprimaryweapon"; // mule
		self.perk_shader[5] = "specialty_additionalprimaryweapon_zombies";
	}
    if (isDefined(level.zombiemode_using_deadshot_perk) && level.zombiemode_using_deadshot_perk)
    {
	    self.All_Perk_in_level[6] = "specialty_deadshot"; //deadshot
		self.perk_shader[6] = "specialty_ads_zombies";
	}
    if (isDefined(level.zombiemode_using_tombstone_perk) && level.zombiemode_using_tombstone_perk)
    {
	    self.All_Perk_in_level[7] = "specialty_scavenger"; //tombstone
		self.perk_shader[7] = "specialty_tombstone_zombies";
	}
    if (isDefined(level._custom_perks) && isDefined(level._custom_perks["specialty_flakjacket"]) && (level.script != "zm_buried"))
    {
		self.All_Perk_in_level[8] = "specialty_flakjacket"; // Vultra aid
		self.perk_shader[8] = "specialty_vulture_zombies";
	}
    if (isDefined(level._custom_perks) && isDefined(level._custom_perks["specialty_nomotionsensor"]))
 	{
	    self.All_Perk_in_level[9] = "specialty_nomotionsensor"; //cherry
		self.perk_shader[9] = "specialty_electric_cherry_zombie";
	}
    if (isDefined(level._custom_perks) && isDefined(level._custom_perks["specialty_grenadepulldeath"]))
    {  
		self.All_Perk_in_level[10] = "specialty_grenadepulldeath"; //PHD
		self.perk_shader[10] = "specialty_divetonuke_zombies";
	}
    if (isDefined(level.zombiemode_using_chugabud_perk) && level.zombiemode_using_chugabud_perk)
    {  
		self.All_Perk_in_level[11] = "specialty_finalstand"; //who's who
		self.perk_shader[11] = "specialty_chugabud_zombies";
	}
	if(self.milestonedebug == true)
	{
		self iprintln("Check all perks that are in the level."); 
	}
}

SetRandPerkShader(Perkname)
{
	if(self.milestonedebug == true)
	{
		self iprintln("^2SetRandPerkShader threaded");
	}
	if (Perkname ==  "specialty_armorvest")
	{
		self.PreshaderPerk = self.perk_shader[0];
	}

	if (Perkname ==  "specialty_fastreload")
	{
		self.PreshaderPerk = self.perk_shader[1];
	}

	if (Perkname ==  "specialty_quickrevive")
	{
		self.PreshaderPerk = self.perk_shader[2];
	}

	if (Perkname ==  "specialty_rof")
	{
		self.PreshaderPerk = self.perk_shader[3];
	}

	if (Perkname ==  "specialty_longersprint")
	{
		self.PreshaderPerk = self.perk_shader[4];
	}

	if (Perkname ==  "specialty_additionalprimaryweapon")
	{
		self.PreshaderPerk = self.perk_shader[5];
	}

	if (Perkname ==  "specialty_deadshot")
	{
		self.PreshaderPerk = self.perk_shader[6];
	}

	if (Perkname ==  "specialty_scavenger")
	{
		self.PreshaderPerk = self.perk_shader[7];
	}

	if (Perkname ==  "specialty_flakjacket")
	{
		self.PreshaderPerk = self.perk_shader[8];
	}

	if (Perkname ==  "specialty_nomotionsensor")
	{
		self.PreshaderPerk = self.perk_shader[9];
	}

	if (Perkname ==  "specialty_grenadepulldeath")
	{
		self.PreshaderPerk = self.perk_shader[10];
	}

	if (Perkname ==  "specialty_finalstand")
	{
		self.PreshaderPerk = self.perk_shader[11];
	}
	if(self.milestonedebug == true)
	{
		self iprintln("^2Setting PreshaderPerk to ^7" + self.PreshaderPerk);
	}
}

Power_Up_check()
{
	if (isDefined( level.zombie_include_powerups["nuke"]))
	{
		self.All_Power_Ups_in_level[0] = "nuke"; // Nuke power up
	}
	if (isDefined( level.zombie_include_powerups["insta_kill"]))
	{
		self.All_Power_Ups_in_level[1] = "insta_kill"; // insta kill power up
	}
	if (isDefined(level.zombie_include_powerups["full_ammo"]))
	{
		self.All_Power_Ups_in_level[2] = "full_ammo"; // max ammo power up
	}
	if (isDefined(level.zombie_include_powerups["double_points"]))
	{
		self.All_Power_Ups_in_level[3] = "double_points"; // double points power up
	}
	if (isDefined(level.zombie_include_powerups["carpenter"]))
	{
		self.All_Power_Ups_in_level[4] = "carpenter"; // carpenter power up
	}
	if (isDefined(level.zombie_include_powerups["fire_sale"]))
	{
		self.All_Power_Ups_in_level[5] = "fire_sale"; // fire sale power up
	}
	if(self.milestonedebug == true)
	{
		self iprintln("Check all powers up that are in the level.");
	}
}
// END OF MILESTONE System
