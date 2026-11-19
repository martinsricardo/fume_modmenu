#include mp\bots_funcs;
bots_watchUseKillStreak()
{
	self endon("bot_reset");
	self endon("death");
	for(;;)
	{
		if(self bots_doingNothing() && !isDefined(self.bots_RealSeen) && isDefined(self.pers["killstreaks"][0]) && self.pers["killstreaks"][0].streakName != "" && getDvar("bots_loadout_killstreak") != "none" && !isDefined(self.lastStand)) self bots_UseStreak();
		wait 1;
	}
}
bots_UseStreak()
{
	switch(self.pers["killstreaks"][0].streakName)
	{
		case "airdrop_sentry_minigun": if(!self bots_isEmp())
		{
			if(level.littleBirds < 3)
			{
				if(bulletTracePassed(self getTagOrigin( "j_head" ), self getTagOrigin( "j_head" )+(0,0,255), false, self) || self.pers["bots"]["skill"]["base"] <= 4) self bots_airdropSent();
			}
		}
		break;
		case "airdrop": if(!self bots_isEmp())
		{
			if(level.littleBirds < 3)
			{
				if(bulletTracePassed(self getTagOrigin( "j_head" ), self getTagOrigin( "j_head" )+(0,0,255), false, self) || self.pers["bots"]["skill"]["base"] <= 4) self bots_airdrop();
			}
		}
		break;
		case "airdrop_mega": if(!self bots_isEmp())
		{
			if(bulletTracePassed(self getTagOrigin( "j_head" ), self getTagOrigin( "j_head" )+(0,0,255), false, self) || self.pers["bots"]["skill"]["base"] <= 4) self bots_airdropmega();
		}
		break;
		case "sentry": if(!self bots_isEmp())
		{
			pos = self bots_GetCursorPosition();
			if(distance(pos, self.origin) > 400 || self.pers["bots"]["skill"]["base"] <= 4) self bots_sentry();
		}
		break;
		case "harrier_airstrike": case "precision_airstrike": case "stealth_airstrike": if(!self bots_isEmp())
		{
			if(level.planes < 2 || self.pers["killstreaks"][0].streakName != "harrier_airstrike")
			{
				players = [];
				target = undefined;
				foreach(player in level.players)
				{
					if(player == self) continue;
					if(level.teamBased && self.pers["team"] == player.pers["team"]) continue;
					if(!bots_isReallyAlive(player)) continue;
					if(!player bots_hasPerk("specialty_coldblooded"))
					{
						if(bulletTracePassed(player getTagOrigin( "j_head" ), player getTagOrigin( "j_head" )+(0,0,255), false, player) || self.pers["bots"]["skill"]["base"] <= 4)
						{
							players[players.size] = player;
						}
					}
				}
				if(players.size > 0) target = players[randomint(players.size)];
				if(isDefined(target) || self.pers["bots"]["skill"]["base"] < 3)
				{
					self.bots_doing = "laptop";
					lastWeapon = self getCurrentWeapon();
					self thread maps\mp\killstreaks\_killstreaks::killstreakUsePressed();
					switch(self.pers["killstreaks"][0].streakName)
					{
						case "harrier_airstrike": self bots__giveWeapon("killstreak_harrier_airstrike_mp", 0);
						self setspawnweapon("killstreak_harrier_airstrike_mp");
						break;
						case "stealth_airstrike": self bots__giveWeapon("killstreak_stealth_airstrike_mp", 0);
						self setspawnweapon("killstreak_stealth_airstrike_mp");
						break;
						case "precision_airstrike": self bots__giveWeapon("killstreak_precision_airstrike_mp", 0);
						self setspawnweapon("killstreak_precision_airstrike_mp");
						break;
					}
					wait 1;
					if(isDefined(target))
					{
						self notify( "confirm_location", target.origin, randomint(360) );
					}
					else
					{
						self notify( "confirm_location", self.origin, randomint(360) );
					}
					wait 1;
					self setspawnweapon(lastWeapon);
					self takeweapon("killstreak_stealth_airstrike_mp");
					self takeweapon("killstreak_precision_airstrike_mp");
					self takeweapon("killstreak_harrier_airstrike_mp");
					self.bots_doing = "none";
				}
			}
		}
		break;
		case "uav": if(!self bots_isEmp())
		{
			if(((!self.isRadarBlocked && !level.teambased) || (level.teambased && level.activeCounterUAVs[level.otherTeam[self.team]] <= 0)) || self.pers["bots"]["skill"]["base"] < 3)
			{
				self.bots_doing = "ks_call";
				lastWeapon = self getCurrentWeapon();
				self bots__giveWeapon("killstreak_uav_mp", 0);
				self setspawnweapon("killstreak_uav_mp");
				wait 1;
				self thread maps\mp\killstreaks\_killstreaks::killstreakUsePressed();
				self setspawnweapon(lastWeapon);
				self takeweapon("killstreak_uav_mp");
				self.bots_doing = "none";
			}
		}
		break;
		case "counter_uav": if(!self bots_isEmp())
		{
			self.bots_doing = "ks_call";
			lastWeapon = self getCurrentWeapon();
			self bots__giveWeapon("killstreak_counter_uav_mp", 0);
			self setspawnweapon("killstreak_counter_uav_mp");
			wait 1;
			self thread maps\mp\killstreaks\_killstreaks::killstreakUsePressed();
			self setspawnweapon(lastWeapon);
			self takeweapon("killstreak_counter_uav_mp");
			self.bots_doing = "none";
		}
		break;
		case "helicopter": if(!self bots_isEmp())
		{
			self.bots_doing = "ks_call";
			lastWeapon = self getCurrentWeapon();
			self bots__giveWeapon("killstreak_helicopter_mp", 0);
			self setspawnweapon("killstreak_helicopter_mp");
			wait 1;
			self thread maps\mp\killstreaks\_killstreaks::killstreakUsePressed();
			self setspawnweapon(lastWeapon);
			self takeweapon("killstreak_helicopter_mp");
			self.bots_doing = "none";
		}
		break;
		case "helicopter_flares": if(!self bots_isEmp())
		{
			self.bots_doing = "ks_call";
			lastWeapon = self getCurrentWeapon();
			self bots__giveWeapon("killstreak_helicopter_flares_mp", 0);
			self setspawnweapon("killstreak_helicopter_flares_mp");
			wait 1;
			self thread maps\mp\killstreaks\_killstreaks::killstreakUsePressed();
			self setspawnweapon(lastWeapon);
			self takeweapon("killstreak_helicopter_flares_mp");
			self.bots_doing = "none";
		}
		break;
		case "emp": if(!self bots_isEmp())
		{
			self.bots_doing = "ks_call";
			lastWeapon = self getCurrentWeapon();
			self bots__giveWeapon("killstreak_emp_mp", 0);
			self setspawnweapon("killstreak_emp_mp");
			wait 1;
			self thread maps\mp\killstreaks\_killstreaks::killstreakUsePressed();
			self setspawnweapon(lastWeapon);
			self takeweapon("killstreak_emp_mp");
			self.bots_doing = "none";
		}
		break;
		case "nuke": if(!self bots_isEmp() && getDvarInt("bots_loadout_nuke"))
		{
			if(!isDefined( level.nukeIncoming ))
			{
				self.bots_doing = "ks_call";
				lastWeapon = self getCurrentWeapon();
				self bots__giveWeapon("killstreak_nuke_mp", 0);
				self setspawnweapon("killstreak_nuke_mp");
				wait 1;
				self thread maps\mp\killstreaks\_killstreaks::killstreakUsePressed();
				self setspawnweapon(lastWeapon);
				self takeweapon("killstreak_nuke_mp");
				self.bots_doing = "none";
			}
		}
		break;
		case "predator_missile": break;
		case "ac130": if(!self bots_isEmp() && !level.ac130InUse)
		{
			if(randomint(5) && self mp\bots_walk::bots_shouldGetObj() && self.pers["killstreaks"][0].lifeId <= self.pers["deaths"])
			{
				self.bots_objDoing = "ks_camp";
				self bots_campThread1();
				self thread bots_campThread();
				self.bots_objDoing = "none";
			}
			if(!self bots_isEmp() && !level.ac130InUse && self bots_doingNothing() && !isDefined(self.bots_RealSeen) && isDefined(self.pers["killstreaks"][0]) && self.pers["killstreaks"][0].streakName == "ac130" && getDvar("bots_loadout_killstreak") != "none" && !isDefined(self.lastStand)) self thread maps\mp\killstreaks\_killstreaks::killstreakUsePressed();
		}
		break;
		case "helicopter_minigun": if(!self bots_isEmp() && !isDefined(level.chopper))
		{
			if(randomint(5) && self mp\bots_walk::bots_shouldGetObj() && self.pers["killstreaks"][0].lifeId <= self.pers["deaths"])
			{
				self.bots_objDoing = "ks_camp";
				self bots_campThread1();
				self thread bots_campThread();
				self.bots_objDoing = "none";
			}
			if(!self bots_isEmp() && !isDefined(level.chopper) && self bots_doingNothing() && !isDefined(self.bots_RealSeen) && isDefined(self.pers["killstreaks"][0]) && self.pers["killstreaks"][0].streakName == "helicopter_minigun" && getDvar("bots_loadout_killstreak") != "none" && !isDefined(self.lastStand)) self thread maps\mp\killstreaks\_killstreaks::killstreakUsePressed();
		}
		break;
	}
}
bots_watchConKS()
{
	self endon("bot_reset");
	for(;;)
	{
		if(self bots_isInChopper()) self bots_chopper();
		else if(self bots_isInAC130()) self bots_ac130();
		else if(self bots_doingNothing() && !isDefined(self.bots_RealSeen) && isDefined(self.pers["killstreaks"][0]) && self.pers["killstreaks"][0].streakName == "predator_missile" && getDvar("bots_loadout_killstreak") != "none" && bots_gameFlag( "prematch_done" ) && !level.inGracePeriod && !isDefined(self.lastStand) && !self bots_isEmp()) self bots_predator();
		wait 1;
	}
}
bots_campThread1()
{
	self endon("kill_bot_walk");
	self mp\bots_walk::bots_goCamp(true, 1, false);
}
bots_campThread()
{
	self endon("bot_reset");
	self endon("kill_bot_walk");
	self endon("death");
	self mp\bots_walk::bots_goCamp(true, 10, false);
}
bots_isInAC130()
{
	if(level.ac130InUse && isDefined(level.ac130player) && level.ac130player == self && self bots_isUsingRemote()) return true;
	else return false;
}
bots_isInChopper()
{
	if(isDefined(level.chopper) && level.chopper.heliType == "minigun" && isDefined(level.chopper.owner) && level.chopper.owner == self && self bots_isUsingRemote()) return true;
	else return false;
}
bots_predator()
{
	if(!randomint(3) && self mp\bots_walk::bots_shouldGetObj() && self.pers["killstreaks"][0].lifeId <= self.pers["deaths"])
	{
		self.bots_objDoing = "ks_camp";
		self bots_campThread1();
		self thread bots_campThread();
		self.bots_objDoing = "none";
	}
	if(self bots_doingNothing() && !isDefined(self.bots_RealSeen) && isDefined(self.pers["killstreaks"][0]) && self.pers["killstreaks"][0].streakName != "" && self.pers["killstreaks"][0].streakName == "predator_missile" && getDvar("bots_loadout_killstreak") != "none" && !isDefined(self.lastStand) && !self bots_isEmp() && bots_isReallyAlive(self))
	{
		players = [];
		target = undefined;
		foreach(player in level.players)
		{
			if(player == self) continue;
			if(level.teamBased && self.pers["team"] == player.pers["team"]) continue;
			if(!bots_isReallyAlive(player)) continue;
			if(!player bots_hasPerk("specialty_coldblooded"))
			{
				if(bulletTracePassed(player getTagOrigin( "j_head" ), player getTagOrigin( "j_head" )+(0,0,255), false, player) || self.pers["bots"]["skill"]["base"] <= 4)
				{
					players[players.size] = player;
				}
			}
		}
		if(players.size > 0) target = players[randomint(players.size)];
		if(isDefined(target) || self.pers["bots"]["skill"]["base"] < 3)
		{
			self.bots_doing = "laptop";
			lastWeapon = self getCurrentWeapon();
			self bots__giveWeapon("killstreak_predator_missile_mp", 0);
			self setspawnweapon("killstreak_predator_missile_mp");
			self maps\mp\killstreaks\_killstreaks::usedKillstreak( "predator_missile", true );
			lifeId = self.pers["killstreaks"][0].lifeId;
			self maps\mp\killstreaks\_killstreaks::shuffleKillStreaksFILO( "predator_missile" );
			if(isDefined(target)) rocket = MagicBullet( "remotemissile_projectile_mp", self.origin + (0,0,7000 - (self.pers["bots"]["skill"]["base"] * 400)), target getTagOrigin( "j_head" ), self );
			else rocket = MagicBullet( "remotemissile_projectile_mp", self.origin + (0,0,7000 - (self.pers["bots"]["skill"]["base"] * 400)), self.origin, self );
			if(isDefined(rocket))
			{
				rocket.lifeId = lifeId;
				rocket.type = "remote";
				rocket thread maps\mp\gametypes\_weapons::AddMissileToSightTraces( self.pers["team"] );
				rocket thread maps\mp\killstreaks\_remotemissile::handleDamage();
				maps\mp\killstreaks\_remotemissile::MissileEyes( self, rocket );
			}
			if(bots_isReallyAlive(self))
			{
				self.bots_doing = "none";
				self setspawnweapon(lastWeapon);
				self takeweapon("killstreak_predator_missile_mp");
			}
		}
	}
}
bots_airdropSent()
{
	self endon("bot_kill_streak");
	self thread bots_watchAirdropSent();
	for(;;)
	{
		if(!self getAmmoCount("airdrop_sentry_marker_mp")) self bots__giveWeapon("airdrop_sentry_marker_mp", 0);
		if(self getCurrentWeapon() != "airdrop_sentry_marker_mp") self setspawnweapon("airdrop_sentry_marker_mp");
		self thread mp\bots_aim::bots_shootWeapon();
		bots_waitFrame();
	}
}
bots_watchAirdropSent()
{
	self endon("bot_reset");
	self endon("death");
	lastWeapon = self getCurrentWeapon();
	self bots__giveWeapon("airdrop_sentry_marker_mp", 0);
	self.bots_doing = "nade_fire";
	self waittill( "grenade_fire" );
	self notify("bot_kill_streak");
	self setspawnweapon(lastWeapon);
	self takeweapon("airdrop_sentry_marker_mp");
	self.bots_doing = "none";
}
bots_airdrop()
{
	self endon("bot_kill_streak");
	self thread bots_watchAirdrop();
	for(;;)
	{
		if(!self getAmmoCount("airdrop_marker_mp")) self bots__giveWeapon("airdrop_marker_mp", 0);
		if(self getCurrentWeapon() != "airdrop_marker_mp") self setspawnweapon("airdrop_marker_mp");
		self thread mp\bots_aim::bots_shootWeapon();
		bots_waitFrame();
	}
}
bots_watchAirdrop()
{
	self endon("bot_reset");
	self endon("death");
	lastWeapon = self getCurrentWeapon();
	self bots__giveWeapon("airdrop_marker_mp", 0);
	self.bots_doing = "nade_fire";
	self waittill( "grenade_fire" );
	self notify("bot_kill_streak");
	self setspawnweapon(lastWeapon);
	self takeweapon("airdrop_marker_mp");
	self.bots_doing = "none";
}
bots_airdropMega()
{
	self endon("bot_kill_streak");
	self thread bots_watchAirdropMega();
	for(;;)
	{
		if(!self getAmmoCount("airdrop_mega_marker_mp")) self bots__giveWeapon("airdrop_mega_marker_mp", 0);
		if(self getCurrentWeapon() != "airdrop_mega_marker_mp") self setspawnweapon("airdrop_mega_marker_mp");
		self thread mp\bots_aim::bots_shootWeapon();
		bots_waitFrame();
	}
}
bots_watchAirdropMega()
{
	self endon("bot_reset");
	self endon("death");
	lastWeapon = self getCurrentWeapon();
	self bots__giveWeapon("airdrop_mega_marker_mp", 0);
	self.bots_doing = "nade_fire";
	self waittill( "grenade_fire" );
	self notify("bot_kill_streak");
	self setspawnweapon(lastWeapon);
	self takeweapon("airdrop_mega_marker_mp");
	self.bots_doing = "none";
}
bots_sentry()
{
	self maps\mp\killstreaks\_killstreaks::usedKillstreak( "sentry", true );
	sentryGun = maps\mp\killstreaks\_autosentry::createSentryForPlayer( "sentry_minigun", self );
	sentryGun maps\mp\killstreaks\_autosentry::sentry_setPlaced();
	self maps\mp\killstreaks\_killstreaks::shuffleKillStreaksFILO( "sentry" );
}
bots_changeAC130weaps()
{
	self endon("bot_reset");
	self endon("bot_kill_ac130");
	for(;;)
	{
		self bots__giveWeapon("ac130_105mm_mp", 0);
		self setspawnweapon("ac130_105mm_mp");
		wait 2+(randomint(3));
		self bots__giveWeapon("ac130_40mm_mp", 0);
		self setspawnweapon("ac130_40mm_mp");
		wait 2+(randomint(4));
		self bots__giveWeapon("ac130_25mm_mp", 0);
		self setspawnweapon("ac130_25mm_mp");
		wait 2+(randomint(4));
	}
}
bots_goodToAim(target)
{
	if(!self bots_isInAC130() && !self bots_isInChopper()) return false;
	if(self mp\bots_aim::bots_isPlayerGood(target)) return true;
	else return false;
}
bots_ac130()
{
	lastWeapon = self getCurrentWeapon();
	self bots__giveWeapon("ac130_105mm_mp", 0);
	self bots__giveWeapon("ac130_25mm_mp", 0);
	self bots__giveWeapon("ac130_40mm_mp", 0);
	self.bots_doing = "laptop";
	self.bots_aimDoing = "ac130";
	self thread bots_changeAC130weaps();
	while(self bots_isInAC130())
	{
		self.bots_doing = "laptop";
		self.bots_aimDoing = "ac130";
		target = self mp\bots_aim::bots_getTargetLaptopPlayer(level.ac130.planemodel);
		if(isDefined(target))
		{
			while(self bots_goodToAim(target))
			{
				self thread mp\bots_aim::bots_doAim(VectorToAngles(target gettagorigin("j_spineupper")-self getEye()), self.pers["bots"]["skill"]["aimSpeed"]);
				self thread mp\bots_aim::bots_ShootWeapon();
				bots_waitFrame();
			}
			self mp\bots_aim::bots_StopShooting();
		}
		else
		{
			self mp\bots_aim::bots_StopShooting();
		}
		bots_waitFrame();
	}
	self mp\bots_aim::bots_stopShooting();
	self notify("bot_kill_ac130");
	self setspawnweapon(lastWeapon);
	self takeWeapon("ac130_105mm_mp");
	self takeWeapon("ac130_25mm_mp");
	self takeWeapon("ac130_40mm_mp");
	self.bots_doing = "none";
	self.bots_aimDoing = "none";
}
bots_chopper()
{
	lastWeapon = self getCurrentWeapon();
	self bots__giveWeapon("heli_remote_mp", 0);
	self setspawnweapon("heli_remote_mp");
	self.bots_doing = "laptop";
	self.bots_aimDoing = "chopper";
	while(self bots_isInChopper())
	{
		self.bots_doing = "laptop";
		self.bots_aimDoing = "chopper";
		if(self getCurrentWeapon() != "heli_remote_mp") self setspawnweapon("heli_remote_mp");
		target = self mp\bots_aim::bots_getTargetLaptopPlayer(level.chopper);
		if(isDefined(target))
		{
			while(self bots_goodToAim(target))
			{
				self thread mp\bots_aim::bots_doAim(VectorToAngles(target gettagorigin("j_spineupper")-self getEye()), self.pers["bots"]["skill"]["aimSpeed"]+2);
				self thread mp\bots_aim::bots_ShootWeapon();
				bots_waitFrame();
			}
			self mp\bots_aim::bots_StopShooting();
		}
		else
		{
			self mp\bots_aim::bots_StopShooting();
		}
		bots_waitFrame();
	}
	self mp\bots_aim::bots_stopShooting();
	self setspawnweapon(lastWeapon);
	self takeWeapon("heli_remote_mp");
	self.bots_doing = "none";
	self.bots_aimDoing = "none";
}
bots_isEmp()
{
	if((level.teamBased && level.teamEMPed[self.team]) || (!level.teamBased && isDefined( level.empPlayer ) && level.empPlayer != self)) return true;
	else return false;
}
bots_setupBotStreaks()
{
	self.pers["bots"]["killstreaks"][0] = "";
	self.pers["bots"]["killstreaks"][1] = "";
	self.pers["bots"]["killstreaks"][2] = "";
	switch(getDvar("bots_loadout_killstreak"))
	{
		case "random": for(i=0;i<3;)
		{
			switch(randomint(15))
			{
				case 0: if(self.pers["bots"]["killstreaks"][0] != "uav" && self.pers["bots"]["killstreaks"][1] != "uav" && self.pers["bots"]["killstreaks"][2] != "uav")
				{
					self.pers["bots"]["killstreaks"][i] = "uav";
					i++;
				}
				break;
				case 1: if((self.pers["bots"]["killstreaks"][0] != "counter_uav" && self.pers["bots"]["killstreaks"][1] != "counter_uav" && self.pers["bots"]["killstreaks"][2] != "counter_uav") && (self.pers["bots"]["killstreaks"][0] != "airdrop" && self.pers["bots"]["killstreaks"][1] != "airdrop" && self.pers["bots"]["killstreaks"][2] != "airdrop"))
				{
					self.pers["bots"]["killstreaks"][i] = "counter_uav";
					i++;
				}
				break;
				case 2: if((self.pers["bots"]["killstreaks"][0] != "counter_uav" && self.pers["bots"]["killstreaks"][1] != "counter_uav" && self.pers["bots"]["killstreaks"][2] != "counter_uav") && (self.pers["bots"]["killstreaks"][0] != "airdrop" && self.pers["bots"]["killstreaks"][1] != "airdrop" && self.pers["bots"]["killstreaks"][2] != "airdrop"))
				{
					self.pers["bots"]["killstreaks"][i] = "airdrop";
					i++;
				}
				break;
				case 3: if((self.pers["bots"]["killstreaks"][0] != "predator_missile" && self.pers["bots"]["killstreaks"][1] != "predator_missile" && self.pers["bots"]["killstreaks"][2] != "predator_missile") && (self.pers["bots"]["killstreaks"][0] != "airdrop_sentry_minigun" && self.pers["bots"]["killstreaks"][1] != "airdrop_sentry_minigun" && self.pers["bots"]["killstreaks"][2] != "airdrop_sentry_minigun"))
				{
					self.pers["bots"]["killstreaks"][i] = "predator_missile";
					i++;
				}
				break;
				case 4: if((self.pers["bots"]["killstreaks"][0] != "predator_missile" && self.pers["bots"]["killstreaks"][1] != "predator_missile" && self.pers["bots"]["killstreaks"][2] != "predator_missile") && (self.pers["bots"]["killstreaks"][0] != "airdrop_sentry_minigun" && self.pers["bots"]["killstreaks"][1] != "airdrop_sentry_minigun" && self.pers["bots"]["killstreaks"][2] != "airdrop_sentry_minigun"))
				{
					self.pers["bots"]["killstreaks"][i] = "airdrop_sentry_minigun";
					i++;
				}
				break;
				case 5: if(self.pers["bots"]["killstreaks"][0] != "precision_airstrike" && self.pers["bots"]["killstreaks"][1] != "precision_airstrike" && self.pers["bots"]["killstreaks"][2] != "precision_airstrike")
				{
					self.pers["bots"]["killstreaks"][i] = "precision_airstrike";
					i++;
				}
				break;
				case 6: if((self.pers["bots"]["killstreaks"][0] != "helicopter" && self.pers["bots"]["killstreaks"][1] != "helicopter" && self.pers["bots"]["killstreaks"][2] != "helicopter") && (self.pers["bots"]["killstreaks"][0] != "harrier_airstrike" && self.pers["bots"]["killstreaks"][1] != "harrier_airstrike" && self.pers["bots"]["killstreaks"][2] != "harrier_airstrike"))
				{
					self.pers["bots"]["killstreaks"][i] = "helicopter";
					i++;
				}
				break;
				case 7: if((self.pers["bots"]["killstreaks"][0] != "helicopter" && self.pers["bots"]["killstreaks"][1] != "helicopter" && self.pers["bots"]["killstreaks"][2] != "helicopter") && (self.pers["bots"]["killstreaks"][0] != "harrier_airstrike" && self.pers["bots"]["killstreaks"][1] != "harrier_airstrike" && self.pers["bots"]["killstreaks"][2] != "harrier_airstrike"))
				{
					self.pers["bots"]["killstreaks"][i] = "harrier_airstrike";
					i++;
				}
				break;
				case 8: if(self.pers["bots"]["killstreaks"][0] != "airdrop_mega" && self.pers["bots"]["killstreaks"][1] != "airdrop_mega" && self.pers["bots"]["killstreaks"][2] != "airdrop_mega")
				{
					self.pers["bots"]["killstreaks"][i] = "airdrop_mega";
					i++;
				}
				break;
				case 9: if((self.pers["bots"]["killstreaks"][0] != "stealth_airstrike" && self.pers["bots"]["killstreaks"][1] != "stealth_airstrike" && self.pers["bots"]["killstreaks"][2] != "stealth_airstrike") && (self.pers["bots"]["killstreaks"][0] != "helicopter_flares" && self.pers["bots"]["killstreaks"][1] != "helicopter_flares" && self.pers["bots"]["killstreaks"][2] != "helicopter_flares"))
				{
					self.pers["bots"]["killstreaks"][i] = "stealth_airstrike";
					i++;
				}
				break;
				case 10: if((self.pers["bots"]["killstreaks"][0] != "stealth_airstrike" && self.pers["bots"]["killstreaks"][1] != "stealth_airstrike" && self.pers["bots"]["killstreaks"][2] != "stealth_airstrike") && (self.pers["bots"]["killstreaks"][0] != "helicopter_flares" && self.pers["bots"]["killstreaks"][1] != "helicopter_flares" && self.pers["bots"]["killstreaks"][2] != "helicopter_flares"))
				{
					self.pers["bots"]["killstreaks"][i] = "helicopter_flares";
					i++;
				}
				break;
				case 11: if((self.pers["bots"]["killstreaks"][0] != "ac130" && self.pers["bots"]["killstreaks"][1] != "ac130" && self.pers["bots"]["killstreaks"][2] != "ac130") && (self.pers["bots"]["killstreaks"][0] != "helicopter_minigun" && self.pers["bots"]["killstreaks"][1] != "helicopter_minigun" && self.pers["bots"]["killstreaks"][2] != "helicopter_minigun"))
				{
					self.pers["bots"]["killstreaks"][i] = "ac130";
					i++;
				}
				break;
				case 12: if((self.pers["bots"]["killstreaks"][0] != "ac130" && self.pers["bots"]["killstreaks"][1] != "ac130" && self.pers["bots"]["killstreaks"][2] != "ac130") && (self.pers["bots"]["killstreaks"][0] != "helicopter_minigun" && self.pers["bots"]["killstreaks"][1] != "helicopter_minigun" && self.pers["bots"]["killstreaks"][2] != "helicopter_minigun"))
				{
					self.pers["bots"]["killstreaks"][i] = "helicopter_minigun";
					i++;
				}
				break;
				case 13: if(self.pers["bots"]["killstreaks"][0] != "emp" && self.pers["bots"]["killstreaks"][1] != "emp" && self.pers["bots"]["killstreaks"][2] != "emp")
				{
					self.pers["bots"]["killstreaks"][i] = "emp";
					i++;
				}
				break;
				case 14: if(self.pers["bots"]["killstreaks"][0] != "nuke" && self.pers["bots"]["killstreaks"][1] != "nuke" && self.pers["bots"]["killstreaks"][2] != "nuke")
				{
					self.pers["bots"]["killstreaks"][i] = "nuke";
					i++;
				}
				break;
			}
		}
		break;
		case "default": switch(randomint(6))
		{
			case 0: self.pers["bots"]["killstreaks"][2] = "nuke";
			if(randomint(2)) self.pers["bots"]["killstreaks"][1] = "helicopter_minigun";
			else self.pers["bots"]["killstreaks"][1] = "ac130";
			self.pers["bots"]["killstreaks"][0] = "harrier_airstrike";
			break;
			case 1: self.pers["bots"]["killstreaks"][0] = "uav";
			self.pers["bots"]["killstreaks"][1] = "counter_uav";
			if(randomint(2)) self.pers["bots"]["killstreaks"][2] = "predator_missile";
			else self.pers["bots"]["killstreaks"][2] = "harrier_airstrike";
			break;
			case 2: self.pers["bots"]["killstreaks"][0] = "airdrop";
			self.pers["bots"]["killstreaks"][1] = "airdrop_sentry_minigun";
			self.pers["bots"]["killstreaks"][2] = "airdrop_mega";
			break;
			case 3: self.pers["bots"]["killstreaks"][0] = "predator_missile";
			self.pers["bots"]["killstreaks"][1] = "harrier_airstrike";
			self.pers["bots"]["killstreaks"][2] = "helicopter_flares";
			break;
			case 4: self.pers["bots"]["killstreaks"][0] = "helicopter";
			self.pers["bots"]["killstreaks"][1] = "helicopter_flares";
			self.pers["bots"]["killstreaks"][2] = "helicopter_minigun";
			break;
			case 5: self.pers["bots"]["killstreaks"][0] = "precision_airstrike";
			self.pers["bots"]["killstreaks"][1] = "harrier_airstrike";
			self.pers["bots"]["killstreaks"][2] = "stealth_airstrike";
			break;
		}
		break;
	}
}