#include mp\bots_funcs;

bots_MainAimbot()
{
	self endon("bot_reset");
	self endon("death");
	for(i=0;;i++)
	{
		if(self bots_shouldAim())
		{
			if(self bots_isClimbing())
			{
				self bots_doClimbingAim();
			}
			else
			{
				if(i == 1)
				{
					if(self bots_canTDKS())
						killstreak = self bots_getTargetKillstreak();
					else
						killstreak = undefined;
				}
				else
				{
					killstreak = undefined;
				}
				if(isDefined(killstreak))
				{
					self bots_doKillKillstreak(killstreak);
				}
				else
				{
						target = self bots_getTargetOnFootPlayer();
					if(isDefined(target))
					{
						self bots_doKillOnFootPlayer(target);
					}
					else
					{
						if(i == 6)
						{
							if(self bots_canKillEqu())
								equ = self bots_getTargetEquipment();
							else
								equ = undefined;
						}
						else
						{
							equ = undefined;
						}
						if(isDefined(equ) && (equ.bots_EquipmentType != 2 || !self.bots_camping))
						{
							self bots_doKillEqu(equ);
						}
						else
						{
							if(i == 16)
							{
								doinNone = self bots_doingNothing();
								if(doinNone)
									self thread bots_checkSwitchWeap();
								if(doinNone || (self.bots_doing == "laststand" && self bots_hasPerk("specialty_laststandoffhand")))
									self thread bots_doGNade();
							}
							self bots_stopShooting();
							if(!isDefined(self.bots_campingAngles))
								angles = VectorToAngles(((self.bots_tempwp-self.origin)-(anglesToForward(self getplayerangles()))));
							else
								angles = self.bots_campingAngles;
							self thread bots_doAim(angles, self.pers["bots"]["skill"]["aimSpeed"]);
						}
					}
				}
			}
		}
		if(i > 19)
			i = 0;
		bots_waitFrame();
	}
}

bots_doAim(angles, speed)
{
	self notify("bots_aim_overlap");
	self endon("bots_aim_overlap");
	self endon("bot_reset");
	self endon("death");
	if(getDvarInt("bots_play_aim"))
		if(!self bots_setPlayerAngesReal(angles, speed))
			self setPlayerAngles(angles);
}

bots_doKillEqu(equ)
{
	self.bots_realEqu = equ;
	while(self bots_isGoodToAimAtEqu(equ))
	{
		isBotDoingNothing = self bots_doingNothing();
		if(isBotDoingNothing)
			self thread bots_checkSwitchWeap();
		if(!self bots_isShellShocked())
		{
			if(equ.bots_EquipmentType == 0)
			{
				self bots_shootWeapon();
				angles = VectorToAngles( ( equ.origin + (0, 0, 35) ) - ( self getEye() ) );
				if((isBotDoingNothing || self.bots_doing == "laststand") && distance(self.origin, equ.origin) < level.bots_knifeDis && getDvarInt("bots_loadout_knife"))
				{
					self.bots_doing = "knife";
					wait self.pers["bots"]["skill"]["shootDelay"];
					lastWeapon = self getCurrentWeapon();
					if(lastWeapon != "riotshield_mp")
					{
						self bots__giveWeapon("killstreak_counter_uav_mp", 0);
						self setspawnweapon("killstreak_counter_uav_mp");
					}
					self playsound("melee_knife_stab");
					if(getDvarInt("bots_play_aim"))
						self setplayerangles(angles);
					if(isDefined(equ))
					{
						if(!isDefined(self.lastStand))
							self SetOrigin(equ.origin);
						if(randomint(4))
							equ notify( "damage", 103, self, self.angles, self.origin, "MOD_MELEE" );
					}
					wait 1;
					if(lastWeapon != "riotshield_mp")
					{
						self setspawnweapon(lastWeapon);
						self takeweapon("killstreak_counter_uav_mp");
					}
					self.bots_doing = "none";
				}
			}
			else
			{
				if(equ.bots_EquipmentType != 2)
				{
					self bots_shootWeapon();
					angles = VectorToAngles( ( equ.origin + (0, 0, 5) ) - ( self getEye() ) );
					if(!randomint(25) && self.pers["bots"]["skill"]["base"] > 4 && self.bots_firing)
						equ notify( "damage", 5, self );
				}
				else
				{
					angles = VectorToAngles( ( equ.origin + (0, 0, 5) ) - ( self getEye() ) );
				}
			}
			self thread bots_doAim(angles, self.pers["bots"]["skill"]["aimSpeed"]);
		}
		bots_waitFrame();
	}
	self.bots_realEqu = undefined;
	self bots_stopShooting();
}

bots_doKillKillstreak(killstreak)
{
	if((self getAmmoCount("stinger_mp") || self getAmmoCount("rpg_mp") || self getAmmoCount("at4_mp")) && bots_weapClass(self getCurrentWeapon()) != "rocketlauncher")
		self bots_SwitchToOff();
	
	self bots_doAntiAir(killstreak);
}

bots_doAntiAir(tarKS)
{
	tarKS endon("death");

	weap = self getCurrentWeapon();
	if(weap == "stinger_mp" || weap == "at4_mp")
	{
		if(!self bots_doingNothing())
			return;
		self thread bots_doNoneOnKSDeath(tarks);
		self bots_rocketWait(tarKS);
		self notify("bot_rocket_kill");
		if(isDefined(tarKS) && (self getAmmoCount("stinger_mp") || self getAmmoCount("at4_mp")))
		{
			if (bulletTracePassed( self getEye(), tarKS.origin, false, tarKS ) )
			{
				weap = self getCurrentWeapon();
				if(weap == "stinger_mp" || weap == "at4_mp")
				{
					self SetWeaponAmmoClip(weap, self GetWeaponAmmoClip(weap) - 1);
					rocket = MagicBullet(weap, self getEye(), tarKS.origin, self );
					rocket Missile_SetTargetEnt( tarKS );
					wait 0.05;
					if(isDefined(tarKS) && isDefined(rocket))
					{
						level notify ( "stinger_fired", self, rocket, tarKS );
						self thread bots_setAltSceneObj( rocket, "tag_origin", 65 );
						if(weap == "at4_mp")
							rocket thread maps\mp\gametypes\_shellshock::grenade_earthQuake();
					}
						
					self bots_ShootWeapon();
					wait 1;
					self bots_stopShooting();
				}
			}
		}
	}
	else
	{
		while(self bots_isGoodToAimAtKS(tarKS))
		{
			angles = VectorToAngles((tarKS.origin-self.origin)-(anglesToForward(self getplayerangles())));
			self thread bots_doAim(angles, self.pers["bots"]["skill"]["aimSpeed"]);
			self thread bots_checkSwitchWeap();
			self bots_ShootWeapon();
			bots_waitFrame();
		}
		self bots_stopShooting();
	}
}

bots_watchRocketWait(tarKS)
{
	self endon("bot_reset");
	self endon("death");
	tarKS endon("death");
	self endon("bot_rocketwait_kill");
	for(;;)
	{
		self.bots_aimDoing = "rocket_lock";
		self.bots_doing = "rocket_lock";
		if(isDefined(tarKS))
		{
			if(self getCurrentWeapon() != "at4_mp")
				self bots_shootWeapon();
			else
				self bots_stopShooting();
			angles = VectorToAngles((tarKS.origin-self.origin)-(anglesToForward(self getplayerangles())));
			self thread bots_doAim(angles, self.pers["bots"]["skill"]["aimSpeed"]);
			if ( isDefined( level.chopper ) && isDefined( level.chopper.gunner ) && tarKS == level.chopper )
				level.chopper.gunner playLocalSound( "missile_locking" );

			if ( isDefined( level.ac130player ) && tarKS == level.ac130.planeModel )
				level.ac130player playLocalSound( "missile_locking" );
			
			self playLocalSound( "stinger_locking" );
			self PlayRumbleOnEntity( "ac130_25mm_fire" );
		}
		wait 0.6;
	}
}

bots_rocketWait2(tarKS)
{
	self endon("bot_reset");
	self endon("death");
	tarKS endon("death");
	self endon("bot_rocketwait_kill");
	for(;;)
	{
		self.bots_aimDoing = "rocket_lock";
		self.bots_doing = "rocket_lock";
		if(isDefined(tarKS))
		{
			if(self getCurrentWeapon() != "at4_mp")
				self bots_shootWeapon();
			else
				self bots_stopShooting();
			angles = VectorToAngles((tarKS.origin-self.origin)-(anglesToForward(self getplayerangles())));
			self thread bots_doAim(angles, self.pers["bots"]["skill"]["aimSpeed"]);
			if ( isDefined( level.chopper ) && isDefined( level.chopper.gunner ) && tarKS == level.chopper )
				level.chopper.gunner playLocalSound( "missile_locking" );

			if ( isDefined( level.ac130player ) && tarKS == level.ac130.planeModel )
				level.ac130player playLocalSound( "missile_locking" );
			
			self playLocalSound( "stinger_locked" );
			self PlayRumbleOnEntity( "ac130_25mm_fire" );
		}
		wait 0.25;
	}
}

bots_rocketWait(tarKS)
{
	self.bots_doing = "rocket_lock";
	self.bots_aimDoing = "rocket_lock";
	self thread bots_watchRocketWait(tarKS);
	wait 3;
	self notify("bot_rocketwait_kill");
	self thread bots_rocketWait2(tarks);
	wait 1;
	self.bots_doing = "none";
	self.bots_aimDoing = "none";
	self notify("bot_rocketwait_kill");
}

bots_doNoneOnKSDeath(tarKS)
{
	self endon("bot_reset");
	self endon("death");
	self endon("bot_rocket_kill");
	tarKS waittill("death");
	self.bots_doing = "none";
	self.bots_aimDoing = "none";
	self notify("bot_rocket_kill");
}

bots_doKillWait()
{
	self endon("bot_reset");
	self endon("death");
	self endon("bot_kill_wait");
	wait self.pers["bots"]["skill"]["shootDelay"];
	self notify("bot_kill_wait");
}

bots_doSkillWait(target)
{
	self endon("bot_kill_wait");
	self thread bots_doKillWait();
	while(self bots_isGoodToAimAtPlayer(target))
	{
		if(!isDefined(self.bots_campingAngles))
			angles = VectorToAngles(((self.bots_tempwp-self.origin)-(anglesToForward(self getplayerangles()))));
		else
			angles = self.bots_campingAngles;
		self thread bots_doAim(angles, self.pers["bots"]["skill"]["aimSpeed"]);
		bots_waitFrame();
	}
	self notify("bot_kill_wait");
}

bots_doKillOnFootPlayer(target)
{
	self bots_doSkillWait(target);
	self.bots_realSeen = target;
	while(self bots_isGoodToAimAtPlayer(target))
	{
		isBotDoingNothing = self bots_doingNothing();
		if(isBotDoingNothing)
			self thread bots_checkSwitchWeap();
		if(!self bots_isShellShocked())
		{
			myEye = self getEye();
			dis = Distance(myEye, target.origin);
			if(dis >= level.bots_minNadeDis && (isBotDoingNothing || (self.bots_doing == "laststand" && self bots_hasPerk("specialty_laststandoffhand"))))
				self thread bots_doGNade();
			
			knife = level.bots_knifeDis;
			if(self bots_hasPerk("specialty_extendedmelee"))
				knife = knife + level.bots_knifeDisPerk;
			
			knife = knife*(getDvarFloat("player_meleeRange")/64.0);
			if(dis <= knife && (isBotDoingNothing || self.bots_doing == "laststand") && randomint(self.pers["bots"]["trait"]["knife"]) == 1 && getDvarInt("bots_loadout_knife"))
				self thread bots_melee(target);
			
			weapon = self getCurrentWeapon();
			if(weapon == "m79_mp" || (isSubStr(weapon, "gl_") && !isSubStr(weapon, "_gl")))
			{
				dist = (dis*(dis/400))/40;
				angles = VectorToAngles( ( target getTagOrigin( "j_knee_ri" ) ) - ( myEye ) + (0,0,dist) );
			}
			else
			{
				if(isSubStr(weapon, "grenade_") || weapon == "semtex_mp" || weapon == "throwingknife_mp")
				{
					dist = (dis*(dis/200))/15;
					angles = VectorToAngles( ( target getTagOrigin( "j_spineupper" ) ) - ( myEye ) + (0,0,dist) );
				}
				else
				{
					angles = VectorToAngles( ( target getTagOrigin( "j_spineupper" ) ) - ( myEye ) );
				}
			}
			self thread bots_doAim(angles, self.pers["bots"]["skill"]["aimSpeed"]);
		}
		self bots_shootWeapon();
		bots_waitFrame();
	}
	self.bots_realSeen = undefined;
	wait self.pers["bots"]["skill"]["newTarg"];
}

bots_doClimbingAim()
{
	while(self bots_isClimbing())
	{
		self bots_stopShooting();
		angles = level.waypoints[self.bots_currentStaticWp].angles;
		self thread bots_doAim(angles, self.pers["bots"]["skill"]["aimSpeed"]);
		bots_waitFrame();
	}
}

bots_killShootOnce()
{
	self endon("bot_reset");
	self endon("death");
	wait 0.2;
	self notify("bot_stop_shooting");
	self freezecontrols(true);
	wait 0.75 - self.pers["bots"]["skill"]["base"]/10;
	self.bots_shootTime = false;
}

bots_shootOnce()
{
	self endon("bot_reset");
	self endon("death");
	self endon("bot_stop_shooting");
	self thread bots_killShootOnce();
	self freezecontrols(false);
	for(;;)
	{
		self.bots_shootTime = true;
		self setStance(self.bots_type);
		bots_waitFrame();
	}
}

bots_ShootWeapon()
{
	curWeap = self GetCurrentWeapon();
	if(isSubStr(curWeap, "barrett_") || isSubStr(curWeap, "m21_") || isSubStr(curWeap, "wa2000_"))
	{
		if(!self.bots_shootTime)
		{
			self.bots_shootTime = true;
			
			if(self bots_CanShoot())
			{
				self thread bots_shootOnce();
			}
			else
			{
				self freezecontrols(true);
			}
		}
	}
	else
	{
		if(self bots_CanShoot())
		{
			self freezecontrols(false);
			self setStance(self.bots_type);
		}
		else
		{
			self freezecontrols(true);
		}
	}
}

bots_doBotReload()
{
	weap = self getCurrentWeapon();
	self SetWeaponAmmoStock(weap, self GetWeaponAmmoStock(weap) + self GetWeaponAmmoClip(weap));
	self SetWeaponAmmoClip(weap, 0);
	self bots_ShootWeapon();
}

bots_checkSwitchWeap()
{
	self endon("bot_reset");
	self endon("death");
	if(!self bots_doingNothing())
		return;
	
	weapon = self getCurrentWeapon();
	if(isDefined(self.bots_realSeen) && self.pers["bots"]["skill"]["base"] >= 2 && bots_weapClass(self bots_getSecondaryName()) == "spread"){
		if(Distance(self.origin, self.bots_realSeen.origin) < 500){
			if(bots_weapClass(weapon) != "spread" && !randomint(6)){
				self bots_SwitchToOff();
			}
		} else {
			if(bots_weapClass(weapon) == "spread" && self.pers["bots"]["trait"]["playStyle"] != 2){
				self bots_SwitchToOff();
			}
		}
	}
	if((isDefined(self.bots_realSeen) && (weapon == "none" || weapon == "stinger_mp" || weapon == "onemanarmy_mp")) || (self.pers["bots"]["trait"]["playStyle"] == 2 && self bots_isValidPrimary(bots_getBaseWeaponName(weapon)))) {
		self bots_SwitchToOff();
	}
	clipCount = self GetWeaponAmmoClip( weapon );
	if(isDefined(self.bots_realSeen))
		rnd = randomint(self.pers["bots"]["trait"]["switch"]);
	else
		rnd = randomint(self.pers["bots"]["trait"]["switch"]*4);
		
	if(!self getAmmoCount(weapon) || (!clipCount && (rnd == 2 || rnd == 3 || rnd == 4)) || rnd == 1) {
		self bots_SwitchToOff();
	}
}

bots_doSwitchTime()
{
	self endon("bot_reset");
	self endon("death");
	wait 2.5;
	self.bots_switchTime = false;
}

bots_SwitchToOff()
{
	if(self bots_doingNothing() && !self.bots_switchTime) {
		self.bots_switchTime = true;
		self thread bots_doSwitchTime();
		secondary = bots_getSecondaryName();
		if(self bots_isValidPrimary(bots_getBaseWeaponName(self getCurrentWeapon())) && getdvarint("bots_loadout_secondary")) {
			if(isDefined(secondary) && self getAmmoCount(secondary))
			{
				self.bots_doing = "switch";
				self setspawnweapon(secondary);
			}
		} else {
			primary = bots_getPrimaryName();
			if(isDefined(primary) && self getAmmoCount(primary) && self getCurrentWeapon() != primary)
			{
				self.bots_doing = "switch";
				self setspawnweapon(primary);
			}
		}
		self bots_stopShooting();
		if(self.bots_doing == "switch")
			wait 1;
		self.bots_doing = "none";
	}
}

bots_doNoneOnGNadeAmmo(weap, lastWeap){
self endon("death");
self endon("bot_reset");
self endon("bot_kill_nade");
	while((self getAmmoCount(weap) || self bots_hasPerk("specialty_onemanarmy")) && self getCurrentWeapon() == weap)
		bots_waitFrame();
	wait 1;
	self setspawnweapon(lastWeap);
	self.bots_doing = "none";
	self bots_stopShooting();
	self notify("bot_kill_nade");
}

bots_forceGNadeFire() {
self endon("death");
self endon("bot_reset");
self endon("bot_kill_nade");
	for(;;){
		bots_waitFrame();
		self bots_shootWeapon();
	}
}

bots_watchGNadeFire(lastWeap) {
self endon("death");
self endon("bot_reset");
self endon("bot_kill_nade");
	self bots_waittill_either("grenade_fire", "offhand_end");
	self setspawnweapon(lastWeap);
	self.bots_doing = "none";
	self bots_stopShooting();
	self notify("bot_kill_nade");
}

bots_doNoneOnDeadNadeAim()
{
	self endon("death");
	self endon("bot_reset");
	self waittill("bot_kill_nade");
	self.bots_camping = false;
	self.bots_campingAngles = undefined;
}

bots_forceGNadeAim(pos, dis, istube)
{
	self thread bots_doNoneOnDeadNadeAim();
	
	if(!isDefined(istube))
		dist = (dis*(dis/200))/15;
	else
		dist = (dis*(dis/400))/40;
	self.bots_camping = true;
	self.bots_campingAngles = VectorToAngles( ( pos ) - ( self getEye() ) + (0,0,dist) );
}

bots_doGNade()
{
	self endon("death");
	self endon("bot_reset");
	self endon("bot_kill_nade");
	
	canNade = (self bots_doingNothing() || (self.bots_doing == "laststand" && self bots_hasPerk("specialty_laststandoffhand")));
	
	if(!canNade)
		return;
	
	if(isDefined(self.bots_realSeen))
		rnd = randomint(self.pers["bots"]["trait"]["nade"]);
	else
		rnd = randomint(self.pers["bots"]["trait"]["nade"]*16);
	
	if(rnd == 3 || rnd == 4){
		hasOMA = self bots_hasPerk("specialty_onemanarmy");
		weapS = self bots_getWeaponShot();
		if(isDefined(weapS) && (self getAmmoCount(weapS) || hasOMA) && getDvarInt("bots_loadout_shotgun") && self bots_doingNothing()){
			self.bots_Doing = "shotg";
			lastWeapon = self getCurrentWeapon();
			self setspawnweapon(weapS);
			self thread bots_doNoneOnGNadeAmmo(weapS, lastWeapon);
			if(hasOMA || self getAmmoCount(weapS))
				wait 10;
					
			self setspawnweapon(lastWeapon);
			self.bots_Doing = "none";
			self notify("bot_kill_nade");
		}
	} else {
		if(rnd == 6){
			hasOMA = self bots_hasPerk("specialty_onemanarmy");
			secnade = self bots_getOffhandName();
			if(isDefined(secnade) && (self getAmmoCount(secnade) || hasOMA) && getDvarInt("bots_loadout_nade") && canNade){
				pos = self bots_GetCursorPosition();
				myEye = self getEye();
				dis = Distance(myEye, pos);
				if(isDefined(self.bots_realSeen) || (dis > level.bots_minNadeDis && dis < 5000 && bulletTracePassed(myEye,self.origin+(0,0,255),false,self))) {
					lastWeapon = self getCurrentWeapon();
					self setspawnweapon(secnade);
					self.bots_Doing = "nade_fire";
					self thread bots_watchGNadeFire(lastWeapon);
					self thread bots_forceGNadeFire();
					if(!isDefined(self.bots_realSeen)){
						self bots_forceGNadeAim(pos, dis);
					}
					self thread bots_doNoneOnGNadeAmmo(secnade, lastWeapon);
					wait 3;
					self setspawnweapon(lastWeapon);
					self.bots_Doing = "none";
					self bots_stopShooting();
					self notify("bot_kill_nade");
				}
			}
		} else {
			if(rnd == 1 || rnd == 2){
				hasOMA = self bots_hasPerk("specialty_onemanarmy");
				weap = self bots_getWeaponGL();
				if(isDefined(weap) && (self getAmmoCount(weap) || hasOMA) && getDvarInt("bots_loadout_tube") && self bots_doingNothing()){
					pos = self bots_GetCursorPosition();
					myEye = self getEye();
					dis = Distance(myEye, pos);
					if(isDefined(self.bots_realSeen) || (dis > level.bots_minNadeDis && dis < 5000 && bulletTracePassed(myEye,self.origin+(0,0,255),false,self))) {
						self.bots_Doing = "tube";
						lastWeapon = self getCurrentWeapon();
						self setspawnweapon(weap);
						if(!isDefined(self.bots_realSeen)){
							self.bots_Doing = "ftube";
							self bots_forceGNadeAim(pos, dis, true);
							wait 1;
							self thread bots_forceGNadeFire();
						}
						self thread bots_doNoneOnGNadeAmmo(weap, lastWeapon);
						if(hasOMA || self getAmmoCount(weap))
							wait 5.5;
							
						self setspawnweapon(lastWeapon);
						self.bots_Doing = "none";
						self bots_stopShooting();
						self notify("bot_kill_nade");
					}
				}
			} else {
				if(rnd == 5){
					hasOMA = self bots_hasPerk("specialty_onemanarmy");
					gnade = self bots_getGrenadeName();
					if((gnade == "claymore_mp" || gnade == "specialty_tacticalinsertion" || gnade == "flare_mp") && isDefined(self.bots_realSeen))
						i = randomint(5);
					else
						i = 0;
					if(isDefined(gnade) && (self getAmmoCount(gnade) || hasOMA) && getDvarInt("bots_loadout_nade") && !i && canNade){
						pos = self bots_GetCursorPosition();
						myEye = self getEye();
						dis = Distance(myEye, pos);
						if(isDefined(self.bots_realSeen) || (dis > level.bots_minNadeDis && dis < 5000 && bulletTracePassed(myEye,self.origin+(0,0,255),false,self))) {
							lastWeapon = self getCurrentWeapon();
							self setspawnweapon(gnade);
							self thread bots_watchGNadeFire(lastWeapon);
							self thread bots_forceGNadeFire();
							self.bots_Doing = "nade_fire";
							if(!isDefined(self.bots_realSeen) && !(gnade == "flare_mp" || gnade == "claymore_mp")){
								self bots_forceGNadeAim(pos, dis);
							}
							self thread bots_doNoneOnGNadeAmmo(gnade, lastWeapon);
							wait 5;
							self setspawnweapon(lastWeapon);
							self.bots_Doing = "none";
							self bots_stopShooting();
							self notify("bot_kill_nade");
						}
					}
				}
			}
		}
	}
}

bots_melee(target)
{
	self endon("death");
	self endon("bot_reset");
	if(target == self)
		return;
	
	lastWeapon = self getCurrentWeapon();
		
	wait self.pers["bots"]["skill"]["shootDelay"];
		
	knife = level.bots_knifeDis;
	if(self bots_hasPerk("specialty_extendedmelee"))
		knife = knife + level.bots_knifeDisPerk;
		
	knife = knife*(getDvarFloat("player_meleeRange")/64.0);
	
	if(!self bots_doingNothing() && self.bots_doing != "laststand")
		return;
	
	self.bots_doing = "knife";
	if(lastWeapon != "riotshield_mp"){
		self bots__giveWeapon("killstreak_counter_uav_mp", 0);
		self setspawnweapon("killstreak_counter_uav_mp");
	}
	self playSound("melee_knife_stab");
	wait 0.1;
	if(isDefined(target) && distance(target.origin, self.origin) < knife && bots_isReallyAlive(target))
	{
		if(!isDefined(self.lastStand))
		{
			pushOutDir = VectorNormalize((self.origin[0], self.origin[1], 0)-(target.origin[0], target.origin[1], 0));
			pushoutPos = self.origin + (pushOutDir * (60-distance(target.origin,self.origin)));
			self SetOrigin((pushoutPos[0], pushoutPos[1], target.origin[2]));
		}	
		if(lastWeapon == "riotshield_mp"){
			if(target getCurrentWeapon() == "riotshield_mp") {
				if(!randomint(4))
					target thread [[level.callbackPlayerDamage]](self, self, 53, 0, "MOD_MELEE", "riotshield_mp", self.origin, self.origin, "none", 0);
			} else {
				if(randomint(5))
					target thread [[level.callbackPlayerDamage]](self, self, 53, 0, "MOD_MELEE", "riotshield_mp", self.origin, self.origin, "none", 0);
			}
		} else {
			if(target getCurrentWeapon() == "riotshield_mp") {
				if(!randomint(4) && (self bots_isFacingAtTarget(target, self.pers["bots"]["skill"]["perfView"]) || self bots_hasPerk("specialty_extendedmelee"))) {
					playFx(level.bots_bloodfx,target.origin+(0,0,30));
					target thread [[level.callbackPlayerDamage]](self, self, 103, 0, "MOD_MELEE", lastWeapon, self.origin, self.origin, "none", 0);
				}
			} else {
				if(randomint(5) && (self bots_isFacingAtTarget(target, self.pers["bots"]["skill"]["perfView"]) || self bots_hasPerk("specialty_extendedmelee"))) {
					playFx(level.bots_bloodfx,target.origin+(0,0,30));
					target thread [[level.callbackPlayerDamage]](self, self, 103, 0, "MOD_MELEE", lastWeapon, self.origin, self.origin, "none", 0);
				}
			}
		}
		if(getDvarInt("bots_play_aim"))
			self setplayerangles(VectorToAngles( ( target.origin ) - ( self getEye() ) ));
	}
	if(isSubStr(lastWeapon,"tactical_"))
		wait 0.5;
	else
		wait 1;
		
	if(lastWeapon != "riotshield_mp")
	{
		self setspawnweapon(lastWeapon);
		self takeweapon("killstreak_counter_uav_mp");
	}
	wait 1;
	self.bots_doing = "none";
}

bots_canTDKS()
{
	if(getDvarInt("bots_play_tdks") && (self.bots_traitRandom == 4 || self getAmmoCount("stinger_mp") || self getAmmoCount("rpg_mp") || self getAmmoCount("at4_mp")))
		return true;
	else
		return false;
}

bots_canKillEqu()
{
	if(getdvarint("bots_play_destroyEq") && self.bots_traitRandom != 2)
		return true;
	else
		return false;
}

bots_isGoodToAimAtKS(KS)
{
	if(self bots_isClimbing() || !self bots_shouldAim())
		return false;
	
	if(self getAmmoCount("stinger_mp") || self getAmmoCount("at4_mp"))
		return false;
	
	if(self bots_isKSGood(KS))
		return true;
	else
		return false;
}

bots_isKSGood(KS)
{
	if(!isDefined(ks))
		return false;
	
	if(bulletTracePassed(self getEye(), ks.origin, false, ks))
		return true;
	else
		return false;
}

bots_isGoodToAimAtEqu(equ)
{
	if(self bots_isClimbing() || !self bots_shouldAim())
		return false;
	
	if(self bots_isEquGood(equ))
		return true;
	else
		return false;
}

bots_isEquGood(equ)
{
	if(!isDefined(equ))
		return false;
	
	if(equ.bots_EquipmentType == 0)
	{
		if((equ.health > 20000) && bulletTracePassed(self getEye(), equ.origin + (0, 0, 35), false, equ))
			return true;
	}
	else
	{
		if(bulletTracePassed(self getEye(), equ.origin + (0, 0, 5), false, equ))
			return true;
	}
	return false;
}

bots_isGoodToAimAtPlayer(player)
{
	if(self bots_isClimbing() || !self bots_shouldAim())
		return false;
	
	if(self bots_isPlayerGood(player))
		return true;
	else
		return false;
}

bots_isPlayerGood(player)
{
	if(!isDefined(player))
		return false;
	
	myEye = self getEye();
	if((bots_isReallyAlive(player) && (bulletTracePassed(myEye, player getTagOrigin("j_ankle_le"), false, player) || bulletTracePassed(myEye, player getTagOrigin("j_head"), false, player) || bulletTracePassed(myEye, player getTagOrigin("j_ankle_ri"), false, player))) || (getDVar("bots_main_target") != ""))
		return true;
	else
		return false;
}

bots_hasTargetRocketAmmo()
{
	if(self getAmmoCount("stinger_mp") || self getAmmoCount("at4_mp"))
		return true;
	else
		return false;
}

bots_getTargetKillstreak()
{
	myEye = self getEye();
	if(level.teamBased)
	{
		if ( IsDefined( level.chopper ) && ( level.chopper.team != self.pers["team"] ) )
		{
			if(bulletTracePassed(myEye, level.chopper.origin, false, level.chopper))
				return level.chopper;
		}
		if ( isDefined( level.harriers) )
		{
			foreach( harrier in level.harriers )
			{
				if ( isDefined( harrier ) && ( harrier.team != self.pers["team"] ) )
				{
					if(bulletTracePassed(myEye, harrier.origin, false, harrier))
						return harrier;
				}
			}
		}
		if(self bots_hasTargetRocketAmmo())
		{
			if ( isDefined( level.ac130player ) && level.ac130player.team != self.pers["team"] )
			{
				if(bulletTracePassed(myEye, level.ac130.planemodel.origin, false, level.ac130.planemodel))
					return level.ac130.planemodel;
			}
			if ( level.UAVModels[level.otherTeam[self.pers["team"]]].size )
			{
				foreach ( UAV in level.UAVModels[level.otherTeam[self.pers["team"]]] )
				{
					if(bulletTracePassed(myEye, UAV.origin, false, UAV ))
						return UAV;
				}
			}
		}
	}
	else
	{
		if ( IsDefined( level.chopper ) && ( level.chopper.owner != self ) )
		{
			if(bulletTracePassed(myEye, level.chopper.origin, false, level.chopper ))
				return level.chopper;
		}
		if ( isDefined( level.harriers) )
		{
			foreach( harrier in level.harriers )
			{
				if ( isDefined( harrier ) && harrier.owner != self )
				{
					if(bulletTracePassed(myEye, harrier.origin, false, harrier ))
						return harrier;
				}
			}
		}
		if(self bots_hasTargetRocketAmmo())
		{
			if ( isDefined( level.ac130player ) )
			{
				if(bulletTracePassed(myEye, level.ac130.planemodel.origin, false, level.ac130.planemodel ))
					return level.ac130.planemodel;
			}
			if ( level.UAVModels.size )
			{
				foreach ( ownerGuid, UAV in level.UAVModels )
				{
					if ( isDefined( UAV.owner ) && UAV.owner == self )
						continue;
					if(bulletTracePassed(myEye, UAV.origin, false, UAV ))
						return UAV;
				}
			}
		}
	}
	return undefined;
}

bots_getTargetEquipment()
{
	myEye = self getEye();
	turrets = GetEntArray("misc_turret", "classname");
	if(turrets.size > 0)
	{
		if(level.teamBased)
		{
			foreach(turret in turrets)
			{
				if(turret.health <= 20000)
					continue;
				if(turret.team == self.pers["team"])
					continue;
				if(bulletTracePassed(myEye, turret.origin + (0, 0, 35), false, turret) && self bots_IsFacingAtTarget(turret, self.pers["bots"]["skill"]["perfView"]))
				{
					turret.bots_EquipmentType = 0;
					return turret;
				}
			}
		}
		else
		{
			foreach(turret in turrets)
			{
				if(turret.health <= 20000)
					continue;
				if(turret.owner == self)
					continue;
				if(bulletTracePassed(myEye, turret.origin + (0, 0, 35), false, turret) && self bots_IsFacingAtTarget(turret, self.pers["bots"]["skill"]["perfView"]))
				{
					turret.bots_EquipmentType = 0;
					return turret;
				}
			}
		}
	}
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
				if(bulletTracePassed(myEye, claymore.origin + (0, 0, 5), false, claymore))
				{
					if(self bots_hasPerk("specialty_detectexplosive") || self bots_IsFacingAtTarget(claymore, self.pers["bots"]["skill"]["perfView"]))
					{
						claymore.bots_EquipmentType = 1;
						return claymore;
					}
				}
			}
		}
		if(isDefined(player.c4array))
		{
			foreach(c4 in player.c4array)
			{
				if(bulletTracePassed(myEye, c4.origin + (0, 0, 5), false, c4))
				{
					if(self bots_hasPerk("specialty_detectexplosive") || self bots_IsFacingAtTarget(c4, self.pers["bots"]["skill"]["perfView"]))
					{
						c4.bots_EquipmentType = 1;
						return c4;
					}
				}
			}
		}
		if(isDefined(player.setSpawnPoint))
		{
			if(bulletTracePassed(myEye, player.setSpawnPoint.origin + (0, 0, 5), false, player.setSpawnPoint))
			{
				if(self bots_hasPerk("specialty_detectexplosive") || self bots_IsFacingAtTarget(player.setSpawnPoint, self.pers["bots"]["skill"]["perfView"]))
				{
					player.setSpawnPoint.bots_EquipmentType = 2;
					return player.setSpawnPoint;
				}
			}
		}
	}
	return undefined;
}

bots_getTargetOnFootPlayer()
{
	tarDvar = getDVar("bots_main_target");
	if(tarDvar == "")
	{
		myEye = self getEye();
		foreach(player in level.players)
		{
			if(player == self)
				continue;
			if(level.teamBased && self.pers["team"] == player.pers["team"])
				continue;
			if(!bots_isReallyAlive(player))
				continue;
			dist = distance(myEye, player.origin);
			if(dist > self.pers["bots"]["skill"]["viewDis"])
				continue;
			tarCheck1 = player getTagOrigin( "j_head" );
			trace1 = PhysicsTrace( myEye, tarCheck1 );
			tarCheck2 = player getTagOrigin( "j_ankle_le" );
			trace2 = PhysicsTrace( myEye, tarCheck2 );
			tarCheck3 = player getTagOrigin( "j_ankle_ri" );
			trace3 = PhysicsTrace( myEye, tarCheck3 );
			if(distance(trace1, tarCheck1) > 0 && distance(trace2, tarCheck2) > 0 && distance(trace3, tarCheck3) > 0)
				continue;
			if(!mp\bots::bots_SmokeTrace(myEye, player.origin, 300.0))
				continue;
			if(self bots_IsFacingAtTarget(player, self.pers["bots"]["skill"]["perfView"]) || self bots_getTurned(player))
				return player;
		}
	}
	else
	{
		foreach(player in level.players)
		{
			if(isSubStr(player.name, tarDvar))
				return player;
		}
	}
	return undefined;
}

bots_getTargetLaptopPlayer(model)
{
	tarDvar = getDVar("bots_main_target");
	if(tarDvar == "")
	{
		foreach (player in level.players)
		{
			if(player == self)
				continue;
			if(level.teamBased && self.pers["team"] == player.pers["team"])
				continue;
			if(!bots_isReallyAlive(player))
				continue;
			if(!bulletTracePassed(self getEye(), player getTagOrigin( "j_head" ), false, model))
				continue;
			if(!player bots_hasPerk("specialty_coldblooded"))
				return player;
		}
	}
	else
	{
		foreach (player in level.players)
		{
			if(isSubStr(player.name, tarDvar))
				return player;
		}
	}
	return undefined;
}

bots_AttackedMe(attacker)
{
	if(isDefined(self.attackers))
	{
		foreach(rat in self.attackers)
		{
			if(isDefined(rat) && rat == attacker)
			{
				weap = bots_getBaseWeaponName(self.attackerData[rat.guid].weapon);
				if(self bots_isValidSecondary(weap) || self bots_isValidPrimary(weap))
					return true;
				else
					return false;
			}
		}
	}
	return false;
}

bots_AttackedHim(attacker)
{
	if(isDefined(attacker.attackers))
	{
		foreach(rat in attacker.attackers)
		{
			if(isDefined(rat) && rat == self)
			{
				weap = bots_getBaseWeaponName(attacker.attackerData[rat.guid].weapon);
				if(self bots_isValidSecondary(weap) || self bots_isValidPrimary(weap))
					return true;
				else
					return false;
			}
		}
	}
	return false;
}

bots_doHeartbeat(player)
{
	if(isSubStr(self getCurrentWeapon(), "heartbeat_") && !player bots_hasPerk("specialty_heartbreaker") && distance(self.origin, player.origin) < 500 && self bots_IsFacingAtTarget(player, self.pers["bots"]["skill"]["perfView"]))
		return true;
	else
		return false;
}

bots_canHearPlayer(target)
{
	if(target bots_hasPerk("specialty_quieter"))
		return false;
	
	if(lengthsquared( target getVelocity() ) >= 20000 || (target bots_playerIsABot() && target.bots_fMoveSpeed >= 4))
	{
		if(self bots_hasPerk("specialty_selectivehearing"))
			_distance = 200;
		else
			_distance = 100;
		
		if(distance(self.origin, target.origin) <= _distance)
			return true;
	}
	return false;
}

bots_playerOnUAV(target)
{
	if(distance(self.origin, target.origin) < 500 && target bots_hasPerk("specialty_localjammer"))
		return false;
	
	if(level.teambased)
	{
		if(level.teamEMPed[self.team])
			return false;
		
		if((level.activeUAVs[self.pers["team"]] > 0) && (level.activeCounterUAVs[level.otherTeam[self.pers["team"]]] <= 0))
			if(!target bots_hasPerk("specialty_coldblooded"))
				return true;
			
		if(target.bots_firing && (level.activeCounterUAVs[level.otherTeam[self.pers["team"]]] <= 0) && !isSubStr(target getCurrentWeapon(), "silencer_"))
			return true;
	}
	else
	{
		if(isDefined( level.empPlayer ) && level.empPlayer != self)
			return false;
		
		if(self.hasRadar && !self.isRadarBlocked)
			if(!target bots_hasPerk("specialty_coldblooded"))
				return true;
			
		if(target.bots_firing && !self.isRadarBlocked && !isSubStr(target getCurrentWeapon(), "silencer_"))
			return true;
	}
	return false;
}

bots_getTurned(player)
{
	if(self.pers["bots"]["skill"]["base"] <= 0)
		return false;

	if(self bots_playerOnUAV(player) || bots_canHearPlayer(player) || self bots_AttackedHim(player) || self bots_AttackedMe(player))
		return true;
	else
		return false;
}

bots_StopShooting()
{
	if(!self bots_CanStopShoot())
	{
		self freezecontrols(false);
		self setStance(self.bots_type);
	}
	else
	{
		self freezecontrols(true);
	}
}

bots_CanStopShoot()
{
	switch(self.bots_doing)
	{
		case "nade_fire":
		case "ftube":
			return false;
		default:
			return true;
	}
}

bots_CanShoot(){
	if(!self.bots_running && self.pers["bots"]["trait"]["playStyle"] != 1 && getDvarInt("bots_play_attack") && self.bots_doing != "switch" && self.bots_doing != "climb" && self.bots_doing != "airdrop" && self.bots_doing != "bomb" && self.bots_doing != "knife")
		return true;
	else
		return false;
}

bots_shouldAim()
{
	if(self.bots_aimDoing == "none")
		return true;
	else
		return false;
}

bots_isClimbing()
{
	if(self.bots_doing == "climb")
		return true;
	else
		return false;
}

bots_IsStunned()
{
	if(isdefined(self.concussionEndTime) && self.concussionEndTime > gettime())
		return true;
	else
		return false;
}

bots_isArtShocked()
{
	if(isDefined(self.beingArtilleryShellshocked) && self.beingArtilleryShellshocked)
		return true;
	else
		return false;
}

bots_isShellShocked()
{
	if(self maps\mp\_flashgrenades::isFlashbanged() || self bots_IsStunned() || self bots_isArtShocked())
		return true;
	else
		return false;
}

bots_setPlayerAngesReal(Angle,Steps)
{
	PStepAngle=360/Steps;
	NStepAngle=PStepAngle-(PStepAngle*2);
	myAngle=self getPlayerAngles();
	X=(Angle[0]-myAngle[0])/Steps;
	if((myAngle[0]+(X*Steps))>360||X>36||X<-36)
	{
		X=(myAngle[0]-((myAngle[0]+(X*Steps))-360))/Steps;X=X-(X*2);
	}
	Y=(Angle[1]-myAngle[1])/Steps;
	if((myAngle[1]+(Y*Steps))>360||Y>36||Y<-36)
	{
		Y=(myAngle[1]-((myAngle[1]+(Y*Steps))-360))/Steps;Y=Y-(Y*2);
	}
	if((X<PStepAngle&&X>NStepAngle)&&(Y<PStepAngle&&Y>NStepAngle))
	{
		for(i=1;i<Steps;i++)
		{
			newAngle=(myAngle[0]+X,myAngle[1]+Y,0);
			self setPlayerAngles(newAngle);
			myAngle=self getPlayerAngles();
			wait 0.05;
		}
		return 1;
	}
	return 0;
}