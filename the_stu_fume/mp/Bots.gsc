#include mp\bots_funcs;
#using_animtree("multiplayer");

bots_init()
{
		bots_precacheStuff();
		bots_loadWaypoints();
		bots_declareDvars();
		thread bots_onPlayerConnect();
		thread bots_watch();
		thread fixGamemodes();
}

fixGamemodes()
{
	for(i=0;i<20;i++)
	{
		if(isDefined(level.bombZones) && level.gametype == "sd")
		{
			foreach(bombZone in level.bombZones)
				bombZone.onUse = ::bots_onUsePlantObjectFix;
			i = 20;
		}
		
		wait 0.05;
	}
}

bots_precacheStuff()
{
	level.bots_bloodfx = loadfx("impacts/flesh_hit_body_fatal_exit");
	level.bots_isNotLessAnimMap = bots_isNotLessAnimMap(getDvar("mapname"));
	level.bots_goalPoint = undefined;
	level.bots_goalRad = undefined;
	level.bots_defuseObject  = undefined;
	level.bots_smokeList = [];
	level.bots_fragList = [];
}

bots_declareDvars()
{
	setDvar("testClients_watchKillcam", false);
	setDvar("testclients_doReload", false);
	setDvar("testclients_doMove", false);
	setDvar("testclients_doAttack", false);
	setDvar("testclients_doCrouch", false);
	
	setDvarIfUninitialized("bots_skill", 0);//0 is random, 1 is easy 7 is hard, 8 is custom, 9 is completely random
	setDvarIfUninitialized("bots_skill_axis_hard", 0);//amount of hard bots on axis team
	setDvarIfUninitialized("bots_skill_axis_med", 0);
	setDvarIfUninitialized("bots_skill_allies_hard", 0);
	setDvarIfUninitialized("bots_skill_allies_med", 0);
	
	setDvarIfUninitialized("bots_loadout", "default");//loadout mode
	setDvarIfUninitialized("bots_loadout_killstreak", "default");//killstreak mode
	setDvarIfUninitialized("bots_loadout_nuke", false);//use nukes
	setDvarIfUninitialized("bots_loadout_changeClass", false);//chance to change class
	setDvarIfUninitialized("bots_loadout_rememberClass", false);//will remember class
	setDvarIfUninitialized("bots_loadout_deathstreak", false);//
	setDvarIfUninitialized("bots_loadout_lastStand", false);//
	setDvarIfUninitialized("bots_loadout_tube", false);//
	setDvarIfUninitialized("bots_loadout_riot", false);//
	setDvarIfUninitialized("bots_loadout_sniper", false);//
	setDvarIfUninitialized("bots_loadout_nade", false);//
	setDvarIfUninitialized("bots_loadout_shotgun", true);//will use *
	setDvarIfUninitialized("bots_loadout_secondary", false);//use secondarys
	setDvarIfUninitialized("bots_loadout_knife", false);//use the knife
	setDvarIfUninitialized("bots_play_watchKillcam", false);//bots chance to watch killcam
	setDvarIfUninitialized("bots_play_run", false);//bots chance to run
	setDvarIfUninitialized("bots_play_tdks", false);//attack killsteaks
	setDvarIfUninitialized("bots_play_destroyEq", false);//attack equ
	setDvarIfUninitialized("bots_play_attack", false);//attack
	setDvarIfUninitialized("bots_play_aim", false);//aim
	setDvarIfUninitialized("bots_play_outOfMyWay", false);//
	setDvarIfUninitialized("bots_play_takeCare", false);//
	setDvarIfUninitialized("bots_play_obj", false);//
	setDvarIfUninitialized("bots_play_camp", false);//
	setDvarIfUninitialized("bots_play_move", false);//
	setDvarIfUninitialized("bots_play_doStuck", false);//
	setDvarIfUninitialized("bots_play_fakeAnims", false);//
	setDvarIfUninitialized("bots_play_throwback", false);//
	setDvarIfUninitialized("bots_setup", false);//
	setDvarIfUninitialized("bots_main_experience", -1);//experience, -1 is random
	setDvarIfUninitialized("bots_main_prestige", -1);//presige, -1 is random
	setDvarIfUninitialized("bots_main_title", "");//title, "" is random
	setDvarIfUninitialized("bots_main_emblem", "");//emblem, "" is random
	setDvarIfUninitialized("bots_main_GUIDs", "");//host GUIDs, "" for off
	setDvarIfUninitialized("bots_main_Names", "INeedGames,INeedbots");//host names, "" for off
	setDvarIfUninitialized("bots_main_menu", true);//enable host menu
	setDvarIfUninitialized("bots_main_target", "");
	
	if (!isDefined(level.bots_knifeDis))
		level.bots_knifeDis = 100;//for how far bots can knife
	if (!isDefined(level.bots_knifeDisPerk))
		level.bots_knifeDisPerk = 50;//how far extra commando adds
	if (!isDefined(level.bots_minNadeDis))
		level.bots_minNadeDis = 400;//how far bots can nade at min distance
	if (!isDefined(level.bots_moveSpeedBase))
		level.bots_moveSpeedBase = 1;//scaler of how fast bots will move
}

bots_watch()
{
	fillMode = getDvarInt("bots_manage_fill_mode");
	if(fillMode == 2 || fillMode == 3)
		setDvar("bots_manage_fill", -1);
	for(;;)
	{
		level bots_watchBots();
		if(randomint(333) == 1)
		{
			setDvar("testclients_doreload", true);
			wait 0.1;
			setDvar("testclients_doreload", false);
			doExtraCheck();
		}
		bots_waitFrame();
		
		if(getDvarInt("bots_manage_reset"))
		{
			level bots_resetBots();
			setDvar("bots_manage_reset", 0);
		}
		bots_waitFrame();
			
		botsToAdd = getDvarInt("bots_manage_add");
		if(botsToAdd > 0)
		{
			if(botsToAdd < 65)
				YeetAddDABOTS(botsToAdd);
			else
				YeetAddDABOTS(64);
			setDvar("bots_manage_add", 0);
		}
		bots_waitFrame();
		
		fillAmount = getDvarInt("bots_manage_fill");
		if(fillAmount == -1)
		{
			daAmount = bots_getGoodMapAmount();
			setDvar("bots_manage_fill", daAmount);
			fillAmount = daAmount;
		}
		
		amount = bots_countFillPlayers();
		if(amount < fillAmount)
			setDvar("bots_manage_add", 1);
		else if(amount > fillAmount && getDvarInt("bots_manage_fill_kick"))
			kick( bots_getRandomBot() getEntityNumber(), "EXE_PLAYERKICKED" );
		
		wait 1;
	}
}

bots_resetBots()
{
	foreach(player in level.players)
	{
		player bots_deleteFakeAnim();
		player notify("bot_reset");
		player freezecontrols(false);
		if(player bots_playerIsABot())
			player thread bots_Added();
	}
}

bots_watchBots()
{
	Skill = getDVarInt("bots_skill");
	botsTeam = getDVar("bots_team");
	doForceTeam = getDVarInt("bots_team_force");
	
	allies_hard = 0;
	allies_med = 0;
	axis_hard = 0;
	axis_med = 0;
	foreach(player in level.players)
	{
		if(player bots_playerIsABot())
		{
			if(Skill == 8)
			{
				if(player.pers["team"] == "allies")
				{
					if(allies_hard < getDvarInt("bots_skill_allies_hard"))
					{
						allies_hard++;
						player.pers["bots"]["skill"]["base"] = 6;
					}
					else if(allies_med < getDvarInt("bots_skill_allies_med"))
					{
						allies_med++;
						player.pers["bots"]["skill"]["base"] = 3;
					}
					else
						player.pers["bots"]["skill"]["base"] = 0;
				}
				else if(player.pers["team"] == "axis")
				{
					if(axis_hard < getDvarInt("bots_skill_axis_hard"))
					{
						axis_hard++;
						player.pers["bots"]["skill"]["base"] = 6;
					}
					else if(axis_med < getDvarInt("bots_skill_axis_med"))
					{
						axis_med++;
						player.pers["bots"]["skill"]["base"] = 3;
					}
					else
						player.pers["bots"]["skill"]["base"] = 0;
				}
			}
			if(botsTeam == "custom")
			{
				if(player.pers["team"] == "axis")
				{
					if(bots_countAxisPlayers() > getDVarInt("bots_team_amount"))
						player bots_changeToTeam("allies");
				}
				else
				{
					if(bots_countAxisPlayers() < getDVarInt("bots_team_amount") && player.pers["team"] != "axis")
						player bots_changeToTeam("axis");
					else if(player.pers["team"] != "allies")
						player bots_changeToTeam("allies");
				}
			}
			else
			{
				if(doForceTeam && botsTeam != "autoassign" && player.pers["team"] != botsTeam)
					player bots_changeToTeam(botsTeam);
			}
		}
	}
	
	if(doForceTeam && botsTeam == "autoassign")
	{
		axis = bots_countAxisPlayers();
		allies = bots_countAlliesPlayers();
		if(abs(axis - allies) > 1)
		{
			if(axis > allies)
			{
				foreach(player in level.players)
				{
					if(player bots_playerIsABot())
					{
						if(player.pers["team"] != "allies")
						{
							player bots_changeToTeam("allies");
							break;
						}
					}
				}
			}
			else
			{
				foreach(player in level.players)
				{
					if(player bots_playerIsABot())
					{
						if(player.pers["team"] != "axis")
						{
							player bots_changeToTeam("axis");
							break;
						}
					}
				}
			}
		}
	}
}

YeetAddDABOTS(numberOfTestClients)
{
	for(i = 0; i < numberOfTestClients; i++)
	{
		ent[i] = addtestclient();
		if (isDefined(ent[i]))
		{
			ent[i].pers["isBot"] = true;
			ent[i] notify("bot_reset");
			ent[i].bots_fixOnce = 1;
			ent[i] thread bots_Added();
			wait 0.25;
		}
	}
}

bots_watchDisconnect()
{
	self thread bots_watchRestart();
	self endon("bot_reset");
	self waittill("disconnect");
	self bots_deleteFakeAnim();
	self notify("bot_reset");
}

bots_watchRestart()
{
	self endon("bot_reset");
	level waittill("restarting");
	self bots_deleteFakeAnim();
	self notify("bot_reset");
}

bots_Added()
{
	self thread bots_watchDisconnect();
	self endon("bot_reset");
	if(getDvarInt("bots_setup") == 1)
	{
	pres = getDvarInt("bots_main_prestige");
	if( pres < 0 ) 
        self setPlayerData("prestige", randomint(12));
    else
       self setPlayerData("prestige", pres);
	
	rank = getDvarInt("bots_main_experience");
    if( rank < 0 )
		self setPlayerData("experience", RandomInt(2516001));
    else
        self setPlayerData("experience", rank);
	
	title = getDvar("bots_main_title");
	if(title == "")
		self setPlayerData("cardTitle", self mp\TitleEmblem::Title());
	else
		self setPlayerData("cardTitle", title);
	
	emblem = getDvar("bots_main_emblem");
	if(emblem == "")
		self setPlayerData("cardIcon", self mp\TitleEmblem::Emblem());
	else
		self setPlayerData("cardIcon", emblem);
	}
	
	self bots_initVars();
	self bots_traitAndSkill();
	self mp\bots_killstreak::bots_setupBotStreaks();
	
	self bots_changeToTeam(getdvar("bots_team"));
	
	if(!level.gameEnded)
		self thread bots_StartBots();
}

bots_initVars()
{
	self.bots_fixOnce = 1;//multiround fix
	self.bots_lastkill = undefined;//player the bot last killed
	self.bots_gotKilled = undefined;//player the bot last got killed by
	self.bots_gotKilledLoc = undefined;//location of death
	self.bots_atDeathLoc = false;//was at death loc
	self.bots_doing = "none";//bot's action
	self.bots_objDoing = "none";//extrnal obj stuff
	self.bots_isCare = undefined;//airdrop going to take
	self.bots_aimDoing = "none";//extranal aim stuff
	self.bots_campingAngles = undefined;//camping angles
	self.bots_lastKS = 0;//how big was last ks before death
	self.bots_switchTime = false;//how long been since switched weapons anti switch spam
	self.bots_shootTime = false;//for anti semi spam
	self.bots_running = false;//tempVar(tm) if is running
	self.bots_runTime = 0;//how much can run in time
	self.bots_camping = false;//is camping
	self.bots_realSeen = undefined;//target player
	self.bots_realEqu = undefined;//target equ
	self.bots_weapDist = 0;//weap effective distance
	
	self bots_deleteFakeAnim();
	
	self.bots_currentStaticWp = -1;//walking vars
	self.bots_tempwp = (0, 0, 0);
	self.bots_vObjectivePos = (0, 0, 0);
	self.bots_type = "stand";
	self.bots_fMoveSpeed = 0;
	self.bots_dynWaypointList = [];
	self.bots_dynWaypointCount = 0;
	self.bots_currDynWaypoint = 0;
	
	self.bots_traitRandom = 0;//random trait every spawn
	
	self.pers["bots"]["class"]["primary"] = "";
	self.pers["bots"]["class"]["primaryCamo"] = 0;
	self.pers["bots"]["class"]["secondary"] = "";
	self.pers["bots"]["class"]["secondaryCamo"] = 0;
	self.pers["bots"]["class"]["perk1"] = "";
	self.pers["bots"]["class"]["perk1pro"] = "";
	self.pers["bots"]["class"]["perk2"] = "";
	self.pers["bots"]["class"]["perk2pro"] = "";
	self.pers["bots"]["class"]["perk3"] = "";
	self.pers["bots"]["class"]["perk3pro"] = "";
	self.pers["bots"]["class"]["deathPerk"] = "";
	self.pers["bots"]["class"]["grenade"] = "";
	self.pers["bots"]["class"]["offhand"] = "";
	self.pers["bots"]["class"]["set"] = false;
	
	self.pers["bots"]["killstreaks"][0] = "";
	self.pers["bots"]["killstreaks"][1] = "";
	self.pers["bots"]["killstreaks"][2] = "";
	
	self.pers["bots"]["trait"]["vengeful"] = 0;//kill last person got killed by
	self.pers["bots"]["trait"]["talk"] = 0;//bot's personal talk amount
	self.pers["bots"]["trait"]["killsOverObj"] = 0;//loves to kill over obj
	self.pers["bots"]["trait"]["camp"] = 0;//how often to camp
	self.pers["bots"]["trait"]["follow"] = 0;//how often to follow
	self.pers["bots"]["trait"]["cfTime"] = 0;//how long to camp/follow
	self.pers["bots"]["trait"]["knife"] = 0;//how often to use knife
	self.pers["bots"]["trait"]["nade"] = 0;//how often to grenade
	self.pers["bots"]["trait"]["switch"] = 0;//how often to switch to offhand
	self.pers["bots"]["trait"]["rage"] = 0;//how often to ragequit
	self.pers["bots"]["trait"]["change"] = 0;//how often to change class
	self.pers["bots"]["trait"]["watch"] = 0;//how often to watch killcam
	self.pers["bots"]["trait"]["run"] = 0;//how often to run
	self.pers["bots"]["trait"]["playStyle"] = 0;//knifer, shotguner, etc//1 knifer//2 secondary junkie

	self.pers["bots"]["skill"]["base"] = 0;//base skill level-more depth thinking 0 easy 6 hard dvar:0 random 1 easy 7 hard 8 custom 9 compRandom
	self.pers["bots"]["skill"]["viewDis"] = 0;//view distance
	self.pers["bots"]["skill"]["aimSpeed"] = 0;//aim speed
	self.pers["bots"]["skill"]["acc"] = 0;//accuracy
	self.pers["bots"]["skill"]["spawnWait"] = 0;//time to react when respawned
	self.pers["bots"]["skill"]["shootDelay"] = 0;//time to react with shooting (did you know this simple 'wait' was the very first spark to have me create my own bot mod?)
	self.pers["bots"]["skill"]["perfView"] = 0;//degrees in angle of puerperal vision
	self.pers["bots"]["skill"]["newTarg"] = 0;//how long to aim at new target
}

bots_traitAndSkill()
{
	self.pers["bots"]["trait"]["vengeful"] = randomint(3);
	self.pers["bots"]["trait"]["killsOverObj"] = randomint(3);
	self.pers["bots"]["trait"]["camp"] = RandomIntRange(300,1500);
	self.pers["bots"]["trait"]["follow"] = RandomIntRange(600,1500);
	self.pers["bots"]["trait"]["cfTime"] = RandomIntRange(30,90);
	self.pers["bots"]["trait"]["knife"] = randomint(3);
	self.pers["bots"]["trait"]["nade"] = 400;
	self.pers["bots"]["trait"]["switch"] = 125;
	self.pers["bots"]["trait"]["rage"] = randomInt(15);
	self.pers["bots"]["trait"]["run"] = randomintrange(100,250);
	self.pers["bots"]["trait"]["playStyle"] = 0;
	self.pers["bots"]["trait"]["watch"] = randomint(10);
	self.pers["bots"]["trait"]["change"] = randomint(25);
	if(randomint(2))
		self.pers["bots"]["trait"]["talk"] = self.pers["bots"]["trait"]["talk"] + randomint(4);
	else
		self.pers["bots"]["trait"]["talk"] = self.pers["bots"]["trait"]["talk"] - randomint(4);
	
	if(!getdvarint("bots_skill")) {
		switch(randomint(25)) {
			case 0:
			case 10:
				self.pers["bots"]["skill"]["base"] = 0;
			break;
			case 1:
			case 11:
			case 2:
			case 12:
			case 23:
				self.pers["bots"]["skill"]["base"] = 1;
			break;
			case 3:
			case 13:
			case 18:
			case 24:
				self.pers["bots"]["skill"]["base"] = 2;
			break;
			case 14:
			case 15:
			case 16:
			case 17:
			case 22:
			case 4:
			case 5:
			case 6:
				self.pers["bots"]["skill"]["base"] = 3;
			break;
			case 7:
			case 19:
			case 21:
				self.pers["bots"]["skill"]["base"] = 4;
			break;
			case 8:
			case 20:
				self.pers["bots"]["skill"]["base"] = 5;
			break;
			case 9:
				self.pers["bots"]["skill"]["base"] = 6;
			break;
		}
	} else {
		if(getdvarint("bots_skill") == 9) {
			self.pers["bots"]["skill"]["base"] = randomint(7);
			self.pers["bots"]["skill"]["viewDis"] = RandomIntRange(500,10000);
			self.pers["bots"]["skill"]["aimSpeed"] = RandomIntRange(2,9);
			self.pers["bots"]["skill"]["acc"] = 0;
			self.pers["bots"]["skill"]["spawnWait"] = RandomFloatRange(0, 1.5);
			self.pers["bots"]["skill"]["shootDelay"] = RandomFloatRange(0, 1.5);
			self.pers["bots"]["skill"]["perfView"] = RandomFloatRange(0.5,0.95);
			self.pers["bots"]["skill"]["newTarg"] = RandomFloatRange(0,1.5);
		}
	}
}

bots_doSkillSpeedPerk()
{
	self endon("bot_reset");
	self endon("death");
	
	if(level.gameType == "gg")
	{
		self setspawnweapon(level.weaponList[self.tier]);
	}
	else if(level.gameType == "oitc")
	{
		self setspawnweapon("beretta_mp");
	}
	else if(level.gameType == "ss")
	{
		self setspawnweapon(level.currentWeapon);
	}
	else if(level.gameType == "infected" && self.team == "allies")
	{
		self setspawnweapon(level.infc_primaryWep);
	}
	
	for(i=0;;i++)
	{
		dvarSkill = getDvarint("bots_skill");
		switch(dvarSkill)
		{
			case 1:
				self.pers["bots"]["skill"]["base"] = 0;
			break;
			case 2:
				self.pers["bots"]["skill"]["base"] = 1;
			break;
			case 3:
				self.pers["bots"]["skill"]["base"] = 2;
			break;
			case 4:
				self.pers["bots"]["skill"]["base"] = 3;
			break;
			case 5:
				self.pers["bots"]["skill"]["base"] = 4;
			break;
			case 6:
				self.pers["bots"]["skill"]["base"] = 5;
			break;
			case 7:
				self.pers["bots"]["skill"]["base"] = 6;
			break;
		}
		if(dvarSkill != 9)
		{
			switch(self.pers["bots"]["skill"]["base"])
			{
				case 0://easy
					self.pers["bots"]["skill"]["viewDis"] = 1000;
					self.pers["bots"]["skill"]["aimSpeed"] = 8;
					self.pers["bots"]["skill"]["acc"] = 0;
					self.pers["bots"]["skill"]["spawnWait"] = 1;
					self.pers["bots"]["skill"]["shootDelay"] = 1;
					self.pers["bots"]["skill"]["perfView"] = 0.85;
					self.pers["bots"]["skill"]["newTarg"] = 1;
				break;
				case 1:
					self.pers["bots"]["skill"]["viewDis"] = 1500;
					self.pers["bots"]["skill"]["aimSpeed"] = 7;
					self.pers["bots"]["skill"]["acc"] = 0;
					self.pers["bots"]["skill"]["spawnWait"] = 0.75;
					self.pers["bots"]["skill"]["shootDelay"] = 0.75;
					self.pers["bots"]["skill"]["perfView"] = 0.8;
					self.pers["bots"]["skill"]["newTarg"] = 0.75;
				break;
				case 2:
					self.pers["bots"]["skill"]["viewDis"] = 2250;
					self.pers["bots"]["skill"]["aimSpeed"] = 6;
					self.pers["bots"]["skill"]["acc"] = 0;
					self.pers["bots"]["skill"]["spawnWait"] = 0.666;
					self.pers["bots"]["skill"]["shootDelay"] = 0.666;
					self.pers["bots"]["skill"]["perfView"] = 0.75;
					self.pers["bots"]["skill"]["newTarg"] = 0.666;
				break;
				case 3://med
					self.pers["bots"]["skill"]["viewDis"] = 2750;
					self.pers["bots"]["skill"]["aimSpeed"] = 5;
					self.pers["bots"]["skill"]["acc"] = 0;
					self.pers["bots"]["skill"]["spawnWait"] = 0.5;
					self.pers["bots"]["skill"]["shootDelay"] = 0.5;
					self.pers["bots"]["skill"]["perfView"] = 0.7;
					self.pers["bots"]["skill"]["newTarg"] = 0.5;
				break;
				case 4:
					self.pers["bots"]["skill"]["viewDis"] = 4000;
					self.pers["bots"]["skill"]["aimSpeed"] = 4;
					self.pers["bots"]["skill"]["acc"] = 0;
					self.pers["bots"]["skill"]["spawnWait"] = 0.333;
					self.pers["bots"]["skill"]["shootDelay"] = 0.25;
					self.pers["bots"]["skill"]["perfView"] = 0.65;
					self.pers["bots"]["skill"]["newTarg"] = 0.333;
				break;
				case 5:
					self.pers["bots"]["skill"]["viewDis"] = 6000;
					self.pers["bots"]["skill"]["aimSpeed"] = 3;
					self.pers["bots"]["skill"]["acc"] = 0;
					self.pers["bots"]["skill"]["spawnWait"] = 0.25;
					self.pers["bots"]["skill"]["shootDelay"] = 0.1;
					self.pers["bots"]["skill"]["perfView"] = 0.6;
					self.pers["bots"]["skill"]["newTarg"] = 0.25;
				break;
				case 6://hard
					self.pers["bots"]["skill"]["viewDis"] = 9999;
					self.pers["bots"]["skill"]["aimSpeed"] = 2;
					self.pers["bots"]["skill"]["acc"] = 0;
					self.pers["bots"]["skill"]["spawnWait"] = 0;
					self.pers["bots"]["skill"]["shootDelay"] = 0;
					self.pers["bots"]["skill"]["perfView"] = 0.55;
					self.pers["bots"]["skill"]["newTarg"] = 0;
				break;
			}
		}
		currentWeapon = self getCurrentWeapon();
		if(level.gameType == "gg")
		{
			if(isDefined(level.weaponList[self.tier]) && currentWeapon != level.weaponList[self.tier])
				self setspawnweapon(level.weaponList[self.tier]);
		}
		else if(level.gameType == "ss")
		{
			if(isDefined(level.currentWeapon) && currentWeapon != level.currentWeapon)
				self setspawnweapon(level.currentWeapon);
		}
		
		acc = self.pers["bots"]["skill"]["acc"];
		weapClass = bots_weapClass(currentWeapon);
		switch(weapClass)
		{
			case "sniper":
				if(getDvar("g_gametype") == "sd")
				{
					acc = acc - 0;
				}
				else
					acc = 5;
				self.bots_weapDist = 9999;
			break;
			case "spread":
			if(getDvar("g_gametype") == "sd")
			{
				acc = acc - 0;
			}
			else
			acc = acc - 5;
				self.bots_weapDist = 9999;
			break;
			default:
				self.bots_weapDist = 9999;
			break;
		}
		self setspreadoverride(acc);
		
		if(isDefined( self.lastStand ))
		{
			if(self mp\bots_walk::bots_CanMove())
				self.bots_fMoveSpeed = 1;
			else
				self.bots_fMoveSpeed = 0;
			if(!self bots_hasPerk("specialty_finalstand"))
			{
				if(weapClass != "pistol")
				{
					sec = self bots_getSecondaryName();
					if(bots_weapClass(sec) != "pistol" || !getdvarint("bots_loadout_secondary"))
					{
						self bots_giveWeapon("beretta_mp");
						self setspawnweapon("beretta_mp");
					}
					else
					{
						self setspawnweapon(sec);
					}
					self mp\bots_aim::bots_stopShooting();
					self.bots_doing = "switch";
					wait 1;
				}
				self.bots_doing = "laststand";
			}
		}
		else
		{
			self setStance(self.bots_type);
			
			if(!self mp\bots_walk::bots_CanMove()){
				self.bots_fMoveSpeed = 0;
			} else {
				switch(self GetStance()){
					case "stand":
						self.bots_fMoveSpeed = 7.5;
					break;
					case "crouch":
						self.bots_fMoveSpeed = 3.999;
					break;
					case "prone":
						self.bots_fMoveSpeed = 1.75;
					break;
				}
				if(self.bots_running) {
					self.bots_fMoveSpeed = self.bots_fMoveSpeed * 1.5;
				}
				if(self mp\bots_aim::bots_isShellShocked()) {
					self.bots_fMoveSpeed = 1.5;
				}
				if(self mp\bots_aim::bots_isClimbing()){
					self.bots_fMoveSpeed = 7.5;
					if(!self bots_hasPerk("specialty_fastmantle"))
						self.bots_fMoveSpeed = self.bots_fMoveSpeed * 0.25;
					else
						self.bots_fMoveSpeed = self.bots_fMoveSpeed * 0.5;
				}
				if(self bots_hasPerk("specialty_lightweight"))
					self.bots_fMoveSpeed = self.bots_fMoveSpeed * 1.15;
				
				if(self.pers["bots"]["trait"]["playStyle"] == 1){
					sec = bots_getSecondaryName();
					if(isSubStr(sec, "tactical_") && !isSubStr(currentWeapon, "tactical_") && getdvarint("bots_loadout_secondary")){
						self setspawnweapon(sec);
					}
				}
					
				self.bots_fMoveSpeed = self.bots_fMoveSpeed*(getdvarfloat("g_speed")/190.0);
				self.bots_fMoveSpeed = self bots_UpdateSpeed();
				self.bots_fMoveSpeed = self.bots_fMoveSpeed*self.moveSpeedScaler;
				self.bots_fMoveSpeed = self.bots_fMoveSpeed*level.bots_moveSpeedBase;
			}
		}
		
		if(self bots_hasPerk("specialty_onemanarmy") && self.bots_doing != "laptop")
		{
			if(currentWeapon != "none")
			{
				self GiveMaxAmmo( currentWeapon );
				if(self bots_hasPerk("specialty_omaquickchange"))
				{
					if(i > 5)
					{
						self setWeaponAmmoClip( currentWeapon, 999 );
					}
				}
			}
		}
		
		if(i > 5)
			i = 0;
		wait 0.5;
	}
}

bots_UpdateSpeed()
{
	weapon = self GetCurrentWeapon();
	if(weapon == "riotshield_mp")
		return self.bots_fMoveSpeed*0.8;
	
	weapClass = bots_weapClass( weapon );
	switch ( weapClass )
	{
		case "rifle":
			return self.bots_fMoveSpeed*0.95;
		case "pistol":
			return self.bots_fMoveSpeed;
		case "mg":
			return self.bots_fMoveSpeed*0.875;
		case "smg":
			return self.bots_fMoveSpeed;
		case "spread":
			return self.bots_fMoveSpeed*0.95;
		case "rocketlauncher":
			return self.bots_fMoveSpeed*0.8;
		case "sniper":
			return self.bots_fMoveSpeed;//wtf
		default:
			return self.bots_fMoveSpeed;
	}
}

bots_StartBots()
{
	self thread bots_onBotEnd();
	self thread bots_onGiveLoadout();
	self thread bots_onBotKill();
	self thread bots_onGetKS();
	self thread bots_onNukeCall();
	self thread bots_onBotSpawn();
	self thread bots_onBotDeath();
	self thread mp\bots_killstreak::bots_watchConKS();
	self thread bots_onPreDeathFrame();
}

bots_UseRunThink()
{
	self endon("death");
	self endon("bot_reset");
	for(;;)
	{
		if(self.bots_running)
		{
			if(!self bots_hasPerk("specialty_marathon"))
			{
				self.bots_runTime = self.bots_runTime - 0.05;
			}
		}
		else
		{
			if(self.bots_runTime < getdvarfloat("scr_player_sprinttime"))
				self.bots_runTime = self.bots_runTime + 0.05;
		}
		wait 0.05;
	}
}

bots_ThinkToRun()
{
	self endon("death");
	self endon("bot_reset");
	for(;;)
	{
		if(self.bots_running)
		{
			if(isDefined(self.bots_realSeen) && self.pers["bots"]["trait"]["playStyle"] != 1)
			{
				if(self bots_hasPerk("specialty_fastsprintrecovery"))
					wait 0.5;
				else
					wait 1;
					
				self.bots_running = false;
			}
			if(self.bots_runTime <= 0 || self.bots_camping || self.bots_doing != "none" || randomint(self.pers["bots"]["trait"]["run"]) == 200 || self.bots_type != "stand" || isDefined( self.lastStand ))
				self.bots_running = false;
		}
		else
		{
			if(self.bots_runTime > 1.5 && randomint(self.pers["bots"]["trait"]["run"]) == 150 && (!isDefined(self.bots_realSeen) || self.pers["bots"]["trait"]["playStyle"] == 1) && !self.bots_camping && self.bots_doing == "none" && self.bots_type == "stand" && getdvarint("bots_play_run") && !isDefined( self.lastStand ))
				self.bots_running = true;
		}
		bots_waitFrame();
	}
}

bots_onBotSpawn()
{
	self endon("bot_reset");
	for(;;)
	{
		self.wantSafeSpawn = true;//force respawn
		
		self.bots_traitRandom = randomint(6);
	
		self.bots_running = false;
		self.bots_runTime = getdvarfloat("scr_player_sprinttime");
		self.bots_doing = "none";
		self.bots_aimDoing = "none";
		self.bots_isCare = undefined;
		self.bots_campingAngles = undefined;
		self.bots_objDoing = "none";
		self.bots_shootTime = false;
		self.bots_switchTime = false;
		self.bots_camping = false;
		self.bots_realSeen = undefined;
		self.bots_realEqu = undefined;
		self.bots_weapDist = 0;
		
		self bots_deleteFakeAnim();
		
		self.bots_currentStaticWp = -1;
		self.bots_tempwp = (0, 0, 0);
		self.bots_vObjectivePos = self getOrigin();
		self.bots_type = "stand";
		self.bots_fMoveSpeed = 0;
		self.bots_dynWaypointList = [];
		self.bots_dynWaypointCount = 0;
		self.bots_currDynWaypoint = 0;
		
		self.bots_lastKS = 0;
		
		//self maps\mp\killstreaks\_killstreaks::giveKillstreak( "helicopter_minigun", false );
		
		self thread bots_doBotSpawn();
			
		self waittill( "spawned_player" );
	}
}

bots_doBotSpawn()
{
	self endon("bot_reset");
	self endon("death");
	
	self thread bots_claymoreFix();
	self thread bots_doSkillSpeedPerk();
	self thread bots_UseRunThink();
	
	self freezecontrols(true);
	bots_gameFlagWait( "prematch_done" );
	self freezecontrols(true);
	
	wait self.pers["bots"]["skill"]["spawnWait"];
	
	self thread bots_ThinkToRun();
	self thread mp\bots_aim::bots_MainAimbot();
	self thread mp\bots_killstreak::bots_watchUseKillStreak();
	self thread mp\bots_walk::bots_getObj();
	self thread mp\bots_walk::bots_doMovement();
	self thread mp\bots_walk::bots_dostuck();
	self thread bots_doAnimations();
	self thread bots_throwback();
}

bots_throwback()
{
	self endon("bot_reset");
	self endon("death");
	for(;;)
	{
		if(getDvarInt("bots_loadout_nade") && getDvarInt("bots_play_throwback") && level.bots_fragList.size)
		{
			foreach(frag in level.bots_fragList)
			{
				if(!level.teamBased || self.pers["team"] != frag.owner.pers["team"] || frag.owner == self)
				{
					if(distance(self.origin, frag.nade.origin) > 100)
						continue;
					if(!bulletTracePassed( self getEye(), frag.nade.origin, false, frag.nade ))
						continue;
					if(self bots_doingNothing() && !isdefined(frag.throwback))
					{
						self bots_doThrowback(frag);
						break;
					}
				}
			}
		}
		wait 1;
	}
}

bots_doThrowback(frag)
{
	self endon("bot_kill_nade");
	
	frag.throwback = 1;

	hadFrag = self getAmmoCount("frag_grenade_mp");
	hasFrag = self hasWeapon("frag_grenade_mp");

	if(!hasFrag)
	{
		self bots__giveWeapon("frag_grenade_mp", 0);
		self giveStartAmmo( "frag_grenade_mp" );
	}

	lastWeapon = self getCurrentWeapon();
	self setspawnweapon("frag_grenade_mp");

	self.bots_doing = "nade_fire";
	
	self thread bots_watchTimeoutThrowBack(hasFrag, lastWeapon, frag);
	self thread mp\bots_aim::bots_forceGNadeFire();
	self thread bots_freeNadeOnDeath(frag);
	
	self waittill("grenade_fire", grenade, weapname);
	if(isSubStr(weapname, "frag_"))
	{
		if(bots_isReallyAlive(self))
		{
			grenade.owner = self;
			grenade.threwBack = true;
			self thread bots_incPlayerStat( "throwbacks", 1 );
			grenade thread maps\mp\gametypes\_shellshock::grenade_earthQuake();
			grenade.originalOwner = frag.owner;
			
			if(hadFrag)
			{
				self setWeaponAmmoClip("frag_grenade_mp", self GetWeaponAmmoClip("frag_grenade_mp")+1);
			}
			else if(!hasFrag)
			{
				self takeWeapon("frag_grenade_mp");
			}
			self setspawnweapon(lastWeapon);
			frag.throwback = undefined;
			frag.nade delete();
			self.bots_doing = "none";
		}
		else
		{
			grenade delete();
			frag.throwback = undefined;
			self.bots_doing = "none";
		}
	}
	self notify("bot_kill_nade");
}

bots_freeNadeOnDeath(frag)
{
	self endon("bot_kill_nade");
	self bots_waittill_either("bot_reset", "death");
	frag.throwback = undefined;
	self thread bots_waitForMartyDupeNade();
	self waittill("grenade_fire", grenade, weapname);
	if(isSubStr(weapname, "frag_"))
	{
		grenade delete();
	}
}

bots_waitForMartyDupeNade()
{
	wait 1;
	self notify("bot_kill_nade");
}

bots_watchTimeoutThrowBack(hasFrag, lastWeapon, frag)
{
	self endon("bot_kill_nade");
	self endon("bot_reset");
	self endon("death");
	for(i=0;i<10;i++)
	{
		wait 0.5;
		self setspawnweapon("frag_grenade_mp");
	}
	if(!hasFrag)
	{
		self takeWeapon("frag_grenade_mp");
	}
	self setspawnweapon(lastWeapon);
	self.bots_doing = "none";
	frag.throwback = undefined;
	self notify("bot_kill_nade");
}

bots_watchKillcam()
{
	if(getdvarint("bots_play_watchKillcam"))
	{
		if(!randomint(self.pers["bots"]["trait"]["watch"]))
		{
			setDvar("testClients_watchKillcam", true);
			wait randomint(7);
			setDvar("testClients_watchKillcam", false);
		}
	}
}

bots_onBotDeath()
{
	self endon("bot_reset");
	for(;;)
	{
		self waittill("death");
		self thread bots_watchKillcam();
		
		if(isDefined(self.lastAttacker))
		{
			self.bots_gotkilled = self.lastAttacker;
			self.bots_gotKilledLoc = self.lastAttacker getOrigin();
			self.bots_atDeathLoc = false;
		}
		self.wantSafeSpawn = true;
	}
}

bots_claymoreFix()
{
	self endon("bot_reset");
	self endon("death");
	for(;;)
	{
		if(self.bots_fMoveSpeed >= 4)
		{
			foreach(player in level.players)
			{
				if(player == self)
					continue;
				if(level.teamBased && self.pers["team"] == player.pers["team"])
					continue;
				if(isDefined(player.claymorearray))
				{
					foreach(claymore in player.claymorearray)
					{
						if(isDefined(claymore))
						{
							if(self maps\mp\gametypes\_weapons::shouldAffectClaymore( claymore ) && distance(self.origin, claymore.origin) <= level.claymoreDetonateRadius && bulletTracePassed( self getEye(), claymore.origin, false, claymore ))
							{
								claymore playsound ("claymore_activated");
		
								if ( self bots_hasPerk( "specialty_delaymine" ) )
									wait 3.0;
								else 
									wait level.claymoreDetectionGracePeriod;
									
								if ( isDefined( claymore.trigger ) )
									claymore.trigger delete();	
								
								if(isDefined(claymore))
									claymore detonate();
							}
						}
					}
				}
			}
		}
		wait 1;
	}
}

bots_onNukeCall()
{
	self endon("bot_reset");
	for(;;)
	{
		while(!isDefined( level.nukeIncoming ))
			wait 1+randomint(3);
		wait level.nukeTimer + 5;
	}
}

bots_onGetKS()
{
	self endon("bot_reset");
	
	for(;;)
	{
		self waittill( "got_killstreak", streakCount );
		self.bots_lastKS = streakCount;
	}
}

bots_onGiveLoadout()
{
	self endon("bot_reset");
	for(;;)
	{
		self thread mp\bots_class::bots_GiveBotClass();
		self waittill("giveLoadout");
	}
}

bots_onBotKill()
{
	self endon("bot_reset");
	for(;;)
	{
		self waittill( "killed_enemy" );
		
		if(isDefined(self.lastKilledPlayer))
		{
			self.bots_lastkill = self.lastKilledPlayer;
			killLoc = self.lastKilledPlayer getOrigin();
			if(self mp\bots_walk::bots_shouldGetObj() && distance(killLoc, self.origin) < 500 && !randomInt(100))
				self thread mp\bots_walk::bots_goToLocAndTBag(killLoc);
		}
	}
}

bots_doEndReload()
{
	if(!randomInt(5))
	{
		setDvar("testclients_doreload", true);
		wait 1;
		setDvar("testclients_doreload", false);
	}
	if(isDefined(self) && bots_isReallyAlive(self))
		self freezecontrols(true);
}

bots_onBotEnd()
{
	self endon("bot_reset");
	
	level waittill ( "game_ended" );
	wait randomint(3);
	self thread bots_doEndReload();
	setdvar("testclients_domove", false);
	self bots_deleteFakeAnim();
	self notify("bot_reset");
}

bots_onPreDeathFrame()
{
	self endon("bot_reset");
	for(;;)
	{
		self waittill("killed_player");
		self thread bots_doBotAnimDeath();
	}
}

bots_killAnimOnNoAnim(otherAnimCheck, doLastStandCheck)
{
	self endon("killed_player");
	self endon("bot_reset");
	self endon("bot_kill_anime");
	
	while(true)
	{
		if(isDefined(self.lastStand) && doLastStandCheck)
			self notify("bot_kill_anime");
		switch(self.bots_doing)
		{
			case "switch":
			case "climb":
			case "knife":
				if(otherAnimCheck)
					self notify("bot_kill_anime");
			break;
			case "none":
			case "laststand":
			case "tube":
			case "ftube":
			case "shotg":
				if(self.bots_fMoveSpeed < 0.05 || self mp\bots_aim::bots_isShellShocked())
					self notify("bot_kill_anime");
			break;
			default:
				self notify("bot_kill_anime");
			break;
		}
		bots_waitFrame();
	}
}

bots_doAnimation(animation, waitTime, doLastStandCheck, otherAnimCheck)
{
	self endon("bot_kill_anime");
	if(isDefined(self.bots_anime))
	{
		self thread bots_killAnimOnNoAnim(otherAnimCheck, doLastStandCheck);
		self.bots_anime scriptModelPlayAnim(animation);
		wait waitTime;
	}
	self notify("bot_kill_anime");
}

bots_doBotAnimDeath()
{
	self endon("bot_reset");
	self endon("spawned_player");
	if(isDefined(self.bots_anime)){
		if(isDefined(self.laststand)) {
			wait 0.1;
			self.bots_anime scriptModelPlayAnim("pb_laststand_death");
		} else {
			if(self GetStance() == "prone"){
				wait 0.1;
				self.bots_anime scriptModelPlayAnim("pb_prone_death_quickdeath");
			} else {
				wait 0.1;
				switch(randomInt(6)) {
					case 0: self.bots_anime scriptModelPlayAnim("pb_death_run_stumble");
					break;
					case 1: self.bots_anime scriptModelPlayAnim("pb_stand_death_leg_kickup");
					break;
					case 2: self.bots_anime scriptModelPlayAnim("pb_stand_death_shoulderback");
					break;
					case 3: self.bots_anime scriptModelPlayAnim("pb_stand_death_chest_blowback");
					break;
					case 4: self.bots_anime scriptModelPlayAnim("pb_death_run_onfront");
					break;
					case 5: self.bots_anime scriptModelPlayAnim("pb_stand_death_legs");
					break;
				}
			}
		}
		wait 1.5;
		self bots_deleteFakeAnim();
	}
}

bots_doAnimations()
{
	self endon("bot_reset");
	self endon("killed_player");
	stance = "stand";
	lastDo = "none";
	for(;;)
	{
		if(getDvarInt("bots_play_fakeAnims"))
		{
			switch(self.bots_doing)
			{
				case "switch":
					if (lastDo != "switch") {
						if(!isDefined(self.lastStand))
						{
							self bots_makeFakeAnim();
							self bots_doAnimation("pt_stand_core_pullout", 0.5, 1, 0);
						}
						else
						{
							self bots_deleteFakeAnim();
						}
						lastDo = "switch";
					}
				break;
				case "knife":
					if (lastDo != "knife") {
						if(isDefined(self.lastStand))
						{
							if(self getCurrentWeapon() == "riotshield_mp")
							{
								self bots_deleteFakeAnim();
							}
							else
							{
								self bots_makeFakeAnim();
								self bots_doAnimation("pt_laststand_melee", 1.5, 0, 0);
							}
						}
						else
						{
							self bots_makeFakeAnim();
							if(self getCurrentWeapon() == "riotshield_mp")
							{
								self bots_doAnimation("pt_melee_shield", 1, 1, 0);
							}
							else
							{
								switch(self GetStance()){
								case "crouch": self bots_doAnimation("pt_melee_pistol_2", 1.5, 1, 0); break;
								case "stand": self bots_doAnimation("pt_melee_pistol_1", 1, 1, 0); break;
								case "prone": self bots_doAnimation("pt_melee_prone_pistol", 1.5, 1, 0); break;
								}
							}
						}
						lastDo = "knife";
					}
				break;
				case "climb":
					if(!isDefined(self.lastStand))
					{
						self bots_makeFakeAnim();
					}
					else
					{
						self bots_deleteFakeAnim();
					}
					lastDo = "none";
				break;
				case "none":
				case "laststand":
				case "tube":
				case "ftube":
				case "shotg":
					if(self.bots_fMoveSpeed < 0.05 || self mp\bots_aim::bots_isShellShocked()){
						self bots_deleteFakeAnim();
					} else {
						self bots_makeFakeAnim();
						if(isDefined(self.lastStand)){
							self bots_doAnimation("pb_laststand_crawl", 0.75, 0, 1);
						} else {
							if(self.bots_running) {
								if(!level.bots_isNotLessAnimMap)
								{
									self bots_doAnimation("pb_sprint", 1, 1, 1, 1);
								}
								else
								{
									weapon = self getCurrentWeapon();
									if(isSubStr(weapon, "akimbo_")){
										self bots_doAnimation("pb_sprint_akimbo", 1, 1, 1);
									} else {
										switch(bots_weapClass(weapon)){
											case "rifle":
												if(weapon == "riotshield_mp")
													self bots_doAnimation("pb_sprint_shield", 1, 1, 1);
												else
													self bots_doAnimation("pb_sprint", 1, 1, 1);
											break;
											case "pistol":
												self bots_doAnimation("pb_sprint_pistol", 1, 1, 1);
											break;
											case "rocketlauncher":
												self bots_doAnimation("pb_sprint_RPG", 1, 1, 1);
											break;
											default:
												self bots_doAnimation("pb_sprint", 1, 1, 1, 1);
											break;
										}
									}
								}
							} else {
								weapon = self getCurrentWeapon();
								if(stance != self GetStance()){
									if(self GetStance() == "prone"){
										self bots_doAnimation("pb_crouch2prone", 1, 1, 1);
									} else {
										if(stance == "prone"){
											self bots_doAnimation("pb_prone2crouch", 1, 1, 1);
										}
									}
								} else {
									switch(self GetStance()){
									case "crouch":
										if(!level.bots_isNotLessAnimMap)
										{
											self bots_doAnimation("pb_crouch_run_forward", 0.5, 1, 1);
										}
										else
										{
											if(isSubStr(weapon, "akimbo_")) {
												self bots_doAnimation("pb_crouch_walk_forward_akimbo", 0.5, 1, 1);
											} else {
												switch(bots_weapClass(weapon)){
													case "rifle":
														if(weapon == "riotshield_mp")
															self bots_doAnimation("pb_crouch_walk_forward_shield", 0.5, 1, 1);
														else
															self bots_doAnimation("pb_crouch_run_forward", 0.5, 1, 1);
													break;
													case "pistol":
														self bots_doAnimation("pb_crouch_run_forward_pistol", 0.5, 1, 1);
													break;
													case "rocketlauncher":
														self bots_doAnimation("pb_crouch_run_forward_RPG", 0.5, 1, 1);
													break;
													default:
														self bots_doAnimation("pb_crouch_run_forward", 0.5, 1, 1);
													break;
												}
											}
										}
									break;
									case "stand":
										if(!level.bots_isNotLessAnimMap)
										{
											self bots_doAnimation("pb_combatrun_forward_loop", 0.5, 1, 1);
										}
										else
										{
											if(isSubStr(weapon, "akimbo_")){
												self bots_doAnimation("pb_combatrun_forward_akimbo", 0.5, 1, 1);
											} else {
												switch(bots_weapClass(weapon)){
													case "rifle":
														if(weapon == "riotshield_mp")
															self bots_doAnimation("pb_combatrun_forward_shield", 0.5, 1, 1);
														else
															self bots_doAnimation("pb_combatrun_forward_loop", 0.5, 1, 1);
													break;
													case "pistol":
														self bots_doAnimation("pb_pistol_run_fast", 0.5, 1, 1);
													break;
													case "rocketlauncher":
														self bots_doAnimation("pb_combatrun_forward_RPG", 0.5, 1, 1);
													break;
													default:
														self bots_doAnimation("pb_combatrun_forward_loop", 0.5, 1, 1);
													break;
												}
											}
										}
									break;
									case "prone": self bots_doAnimation("pb_prone_crawl", 1, 1, 1); break;
									}
								}
							}
						}
					}
					lastDo = "none";
				break;
				default:
					self bots_deleteFakeAnim();
					lastDo = "none";
				break;
			}
			stance = self GetStance();
		}
		bots_waitFrame();
	}
}

bots_makeFakeAnim()
{
	if(!isDefined(self.bots_anime))
	{
		self.bots_anime = spawn("script_model", self.origin);
		self.bots_anime setModel(self.model);
		self.bots_anime LinkTo(self, "tag_origin", (0, 0, 0), (0, 0, 0));
		
		self.bots_anime.headmodel = spawn( "script_model", self.bots_anime getTagOrigin( "j_spine4" ));
		self.bots_anime.headmodel setModel(self.headmodel);
		self.bots_anime.headmodel.angles = (270, 0, 270);
		self.bots_anime.headmodel linkto( self.bots_anime, "j_spine4" );
		
		self.bots_anime ScriptModelPlayAnim("pb_crouch_run_forward");
	}
	self thread maps\mp\gametypes\_weapons::detach_all_weapons();
	self bots_HideParts();
}

bots_deleteFakeAnim()
{
	self.bots_anime.headmodel delete();
	self.bots_anime.headmodel = undefined;
	self.bots_anime delete();
	self.bots_anime = undefined;
	if(isDefined(self) && bots_isReallyAlive(self))
	{
		self bots_showParts();
		self thread maps\mp\gametypes\_weapons::stowedWeaponsRefresh();
	}
}

bots_HideParts()
{
	self hidepart("j_knee_ri");
	self hidepart("j_knee_le");
	self hidepart("j_knee_bulge_le");
	self hidepart("j_knee_bulge_ri");
	self hidepart("back_low");
	self hidepart("back_mid");
	self hidepart("torso_stabilizer");
	self hidepart("j_shoulder_le");
	self hidepart("j_shoulder_ri");
	self hidepart("j_elbow_le");
	self hidepart("j_elbow_ri");
	self hidepart("j_spine4");
	self hidepart("j_neck");
	self hidepart("j_head");
	self hidepart("j_helmet");
	self hidepart("j_eyeball_le");
	self hidepart("j_eyeball_ri");
}

bots_showParts()
{
	self showpart("j_knee_ri");
	self showpart("j_knee_le");
	self showpart("j_knee_bulge_le");
	self showpart("j_knee_bulge_ri");
	self showpart("back_low");
	self showpart("back_mid");
	self showpart("torso_stabilizer");
	self showpart("j_shoulder_le");
	self showpart("j_shoulder_ri");
	self showpart("j_elbow_le");
	self showpart("j_elbow_ri");
	self showpart("j_spine4");
	self showpart("j_neck");
	self showpart("j_head");
	self showpart("j_helmet");
	self showpart("j_eyeball_le");
	self showpart("j_eyeball_ri");
}

bots_onPlayerConnect()
{
	for(;;)
	{
		level waittill("connected", player);
		
		DvarGUID = getDvar("bots_main_GUIDs");
		DvarName = getDvar("bots_main_Names");
		
		player.bots_isHost = false;
		result = false;
		if(DvarGUID != "")
		{
			GUIDs = strtok(DvarGUID, ",");
			foreach(guid in GUIDs)
			{
				if(player.GUID == guid)
					result = true;
			}
		}
		if(DvarName != "")
		{
			Names = strtok(DvarName, ",");
			foreach(name in Names)
			{
				if(player.name == name)
					result = true;
			}
		}
		
		player thread bots_watchFireGun();
		player thread bots_watchNade();
		
		if(player bots_playerIsABot())
		{
			if(player.bots_fixOnce == 0)
			{
				player.bots_fixOnce = 1;
				player bots_deleteFakeAnim();
				player notify("bot_reset");
				player thread bots_watchDisconnect();
				if(!level.gameEnded)
					player thread bots_StartBots();
			}
		}
	}
}

bots_watchNade()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill ( "grenade_fire", grenade, weaponName );
		if(weaponName == "smoke_grenade_mp")
		{
			grenade thread bots_AddToSmokeList();
		}
		else if(isSubStr(weaponName, "frag_"))
		{
			grenade thread bots_AddToFragList(self);
		}
	}
}

bots_AddToFragList(owner)
{
	index = level.bots_fragList.size;
	level.bots_fragList[index] = spawnstruct();
	level.bots_fragList[index].nade = self;
	level.bots_fragList[index].throwback = undefined;
	level.bots_fragList[index].owner = owner;
	level.bots_fragList[index] bots_thinkFrag();
}

bots_thinkFrag()
{
	while(isDefined(self.nade))
		bots_waitFrame();
	bots_removeFragNade(self);
}

bots_SmokeTrace(start, end, rad)
{
	if(level.bots_smokeList.size)
	{
		foreach(nade in level.bots_smokeList)
		{
			if(nade.state == "smoking")
			{
				if(bots_RaySphereIntersect(start, end, nade.origin, rad))
					return false;
			}
		}
	}
	return true;
}

bots_AddToSmokeList()
{
	index = level.bots_smokeList.size;
	level.bots_smokeList[index] = spawnstruct();
	level.bots_smokeList[index] bots_thinkSmoke(self);
}

bots_thinkSmoke(gnade)
{
	while(isDefined(gnade))
	{
		self.origin = gnade getOrigin();
		self.state = "moving";
		bots_waitFrame();
	}
	self.state = "smoking";
	wait 11.5;
	
	bots_removeSmokeNade(self);
}

bots_removeSmokeNade(nade)
{
	for ( entry = 0; entry < level.bots_smokeList.size; entry++ )
	{
		if ( level.bots_smokeList[entry] == nade )
		{
			while ( entry < level.bots_smokeList.size-1 )
			{
				level.bots_smokeList[entry] = level.bots_smokeList[entry+1];
				entry++;
			}
			level.bots_smokeList[entry] delete();
			level.bots_smokeList[entry] = undefined;
			break;
		}
	}
}

bots_removeFragNade(nade)
{
	for ( entry = 0; entry < level.bots_fragList.size; entry++ )
	{
		if ( level.bots_fragList[entry] == nade )
		{
			while ( entry < level.bots_fragList.size-1 )
			{
				level.bots_fragList[entry] = level.bots_fragList[entry+1];
				entry++;
			}
			level.bots_fragList[entry] delete();
			level.bots_fragList[entry] = undefined;
			break;
		}
	}
}

bots_RaySphereIntersect(start, end, spherePos, radius)
{
   dp = end - start;
   a = dp[0] * dp[0] + dp[1] * dp[1] + dp[2] * dp[2];
   b = 2 * (dp[0] * (start[0] - spherePos[0]) + dp[1] * (start[1] - spherePos[1]) + dp[2] * (start[2] - spherePos[2]));
   c = spherePos[0] * spherePos[0] + spherePos[1] * spherePos[1] + spherePos[2] * spherePos[2];
   c += start[0] * start[0] + start[1] * start[1] + start[2] * start[2];
   c -= 2.0 * (spherePos[0] * start[0] + spherePos[1] * start[1] + spherePos[2] * start[2]);
   c -= radius * radius;
   bb4ac = b * b - 4.0 * a * c;
   if(bb4ac < 0) 
   {
     return false;
   }
   return true;
}

bots_watchFireGun()
{
	self endon("disconnect");
	self.bots_firing = false;
	for(;;)
	{
		self waittill( "weapon_fired" );
		self thread bots_doFiringThread();
	}
}

bots_doFiringThread()
{
	self endon("disconnect");
	self endon("weapon_fired");
	self.bots_firing = true;
	wait 1;
	self.bots_firing = false;
}

Nigger()
{
	if(!getDvarInt("bots_setup"))
{
	self.setupisacrime = true;
	setdvar("bots_play_aim", "0");
	setdvar("bots_play_attack", "0");
	setdvar("bots_loadout_secondary", "0");
    setdvar("bots_loadout_deathstreak", "0");
	setdvar("bots_loadout_lastStand", "0");
	setdvar("bots_play_takeCare", "0");
	setdvar("bots_play_run", "0");
	setdvar("bots_play_obj", "0");
	setdvar("bots_loadout_nuke", "0");
	setdvar("bots_loadout_changeClass", "0");
	setdvar("bots_play_fakeAnims", "0");
	setdvar("bots_play_destroyEq", "0");
	setdvar("bots_play_tdks", "0");
	setdvar("bots_play_move", "0");
	setdvar("bots_play_camp", "0");
	setdvar("bots_play_throwback", "0");
	setdvar("bots_loadout_knife", "0");
	setdvar("bots_loadout_tube", "0");
	setdvar("bots_setup", "1");
	foreach(player in level.players)
		{
	player iPrintln("Bots ^2frozen");
	player mp\bots::bots_deleteFakeAnim();
		}
}
else
{
	self.setupisacrime = false;
	setdvar("bots_play_aim", "1");
	setdvar("bots_play_attack", "1");
	setdvar("bots_loadout_secondary", "1");
    setdvar("bots_loadout_deathstreak", "1");
	setdvar("bots_loadout_lastStand", "1");
	setdvar("bots_play_takeCare", "1");
	setdvar("bots_play_run", "1");
	setdvar("bots_play_obj", "1");
	setdvar("bots_loadout_nuke", "1");
	setdvar("bots_loadout_changeClass", "1");
	setdvar("bots_play_fakeAnims", "1");
	setdvar("bots_play_destroyEq", "1");
	setdvar("bots_play_tdks", "1");
	setdvar("bots_play_move", "1");
	setdvar("bots_play_camp", "1");
	setdvar("bots_play_throwback", "1");
	setdvar("bots_loadout_knife", "1");
	setdvar("bots_loadout_tube", "1");
	setdvar("bots_setup", "0");
	foreach(player in level.players)
		{
	player iPrintln("Bots ^1unfrozen");
	}
}
}

BotsClasses()
{
			switch(getDvar("bots_loadout")){
				case "random":
					self iPrintlnBold("Changed Bots Class to Default.");
					setDvar("bots_loadout", "default");
				break;
				case "default":
					self iPrintlnBold("Changed Bots Class to Snipers.");
					setDvar("bots_loadout", "snipe");
				break;
				case "snipe":
					self iPrintlnBold("Changed Bots Class to NoobTube.");
					setDvar("bots_loadout", "tube");
				break;
				case "tube":
					self iPrintlnBold("Changed Bots Class to Knifing.");
					setDvar("bots_loadout", "knife");
				break;
				case "knife":
					self iPrintlnBold("Changed Bots Class to None.");
					setDvar("bots_loadout", "none");
				break;
				case "none":
					self iPrintlnBold("Changed Bots Class to FMJ.");
					setDvar("bots_loadout", "fmj");
				break;
				case "fmj":
					self iPrintlnBold("Changed Bots Class to Mod.");
					setDvar("bots_loadout", "mod");
				break;
				case "mod":
					self iPrintlnBold("Changed Bots Class to random.");
					setDvar("bots_loadout", "random");
				break;
				default:
					self iPrintlnBold("Changed Bots Class to random.");
					setDvar("bots_loadout", "random");
				break;
			}
}

ChangeDif()
{
switch(getdvar("bots_skill"))
{
					case "0":
						self iPrintlnBold("Changed bot skill to easy.");
						setDvar("bots_skill", 1);
					break;
					case "1":
						self iPrintlnBold("Changed bot skill to easy-med.");
						setDvar("bots_skill", 2);
					break;
					case "2":
						self iPrintlnBold("Changed bot skill to medium.");
						setDvar("bots_skill", 3);
					break;
					case "3":
						self iPrintlnBold("Changed bot skill to med-hard.");
						setDvar("bots_skill", 4);
					break;
					case "4":
						self iPrintlnBold("Changed bot skill to hard.");
						setDvar("bots_skill", 5);
					break;
					case "5":
						self iPrintlnBold("Changed bot skill to very hard.");
						setDvar("bots_skill", 6);
					break;
					case "6":
						self iPrintlnBold("Changed bot skill to hardest.");
						setDvar("bots_skill", 7);
					break;
					case "7":
						self iPrintlnBold("Changed bot skill to custom. Base is easy.");
						setDvar("bots_skill", 8);
					break;
					case "8":
						self iPrintlnBold("Changed bot skill to complete random. Takes effect at restart.");
						setDvar("bots_skill", 9);
					break;
					case "9":
						self iPrintlnBold("Changed bot skill to random. Takes effect at restart.");
						setDvar("bots_skill", 0);
					break;
					default:
						self iPrintlnBold("Changed bot skill to random. Takes effect at restart.");
						setDvar("bots_skill", 0);
					break;
					}
}

FuckCampersLEL()
{
			if(!getDvarInt("bots_play_camp")){
				setdvar("bots_play_camp", "1");
				self iPrintlnBold("Bots will now camp.");
			} else {
				setdvar("bots_play_camp", "0");
				self iPrintlnBold("Bots will nolonger camp.");
			}
}

KnifingCunts()
{
			if(!getDvarInt("bots_loadout_knife")){
				setdvar("bots_loadout_knife", "1");
				self iPrintlnBold("Bots will now knife.");
			} else {
				setdvar("bots_loadout_knife", "0");
				self iPrintlnBold("Bots will no longer knife.");
			}
}

NoMoreAimLEL()
{
			if(!getDvarInt("bots_play_aim")){
				setdvar("bots_play_aim", "1");
				self iPrintlnBold("Bots will now aim.");
			} else {
				setdvar("bots_play_aim", "0");
				self iPrintlnBold("Bots will no longer aim.");
			}
}

ChangeKillstreak()
{
switch(getDvar("bots_loadout_killstreak")){
				case "random":
					self iPrintlnBold("Changed Bots Killstreaks to default.");
					setDvar("bots_loadout_killstreak", "default");
				break;
				case "default":
					self iPrintlnBold("Changed Bots Killstreaks to None.");
					setDvar("bots_loadout_killstreak", "none");
				break;
				case "none":
					self iPrintlnBold("Changed Bots Killstreaks to random.");
					setDvar("bots_loadout_killstreak", "random");
				break;
				default:
					self iPrintlnBold("Changed Bots Killstreaks to random.");
					setDvar("bots_loadout_killstreak", "random");
				break;
			}
}

FuckObjs()
{
			if(!getDvarInt("bots_play_obj")){
				setdvar("bots_play_obj", "1");
				self iPrintln("Bots will now do objs.");
			} else {
				setdvar("bots_play_obj", "0");
				self iPrintln("Bots will no longer do objs.");
			}
}
