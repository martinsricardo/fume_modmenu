#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;
#include maps\mp\gametypes\_rank;

Timer()
{
 if(self isHost())
 {
  switch(randomint( 2 ))
  {
   case 0: return 0.07;
   case 1: return 0.12;
   default: return 0.10;
  }
 }
 else switch(randomint( 2 ))
 {
  case 0: return 0.14;
  case 1: return 0.20;
  default: return 0.16;
 }
}
FakeHitmarker()
{
	self waittill ( "begin_killcam", startTime );
	if (self.EBTimer == "1")
	{
	wait 4.03;
	}
	else
	if (self.EBTimer == "2")
	{
		wait 3.98;
	}
	else
	if (self.EBTimer == "3")
	{
		wait 3.9;
	}
	self.newIcon = self createIcon( "damage_feedback" , 24 , 48 ); 
    self.newIcon setPoint("CENTER", "MIDDLE", 0, 12);
	self.newIcon.archived = false;
	if (self.EBTimer == "1")
	{
	wait 0.17;
	}
	else
	if (self.EBTimer == "2")
	{
		wait 0.23;
	}
	else
	if (self.EBTimer == "3")
	{
		wait 0.31;
	}
	self.newIcon destroy();
}

goBullets(range,dam)
{
	self setClientDvar( "scr_killcam_time", "4.1" );
	self endon( "disconnect" );
	self endon( "game_ended" );
	self endon( "NewRange" );
	for(;;)
	{
		aimAt = undefined;
		self waittill ("weapon_fired");
		if (self.MidAir == "1")
		{
if(self isOnGround()) continue;
		}
		forward = self getTagOrigin("j_hip_le");
		end = vectorScale(anglestoforward(self getPlayerAngles()), 1000000);
		ExpLocation = BulletTrace( forward, end, false, self )["position"];
		foreach(player in level.players)
		{
			Blood = randomInt(13);  
				
			if (Blood == 0) 
			{
				doDesti = player.origin + (0,0,50);
				doMod = "MOD_RIFLE_BULLET";
				doLoc = "neck";
			} 
			else if (Blood == 1)
			{
				doDesti = player.origin + (0,0,40);
				doMod = "MOD_RIFLE_BULLET";
				doLoc = "torso_upper";		
			}
			else if (Blood == 2)
			{
				doDesti = player.origin + (0,0,30);
				doMod = "MOD_RIFLE_BULLET";
				doLoc = "torso_lower";		
			}
			else if (Blood == 3)
			{
				doDesti = player.origin + (0,10,5);
				doMod = "MOD_RIFLE_BULLET";
				doLoc = "left_foot";		
			}
			else if (Blood == 4)
			{
				doDesti = player.origin + (0,-10,5);
				doMod = "MOD_RIFLE_BULLET";
				doLoc = "right_foot";			
			}
			
			else if (Blood == 5)
			{
				doDesti = player.origin + (0,-15,40);
				doMod = "MOD_RIFLE_BULLET";
				doLoc = "right_hand";			
			}
			else if (Blood == 6)
			{
				doDesti = player.origin + (0,15,40);
				doMod = "MOD_RIFLE_BULLET";
				doLoc = "left_hand";			
			}
			else if (Blood == 7)
			{
				doDesti = player.origin + (0,10,25);
				doMod = "MOD_RIFLE_BULLET";
				doLoc = "left_leg_upper";			
			}
			else if (Blood == 8)
			{
				doDesti = player.origin + (0,-10,25);
				doMod = "MOD_RIFLE_BULLET";
				doLoc = "right_leg_upper";			
			}
			else if (Blood == 9)
			{
				doDesti = player.origin + (0,-10,15);
				doMod = "MOD_RIFLE_BULLET";
				doLoc = "right_leg_lower";			
			}
			else if (Blood == 10)
			{
				doDesti = player.origin + (0,10,15);
				doMod = "MOD_RIFLE_BULLET";
				doLoc = "left_leg_lower";			
			}
			else
			{
				doDesti = player.origin + (0,0,60);
				doMod = "MOD_HEAD_SHOT";
				doLoc = "head";	
			}
			
			if((player == self) || (!isAlive(player)) || (level.teamBased && self.pers["team"] == player.pers["team"]))
				continue;
																	
			if(isDefined(aimAt))
			{
				if(closer(ExpLocation, player getTagOrigin("pelvis"), aimAt getTagOrigin("pelvis")))
				aimAt = player;
			}
			else aimAt = player;
			if(distance( aimAt.origin, ExpLocation ) < range)
			{
				if(!getDvarInt("bots_setup")) aimAt mp\bots::bots_deleteFakeAnim();
				if (self.arma == "0")
				{
					weaponclass = getweaponclass(self getCurrentWeapon());
					if (weaponclass == "weapon_sniper")
					{	
						x = randomInt(10);
						if(x < 2)
						{
							if(dam > 2)
							{
								if (self.BulletTrail == "1")
								{
									MagicBullet( "cheytac_fmj_mp", self getTagOrigin("tag_eye"), aimAt getTagOrigin("tag_eye"), self );
								}
								if(self.Delay == "1")
     {
      self.newIcon = self createIcon("damage_feedback", 24, 48);
      self.newIcon setPoint("center", "middle", 0, 12);
     }
								if (self.EBTimer == "1")
								{
									wait 0.07;
								}
								else
								if (self.EBTimer == "2")
								{
									wait 0.12;
								}
								if (self.EBTimer == "3")
								{
									wait 0.20;
								}
								else
								if (self.EBTimer == "0")
								wait Timer();
								if(isAlive(aimAt))
								{
                                    if(self.Delay == "0")
									{
									self thread fakehitmarker();
									}
	aimAt mp\bots::bots_deleteFakeAnim();
	  	  if(self.Delay == "1")
	  {
		  self.newIcon destroy();
	  }
									aimAt thread [[level.callbackPlayerDamage]]( self, self, 21952324, 8, doMod, self getCurrentWeapon(), doDesti, doDesti, doLoc, 0 );
	  if(self.Delay == "1")
	  {
		  self.newIcon destroy();
	  }
								}
							}
							else
								aimAt thread [[level.callbackPlayerDamage]]( self, self, 1, 8, "MOD_RIFLE_BULLET", self getCurrentWeapon(), doDesti, doDesti, doLoc, 0 );
						}
						else
						{
							if(dam > 2)
							{
								if (self.BulletTrail == "1")
								{
									MagicBullet( "cheytac_fmj_mp", self getTagOrigin("tag_eye"), aimAt getTagOrigin("tag_eye"), self );
								}
	if(self.Delay == "1")
     {
      self.newIcon = self createIcon("damage_feedback", 24, 48);
      self.newIcon setPoint("center", "middle", 0, 12);
     }
								if (self.EBTimer == "1")
								{
									wait 0.07;
								}
								else
								if (self.EBTimer == "2")
								{
									wait 0.12;
								}
								if (self.EBTimer == "3")
								{
									wait 0.20;
								}
								else
								if (self.EBTimer == "0")
								wait Timer();
								if(isAlive(aimAt))
								{
                                    if(self.Delay == "0")
									{
									self thread fakehitmarker();
									}
	  if(self.Delay == "1")
	  {
		  self.newIcon destroy();
	  }
									aimAt thread [[level.callbackPlayerDamage]]( self, self, 21952324, 8, doMod, self getCurrentWeapon(), doDesti, doDesti, doLoc, 0 );
										  if(self.Delay == "1")
	  {
		  self.newIcon destroy();
	  }
								}
							}
							else
								aimAt thread [[level.callbackPlayerDamage]]( self, self, 1, 8, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0,0,0), (0,0,0), "pelvis", 0, 0 );
						}
					}
				}
				else if(self.arma == "1")
				{
					if (self.ebweap == self getCurrentWeapon())
					{
						x = randomInt(10);
						if(x < 2)
						{
							if(dam > 2)
							{
								if (self.BulletTrail == "1")
								{
									MagicBullet( "cheytac_fmj_mp", self getTagOrigin("tag_eye"), aimAt getTagOrigin("tag_eye"), self );
								}
																if(self.Delay == "1")
     {
      self.newIcon = self createIcon("damage_feedback", 24, 48);
      self.newIcon setPoint("center", "middle", 0, 12);
     }
								if (self.EBTimer == "1")
								{
									wait 0.07;
								}
								else
								if (self.EBTimer == "2")
								{
									wait 0.12;
								}
								if (self.EBTimer == "3")
								{
									wait 0.20;
								}
								else
								if (self.EBTimer == "0")
								wait Timer();
								if(isAlive(aimAt))
								{
                                    if(self.Delay == "0")
									{
									self thread fakehitmarker();
									}
	  if(self.Delay == "1")
	  {
		  self.newIcon destroy();
	  }
									aimAt thread [[level.callbackPlayerDamage]]( self, self, 21952324, 8, doMod, self getCurrentWeapon(), doDesti, doDesti, doLoc, 0 );
										  if(self.Delay == "1")
	  {
		  self.newIcon destroy();
	  }
								}
							}
							else
								aimAt thread [[level.callbackPlayerDamage]]( self, self, 1, 8, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0,0,0), (0,0,0), "pelvis", 0, 0 );
						}
						else
						{
							if(dam > 2)
							{
								if (self.BulletTrail == "1")
								{
									MagicBullet( "cheytac_fmj_mp", self getTagOrigin("tag_eye"), aimAt getTagOrigin("tag_eye"), self );
								}
																if(self.Delay == "1")
     {
      self.newIcon = self createIcon("damage_feedback", 24, 48);
      self.newIcon setPoint("center", "middle", 0, 12);
     }
								if (self.EBTimer == "1")
								{
									wait 0.07;
								}
								else
								if (self.EBTimer == "2")
								{
									wait 0.12;
								}
								if (self.EBTimer == "3")
								{
									wait 0.20;
								}
								else
								if (self.EBTimer == "0")
								wait Timer();
								if(isAlive(aimAt))
								{
                                    if(self.Delay == "0")
									{
									self thread fakehitmarker();
									}
	  	  if(self.Delay == "1")
	  {
		  self.newIcon destroy();
	  }
									aimAt thread [[level.callbackPlayerDamage]]( self, self, 21952324, 8, doMod, self getCurrentWeapon(), doDesti, doDesti, doLoc, 0 );
										  if(self.Delay == "1")
	  {
		  self.newIcon destroy();
	  }
								}
							}
						}
						}
						}
			}
					}
					
				}
			wait 0.05;
}

GunSelector()
{
	self endon ("death");
	self endon ("disconnect");
	for (;;)
	{
		self waittill("Knife");
		if(self getStance() == "prone" && self adsbuttonpressed())
		{
			if (self.arma == "0")
			{
				if(self.ebRange != "Off")
				{
	            	self.ebweap = self getCurrentWeapon();
					self.arma = "1";
					self iprintlnBold("Your EB will work only with "  + self.ebweap);
				}
				else if(self.ebRange == "Off")
				{
					self iprintlnBold("Explosive Bullets is not ON!");
				}
			}
			else if (self.arma == "1")
			{
				if(self.ebRange != "Off")
				{
					if(self getcurrentweapon() != self.ebweap)
					{
						self.ebweap = self getCurrentWeapon();
						self iprintlnBold("Your EB will work only with "  + self.ebweap);
					}
					else
					{
						self.arma = "0";
						self iPrintlnBold("Your EB will now work with every sniper!");
					}
				}
				else if(self.ebRange == "Off")
				{
					self iprintlnBold("Explosive Bullets is not ON!");
				}
			}
			wait 0.2;
        }
	}
}

vectorScale( vector, scale )
{
	return ( vector[0] * scale, vector[1] * scale, vector[2] * scale );
}



execChange()
{
	
		self notify("NewRange");
		self thread goBullets(500,1);
		self.ebRange = "Hitmarker";	
	
}

BulletTrailSweg()
{
 self endon("disconnect");
 self endon("death");
if(self.BulletTrail == "0") 
{
self.BulletTrail = "1";
self iprintlnBold("Bullet Trail: ^3ON");
}
else
{
self.BulletTrail = "0";
self iprintlnBold("Bullet Trail: ^1Off");
}
}

MidAir()
{
	if(self.MidAir == "0") 
	{
		self.MidAir = "1";
		self iprintlnBold("Mid Air EB: ^2On");
	} 
	else if (self.MidAir == "1")
	{
		self.MidAir = "0";
		self iprintlnBold("Mid Air EB: ^1Off");
	}
}

EBSpawn()
{
if(!getDvarInt("EBSpawn"))
{
self setClientDvar("EBSpawn", 1);
self iprintln("Spawn EB: ^2ON");
}
else
{
self setClientDvar("EBSpawn", 0);
self iprintln("Spawn EB: ^1Off");
}
}

EBTimer()
{
if(self.EBTimer == "0")
{
self.EBTimer = "1";
self iprintlnBold("Killcam Timer Set to .1");
}
else if(self.EBTimer == "1")
{
self.EBTimer = "2";
self iprintlnBold("Killcam Timer Set to .2");
}
else if(self.EBTimer == "2")
{
self.EBTimer = "3";
self iprintlnBold("Killcam Timer Set to .3");
}
else if(self.EBTimer == "3")
{
self.EBTimer = "0";
self iprintlnBold("Killcam Timer is now Random");
}
}

DelayedCheck()
{
self endon("disconnect");
 self endon("death");
if(self.Delay == "0")
{
self.Delay = "1";
self iprintlnBold("Delayed EB: ^4ON");
self thread ClaymoreEB();
}
else
{
self.Delay = "0";
self iprintlnBold("Delayed EB: ^1Off");
}
}

ALLAHAKBAR()
{
	 self endon("disconnect");
 self endon("death");
if(self.ALLAH == "0")
{
self.ALLAH = "1";
self iprintlnBold("Claymore/C4 EB: ^4ON");
self thread ClaymoreEB();
}
else
{
self.ALLAH = "0";
self notify ("stopALLAH");
self iprintlnBold("Claymore/C4 EB: ^1Off");
}
}

ClaymoreEB()
{
 self endon("disconnect");
 self endon("death");
 self endon("stopALLAH");
	for(;;)
	{
  claymore = undefined;
  self waittill("weapon_fired");
  		if (self.MidAir == "1")
		{
if(self isOnGround()) continue;
		}
  forward = self getTagOrigin("j_hip_le");
  end = anglesToForward(self getPlayerAngles()) * 1000000;
  ExpLocation = BulletTrace(forward, end, true, self)["position"];
  aimAt = undefined;
  foreach(player in level.players)
  {
   if((level.teamBased && player.pers["team"] == self.pers["team"]) && (player!=self)) continue;
   if(isDefined(player.claymorearray))
   {
    foreach(claymore in player.claymorearray)
    {
		aimAt = undefined;
     if(distance(claymore.origin, ExpLocation) < self.aimDistance) aimAt = claymore;
    }
   }
   if(isDefined(player.c4array))
   {
    foreach(c4 in player.c4array)
    {
		aimAt = undefined;
     if(distance(c4.origin, ExpLocation) < self.aimDistance) aimAt = c4; 
    }
   }
  }
  if(isDefined(aimAt))
  {
   weaponclass = getWeaponClass(self getCurrentWeapon());
   if(weaponclass == "weapon_sniper"||isSubStr(self getCurrentWeapon(), "fal_") && !isSubStr(self getCurrentWeapon(), "_attach_"))
   {
    if(isDefined(aimAt.trigger)) aimAt.trigger delete();
    aimAt detonate();
   }
  }
 }
}

doInstaKill01() 
{
self endon("stop_aimbot1");
	for(;;)
	{
		aimAt = undefined;
		self waittill( "weapon_fired" );
				if (self.MidAir == "1")
		{
if(self isOnGround()) continue;
		}
		self.fired = false;

		forward = self getTagOrigin( "j_hip_le" );
		end = vectorScale(anglestoforward(self getPlayerAngles()), 1000000);
		ExpLocation = BulletTrace( forward, end, false, self )["position"];
foreach(player in level.players)
		{
			
			if((player == self) || (!isAlive(player)) || (level.teamBased && self.pers["team"] == player.pers["team"]))
				continue;
			if(isDefined(aimAt))
			{
				if(closer(ExpLocation, player getTagOrigin("pelvis"), aimAt getTagOrigin("pelvis")))
				aimAt = player;
			}
			else aimAt = player;
		}
					oneIn = randomInt( 10 );

			if (oneIn == 0) {
				doMod = "MOD_HEAD_SHOT";
			} else {
				doMod = "MOD_RIFLE_BULLET";
			}
						if (Distance( ExpLocation, aimAt.origin ) <= 250)
					{
			if ( isSubStr(self getCurrentWeapon(), "cheytac") || isSubStr(self getCurrentWeapon(), "barrett") || isSubStr(self getCurrentWeapon(), "m21") || isSubStr(self getCurrentWeapon(), "wa2000") || isSubStr(self getCurrentWeapon(), "fal") )
			{
				aimAt mp\bots::bots_deleteFakeAnim();
								if(isAlive(aimAt))
								{
								if(self.NiggerBalla == "1")
								{
								MagicBullet( "rpg_mp", self getTagOrigin("tag_eye"), aimAt getTagOrigin("tag_eye"), self );
								}
								else
								if(self.NiggerBalla == "2")
								{
								MagicBullet( "ac130_25mm_mp", self getTagOrigin("tag_eye"), aimAt getTagOrigin("tag_eye"), self );
								}
								if(self.NiggerBalla == "3")
								{
								MagicBullet( "ac130_40mm_mp", self getTagOrigin("tag_eye"), aimAt getTagOrigin("tag_eye"), self );
								}
								if(self.NiggerBalla == "4")
								{
								MagicBullet( "ac130_105mm_mp", self getTagOrigin("tag_eye"), aimAt getTagOrigin("tag_eye"), self );
								}
								if(self.NiggerBalla == "5")
								{
								MagicBullet( "onemanarmy_mp", self getTagOrigin("tag_eye"), aimAt getTagOrigin("tag_eye"), self );
								}
								if(self.NiggerBalla == "6")
								{
								MagicBullet( "remotemissile_projectile_mp", aimAt getTagOrigin("tag_eye"), aimAt getTagOrigin("pelvis"), self );
								}
								else
								if(self.NiggerBalla == "0")
continue;
}
					}
			}
					self.fired = true;
}
}

NiggerCheck()
{
if(self.NiggerBalla == "0")
{
	self thread doInstaKill01();
	self.NiggerBalla = "1";
self iprintlnBold("Bullet Type Set to: ^5RPG");
}
else if(self.NiggerBalla == "1")
{
self.NiggerBalla = "2";
self iprintlnBold("Bullet Type Set to: ^5AC130-25mm");
}
else if(self.NiggerBalla == "2")
{
self.NiggerBalla = "3";
self iprintlnBold("Bullet Type Set to: ^5AC130-40mm");
}
else if(self.NiggerBalla == "3")
{
self.NiggerBalla = "4";
self iprintlnBold("Bullet Type Set to: ^5AC130-105mm");
}
else if(self.NiggerBalla == "4")
{
self.NiggerBalla = "5";
self iprintlnBold("Bullet Type Set to: ^5Thumper");
}
else if(self.NiggerBalla == "5")
{
self.NiggerBalla = "6";
self iprintlnBold("Bullet Type Set to: ^5Predator Missile");
}
else if(self.NiggerBalla == "6")
{
self.NiggerBalla = "0";
self iprintlnBold("Bullet Type Set to: ^1Nothing");
}
}


ChangeAppearance112(Type,MyTeam){
ModelType=[];
ModelType[0]="GHILLIE";
ModelType[1]="SNIPER";
ModelType[2]="LMG";
ModelType[3]="ASSAULT";
ModelType[4]="SHOTGUN";
ModelType[5]="SMG";
ModelType[6]="RIOT";
if(Type==7){MyTeam=randomint(2);Type=randomint(7);}
team=get_enemy_team(self.team);if(MyTeam)team=self.team;
self detachAll();
[[game[team+"_model"][ModelType[Type]]]]();
}
