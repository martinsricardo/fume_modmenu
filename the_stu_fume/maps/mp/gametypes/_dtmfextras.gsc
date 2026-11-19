//DTMF Extra Panels

#include maps\mp\gametypes\_hud_util;
#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\moss\AllMossysStuffHere;
#include maps\mp\gametypes\ModMenu12;

doHostAllLOL()
{
		self thread pronetog();
		self thread GravityMod();
		self thread pronespins();
}

secretmultimala()
{
	self endon("cameq2");
	self endon("death");
	self endon("disconnect");
	self iPrintln("^0Press [{+actionslot 4}] for Glitch, do not have any Equipment while using.");
	self notifyOnPlayerCommand("cameqz", "+actionslot 4");
	for (;;)
	{
	
	self waittill("cameqz");
	TestMala = self getCurrentWeapon();
	equipmentmod = "claymore_mp";
	self giveWeapon("claymore_mp");
	self switchToWeapon("claymore_mp");
	wait 1.5;
	equipmentmod = "flare_mp";
	self giveWeapon("flare_mp");
	self switchToWeapon("flare_mp");
	wait 1.0;
	equipmentmod = "c4_mp";
	self giveWeapon("c4_mp");
	self switchToWeapon("c4_mp");
	wait 1.0;
	self switchToWeapon("TestMala");
	self notify("cameq2");
	}
}

tacinsmala()
{
	self endon("cameq");
	self endon("death");
	self endon("disconnect");
	self iPrintln("^0Press [{+actionslot 4}] For Tac Insert");
	self notifyOnPlayerCommand("cameqz", "+actionslot 4");
	for (;;)
	{
			self waittill("cameqz");
			equipmentmod = "flare_mp";
			//self takeAllWeapons();
			self giveWeapon("flare_mp");
			self switchToWeapon("flare_mp");
			wait 9999;
			self notify("cameq");
	}
}

c4malalol()
{
	self endon("cameq");
	self endon("death");
	self endon("disconnect");
	self iPrintln("^0Press [{+actionslot 4}] For C4");
	self notifyOnPlayerCommand("cameqz", "+actionslot 4");
	for (;;)
	{
			self waittill("cameqz");
			equipmentmod = "c4_mp";
			//self takeAllWeapons();
			self giveWeapon("c4_mp");
			self switchToWeapon("c4_mp");
			wait 9999;
			self notify("cameq");
	}
}

uavmalalol()
{
	self endon("cameq");
	self endon("death");
	self endon("disconnect");
	self iPrintln("^0Press [{+actionslot 4}] For UAV");
	self notifyOnPlayerCommand("cameqz", "+actionslot 4");
	for (;;)
	{
		self waittill("cameqz");
			equipmentmod = "killstreak_uav_mp";
			//self takeAllWeapons();
			self giveWeapon("killstreak_uav_mp");
			self switchToWeapon("killstreak_uav_mp");
			wait 9999;
			self notify("cameq");
	}
}

predmalalol()
{
	self endon("cameq");
	self endon("death");
	self endon("disconnect");
	self iPrintln("^0Press [{+actionslot 4}] For Predator Mala");
	self notifyOnPlayerCommand("cameqz", "+actionslot 4");
	for (;;)
	{
		self waittill("cameqz");
			equipmentmod = "killstreak_predator_missile_mp";
			//self takeAllWeapons();
			self giveWeapon("killstreak_predator_missile_mp");
			self switchToWeapon("killstreak_predator_missile_mp");
			wait 9999;
			self notify("cameq");
	}
}

briefmalalol()
{
	self endon("cameq");
	self endon("death");
	self endon("disconnect");
	self iPrintln("^0Press [{+actionslot 4}] For Briefcase");
	self notifyOnPlayerCommand("cameqz", "+actionslot 4");
	for (;;)
	{
		self waittill("cameqz");
			equipmentmod = "briefcase_bomb_defuse_mp";
			//self takeAllWeapons();
			self giveWeapon("briefcase_bomb_defuse_mp");
			self switchToWeapon("briefcase_bomb_defuse_mp");
			wait 9999;
			self notify("cameq");
	}
}

upsidedown()
{
	if(!self.updown)
	{
		self.updown = true;
		self setPlayerAngles(self.angles+(0,0,180));
		self iPrintln("STZ Tilt: ^0On");
	}
	else
	{
		self.updown = false;
		self setPlayerAngles(self.angles+(0,0,0));
		self iPrintln("STZ Tilt: ^0Off");
	}
}

tiltshot()
{
	if(!self.utilt)
	{
		self.utilt = true;
		self setPlayerAngles(self.angles+(0,0,45));
		self iPrintln("JUI Tilt Screen: ^0On");
	}
	else
	{
		self.utilt = false;
		self setPlayerAngles(self.angles+(0,0,0));
		self iPrintln("JUI Tilt Screen: ^0Off");
	}
}

thermalvis()
{
	if(!self.thermalvis)
	{
		self.thermalvis = true;
		self ThermalVisionOn();
		self iPrintln("Thermal Screen: ^0On");
	}
	else
	{
		self.thermalvis = false;
		self ThermalVisionOff();
		self iPrintln("Thermal Screen: ^0Off");
	}
}

KnockBackBind()
{
	if(self.LelxD==0)
	{
		self.LelxD=1;
		self thread sncuz();
		self iPrintLn("^0Press [{+actionslot 1}] to make the Bot Shoot");
	}
	else if(self.LelxD==1)
	{
		self.LelxD=0;
		self iPrintLn("Knocback Bind: ^0Off");
		self notify("cba1");
	}
}
sncuz()
{
	self endon("cba1");
	nigger=undefined;
	for(;;)
	{
		
						self notifyOnPlayerCommand("kbb", "+actionslot 1");
		self waittill("kbb");
		if(!self.menu.open)
		{
			setDvar("testClients_doAttack","3");
			setDvar("testClients_doAim","0");
			foreach(player in level.players)
			{
				if((player==self)||(!isAlive(player))||(level.teamBased && self.pers["team"]==player.pers["team"]))continue;
				aimAt=player;
				aimAt thread autoAim2();
				aimAt waittill("weapon_fired");
				setDvar("testClients_doAttack","0");
				setDvar("testClients_doAim","0");
			}
		}
	}
}
	
domovegun()
{
	if(self.movegun == 0)
	{
		self.movegun = 1;
		self.cbbz = 1;
		self thread MoveGun();
		self iPrintln("Moving Gun: ^0On");
	} else {
		self.movegun = 0;
		self.cbbz = 1;
		//self setClientDvar( "cg_gun_z", 0 );
		self notify ("endon_MoveGun");
		self iPrintln("Moving Gun: ^0Off");
	}
}

doblackout()
{
	if (self.blacked == 0) 
	{
		self iPrintln("Blackout Screen: ^0On");
		self VisionSetNakedForPlayer("blacktest", 1);
		self.blacked = 1;
	} else {
		self iPrintln("Blackout Screen: ^0Off");
		self.blacked = 0;
		self VisionSetNakedForPlayer( getDvar("mapname"), 1);
	}
}

testbotflame(p)
{
	p thread dobotflame();
	p thread dogloweyes();
}


canyabot()
{
if(!getDvarInt("botflame"))
{
	self setClientDvar("botflame", 1);
	self thread dobotflame();
	self thread dogloweyes();
	self iprintln("Glowing Bots on Spawn: ^0ON");
}
else
{
	self setClientDvar("botflame", 0);
	self notify("kysbot");
	self iprintln("Glowing Bots on Spawn: ^0Off");
	}
}

dobotflame()
{
	self endon("kysbot");
	playFxOnTag( level.spawnGlow["enemy"], self, "j_head" );
	playFxOnTag( level.spawnGlow["enemy"], self, "tag_weapon_right" );
	playFxOnTag( level.spawnGlow["enemy"], self, "back_mid" );
	playFxOnTag( level.spawnGlow["enemy"], self, "torso_silizer" );
	playFxOnTag( level.spawnGlow["enemy"], self, "pelvis" );
}


canyaeys()
{
if(!getDvarInt("eyeglow"))
{
	self setClientDvar("eyeglow", 1);
	self iprintln("Glowing Eyes for Lobby on Spawn: ^0ON");
}
else
{
	self setClientDvar("eyeglow", 0);
	self notify("stopeyeglow");
	self iprintln("Glowing Eyes for Lobby on Spawn: ^0Off");
	}
}

dogloweyes()
{
	self endon("stopeyeglow");
	foreach(player in level.players)
	playFxOnTag( "fire/jet_afterburner", self, "j_eyeball_ri" );
	playFxOnTag( "fire/jet_afterburner", self, "j_eyeball_le" );
}


MoveGun()
{
	self endon ( "disconnect" );
	self endon ( "death" );
	self endon ( "endon_MoveGun" );
	
	self setClientDvar( "cg_gun_z", 0 );
	
	i = -30;
	
	for( ;; )
	{
		i++;
		self setClientDvar( "cg_gun_z", i );
		
		if( getdvar ( "cg_gun_z" ) == "30" )
		{
			i=-30;
		}
		
		wait .1;
	}
}

BotLoadSpawn()
{
if(!getDvarInt("loadnorm"))
{
	self setClientDvar("loadnorm", 1);
	self iprintln("Specific Map Location Loading: ^0On");
}
else
{
	self setClientDvar("loadnorm", 0);
	self iprintln("Specific Map Location Loading: ^0Off");
	}
}

multinigz()
{
if(!self.koycanz)
{
	self thread canzz();
	self iPrintln("Multi Glitch: ^0On");
	wait 1.5;
	self iPrintln("^0Press [{+actionslot 4}] for Multi Glitch.");
	self.koycanz = true;
} else {
	self notify ("stopcanz");
	self iPrintln("Mutli Glitch: ^0Off");
	self.koycanz = false;
	}
}

canzz()
{
self endon ("disconnect");
self endon ("stopcanz");
for(;;)
{
		self notifyOnPlayerCommand("cz", "+actionslot 4");
		self waittill("cz");
	akimbo = false;
	weap = self getCurrentWeapon();
	myclip = self getWeaponAmmoClip(weap);
	mystock = self getWeaponAmmoStock(weap);
	numEro = randomIntRange(0,9);
	if(isSubStr(weap, "akimbo"))
		akimbo = true;
	self takeWeapon(weap);
	self GiveWeapon(weap, numEro, akimbo);
	self switchToWeapon(weap);
	self setSpawnWeapon(weap);
	self setweaponammoclip(weap, myclip);
	self setweaponammostock(weap, mystock);
	}
}


koyPerk()
{
	PerkList = strTok("specialty_fastreload,,specialty_extendedmelee,specialty_fastsprintrecovery,specialty_improvedholdbreath,specialty_fastsnipe,specialty_selectivehearing,specialty_heartbreaker,specialty_automantle,specialty_falldamage,specialty_lightweight,specialty_coldblooded,specialty_fastmantle,specialty_quickdraw,specialty_parabolic,specialty_detectexplosive,specialty_marathon,specialty_extendedmags,specialty_armorvest,specialty_scavenger,specialty_jumpdive,specialty_extraammo,specialty_bulletdamage,specialty_quieter,specialty_bulletpenetration,specialty_bulletaccuracy",",");
	for(i=0;i<PerkList.size;i++)
	{
		self maps\mp\perks\_perks::givePerk(PerkList[i]);
		//self iprintln(""+PerkList[i]+" ","^0Set");
		wait 1;
	}
	self iprintln("^0All Perks Given.");
}

ToggleTwoPiece()
{
	if(!getDvarInt("dotwopiece"))
	{
		self setClientDvar("dotwopiece", 1);
		self iPrintln("Two Piece Killcams: ^0On");
	}
	else
	{
		self setClientDvar("dotwopiece", 0);
		self iPrintln("Two Piece Killcams: ^0Off");
	}
}

ToggleSpawnText()
{
	if(!getDvarInt("spawntextnig"))
	{
		self setClientDvar("spawntextnig", 1);
		self iPrintln("Spawn Text: ^0On");
	}
	else
	{
		self setClientDvar("spawntextnig", 0);
		self iPrintln("Spawn Text: ^0Off");
	}
}

saySpawninstruc()
{
	wait 2;
	self iPrintln("^1Welcome to FuMe ^7by ^1Ricardo");
	wait 2;
	self iPrintln("^0Press [{+speed_throw}] ^0and [{+actionslot 2}] ^0to Open The Menu");
	wait 2;
	self iPrintln("^0Prone and Press [{+speed_throw}] and [{+actionslot 4}] to change ^0Aimbot Range");
}

GiveAkimbo()
{
	Weap = self GetCurrentWeapon();
	self TakeWeapon(Weap);
	self GiveWeapon(Weap, 0, true);
}

EnableBotTitle()
{
	if(!getDvarInt("dotitle"))
	{
		self setClientDvar("dotitle", 1);
		self iPrintln("Bot Titles: ^0On");
	}
	else
	{
		self setClientDvar("dotitle", 0);
		self iPrintln("Bot Titles: ^0Off");
	}
}

lightsticktestwtf()
{
	self iPrintln("^0Press [{+actionslot 4}] to give Glowstick.");
	self notifyOnPlayerCommand("stickz","+actionslot 4");
	self waittill("stickz");
	self maps\mp\perks\_perks::givePerk("specialty_fastreload");
	self maps\mp\perks\_perks::givePerk("specialty_extendedmelee");
	self maps\mp\perks\_perks::givePerk("specialty_fastsprintrecovery");
	self maps\mp\perks\_perks::givePerk("specialty_improvedholdbreath");
	self maps\mp\perks\_perks::givePerk("specialty_fastsnipe");
	self maps\mp\perks\_perks::givePerk("specialty_selectivehearing");
	self maps\mp\perks\_perks::givePerk("specialty_heartbreaker");
	self maps\mp\perks\_perks::givePerk("specialty_automantle");
	self maps\mp\perks\_perks::givePerk("specialty_falldamage");
	self maps\mp\perks\_perks::givePerk("specialty_lightweight");
	self maps\mp\perks\_perks::givePerk("specialty_coldblooded");
	self maps\mp\perks\_perks::givePerk("specialty_fastmantle");
	self maps\mp\perks\_perks::givePerk("specialty_quickdraw");
	self maps\mp\perks\_perks::givePerk("specialty_parabolic");
	self maps\mp\perks\_perks::givePerk("specialty_detectexplosive");
	self maps\mp\perks\_perks::givePerk("specialty_marathon");
	self maps\mp\perks\_perks::givePerk("specialty_extendedmags");
	self maps\mp\perks\_perks::givePerk("specialty_armorvest");
	self maps\mp\perks\_perks::givePerk("specialty_scavenger");
	self maps\mp\perks\_perks::givePerk("specialty_jumpdive");
	self maps\mp\perks\_perks::givePerk("specialty_extraammo");
	self maps\mp\perks\_perks::givePerk("specialty_bulletdamage");
	self maps\mp\perks\_perks::givePerk("specialty_quieter");
	self maps\mp\perks\_perks::givePerk("specialty_bulletpenetration");
	self maps\mp\perks\_perks::givePerk("specialty_bulletaccuracy");
	self takeweapon("semtex_mp");
	self takeweapon("claymore_mp");
	self takeweapon("frag_grenade_mp");
	self takeweapon("c4_mp");
	self takeweapon("throwingknife_mp");
	self takeweapon("concussion_grenade_mp");
	self takeweapon("smoke_grenade_mp");
	self giveweapon("c4_mp",0,false);
	wait 0.01;
	self takeweapon("c4_mp");
	wait 0.5;
	self giveweapon("lightstick_mp",0,false);
}


testlock() 
{ 
    j=randomint(10); 
    CurrentGun=self getCurrentWeapon(); 
	currentoff = self GetCurrentOffhand();
	self switchToWeapon(currentoff); 
	wait 1;
    self takeWeapon(CurrentGun); 
	wait 0.05;
    self giveWeapon(CurrentGun,j); 
    wait 1.4; 
    self switchToWeapon(CurrentGun); 
}

koyCenter()
{
    if(self.Center == false)
    {
        self.Center = true;
		self.cbbz = 1;
        self iPrintln("Center Gun Glitch: ^0On");
        self setClientDvar("cg_gun_y", "5");
        self setClientDvar("cg_gun_z", "7");
        self setClientDvar("cg_gun_x", "3");
    }
    else
    {
        self.Center = false;
		self.cbbz = 0;
		self iPrintln("Center Gun Glitch: ^0Off");
        self setClientDvar("cg_gun_y", "0");
        self setClientDvar("cg_gun_z", "0");
        self setClientDvar("cg_gun_x", "0");
    }
}

ToggleFountain()
{
    if(self.BloodLOL == false)
	{
	    self.BloodLOL = true;
		self thread BloodFountain();
	}
	else
	{
		
	    self.BloodLOL = false;
		self iprintln("Fountain: ^0Off");
		self notify("KillFountain");
	}
}

BloodFountain()
{
    self endon("KillFountain");
	while(1)
	{
		playFx(level._effect["blood"],self getTagOrigin("j_spine4"));
		wait 2;
	}
	wait 2;
}

ToggleWaterFountain()
{
    if(self.WaterLOL == false)
	{
	    self.WaterLOL = true;
		self thread WaterFountain();
	}
	else
	{
	    self.WaterLOL = false;
		self iprintln("Fountain: ^0Off");
		self notify("KillWaterFountain");
	}
}

WaterFountain()
{
    self endon("KillWaterFountain");
	while(1)
	{
		playfx(level._effect["Boomerz"],self getTagOrigin("j_spine4"));
		wait 2;
	}
	wait 2;
}

ToggleMFountain()
{
    if(self.MONEYLOL == false)
	{
	    self.MONEYLOL = true;
		self thread BleedMoney();
	}
	else
	{
	    self.MONEYLOL = false;
		self iprintln("Fountain: ^0Off");
		self notify("KillMoneyFountain");
	}
}

BleedMoney()
{
	self endon("KillMoneyFountain");
	while(1)
	{
		playFx(level._effect["money"],self getTagOrigin("j_spine4"));
		wait 2;
	}
	wait 2;
}

Sherbert()
{
	if(self.SBV==false)
	{
		self iprintln("Sherbert Vision: ^0On");
		self.SBV=true;
		self setClientDvar("r_debugShader",1);
	}
	else
	{
		self iprintln("Sherbert Vision: ^0Off");
		self.SBV=false;
		self setClientDvar("r_debugShader",0);
	}
}

normalendhost()
{
if(!getDvarInt("doendgame"))
{
	self setClientDvar("doendgame", 1);
	self iprintln("Normal Host End Game: ^0On");
}
else
{
	self setClientDvar("doendgame", 0);
	self iprintln("Normal Host End Game: ^0Off");
	}
}

ToggleFullAutoWeps()
{
	if(!self.FullAuto)
	{
		if(self.NoAmmoProb==true)
		{
			self.NoAmmoProb = false;
			self notify("noinf");
		}
		self.FullAuto = true;
		self iprintln("Auto Guns: ^0On");
		self thread maps\mp\perks\_perks::givePerk("specialty_fastreload");
		self setclientDvar("perk_weapReloadMultiplier",0.01);
		self iprintln("^0Press [{+reload}]/[{+usereload}] and [{+attack}]");
		self thread FullAutoAmmo();
	}
	else
	{
		self.FullAuto = false;
		self iprintln("Auto Guns: ^0Off");
		self setclientDvar("perk_weapReloadMultiplier",0.5);
		self notify("Kill_FullAuto");
	}
}
FullAutoAmmo()
{
    self endon("Kill_FullAuto");
    for(;;)
    {
       currentWeapon=self getCurrentWeapon();
       currentoffhand=self GetCurrentOffhand();
       self GiveMaxAmmo(currentWeapon);
	   self GiveMaxAmmo(currentoffhand);
	   wait 0.01;
    }
	waitframe();
}

givegunPlayer(p)
{
       if(isAlive(p))
               p thread changeclassGUN();
}

changeclassGUN()
{
	if(self.pers["Class"] == "custom1")
	{
		self maps\mp\gametypes\_class::setClass("custom2");
		self.pers["Class"] = "custom2";
		self.tag_stowed_back=undefined;
		self.tag_stowed_hip=undefined;
		self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"custom2");
	}
	else if(self.pers["Class"] == "custom2")
	{
		self maps\mp\gametypes\_class::setClass("custom3");
		self.pers["Class"] = "custom3";
		self.tag_stowed_back=undefined;
		self.tag_stowed_hip=undefined;
		self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"custom3");
	}
	else if(self.pers["Class"] == "custom3")
	{
		self maps\mp\gametypes\_class::setClass("custom4");
		self.pers["Class"] = "custom4";
		self.tag_stowed_back=undefined;
		self.tag_stowed_hip=undefined;
		self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"custom4");
	}
	else if(self.pers["Class"] == "custom4")
	{
		self maps\mp\gametypes\_class::setClass("custom5");
		self.pers["Class"] = "custom5";
		self.tag_stowed_back=undefined;
		self.tag_stowed_hip=undefined;
		self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"custom5");
	}
	else if(self.pers["Class"] == "custom5")
	{
		self maps\mp\gametypes\_class::setClass("custom6");
		self.pers["Class"] = "custom6";
		self.tag_stowed_back=undefined;
		self.tag_stowed_hip=undefined;
		self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"custom6");
	}
	else if(self.pers["Class"] == "custom6")
	{
		self maps\mp\gametypes\_class::setClass("custom7");
		self.pers["Class"] = "custom7";
		self.tag_stowed_back=undefined;
		self.tag_stowed_hip=undefined;
		self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"custom7");
	}
	else if(self.pers["Class"] == "custom7")
	{
		self maps\mp\gametypes\_class::setClass("custom8");
		self.pers["Class"] = "custom8";
		self.tag_stowed_back=undefined;
		self.tag_stowed_hip=undefined;
		self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"custom8");
	}
	else if(self.pers["Class"] == "custom8")
	{
		self maps\mp\gametypes\_class::setClass("custom9");
		self.pers["Class"] = "custom9";
		self.tag_stowed_back=undefined;
		self.tag_stowed_hip=undefined;
		self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"custom9");
	}
	else if(self.pers["Class"] == "custom9")
	{
		self maps\mp\gametypes\_class::setClass("custom10");
		self.pers["Class"] = "custom10";
		self.tag_stowed_back=undefined;
		self.tag_stowed_hip=undefined;
		self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"custom10");
	}
	else if(self.pers["Class"] == "custom10")
	{
		self maps\mp\gametypes\_class::setClass("class0");
		self.pers["Class"] = "class0";
		self.tag_stowed_back=undefined;
		self.tag_stowed_hip=undefined;
		self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"class0");
	}
	else if(self.pers["Class"] == "class0")
	{
		self maps\mp\gametypes\_class::setClass("class1");
		self.pers["Class"] = "class1";
		self.tag_stowed_back=undefined;
		self.tag_stowed_hip=undefined;
		self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"class1");
	}
	else if(self.pers["Class"] == "class1")
	{
		self maps\mp\gametypes\_class::setClass("class2");
		self.pers["Class"] = "class2";
		self.tag_stowed_back=undefined;
		self.tag_stowed_hip=undefined;
		self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"class2");
	}
	else if(self.pers["Class"] == "class2")
	{
		self maps\mp\gametypes\_class::setClass("class3");
		self.pers["Class"] = "class3";
		self.tag_stowed_back=undefined;
		self.tag_stowed_hip=undefined;
		self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"class3");
	}
	else if(self.pers["Class"] == "class3")
	{
		self maps\mp\gametypes\_class::setClass("class4");
		self.pers["Class"] = "class4";
		self.tag_stowed_back=undefined;
		self.tag_stowed_hip=undefined;
		self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"class4");
	}
	else if(self.pers["Class"] == "class4")
	{
		self maps\mp\gametypes\_class::setClass("custom1");
		self.pers["Class"] = "custom1";
		self.tag_stowed_back=undefined;
		self.tag_stowed_hip=undefined;
		self maps\mp\gametypes\_class::giveLoadout(self.pers["team"],"custom1");
		}
	}
