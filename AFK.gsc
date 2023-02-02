#include maps/mp/zombies/_zm_utility;
#include maps/mp/_utility;
#include maps/_utility;
#include common_scripts/utility;
#include maps/mp/zombies/_zm_spawner;
#include maps/mp/gametypes_zm/_hud_message;
#include maps/mp/gametypes_zm/_hud_util;
// Stick Gaming AFK Beta V4.3
// Some code in the script have been use or remix from other people round the internet
//
// Any contributors will be credited down below
// Nathan3197
// MrE
//
// Credit of use of other people code found on the internet
// fedddddd for extra GSC functions (Chat commands, set clan tag and custom kick msg) - https://github.com/fedddddd/t6-gsc-utils
//
// Big thanks to the pluto team for all there hard efforts to allow us to play BO2 with mods and servers.
	
	// AFK System V4.3
	// Created By Nathan3197 with assistant from MrE
	// For StickGaming T6ZM Servers
	/*
	TODO V4.3
	[X] If player havn't move for X amount of time AUTO AFK
	[] make this look nicer
	[] Pwnd some noob
	[] Check if players arn't to close to eachother so they do a pileup glitch
	*/




init()
{

	level thread onplayerconnect();
	level thread AFKCommandListener();
	level thread AFKCheck();
}


onplayerconnect()
{
	level endon ("end_game");
	for ( ;; )
	{
        level waittill( "connected", player );
		player thread AFK_listener(); // thread the AFK_listener

	}
}

// Start of AFK System
AFK_listener()
{

	level endon( "end_game" ); // this make things not break over longs games
	self endon( "end_game" ); // no idea but people still getting afk kicked on first use  when using /afk
	self endon( "disconnect" ); // this also does the same thing above
	self.SetupDone = false;
	self.isAFK = false;
	flag_wait( "initial_blackscreen_passed" ); // yeah we don't want this to run while the match is setting up
	//level waittill("end_of_round");
	self iprintln("AFK system creaded by ^2Nathan3197");

	wait 5;

	// Start of CONFIG
	self.afkcooldown = int(getDvarInt("afk_cooldown", 0));  // Cooldown untill player can turn on afk again (1min - 60, 2min - 90, 3min - 180, 4min - 240, 5min - 300)
	self.autoKick = int(getDvarInt("afk_autokick", 0)); 	// Timer to Auto kick the player if they in AFK for to long (5min - 300, 10min - 600, 15min - 900, 30min - 1800, 45min - 2700)
	self.disToTurnoff = int(getDvarInt("afk_distoturnoff", 0)); // the amount of distance the player need to move before AFK mode will turn off
	self.autoAFK = int(getDvarInt("afk_AutoAFK", 0)); 		// Timer for auto afk to turn on when player is not moving or pressing a button
	self.debugmode = int(getDvarInt("afk_debug", 0)); //turn on debug
	//checking if dvars are set to 0 if so we are resetting them to default
	if(self.afkcooldown == 0)
	{
		self.afkcooldown  = 30;
	}
	if(self.autoKick == 0)
	{
		self.autoKick = 300;
	}
	if(self.disToTurnoff == 0)
	{
		self.disToTurnoff = 15;
	}
	if(self.autoAFK == 0)
	{
		self.autoAFK = 60;
	}

	if(int(getDvar("afk_allowautoAFK")) == 1)
	{
		self.allowautoAFK = true; // allow auto afk
	}
	else
	{
		self.allowautoAFK = false; // allow auto afk
	}
	// END OF CONFIG

	self.PlayerNamet = self.name; // Get the player name
	self.isAFK = false; // set isAFK to false because you are using your keyboard or controller (also your a mad man if you play with no aimassit in T6)
	self.counter = 0; // Dont touch this Really don't touch this, if you do you break everything
	self.autoKickTimer = 0; // Don't touch this
	self.KickingPlayernow = false; // Don't touch this
	if(self.debugmode == 0)
	{
		self.AFKdebug = false; // Yes we do debug things
	}
	else
	{
		self.AFKdebug = true; // Yes we do debug things
	}

	self thread NoInputAFK(); // no move afk system
	self thread AutoAFKcommandListen(); // text command
	if(self.AFKdebug == true) // if thingy is true do this (i hope it not true on people that are not admin :l)
	{
		self iprintln("^2Thread AFK Listener"); // look this code is working
	}
	// // Set up Text
	// self.AKFTextTimer = self.autoKick / 60;
	// self.TextAFK = newclienthudelem(self); // cheap way to get around ClearAllTextAfterHudElem(); removing the text
	// self.TextAFK.x = 320;
	// self.TextAFK.y = 120;
	// self.TextAFK.alignx = "CENTER";
	// self.TextAFK.aligny = "CENTER";
	// self.TextAFK.horzalign = "fullscreen";
	// self.TextAFK.vertalign = "fullscreen";
	// self.TextAFK.alpha = 0;
	// self.TextAFK.fontscale = 5;
	// self.TextAFK.archived = 0;
	// self.TextAFK.foreground = 1;
	// self.TextAFK SetText("^2You are AFK, ^1YOU WILL BE KICK AFTER^3 " + self.AKFTextTimer + " ^7Min"); // get rekt AFKER
	// self.TextAFK.hidewheninmenu = 1;

	self.SetupDone = true;
	for(;;) // loop to check button presses
	{

		if(self.counter > 0 && self.isAFK == false ) // if counter is more then 0 & isafk false then run the countdown
		{
			self.counter--; // counter goes down everyscond
			if(self.AFKdebug == true)
			{
				self iprintln("^2Counter before going AFK is ^2" + self.counter); 
			}
			self IPrintLnBold("^1You have ^3" + self.counter +" ^1second until you can go ^2AFK ^3again"); // tells the player how long till they can go afk again
			wait 1;
		}
		else if(self.counter == 0 && self.isAFK == false) // if couter is 0 then player can go afk
		{
			if (self adsbuttonpressed() && self ActionSlotFourButtonPressed()) // if ADS & 2/DpadDown is pressed then run this
			{
				if(self.AFKdebug == true)
				{
					self iprintln("Ready for player to enter AFK"); 
				}
				self thread AFKON(); // runs afk on function
				wait 1.7; // to prevent spamming
			}

 		}
		if (self.isAFK == true) // if isAFK ture then check if the player has press or move any button
		{
			wait 0.15; // prevent auto trigger
			// If the Player presses any button ore move more then 10 units then AFKOFF will run.
			if ( self ActionSlotFourButtonPressed() | self attackbuttonpressed() | self jumpbuttonpressed() | self meleeButtonPressed() | self throwbuttonpressed() |  self actionslotonebuttonpressed() | self ActionSlotTwoButtonPressed() | self ActionSlotThreeButtonPressed() | self SprintButtonPressed() | self ChangeSeatButtonPressed() | self SecondaryOffhandButtonPressed() | self FragButtonPressed() | self UseButtonPressed() | Distance(self.old_origin, self.origin) >= self.disToTurnoff)
			{
				if(self.AFKdebug == true)
				{
					self iprintln("Player has press a button turning off AFK"); 
				}
				AllClientsPrint("^2"+self.PlayerNamet +"^7 is ^1NOT ^6AFK^7"); // tell all players that you are not AFK
				self thread AFKOFF(); // player runs AFKOFF function
				// self.TextAFK fadeovertime(0.50); // fade the text off
				// self.TextAFK.alpha = 0;
				wait 0.15;
			}			
		}
		wait 0.05;
		waittillframeend;
	}
}

AFKBARGUI()
{
	level endon( "end_game" ); // this make things not break over longs games
	self endon( "end_game" ); // no idea but people still getting afk kicked on first use  when using /afk
	self endon( "disconnect" ); // this also does the same thing above

	//self iprintln("bleedout bar new"); //debuging
	//we create a progress bar for the bleedout bar
	self.ProcessBar2 = createPrimaryProgressBar();
	self.ProcessBar2 setPoint("CENTER","CENTER",0,100);
	self.ProcessBar2.color = (0,0,0);
	self.ProcessBar2.bar.color = (0,1,0);
	self.ProcessBar2.alpha = 1;
	self.ProcessBar2.archived = 1;

	//we create a text displaying the bleedout timer
	self.AFK_Text = newclienthudelem( self );
	self.AFK_Text.x = 320;
	self.AFK_Text.y = 325;
	self.AFK_Text.alignx = "center";
	self.AFK_Text.aligny = "middle";
	self.AFK_Text.horzalign = "fullscreen";
	self.AFK_Text.vertalign = "fullscreen";
    self.AFK_Text.alpha = 0;
	self.AFK_Text.archived = 1;
    self.AFK_Text.fontscale = 1.2;
	self.AFK_Text.hidewheninmenu = 1;
	self.AFK_Text.label = &"You be kick in:^1 ";
	
	self.ProcessBar2 fadeovertime(0.50); // fade the text off
	self.ProcessBar2.alpha = 1;
	self.AFK_Text fadeovertime(0.50); // fade the text off
	self.AFK_Text.alpha = 1;

	//while we are down we update the bar and text
	while(self.isAFK == true)
	{
		self.ProcessBar2 updateBar(int(self.counter) / int(self.autoKick));
		self.AFK_Text setvalue(int(self.counter / 60));
		wait 1;
		waittillframeend;
	}
	self.AFK_Text fadeovertime(0.50); // fade the text off
	self.AFK_Text.alpha = 0;
	self.ProcessBar2 fadeovertime(0.50); // fade the text off
	self.ProcessBar2.alpha = 0;
	//we destroy the hud so we free up hud elemets for other scripts
	//self iprintln("hud destorty"); //debuging
	self.ProcessBar2 destroyElem();
	self.AFK_Text destroyElem();
}


NoInputAFK()
{
	level endon( "end_game" ); // this make things not break over longs games
	self endon( "end_game" ); // no idea but people still getting afk kicked on first use  when using /afk
	self endon( "disconnect" ); // this also does the same thing above
	flag_wait( "initial_blackscreen_passed" );
	flag_wait( "start_zombie_round_logic" );
	for(;;)
	{
		wait .15;
		if(self.sessionstate == "playing" & self.allowautoAFK == true)
		{
			prevorigin = self.origin;
    		while( isDefined( self ) )
    		{
        		wait .15;
				if(self.counter == 0 && self.isAFK == false)
				{
					if (self ActionSlotFourButtonPressed() | self attackbuttonpressed() | self jumpbuttonpressed() | self meleeButtonPressed() | self throwbuttonpressed() |  self actionslotonebuttonpressed() | self ActionSlotTwoButtonPressed() | self ActionSlotThreeButtonPressed() | self SprintButtonPressed() | self ChangeSeatButtonPressed() | self SecondaryOffhandButtonPressed() | self FragButtonPressed() | self UseButtonPressed())
					{
						movecounter = self.autoAFK;
						break;
					}
        			if ( self.origin == prevorigin )
					{
					
						movecounter--;
						prevorigin = self.origin;
						wait 1;
					}
					if(movecounter == 0)
					{
						self thread AFKON();
						movecounter = self.autoAFK;
						break;
					}
				}
				else
            	movecounter = self.autoAFK;
        		prevorigin = self.origin;
    		}
		}
	}
}
AFKCommandListener()
{
	// This Requires https://github.com/fedddddd/t6-gsc-utils in you t6r/data/plugin folder
	// THIS CAN ONLY WORK ON DEDI SERVER
    level endon("end_game");
	AFKCommand = ".afk"; //afk command 1
	AUTOAFKOFF = ".autoafk"; //
	wait 15;
    for(;;) 
    {
    	level waittill("say", message, player); // waiting till player has type in chat
    	if( isstrstart( tolower( message ), AFKCommand )) // check the message if it contain AFKCommand
		{


	    	player thread AFKON(); //if true turn on AFK for the player
			
    	}
		if( isstrstart( tolower( message ), AUTOAFKOFF )) // check the message if it contain AFKCommand
		{
	    	player notify("Auto_AFK_toggle"); //if true turn on AFK for the player
			player tell("auto afk off");
    	}
     	wait 0.05;
		waittillframeend;
    }
}

toLowerCase(text)
{
	self iprintln(text);
}

AFKON()
{
	level endon( "end_game" );
	self endon( "end_game" );
	self endon( "disconnect" );
	if(self.AFKdebug == true)
	{
		self iprintln("Thread AFKON, enable afk"); 
	}
	if(self.sessionstate == "playing")
	{
		if (self.counter == 0 & self.SetupDone == true)
		{
			self.autoKickTimer = self.autoKick;
			self.counter = self.afkcooldown; // reset counter to whatever afkcooldown is
			AllClientsPrint("^2"+self.PlayerNamet +"^7 is ^6AFK^7"); // tell all players that you are AFK
			self setclantag("AFK"); // require until_gsc.dll
			// self.TextAFK fadeovertime(0.50); // fade the text off
			// self.TextAFK.alpha = 1;
			wait 0.50;
			self.old_origin = self.origin;
			self.isAFK = true; // Set IS AFK TO TRUE
			self.ignoreme = 1; // Zombies wont find the player
			self enableInvulnerability(); // God mode is on
			self AFKAutoKick();
			self thread AFKBARGUI();
			self Destroy();
		}
		else
		{
			iprintln("You need to wait a round before you can go afk.");
		}
	}
}

AFKOFF()
{
	level endon( "end_game" ); // this make things not break over longs games
	self endon( "end_game" ); // no idea but people still getting afk kicked on first use  when using /afk
	self endon( "disconnect" ); // this also does the same thing above
	if(self.AFKdebug == true)
	{
		self iprintln("Thread AFKOFF dissable afk"); 
	}

	self.isAFK = false; // set IS AFK TO FALSE
	self.ignoreme = 0; // Zombies will find the player agian
	self disableInvulnerability(); // God mode is off
	self setclantag(""); // // require until_gsc.dll
	self Destroy();
	// self iprintln("^6AFK OFF"); // tell the player that they are not afk

}

AFKAutoKick()
{
	self notify( "nomultikickers" );
	self endon( "nomultikickers" );
	self endon( "end_game" );
	self endon( "disconnect" );
	self endon( "KickingPlayernow");
	while(self.isAFK)
	{
		if(self.AFKdebug == true)
		{
			self iprintln("player is AFK Timer and has ^2" + self.autoKickTimer + "^7 untill kick"); 
		}
		if(self.autoKickTimer > 0 && self.isAFK == true ) // if counter is more then 0 & isafk false then run the countdown
		{
			if( self.autoKickTimer <= 60 )
			{
				self iprintln("^1You will be kicked in ^2" + self.autoKickTimer + " ^6Seconds");
			}
			self.autoKickTimer--; // counter goes down every second
		}
		if ( self.autoKickTimer == 1 && self.KickingPlayernow == false )
		{
			if(self.AFKdebug == true)
			{
				self iprintln("Player has been afk for longer then the timer kicking the player"); 
			}
			wait 1;
			self.KickingPlayernow = true;
			
			level thread kicktheplayer(self.name);
			self notify( "KickingPlayernow" );
		} 
		wait 1;
	}
	self.autoKickTimer = self.autoKick; // once self.isAFK goes false timer resets and runc finishes but wont reset if player kicked
	return 0;
	
}

kicktheplayer(name)
{
	
	level endon( "end_game" );
	foreach (player in level.players) 
	{
		if (player.name == name)
		{
		 AllClientsPrint("Kicking ^6"  + name + " ^7For being AFK for to long");
		 wait 3;
		 executeCommand("clientkick_for_reason  " + player GetEntityNumber() + " \"" + " ^3Server^7: ^6You Where ^2AFK^6 For To Long" + "\"");  // Begone thots
		 break;
		}	
	
	}
}

AFKCheck()
{
	self endon("disconnect");
    level endon("end_game");
    level waittill("connected", player);
	// Start of Config
    Countdowntoendgame = 30; // set the timer to end the game 
	// End of Config
    countdown4 = 0;
    countdownISLIVE = false;
    peoplespec = 0;
    PeopleAlive = 0;
	for(;;)
	{		
   		foreach(player in getplayers())
    	{
   			if(player.isAFK == false && player.sessionstate == "playing")
    		{
   				PeopleAlive++;
   				//self thread printToAllPlayerAboutAFKWarning("People not afk: " + PeopleAlive);
   			}
   			if(player.sessionstate == "spectator")
   			{
   				peoplespec++;
   				//self thread printToAllPlayerAboutAFKWarning("People spectator: " + peoplespec);
   			}
   		}
   		if(PeopleAlive == 0)
    	{
    		if(peoplespec >= 1)
    		{
    			countdownISLIVE = true;
   				if(countdown4 > 0 && countdownISLIVE == true)
    			{
    				countdown4--;
    				self thread printToAllPlayerAboutAFKWarning("^1All alive players are ^3AFK! ^1the match is about to restart in ^6" + countdown4);
    				wait 1;
    			}
    			if (countdown4 == 0 && countdownISLIVE == true)
   				{
   					level notify("end_game"); // end the game
   				}
   			}
   		}
   		if (PeopleAlive >= 1)
   		{
   			peoplespec = 0;
   			PeopleAlive = 0;
   			countdownISLIVE = false;
   			countdown4 = Countdowntoendgame;
   		}
    	wait 1;
    }
}

printToAllPlayerAboutAFKWarning( msg )
{
	foreach( player in level.players)
	{
		player IPrintLnBold( msg );
	}
}

AutoAFKcommandListen()
{
	self endon("disconnect");
    level endon("end_game");
	for(;;)
	{
		self waittill("Auto_AFK_toggle");
		self.allowautoAFK = !self.allowautoAFK;
		wait 1;
	}
}
// End of AFK System

