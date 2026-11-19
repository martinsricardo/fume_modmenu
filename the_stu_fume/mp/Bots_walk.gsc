#include mp\bots_funcs;
bots_doStuck()
{
	self endon("bot_reset");
	self endon("death");
	stuck = 0;
	for(;;)
	{
		before = self getorigin();
		wait 3;
		if(before == self getorigin() && self bots_CanMove())
		{
			wait 2;
			if(before == self getorigin() && self bots_CanMove())
			{
				self notify( "BotMovementComplete" );
				wait 0.5;
				self.bots_vObjectivePos = bots_GetNearestStaticWaypoint(self.origin);
				wait 2;
				if(before == self getorigin())
				{
					if(self bots_CanMove())
					{
						if(stuck > 4)
						{
							stuck = 0;
							if(getDvarInt("bots_play_doStuck")) self bots_suicide();
						}
						else
						{
							stuck++;
							self notify("kill_bot_walk");
							self.bots_currentStaticWp = -1;
							self.bots_tempwp = (0, 0, 0);
							self.bots_vObjectivePos = self getOrigin();
							self.bots_type = "stand";
							self.bots_fMoveSpeed = 0;
							self.bots_dynWaypointList = [];
							self.bots_dynWaypointCount = 0;
							self.bots_currDynWaypoint = 0;
							self.bots_camping = false;
							self.bots_doing = "none";
							self.bots_objDoing = "none";
							self thread bots_doMovement();
							self thread bots_getObj();
						}
					}
				}
			}
		}
	}
}
bots_getObj()
{
	self endon("bot_reset");
	self endon("death");
	self endon("kill_bot_walk");
	self thread bots_watchPlayers();
	if(level.gametype == "blitz") self thread bots_doBlitz();
	for(;;)
	{
		if(self bots_shouldGetObj())
		{
			equ = self.bots_realEqu;
			if(isDefined(equ))
			{
				self bots_goToLoc(equ.origin, ::bots_nullFunc, 0, 0, 0);
				if(isDefined(equ) && distance(equ.origin, self.origin) < 100 && equ.bots_EquipmentType == 2)
				{
					if(!self.bots_traitRandom && !isDefined(self.lastStand))
					{
						equ.health = 0;
						equ notify( "damage", -20, self );
					}
					else
					{
						if(!getDvarInt("bots_play_camp")) self bots_goToLoc(level.waypoints[randomint(level.waypointCount)].origin, ::bots_nullFunc, 0, 0, 0);
						else self bots_campAtEnt(equ, true, ::bots_nullFunc, 0, 0, 0);
					}
				}
			}
			else
			{
				dropCrates = getEntArray( "care_package", "targetname" );
				airDrop = undefined;
				if(dropCrates.size > 0 && self.bots_traitRandom != 3 && getDvarInt("bots_play_takecare"))
				{
					if(self.bots_traitRandom == 0)
					{
						airDrop = undefined;
						airDropDis = 99999999;
						foreach(crate in dropCrates)
						{
							if(!isDefined(crate)) continue;
							distance = distance(self.origin, crate.origin);
							if(distance < airDropDis)
							{
								if((!isDefined(crate.bots_reachable) || (isDefined(crate.bots_reachable) && crate.bots_reachable < 3)) && isDefined(crate.mode))
								{
									airDropDis = distance(self.origin, crate.origin);
									airDrop = crate;
								}
							}
						}
					}
					else
					{
						airDrop = undefined;
						foreach(crate in dropCrates)
						{
							if(!isDefined(crate)) continue;
							if(isDefined(airDrop))
							{
								if(maps\mp\killstreaks\_killstreaks::getStreakCost(airDrop.crateType) < maps\mp\killstreaks\_killstreaks::getStreakCost(crate.crateType))
								{
									if((!isDefined(crate.bots_reachable) || (isDefined(crate.bots_reachable) && crate.bots_reachable < 3)) && isDefined(crate.mode))
									{
										airDrop = crate;
									}
								}
							}
							else
							{
								if((!isDefined(crate.bots_reachable) || (isDefined(crate.bots_reachable) && crate.bots_reachable < 3)) && isDefined(crate.mode))
								{
									airDrop = crate;
								}
							}
						}
					}
				}
				if(isDefined(airDrop))
				{
					if (!isDefined(airDrop.bots_reachable)) airDrop.bots_reachable = 0;
					self.bots_isCare = airDrop;
					self.bots_objDoing = "airdrop";
					self bots_goToLoc(airdrop.origin, ::bots_goToAirDrop, airdrop, 0, 0);
					if(isDefined(airDrop) && distance(airDrop.origin, self.origin) < 100 && self bots_doingNothing() && !isDefined(self.lastStand))
					{
						self.bots_doing = "airdrop";
						lastWeapon = self getCurrentWeapon();
						self bots__giveWeapon("briefcase_bomb_defuse_mp", 0);
						self setSpawnWeapon("briefcase_bomb_defuse_mp");
						if(airDrop.owner == self) self bots_airDrop_wait(1.5, airDrop);
						else self bots_airDrop_wait(5, airDrop);
						self takeWeapon("briefcase_bomb_defuse_mp");
						self setSpawnWeapon(lastWeapon);
						wait 0.5;
						if(isdefined(airDrop) && distance(self.origin, airDrop.origin) < 100 && self.bots_doing == "airdrop" && !isDefined(self.lastStand))
						{
							airDrop notify ( "captured", self );
						}
						self.bots_doing = "none";
					}
					self.bots_objDoing = "none";
					self.bots_isCare = undefined;
				}
				else
				{
					if(randomint(int(self.pers["bots"]["trait"]["nade"]/8)) == 2)
					{
						if(self bots_doingNothing() || (self.bots_doing == "laststand" && self bots_hasPerk("specialty_laststandoffhand"))) self bots_doWPGrenade(randomint(5));
					}
					if(randomint(int(self.pers["bots"]["trait"]["camp"]/8)) == 2)
					{
						self bots_goCamp(randomint(2), self.pers["bots"]["trait"]["cfTime"], true);
					}
					if(randomint(int(self.pers["bots"]["trait"]["follow"]/8)) == 2)
					{
						self bots_goFollow(undefined, self.pers["bots"]["trait"]["cfTime"], true);
					}
					if(getDvarInt("bots_play_obj"))
					{
						switch(level.gametype)
						{
							case "sd": if(isdefined(level.bombZones) && (isdefined(level.sdBomb) || level.multiBomb))
							{
								timeLeft = maps\mp\gametypes\_gamelogic::getTimeRemaining() / 1000;
								if(self.pers["team"] == game["attackers"])
								{
									if(level.bombPlanted)
									{
										if(isDefined(level.bots_defuseObject) && getDvarInt("bots_play_camp"))
										{
											self bots_campAtEnt(level.bots_defuseObject.trigger, true, ::bots_protectBombplantSD, 0, 0, 0);
										}
										else
										{
											self bots_goToLoc(level.waypoints[randomint(level.waypointCount)].origin, ::bots_nullFunc, 0, 0, 0);
										}
									}
									else
									{
										if((isdefined(self.isBombCarrier) && self.isBombCarrier) || level.multiBomb)
										{
											if(timeLeft <= 60 || !self.bots_traitRandom)
											{
												nearestDistance = 9999999999;
												nearestBombZone = undefined;
												if(randomInt(2))
												{
													for(b = 0;b < level.bombZones.size;b++)
													{
														distance = distance(level.bombZones[b].trigger.origin, self.origin);
														if(distance < nearestDistance)
														{
															nearestBombZone = level.bombZones[b];
															nearestDistance = distance;
														}
													}
												}
												else
												{
													bombzones = [];
													foreach(bombsite in level.bombzones)
													{
														bombzones[bombzones.size] = bombsite;
													}
													nearestBombZone = bombzones[randomInt(bombzones.size)];
													nearestDistance = distance(nearestBombZone.trigger.origin, self.origin);
												}
												if(isDefined(nearestBombZone))
												{
													self.bots_objDoing = "plant";
													self bots_goToLoc(nearestBombZone.trigger.origin, ::bots_nullFunc, 0, 0, 0);
													if(self bots_doingNothing() && !isDefined(self.lastStand) && !self bots_anyOnePlanting() && distance(nearestBombZone.trigger.origin, self.origin) < 100 && !level.bombPlanted)
													{
														self thread bots_onBotDeathBomb();
														self.isPlanting = true;
														self.bots_doing = "bomb";
														nearestBombZone maps\mp\gametypes\sd::onBeginUse(self);
														weap1 = "briefcase_bomb_mp";
														lastWeap = self getCurrentWeapon();
														self bots__giveWeapon(weap1, 0);
														self setSpawnWeapon(weap1);
														wait(getdvarint("scr_sd_planttime") + 1);
														if(self.doing == "bomb" && !isDefined(self.lastStand) && !self bots_anyOnePlanting() && distance(nearestBombZone.trigger.origin, self.origin) < 100 && !level.bombPlanted)
														{
															nearestBombZone bots_onUsePlantObjectFix(self);
															nearestBombZone maps\mp\gametypes\sd::onEndUse(self.pers["team"], self, true);
														}
														self setSpawnWeapon(lastWeap);
														self takeWeapon(weap1);
														self.isPlanting = false;
														self.bots_doing = "none";
														self notify("bot_kill_bomb");
													}
													self.bots_objDoing = "none";
												}
												else
												{
													self bots_goToLoc(level.waypoints[randomint(level.waypointCount)].origin, ::bots_nullFunc, 0, 0, 0);
												}
											}
											else
											{
												self bots_goToLoc(level.waypoints[randomint(level.waypointCount)].origin, ::bots_nullFunc, 0, 0, 0);
											}
										}
										else
										{
											protectTarget = undefined;
											for(f = 0;f < level.players.size;f++)
											{
												if(isdefined(level.players[f].isBombCarrier) && level.players[f].isBombCarrier)
												{
													protectTarget = level.players[f];
													break;
												}
											}
											if(isDefined(protectTarget))
											{
												if(self.bots_traitRandom)
												{
													self bots_goFollow(protectTarget, 30, false);
												}
												else
												{
													self bots_goToLoc(level.waypoints[randomint(level.waypointCount)].origin, ::bots_nullFunc, 0, 0, 0);
												}
											}
											else
											{
												self.bots_objDoing = "bomb";
												self bots_goToLoc(level.sdBomb.trigger.origin, ::bots_nullFunc, 0, 0, 0);
												self.bots_objDoing = "none";
											}
										}
									}
								}
								else
								{
									if(level.bombPlanted)
									{
										if(isDefined(level.bots_defuseObject))
										{
											self.bots_objDoing = "defuse";
											self bots_goToLoc(level.bots_defuseObject.trigger.origin, ::bots_nullFunc, 0, 0, 0);
											if(self bots_doingNothing() && !isDefined(self.lastStand) && !self bots_anyOneDefusing() && distance(level.bots_defuseObject.trigger.origin, self.origin) < 100 && level.bombPlanted)
											{
												self thread bots_onBotDeathBomb();
												self.isDefusing = true;
												self.bots_doing = "bomb";
												level.bots_defuseObject maps\mp\gametypes\sd::onBeginUse(self);
												weap1 = "briefcase_bomb_defuse_mp";
												lastWeap = self getCurrentWeapon();
												self bots__giveWeapon(weap1, 0);
												self setSpawnWeapon(weap1);
												wait(getdvarint("scr_sd_defusetime") + 1);
												if(self.bots_doing == "bomb" && !isDefined(self.lastStand) && !self bots_anyOneDefusing() && distance(level.bots_defuseObject.trigger.origin, self.origin) < 100 && level.bombPlanted)
												{
													level.bots_defuseObject maps\mp\gametypes\sd::onUseDefuseObject(self);
													level.bots_defuseObject maps\mp\gametypes\sd::onEndUse(self.pers["team"], self, true);
												}
												self setSpawnWeapon(lastWeap);
												self takeWeapon(weap1);
												self.isDefusing = false;
												self.bots_doing = "none";
												self notify("bot_kill_bomb");
											}
											self.bots_objDoing = "none";
										}
									}
									else
									{
										if(timeLeft <= 60 || !self.bots_traitRandom)
										{
											if(!self.bots_traitRandom)
											{
												protectTarget = undefined;
												for(f = 0;f < level.players.size;f++)
												{
													if(isdefined(level.players[f].isBombCarrier) && level.players[f].isBombCarrier)
													{
														protectTarget = level.players[f];
														break;
													}
												}
												if(isDefined(protectTarget))
												{
													self bots_goFollow(protectTarget, 30, false);
												}
												else
												{
													if(getDvarInt("bots_play_camp"))
													{
														self bots_campAtEnt(level.sdBomb.trigger, true, ::bots_protectSDBomb, 0, 0, 0);
													}
													else
													{
														self bots_goToLoc(level.waypoints[randomint(level.waypointCount)].origin, ::bots_nullFunc, 0, 0, 0);
													}
												}
											}
											else
											{
												nearestDistance = 9999999999;
												nearestBombZone = undefined;
												if(randomInt(2))
												{
													for(b = 0;b < level.bombZones.size;b++)
													{
														distance = distance(level.bombZones[b].trigger.origin, self.origin);
														if(distance < nearestDistance)
														{
															nearestBombZone = level.bombZones[b];
															nearestDistance = distance;
														}
													}
												}
												else
												{
													bombzones = [];
													foreach(bombsite in level.bombzones)
													{
														bombzones[bombzones.size] = bombsite;
													}
													nearestBombZone = bombzones[randomInt(bombzones.size)];
													nearestDistance = distance(nearestBombZone.trigger.origin, self.origin);
												}
												if(isDefined(nearestBombZone) && getDvarInt("bots_play_camp"))
												{
													self bots_campAtEnt(nearestBombZone.trigger, true, ::bots_protectBombSiteSD, 0, 0, 0);
												}
												else
												{
													self bots_goToLoc(level.waypoints[randomint(level.waypointCount)].origin, ::bots_nullFunc, 0, 0, 0);
												}
											}
										}
										else
										{
											self bots_goToLoc(level.waypoints[randomint(level.waypointCount)].origin, ::bots_nullFunc, 0, 0, 0);
										}
									}
								}
							}
							break;
							default: self bots_goToLoc(level.waypoints[randomint(level.waypointCount)].origin, ::bots_nullFunc, 0, 0, 0);
							break;
						}
					}
					else
					{
						self bots_goToLoc(level.waypoints[randomint(level.waypointCount)].origin, ::bots_nullFunc, 0, 0, 0);
					}
				}
			}
		}
		self bots_waittill_notify_or_timeout("BotMovementComplete", 1);
	}
}
bots_doBlitz()
{
	self endon("bot_reset");
	self endon("death");
	self endon("kill_bot_walk");
	for(;;)
	{
		self waittill( "objective" );
		self notify("kill_bot_walk");
		self.bots_currentStaticWp = -1;
		self.bots_tempwp = (0, 0, 0);
		self.bots_vObjectivePos = self getOrigin();
		self.bots_type = "stand";
		self.bots_fMoveSpeed = 0;
		self.bots_dynWaypointList = [];
		self.bots_dynWaypointCount = 0;
		self.bots_currDynWaypoint = 0;
		self.bots_camping = false;
		self.bots_doing = "none";
		self.bots_objDoing = "none";
		self thread bots_doMovement();
		self thread bots_getObj();
	}
}
bots_oneFlag(parm1, parm2, parm3)
{
	tarPlay = undefined;
	foreach(player in level.players)
	{
		if(isDefined(player.carryFlag))
		{
			ObjectivePos = player;
			break;
		}
	}
	if(!isDefined(tarPlay)) return true;
	else return false;
}
bots_tdef(parm1, parm2, parm3)
{
	if(!isDefined(level.gameFlag.currentCarrier)) return true;
	else return false;
}
bots_watchPlayers()
{
	self endon("bot_reset");
	self endon("death");
	self endon("kill_bot_walk");
	for(;;)
	{
		if(self.pers["bots"]["trait"]["killsOverObj"]) target = bots_getGoToPlayer();
		else target = undefined;
		if(self bots_shouldGetObj())
		{
			if(isDefined(target))
			{
				self.bots_objDoing = "player";
				self bots_goToLoc(target getOrigin(), ::bots_nullFunc, 0, 0, 0);
				self.bots_objDoing = "none";
			}
			else
			{
				if(self.pers["bots"]["trait"]["vengeful"] == 2 && isDefined(self.bots_gotKilledLoc) && !self.bots_atDeathLoc)
				{
					self.bots_objDoing = "deathloc";
					self bots_goToLoc(self.bots_gotKilledLoc, ::bots_nullFunc, 0, 0, 0);
					if(distance(self.origin, self.bots_gotKilledLoc) < 100) self.bots_atDeathLoc = true;
					self.bots_objDoing = "none";
				}
			}
		}
		wait 1;
	}
}
bots_goToLoc(where, func, parm1, parm2, parm3)
{
	self notify("bot_walk_overlap");
	self endon("bot_walk_overlap");
	while(self [[func]](parm1, parm2, parm3) && distance(self.origin, where) >= 80)
	{
		self.bots_vObjectivePos = where;
		bots_waitFrame();
	}
}
bots_campAtEnt(ent, campCheck, func, parm1, parm2, parm3)
{
	if(!getDvarInt("bots_play_camp") && campCheck) return;
	self notify("bot_walk_overlap");
	self thread bots_doNoneOnOverlapCamp();
	self endon("bot_walk_overlap");
	while(self [[func]](parm1, parm2, parm3) && isDefined(ent))
	{
		if(distance(self.origin, ent.origin) >= 80)
		{
			self.bots_camping = false;
			self.bots_campingAngles = undefined;
		}
		else
		{
			self.bots_camping = true;
			self.bots_campingAngles = VectorToAngles((ent.origin-self.origin)-anglesToForward(self getplayerangles()));
		}
		self.bots_vObjectivePos = ent.origin;
		bots_waitFrame();
	}
	self.bots_camping = false;
	self.bots_campingAngles = undefined;
	self notify("bot_kill_camp");
}
bots_pickupCTFFlagOther(parm1, parm2, parm3)
{
	if(!self bots_TeamHasFlag()) return true;
	else return false;
}
bots_pickupCTFFlag(parm1, parm2, parm3)
{
	if(!level.teamFlags[self.team] maps\mp\gametypes\_gameobjects::isHome()) return true;
	else return false;
}
bots_capCTFFlag(parm1, parm2, parm3)
{
	if(isDefined( self.carryFlag ) && level.teamFlags[self.team] maps\mp\gametypes\_gameobjects::isHome()) return true;
	else return false;
}
bots_protectSabSite(parm1, parm2, parm3)
{
	if(!level.bombPlanted && self.pers["team"] != level.sabBomb maps\mp\gametypes\_gameobjects::getOwnerTeam()) return true;
	else return false;
}
bots_protectSabPlant(parm1, parm2, parm3)
{
	if(level.bombPlanted && self.pers["team"] == level.sabBomb maps\mp\gametypes\_gameobjects::getOwnerTeam()) return true;
	else return false;
}
bots_getTag(tag, parm2, parm3)
{
	if(isDefined(tag)) return true;
	else return false;
}
bots_nullFunc(parm1, parm2, parm3)
{
	return true;
}
bots_protectHQ(parm1, parm2, parm3)
{
	if(isDefined(level.radioObject) && (level.radioObject maps\mp\gametypes\_gameobjects::getOwnerTeam() != self.pers["team"] || (self.bots_traitRandom && getDvarInt("bots_play_camp")))) return true;
	else return false;
}
bots_doNoneOnOverlapCamp()
{
	self endon("bot_reset");
	self endon("death");
	self endon("kill_bot_walk");
	self endon("bot_kill_camp");
	self waittill("bot_walk_overlap");
	self.bots_camping = false;
	self.bots_campingAngles = undefined;
}
bots_protectGrndZone()
{
	if(isDefined(level.grnd_zone)) return true;
	else return false;
}
bots_protectGTNW(parm1, parm2, parm3)
{
	if(isDefined(level.nukeSite)) return true;
	else return false;
}
bots_protectSDBomb(parm1, parm2, parm3)
{
	if(!level.bombPlanted && !self bots_SomeoneGotsBomb()) return true;
	else return false;
}
bots_protectBombplantSD(parm1, parm2, parm3)
{
	if(level.bombPlanted) return true;
	else return false;
}
bots_protectBombSiteSD(parm1, parm2, parm3)
{
	if(!level.bombPlanted) return true;
	else return false;
}
bots_goToBombSite(bombsite, parm2, parm3)
{
	if(!isDefined(bombsite.trigger.trigger_off)) return true;
	else return false;
}
bots_protectBombsiteDD(bombsite, planted, parm3)
{
	if((bombsite.label == "_a" && level.aPlanted == planted) || (bombsite.label == "_b" && level.bPlanted == planted) && !isDefined(bombsite.trigger.trigger_off)) return true;
	else return false;
}
bots_capFlag(flag, parm2, parm3)
{
	if(self.team != flag bots_getFlagTeam()) return true;
	else return false;
}
bots_TeamHasFlag()
{
	foreach(player in level.players)
	{
		if(self.pers["team"] != player.pers["team"]) continue;
		if(isDefined( player.carryFlag )) return true;
	}
	return false;
}
bots_getGoToPlayer()
{
	tarVar = getDVar("bots_main_target");
	foreach(player in level.players)
	{
		if(tarVar == "")
		{
			if(player == self) continue;
			if(level.teamBased && self.pers["team"] == player.pers["team"]) continue;
			if(!bots_isReallyAlive(player)) continue;
			if(distance(self getEye(), player.origin) > self.pers["bots"]["skill"]["viewDis"]) continue;
			if(self mp\bots_aim::bots_AttackedMe(player) || self mp\bots_aim::bots_AttackedHim(player) || self mp\bots_aim::bots_doHeartbeat(player) || self mp\bots_aim::bots_playerOnUAV(player)) return player;
		}
		else
		{
			if(issubStr(player.name, tarVar)) return player;
		}
	}
	return undefined;
}
bots_shouldGetObj()
{
	if(self.bots_objDoing == "none") return true;
	else return false;
}
bots_airDrop_wait(_wait, airdrop)
{
	airdrop endon("captured");
	wait _wait;
}
bots_goToAirDrop(airDrop, parm2, parm3)
{
	if(isDefined(airDrop) && (!isDefined(airDrop.bots_reachable) || (isDefined(airDrop.bots_reachable) && airDrop.bots_reachable < 3)) && isDefined(airDrop.mode)) return true;
	else return false;
}
bots_doNothingOnCampTime(time, talk, campSpot)
{
	self endon("bot_reset");
	self endon("kill_bot_walk");
	self endon("death");
	self endon("bot_walk_overlap");
	self endon("bot_kill_camp");
	wait time;
	if(talk) self.bots_camping = false;
	self.bots_campingAngles = undefined;
	self notify("bot_kill_camp");
}
bots_goCamp(nearest, time, talk)
{
	if(!getDvarInt("bots_play_camp")) return;
	self notify("bot_walk_overlap");
	self thread bots_doNoneOnOverlapCamp();
	self endon("bot_walk_overlap");
	self endon("bot_kill_camp");
	if(nearest) campSpot = bots_getNearestCampSpot();
	else campSpot = bots_getRandomCampSpot();
	if(campSpot != -1)
	{
		virgin = true;
		for(;;)
		{
			if(distance(level.waypoints[campSpot].origin, self.origin) < 80)
			{
				if(virgin)
				{
					virgin = false;
					self thread bots_doNothingOnCampTime(time, talk, campSpot);
				}
				self.bots_camping = true;
				self.bots_campingAngles = level.waypoints[campSpot].angles;
			}
			else
			{
				self.bots_camping = false;
				self.bots_campingAngles = undefined;
			}
			self.bots_vObjectivePos = level.waypoints[campSpot].origin;
			if(isDefined(self.bots_realSeen) && randomint(int(self.pers["bots"]["trait"]["camp"]/4)) == 2)
			{
				self.bots_camping = false;
				self.bots_campingAngles = undefined;
				self notify("bot_kill_camp");
			}
			bots_waitFrame();
		}
	}
}
bots_doNoneWPGnade(nade, wp)
{
	self endon("bot_reset");
	self endon("death");
	self endon("kill_bot_walk");
	self endon("bot_walk_overlap");
	self waittill("bot_kill_nade");
	self.bots_camping = false;
	self.bots_campingAngles = undefined;
}
bots_doNadeStuff(nade, wp)
{
	self endon("bot_kill_nade");
	canNade = (self bots_doingNothing() || (self.bots_doing == "laststand" && self bots_hasPerk("specialty_laststandoffhand")));
	if(!getDvarInt("bots_loadout_nade") || !canNade) return;
	self thread bots_doNoneWPGnade(nade, wp);
	self thread bots_doNoneOnOverlapCamp();
	self.bots_camping = true;
	self.bots_campingAngles = level.waypoints[wp].angles;
	wait 1;
	if(!getDvarInt("bots_loadout_nade") || !canNade)
	{
		self notify("bot_kill_nade");
		return;
	}
	lastWeapon = self getCurrentWeapon();
	self setspawnweapon(nade);
	self.bots_Doing = "nade_fire";
	self thread mp\bots_aim::bots_watchGNadeFire(lastWeapon);
	self thread mp\bots_aim::bots_forceGNadeFire();
	self thread mp\bots_aim::bots_doNoneOnGNadeAmmo(nade, lastWeapon);
	wait 3;
	self setspawnweapon(lastWeapon);
	self.bots_doing = "none";
	self mp\bots_aim::bots_stopShooting();
	self notify("bot_kill_nade");
}
bots_doWPGrenade(nearest)
{
	if(!getDvarInt("bots_loadout_nade")) return;
	self notify("bot_walk_overlap");
	self endon("bot_walk_overlap");
	gnade = self bots_getGrenadeName();
	secnade = self bots_getOffhandName();
	wp = undefined;
	nade = undefined;
	wps = [];
	if(gnade == "c4_mp" || gnade == "blastsheild_mp" || gnade == "specialty_blastshield")
	{
		if(self getAmmoCount(secnade) || self bots_hasPerk("specialty_onemanarmy")) nade = secnade;
	}
	else
	{
		if((self getAmmoCount(secnade) || self bots_hasPerk("specialty_onemanarmy")) && (self getAmmoCount(gnade) || self bots_hasPerk("specialty_onemanarmy")))
		{
			if(randomint(2)) nade = secnade;
			else nade = gnade;
		}
		else
		{
			if(self getAmmoCount(secnade) || self bots_hasPerk("specialty_onemanarmy")) nade = secnade;
			else if(self getAmmoCount(gnade) || self bots_hasPerk("specialty_onemanarmy")) nade = gnade;
		}
	}
	if(isDefined(nade))
	{
		if(gnade == "claymore_mp" || gnade == "flare_mp" || gnade == "specialty_tacticalinsertion") wps = bots_getClaymoreWaypointArray();
		else wps = bots_getGrenadeWaypointArray();
	}
	if(wps.size)
	{
		if(nearest)
		{
			foreach(_wp in wps)
			{
				if(isDefined(wp))
				{
					if(distance(self.origin, level.waypoints[_wp].origin) < distance(self.origin, level.waypoints[wp].origin)) wp = _wp;
				}
				else
				{
					wp = _wp;
				}
			}
		}
		else
		{
			wp = wps[randomint(wps.size)];
		}
	}
	if(isDefined(wp))
	{
		while(distance(level.waypoints[wp].origin, self.origin) >= 80)
		{
			self.bots_vObjectivePos = level.waypoints[wp].origin;
			bots_waitFrame();
		}
		self bots_doNadeStuff(nade, wp);
	}
}
bots_goFollow(player, time, talk)
{
	self notify("bot_walk_overlap");
	self thread bots_doNoneOnOverlapCamp();
	self endon("bot_walk_overlap");
	self endon("kill_bot_follow");
	if(isDefined(player) || level.teambased)
	{
		if(!isDefined(player))
		{
			players = [];
			foreach(player in level.players)
			{
				if(player == self) continue;
				if(self.pers["team"] != player.pers["team"]) continue;
				if(!bots_isReallyAlive(player)) continue;
				players[players.size] = player;
			}
			if(randomint(2)) player = players[randomint(players)];
			else player = bots_getNearestEnt(players);
		}
		if(isDefined(player))
		{
			self thread bots_doNothingOnFollowTime(time, talk, player);
			for(;;)
			{
				if(isDefined(player) && bots_isReallyAlive(player))
				{
					if(distance(player.origin, self.origin) >= 80)
					{
						self.bots_camping = false;
						self.bots_campingAngles = undefined;
					}
					else
					{
						self.bots_camping = true;
						self.bots_campingAngles = VectorToAngles((player.origin-self.origin)-anglesToForward(self getplayerangles()));
					}
					self.bots_vObjectivePos = player.origin;
				}
				else
				{
					self.bots_camping = false;
					self.bots_campingAngles = undefined;
					self notify("kill_bot_follow");
				}
				if(isDefined(self.bots_realSeen) && randomint(int(self.pers["bots"]["trait"]["follow"]/4)) == 2)
				{
					self.bots_camping = false;
					self.bots_campingAngles = undefined;
					self notify("kill_bot_follow");
				}
				bots_waitFrame();
			}
		}
	}
}
bots_doNothingOnFollowTime(time, talk, player)
{
	self endon("bot_reset");
	self endon("kill_bot_walk");
	self endon("death");
	self endon("kill_bot_follow");
	self endon("bot_walk_overlap");
	wait time;
	self.bots_camping = false;
	self.bots_campingAngles = undefined;
	self notify("kill_bot_follow");
}
bots_goToLocAndTBag(where)
{
	self endon("bot_reset");
	self endon("death");
	self endon("kill_bot_walk");
	self notify("bot_walk_overlap");
	self endon("bot_walk_overlap");
	self.bots_objDoing = "tbag";
	while(distance(self.origin, where) >= 80)
	{
		self.bots_vObjectivePos = where;
		bots_waitFrame();
	}
	self.bots_camping = true;
	self.bots_campingAngles = VectorToAngles(((where+(0, 0, -200))-self.origin)-anglesToForward(self getplayerangles()));
	for(i=0;i<3;i++)
	{
		tim = getTime();
		while((getTime() - tim) < 500)
		{
			self.bots_type = "crouch";
			if(self mp\bots_aim::bots_CanShoot()) self freezecontrols(false);
			else self freezecontrols(true);
			self setStance("crouch");
			bots_waitFrame();
		}
		tim = getTime();
		while((getTime() - tim) < 500)
		{
			self.bots_type = "stand";
			if(self mp\bots_aim::bots_CanShoot()) self freezecontrols(false);
			else self freezecontrols(true);
			self setStance("stand");
			bots_waitFrame();
		}
	}
	self.bots_objDoing = "none";
	self.bots_camping = false;
	self.bots_campingAngles = undefined;
}
bots_SomeoneGotsBomb()
{
	foreach(player in level.players)
	{
		if(isdefined(player.isBombCarrier) && player.isBombCarrier) return true;
	}
	return false;
}
bots_anyonePlanting()
{
	foreach(player in level.players)
	{
		if(player == self) continue;
		if(isDefined(player.isPlanting) && player.isPlanting) return true;
	}
	return false;
}
bots_anyoneDefusing()
{
	foreach(player in level.players)
	{
		if(player == self) continue;
		if(isDefined(player.isDefusing) && player.isDefusing) return true;
	}
	return false;
}
bots_getClaymoreWaypointArray()
{
	if(!isDefined(level.waypoints) || level.waypointCount == 0) return [];
	campingWaypoints = [];
	for(i = 0;i < level.waypointCount;i++)
	{
		if(level.waypoints[i].type == "claymore") campingWaypoints[campingWaypoints.size] = i;
	}
	return campingWaypoints;
}
bots_getGrenadeWaypointArray()
{
	if(!isDefined(level.waypoints) || level.waypointCount == 0) return [];
	campingWaypoints = [];
	for(i = 0;i < level.waypointCount;i++)
	{
		if(level.waypoints[i].type == "grenade") campingWaypoints[campingWaypoints.size] = i;
	}
	return campingWaypoints;
}
bots_getNearestCampSpot()
{
	campPoints = bots_getCampingWaypointArray();
	campSpot = -1;
	if(campPoints.size)
	{
		foreach(point in campPoints)
		{
			if(campSpot == -1)
			{
				campSpot = point;
			}
			else
			{
				if(distance(self.origin, level.waypoints[point].origin) < distance(self.origin, level.waypoints[campSpot].origin)) campSpot = point;
			}
		}
	}
	return campSpot;
}
bots_getRandomCampSpot()
{
	campPoints = bots_getCampingWaypointArray();
	campSpot = -1;
	if(campPoints.size) campSpot = campPoints[randomint(campPoints.size)];
	return campSpot;
}
bots_onBotDeathBomb()
{
	self endon("bot_kill_bomb");
	self thread bots_doNoneOnReset();
	self thread bots_doNoneOnReset_();
	self waittill("death");
	self.isPlanting = false;
	self.isDefusing = false;
	self notify("bot_kill_bomb");
}
bots_doNoneOnReset()
{
	self endon("bot_kill_bomb");
	self waittill("bot_reset");
	self.isPlanting = false;
	self.isDefusing = false;
	self notify("bot_kill_bomb");
}
bots_doNoneOnReset_()
{
	self endon("bot_kill_bomb");
	self waittill("kill_bot_walk");
	self.isPlanting = false;
	self.isDefusing = false;
	self notify("bot_kill_bomb");
}
bots_getFlagTeam()
{
	return self.useObj maps\mp\gametypes\_gameobjects::getOwnerTeam();
}
bots_getCampingWaypointArray()
{
	if(!isDefined(level.waypoints) || level.waypointCount == 0) return [];
	campingWaypoints = [];
	for(i = 0;i < level.waypointCount;i++)
	{
		if(level.waypoints[i].childCount == 1 && level.waypoints[i].type == "crouch") campingWaypoints[campingWaypoints.size] = i;
	}
	return campingWaypoints;
}
bots_getNearestTag()
{
	tag = undefined;
	if(isDefined(level.dogTags))
	{
		foreach(player in level.players)
		{
			if(!isDefined(level.dogtags[player.guid])) continue;
			if(isDefined(tag))
			{
				if(closer(self.origin,level.dogtags[player.guid].trigger.origin,tag.trigger.origin))
				{
					tag = level.dogtags[player.guid];
				}
			}
			else
			{
				tag = level.dogtags[player.guid];
			}
		}
	}
	return tag;
}
bots_getWaypointsNear(Loc, Rad)
{
	if(!isDefined(level.waypoints) || level.waypointCount == 0) return [];
	campingWaypoints = [];
	for(i = 0;i < level.waypointCount;i++)
	{
		if(distance(level.waypoints[i].origin, Loc) <= Rad) campingWaypoints[campingWaypoints.size] = i;
	}
	return campingWaypoints;
}
bots_CanMove()
{
	if(self.bots_doing == "airdrop" || self.bots_doing == "laptop" || self.bots_doing == "bomb" || self.bots_doing == "rocket_lock" || self.bots_camping || (self.bots_traitRandom && isDefined(self.bots_realSeen)) || !getDvarInt("bots_play_move")) return false;
	else return true;
}
BotMove(_vMoveTarget, onStaticWP)
{
	self notify( "BotMovementComplete" );
	if(self.bots_fMoveSpeed < 0.05)
	{
		self notify( "BotMovementComplete" );
	}
	else
	{
		if(!isDefined(onStaticWP) || level.waypoints[self.bots_currentStaticWp].type != "climb") self thread BotMovethread(_vMoveTarget);
		else if(self botCanClimb()) self BotClimbThread(_vMoveTarget);
	}
}
bots_endOnBotMove()
{
	self endon("bot_reset");
	self endon("death");
	self endon("kill_bot_walk");
	self waittill( "BotMovementComplete" );
	self.bots_doing = "none";
}
BotClimbThread(_vMoveTarget)
{
	self endon("BotMovementComplete");
	self thread bots_endOnBotMove();
	for(;;)
	{
		distance = DistanceSquared(_vMoveTarget, self.origin);
		if(distance <= (self.bots_fMoveSpeed*self.bots_fMoveSpeed))
		{
			self notify( "BotMovementComplete" );
		}
		else
		{
			self.bots_doing = "climb";
			self SetOrigin(self.origin + (VectorNormalize(_vMoveTarget-self.origin) * (self.bots_fMoveSpeed*2)));
			self bots_PushOutOfPlayers();
		}
		wait 0.05;
	}
}
BotMoveThread(_vMoveTarget)
{
	self endon("bot_reset");
	self endon("BotMovementComplete");
	self endon("death");
	self endon("kill_bot_walk");
	for(;;)
	{
		if(ClampToGroundtest())
		{
			moveTarget = (_vMoveTarget[0], _vMoveTarget[1], self.origin[2]);
			distance = DistanceSquared(moveTarget, self.origin);
			if(distance <= (self.bots_fMoveSpeed*self.bots_fMoveSpeed))
			{
				self notify( "BotMovementComplete" );
			}
			else
			{
				self SetOrigin(self.origin + (VectorNormalize(moveTarget-self.origin) * (self.bots_fMoveSpeed)));
				self bots_PushOutOfPlayers();
			}
		}
		else
		{
			if(self mp\bots_aim::bots_CanShoot())
			{
				self freezecontrols(false);
				self setStance(self.bots_type);
			}
			moveTarget = (_vMoveTarget[0], _vMoveTarget[1], self.origin[2]);
			distance = DistanceSquared(moveTarget, self.origin);
			if(distance <= (self.bots_fMoveSpeed*self.bots_fMoveSpeed))
			{
				self notify( "BotMovementComplete" );
			}
			else
			{
				self SetOrigin(self.origin + (VectorNormalize(moveTarget-self.origin) * 10));
				self bots_PushOutOfPlayers();
			}
		}
		wait 0.05;
	}
}
BotGoal_DynWaypointFollowGoal()
{
	self endon("DynWaypointFollowGoalComplete");
	self BuildDynWaypointList();
	for(;;)
	{
		self.bots_tempWp = (self.bots_dynWaypointList[self.bots_currDynWaypoint][0], self.bots_dynWaypointList[self.bots_currDynWaypoint][1], self.origin[2]);
		distToWp = Distance(self.bots_tempWp, self.origin);
		if(distToWp <= 50)
		{
			self.bots_currDynWaypoint++;
			if(self.bots_currDynWaypoint >= self.bots_dynWaypointCount)
			{
				if(isDefined(self.bots_isCare))
				{
					if(distance(self.origin, self.bots_isCare.origin) > 150 && isDefined(self.bots_isCare.mode))
					{
						self.bots_isCare.bots_reachable++;
					}
				}
				self notify("DynWaypointFollowGoalComplete");
			}
			else
			{
				self.bots_tempWp = (self.bots_dynWaypointList[self.bots_currDynWaypoint][0], self.bots_dynWaypointList[self.bots_currDynWaypoint][1], self.origin[2]);
				self BotMove(self.bots_tempWp);
			}
		}
		wait 0.05;
	}
}
botCanClimb()
{
	if((self.bots_doing == "none" || self.bots_doing == "climb") && !isDefined(self.lastStand)) return true;
	else return false;
}
bots_doMovement()
{
	self endon("bot_reset");
	self endon("death");
	self endon("kill_bot_walk");
	for(;;)
	{
		if(self.bots_currentStaticWp == -1)
		{
			self.bots_currentStaticWp = bots_GetNearestStaticWaypoint(self.origin);
		}
		self.bots_tempwp = level.waypoints[self.bots_currentStaticWp].origin;
		if(self.bots_camping)
		{
			self.bots_type = "crouch";
		}
		else
		{
			if(self getCurrentWeapon() == "riotshield_mp")
			{
				if(isdefined(self.bots_Realseen) && self.pers["bots"]["skill"]["base"] > 3)
				{
					self.bots_type = "crouch";
				}
				else
				{
					if(level.waypoints[self.bots_currentStaticWp].type == "stand") self.bots_type = "stand";
					else self.bots_type = "crouch";
				}
			}
			else
			{
				if((self.bots_doing == "laptop" || self.bots_doing == "bomb" || self.bots_doing == "airdrop") && self.pers["bots"]["trait"]["killsOverObj"] != 2)
				{
					self.bots_type = "prone";
				}
				else
				{
					if(level.waypoints[self.bots_currentStaticWp].type == "stand")
					{
						switch(randomint(20))
						{
							case 0: if(isdefined(self.bots_RealSeen) && self.bots_traitRandom == 1 && self.pers["bots"]["skill"]["base"] >= 2)
							{
								self.bots_type = "prone";
								wait 1.5;
								self.bots_type = "stand";
							}
							else
							{
								self.bots_type = "stand";
							}
							break;
							case 1: if(!self.bots_running) self.bots_type = "crouch";
							break;
							case 2: if(!self.bots_running) self.bots_type = "crouch";
							break;
							default: self.bots_type = "stand";
							break;
						}
					}
					else
					{
						if(level.waypoints[self.bots_currentStaticWp].type == "prone") self.bots_type = "prone";
						else if(level.waypoints[self.bots_currentStaticWp].type == "climb") self.bots_type = "stand";
						else self.bots_type = "crouch";
					}
				}
			}
		}
		self BotMove(self.bots_tempwp, 1);
		if(level.waypoints[self.bots_currentStaticWp].type != "climb") distToWp = Distance((self.bots_tempwp[0], self.bots_tempwp[1], self.origin[2]), self.origin);
		else distToWp = Distance(self.bots_tempwp, self.origin);
		if(distToWp <= 50)
		{
			if(abs(self.bots_tempwp[2] - self.origin[2]) > 50 && level.waypoints[self.bots_currentStaticWp].type != "climb") self setorigin(self.bots_tempwp);
			if(!AnyWaypointCloser(self.bots_vObjectivePos, self.bots_currentStaticWp))
			{
				self.bots_currentStaticWp = -1;
				if(Distance(self.bots_vObjectivePos, self.origin) > 80) self BotGoal_DynWaypointFollowGoal();
			}
			else
			{
				targetWpIdx = bots_GetNearestStaticWaypoint(self.bots_vObjectivePos);
				self.bots_currentStaticWp = AStarSearch(self.bots_currentStaticWp, targetWpIdx);
				self.bots_tempwp = level.waypoints[self.bots_currentStaticWp].origin;
				self BotMove(self.bots_tempwp, 1);
			}
		}
		wait 0.5;
	}
}
BuildDynWaypointList()
{
	self.bots_dynWaypointCount = 0;
	self.bots_currDynWaypoint = 0;
	from = self.origin + (0,0,30);
	enemydirection = VectorNormalize(self.bots_vObjectivePos - from);
	direction = enemydirection;
	distance = 30.0;
	self.bots_dynWaypointList = [];
	bCanTurnToTarget = true;
	maxWaypointCount = randomintrange(40, 60);
	lastWallDirection = (1,0,0);
	bValidLastWallDirection = false;
	while(self.bots_dynWaypointCount < maxWaypointCount)
	{
		self.bots_dynWaypointList[self.bots_dynWaypointCount] = ClampWpToGround(from);
		self.bots_dynWaypointCount++;
		trace = bulletTrace(from, from + (direction * distance), false, self);
		enemydirection = VectorNormalize(self.bots_vObjectivePos - from);
		if(trace["fraction"] == 1)
		{
			from = trace["position"];
			self.bots_dynWaypointList[self.bots_dynWaypointCount] = ClampWpToGround(from);
			self.bots_dynWaypointCount++;
			if(bCanTurnToTarget)
			{
				direction = enemydirection;
				bValidLastWallDirection = false;
			}
			else
			{
				if(bValidLastWallDirection)
				{
					trace = bulletTrace(from, from + (lastWallDirection * distance * 2.0), false, self);
					if(trace["fraction"] == 1)
					{
						direction = lastWallDirection;
						from = trace["position"];
						dot = vectorDot(enemydirection, direction);
						if(dot > 0.5)
						{
							bCanTurnToTarget = true;
						}
						bValidLastWallDirection = false;
					}
				}
				else
				{
					bCanTurnToTarget = false;
				}
			}
		}
		else
		{
			bCanTurnToTarget = false;
			colNormal = trace["normal"];
			colPos = trace["position"];
			from = colPos + (VectorNormalize(VectorSmooth(direction * -1.0, colNormal, 0.5)) * 20.0);
			tanDirection = VectorCross(direction * -1.0, (0,0,1));
			if(bValidLastWallDirection)
			{
				dot = vectordot(lastWallDirection * -1.0, tanDirection);
				if(dot < 0)
				{
					tanDirection = tanDirection * -1.0;
				}
				lastWallDirection = colNormal * -1.0;
				bValidLastWallDirection = true;
				direction = tanDirection;
			}
			else
			{
				dot = vectordot(enemydirection, tanDirection);
				if(dot < 0)
				{
					tanDirection = tanDirection * -1.0;
				}
				lastWallDirection = colNormal * -1.0;
				bValidLastWallDirection = true;
				direction = tanDirection;
			}
		}
		if(Distance(self.bots_vObjectivePos, from) <= (distance+5.0))
		{
			return true;
		}
	}
	return true;
}
AnyWaypointCloser(pos, wpIndex)
{
	if(!isDefined(level.waypoints) || level.waypointCount == 0)
	{
		return false;
	}
	nearestWaypoint = wpIndex;
	nearestDistance = Distance(pos, level.waypoints[wpIndex].origin);
	for(i = 0;i < level.waypointCount;i++)
	{
		distance = Distance(pos, level.waypoints[i].origin);
		if(distance < nearestDistance)
		{
			nearestDistance = distance;
			nearestWaypoint = i;
		}
	}
	if(nearestWaypoint == wpIndex)
	{
		return false;
	}
	else
	{
		return true;
	}
}
ClampWpToGround(wpPos)
{
	trace = bulletTrace(wpPos, wpPos + (0,0,-300), false, self);
	if(trace["fraction"] < 1)
	{
		return trace["position"] + (0,0,30);
	}
	else
	{
		trace = bulletTrace(wpPos, wpPos + (0,0,20), false, self);
		if(trace["fraction"] < 1)
		{
			return trace["position"] + (0,0,30);
		}
		else
		{
			return wpPos;
		}
	}
}
bots_PushOutOfPlayers()
{
	if(getdvarint("bots_play_outOfMyWay")) minDistance = 60;
	else minDistance = 30;
	foreach(player in level.players)
	{
		if(player == self) continue;
		if(!bots_isReallyAlive(player)) continue;
		distance = distance(player.origin, self.origin);
		if(distance < minDistance)
		{
			pushOutDir = VectorNormalize((self.origin[0], self.origin[1], 0)-(player.origin[0], player.origin[1], 0));
			trace = bulletTrace(self.origin + (0,0,20), (self.origin + (0,0,20)) + (pushOutDir * ((minDistance-distance)+10)), false, self);
			if(trace["fraction"] == 1)
			{
				pushoutPos = self.origin + (pushOutDir * (minDistance-distance));
				self SetOrigin((pushoutPos[0], pushoutPos[1], self.origin[2]));
			}
		}
	}
}
bots_GetNearestStaticWaypoint(pos)
{
	if(!isDefined(level.waypoints) || level.waypointCount == 0)
	{
		return -1;
	}
	nearestWaypoint = -1;
	nearestDistance = 9999999999;
	for(i = 0;i < level.waypointCount;i++)
	{
		distance = Distance(pos, level.waypoints[i].origin);
		if(distance < nearestDistance )
		{
			nearestDistance = distance;
			nearestWaypoint = i;
		}
	}
	return nearestWaypoint;
}
ClampToGroundtest()
{
	trace = physicsTrace(self.origin + (0,0,50), self.origin + (0,0,-40));
	if((trace[2] - (self.origin[2]-40)) > 0 && ((self.origin[2]+50) - trace[2]) > 0)
	{
		self SetOrigin(trace);
		return true;
	}
	return false;
}
VectorCross( v1, v2 )
{
	return ( v1[1]*v2[2] - v1[2]*v2[1], v1[2]*v2[0] - v1[0]*v2[2], v1[0]*v2[1] - v1[1]*v2[0] );
}
VectorSmooth(vA, vB, fFactor)
{
	fFactorRecip = 1.0-fFactor;
	vRVal = ((vA * fFactorRecip) + (vB * fFactor));
	return vRVal;
}
AStarSearch(startWp, goalWp)
{
	pQOpen = [];
	pQSize = 0;
	closedList = [];
	listSize = 0;
	s = spawnstruct();
	s.g = 0;
	s.h = distance(level.waypoints[startWp].origin, level.waypoints[goalWp].origin);
	s.f = s.g + s.h;
	s.wpIdx = startWp;
	s.parent = spawnstruct();
	s.parent.wpIdx = -1;
	pQOpen[pQSize] = spawnstruct();
	pQOpen[pQSize] = s;
	pQSize++;
	while(!PQIsEmpty(pQOpen, pQSize))
	{
		n = pQOpen[0];
		highestPriority = 9999999999;
		bestNode = -1;
		for(i = 0;i < pQSize;i++)
		{
			if(pQOpen[i].f < highestPriority)
			{
				bestNode = i;
				highestPriority = pQOpen[i].f;
			}
		}
		if(bestNode != -1)
		{
			n = pQOpen[bestNode];
			for(i = bestNode;i < pQSize-1;i++)
			{
				pQOpen[i] = pQOpen[i+1];
			}
			pQSize--;
		}
		else
		{
			return;
		}
		if(n.wpIdx == goalWp)
		{
			x = n;
			for(z = 0;z < 1000;z++)
			{
				parent = x.parent;
				if(parent.parent.wpIdx == -1)
				{
					return x.wpIdx;
				}
				x = parent;
			}
			return;
		}
		for(i = 0;i < level.waypoints[n.wpIdx].childCount;i++)
		{
			newg = n.g + distance(level.waypoints[n.wpIdx].origin, level.waypoints[level.waypoints[n.wpIdx].children[i]].origin);
			if(PQExists(pQOpen, level.waypoints[n.wpIdx].children[i], pQSize))
			{
				nc = spawnstruct();
				for(p = 0;p < pQSize;p++)
				{
					if(pQOpen[p].wpIdx == level.waypoints[n.wpIdx].children[i])
					{
						nc = pQOpen[p];
						break;
					}
				}
				if(nc.g <= newg)
				{
					continue;
				}
			}
			else if(ListExists(closedList, level.waypoints[n.wpIdx].children[i], listSize))
			{
				nc = spawnstruct();
				for(p = 0;p < listSize;p++)
				{
					if(closedList[p].wpIdx == level.waypoints[n.wpIdx].children[i])
					{
						nc = closedList[p];
						break;
					}
				}
				if(nc.g <= newg)
				{
					continue;
				}
			}
			nc = spawnstruct();
			nc.parent = spawnstruct();
			nc.parent = n;
			nc.g = newg;
			nc.h = distance(level.waypoints[level.waypoints[n.wpIdx].children[i]].origin, level.waypoints[goalWp].origin);
			nc.f = nc.g + nc.h;
			nc.wpIdx = level.waypoints[n.wpIdx].children[i];
			if(ListExists(closedList, nc.wpIdx, listSize))
			{
				deleted = false;
				for(p = 0;p < listSize;p++)
				{
					if(closedList[p].wpIdx == nc.wpIdx)
					{
						for(x = p;x < listSize-1;x++)
						{
							closedList[x] = closedList[x+1];
						}
						deleted = true;
						break;
					}
					if(deleted)
					{
						break;
					}
				}
				listSize--;
			}
			if(!PQExists(pQOpen, nc.wpIdx, pQSize))
			{
				pQOpen[pQSize] = spawnstruct();
				pQOpen[pQSize] = nc;
				pQSize++;
			}
		}
		if(!ListExists(closedList, n.wpIdx, listSize))
		{
			closedList[listSize] = spawnstruct();
			closedList[listSize] = n;
			listSize++;
		}
	}
}
PQPush(Q, n, QSize)
{
	Q[QSize] = spawnstruct();
	Q[QSize] = n;
}
PQPop(Q, QSize)
{
	rVal = spawnstruct();
	rVal.wpIdx = -1;
	highestPriority = 9999999999;
	bestNode = -1;
	for(i = 0;i < QSize;i++)
	{
		if(Q[i].f < highestPriority)
		{
			bestNode = i;
			highestPriority = Q[i].f;
		}
	}
	if(bestNode != -1)
	{
		rVal = Q[bestNode];
		for(i = bestNode;i < QSize-1;i++)
		{
			Q[i] = Q[i+1];
		}
		return rVal;
	}
	return rVal;
}
PQIsEmpty(Q, QSize)
{
	if(QSize <= 0)
	{
		return true;
	}
	return false;
}
PQGet(Q, n, QSize)
{
	for(i = 0;i < QSize;i++)
	{
		if(Q[i].wpIdx == n)
		{
			return Q[i];
		}
	}
	rVal = spawnstruct();
	rVal.wpIdx = -1;
	return rVal;
}
PQExists(Q, n, QSize)
{
	for(i = 0;i < QSize;i++)
	{
		if(Q[i].wpIdx == n)
		{
			return true;
		}
	}
	return false;
}
ListAdd(list, n, listSize)
{
	list[listSize] = spawnstruct();
	list[listSize] = n;
}
ListRemove(list, n, listSize)
{
	for(i = 0;i < listSize;i++)
	{
		if(list[i].wpIdx == n.wpIdx)
		{
			for(x = i;x < listSize-1;x++)
			{
				list[x] = list[x+1];
			}
			return;
		}
	}
}
ListExists(list, n, listSize)
{
	for(i = 0;i < listSize;i++)
	{
		if(list[i].wpIdx == n)
		{
			return true;
		}
	}
	return false;
}
ListGet(list, n, listSize)
{
	for(i = 0;i < listSize;i++)
	{
		if(list[i].wpIdx == n)
		{
			return list[i];
		}
	}
	rVal = spawnstruct();
	rVal.wpIdx = -1;
	return rVal;
}