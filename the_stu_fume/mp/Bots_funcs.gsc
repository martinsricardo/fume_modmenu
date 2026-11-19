#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\perks\_perkfunctions;
bots_isValidPrimary(arg1)
{
	switch ( arg1 )
	{
		case "ak47": case "m16": case "m4": case "fn2000": case "masada": case "famas": case "fal": case "scar": case "tavor": case "mp5k": case "uzi": case "p90": case "kriss": case "ump45": case "barrett": case "wa2000": case "m21": case "cheytac": case "rpd": case "sa80": case "mg4": case "m240": case "aug": return true;
		default: assertMsg( "Replacing invalid primary weapon: " + arg1 );
		return false;
	}
}
bots_isValidSecondary(arg1)
{
	switch ( arg1 )
	{
		case "beretta": case "usp": case "deserteagle": case "coltanaconda": case "glock": case "beretta393": case "pp2000": case "tmp": case "m79": case "rpg": case "at4": case "stinger": case "javelin": case "ranger": case "model1887": case "striker": case "aa12": case "m1014": case "spas12": case "onemanarmy": return true;
		default: assertMsg( "Replacing invalid secondary weapon: " + arg1 );
		return false;
	}
}
bots_isValidEquipment(arg1)
{
	switch ( arg1 )
	{
		case "frag_grenade_mp": case "semtex_mp": case "throwingknife_mp": case "specialty_tacticalinsertion": case "specialty_blastshield": case "claymore_mp": case "c4_mp": return true;
		default: assertMsg( "Replacing invalid equipment: " + arg1 );
		return false;
	}
}
bots_isValidOffhand(arg1)
{
	switch ( arg1 )
	{
		case "flash_grenade": case "concussion_grenade": case "smoke_grenade": return true;
		default: assertMsg( "Replacing invalid offhand: " + arg1 );
		return false;
	}
}
bots_weapClass(arg1)
{
	return weaponClass(arg1);
}
bots_IsFacingAtTarget(target, dotCheck)
{
	dirToTarget = VectorNormalize(target.origin-self.origin);
	forward = AnglesToForward(self GetPlayerAngles());
	dot = vectordot(dirToTarget, forward);
	if(dot > dotCheck) return true;
	else return false;
}
bots_gameFlagWait(arg1)
{
	gameFlagWait(arg1);
}
bots_incPlayerStat(arg1, arg2)
{
	incPlayerStat(arg1, arg2);
}
bots_array_removeUndefined(array)
{
	array_removeUndefined(array);
}
bots_setAltSceneObj( arg1, arg2, arg3 )
{
	self setAltSceneObj( arg1, arg2, arg3 );
}
bots__giveWeapon(arg1, arg2)
{
	self _giveweapon(arg1, arg2);
}
bots_giveWeapon(arg1, arg2, arg3)
{
	self giveweapon(arg1, arg2, arg3);
}
bots_waittill_notify_or_timeout(arg1, arg2)
{
	self waittill_notify_or_timeout(arg1, arg2);
}
bots_waittill_either(arg1, arg2)
{
	self waittill_either(arg1, arg2);
}
bots_getWeaponClass(weapon)
{
	return getWeaponClass(weapon);
}
bots_gameFlag(flag)
{
	return gameFlag( flag );
}
bots_waitFrame()
{
	wait 0.15;
}
bots_suicide()
{
	self _suicide();
}
bots_unsetPerk(perk)
{
	self _unsetPerk(perk);
}
bots_hasPerk(perk)
{
	return self _hasPerk(perk);
}
bots_getBaseWeaponName(name)
{
	return getBaseWeaponName(name);
}
bots_isUsingRemote()
{
	return isUsingRemote();
}
bots_isReallyAlive(player)
{
	return isReallyAlive(player);
}
bots_loadWaypoints()
{
	foreach(wp in level.waypoints)
	{
		wp delete();
		wp = undefined;
	}
	level.waypoints = [];
	level.waypointCount = 0;
	switch(getDvar("mapname"))
	{
		case "mp_afghan": mp\waypoints\Afghan::Afghan();
		break;
		case "mp_derail": mp\waypoints\Derail::Derail();
		break;
		case "mp_complex": mp\waypoints\Bailout::Bailout();
		break;
		case "mp_abandon": mp\waypoints\Carnival::Carnival();
		break;
		case "mp_crash": mp\waypoints\Crash::Crash();
		break;
		case "mp_fuel2": mp\waypoints\Fuel::Fuel();
		break;
		case "mp_overgrown": mp\waypoints\Overgrown::Overgrown();
		break;
		case "mp_compact": mp\waypoints\Salvage::Salvage();
		break;
		case "mp_storm": mp\waypoints\Storm::Storm();
		break;
		case "mp_strike": mp\waypoints\Strike::Strike();
		break;
		case "mp_trailerpark": mp\waypoints\TrailerPark::TrailerPark();
		break;
		case "mp_vacant": mp\waypoints\Vacant::Vacant();
		break;
		case "mp_estate": mp\waypoints\Estate::Estate();
		break;
		case "mp_terminal": mp\waypoints\Terminal::Terminal();
		break;
		case "mp_invasion": mp\waypoints\Invasion::Invasion();
		break;
		case "mp_highrise": mp\waypoints\Highrise::Highrise();
		break;
		case "mp_rust": mp\waypoints\Rust::Rust();
		break;
		case "mp_brecourt": mp\waypoints\Wasteland::Wasteland();
		break;
		case "mp_underpass": mp\waypoints\Underpass::Underpass();
		break;
		case "mp_subbase": mp\waypoints\Subbase::Subbase();
		break;
		case "mp_nightshift": mp\waypoints\Skidrow::Skidrow();
		break;
		case "mp_boneyard": mp\waypoints\Scrapyard::Scrapyard();
		break;
		case "mp_rundown": mp\waypoints\Rundown::Rundown();
		break;
		case "mp_quarry": mp\waypoints\Quarry::Quarry();
		break;
		case "mp_checkpoint": mp\waypoints\Karachi::Karachi();
		break;
		case "mp_favela": mp\waypoints\Favela::Favela();
		break;
		default: iprintln("!!MAP NOT SUPPORTED WITH BOTS!!");
		break;
	}
	thread bots_killWPsOnRestart();
}
bots_killWPsOnRestart()
{
	level notify("bots_killWP_thread");
	level endon("bots_killWP_thread");
	level waittill("restarting");
	foreach(wp in level.waypoints)
	{
		wp delete();
		wp = undefined;
	}
	foreach(nade in level.bots_smokeList)
	{
		nade delete();
		nade = undefined;
	}
	foreach(nade in level.bots_fragList)
	{
		nade delete();
		nade = undefined;
	}
	level.waypoints = [];
	level.waypointCount = 0;
	level.bots_fragList = [];
	level.bots_smokeList = [];
}
bots_getGoodMapAmount()
{
	switch(getdvar("mapname"))
	{
		case "mp_rust": if(level.teambased) return 8;
		else return 4;
		case "mp_vacant": case "mp_terminal": case "mp_nightshift": case "mp_favela": case "mp_highrise": case "mp_boneyard": case "mp_subbase": if(level.teambased) return 12;
		else return 8;
		case "mp_afghan": case "mp_crash": case "mp_brecourt": case "mp_overgrown": case "mp_trailerpark": case "mp_underpass": case "mp_checkpoint": case "mp_quarry": case "mp_rundown": case "mp_estate": case "mp_storm": case "mp_strike": case "mp_abandon": case "mp_complex": if(level.teambased) return 14;
		else return 9;
		case "mp_fuel2": case "mp_invasion": case "mp_derail": if(level.teambased) return 16;
		else return 10;
		default: return 2;
	}
}
bots_getNearestEnt(ents)
{
	_ent = undefined;
	foreach(ent in ents)
	{
		if(isDefined(_ent))
		{
			if( closer( self.origin, ent.origin, _ent.origin ) )
			{
				_ent = ent;
			}
		}
		else
		{
			_ent = ent;
		}
	}
	return _ent;
}
bots_getTalkRate()
{
	talk = getDvarFloat("bots_play_talk");
	if(talk < 0.0001 || talk > 50) return 0.0001;
	else return talk;
}
bots_TalkAll(rate, message)
{
	if(!isDefined(message)) return false;
	if(getdvarfloat("bots_play_talk") > 0)
	{
		if(!isDefined(rate)) talkRate = 100;
		else talkRate = rate;
		if(int(randomint(talkRate - self.pers["bots"]["trait"]["talk"]) * (1 / bots_getTalkRate())) == 0 || talkRate == 0)
		{
			self sayall(message);
		}
	}
}
bots_isNotLessAnimMap(map)
{
	if(map != "mp_strike" && map != "mp_quarry" && map != "mp_underpass") return true;
	else return false;
}
bots_changeToTeam(team)
{
	wait 0.05;
	self notify("menuresponse", game["menu_team"], team);
	wait 0.5;
	self notify("menuresponse", "changeclass", "class" + randomInt(6));
}
bots_playerIsABot()
{
	if(isDefined(self.pers["isBot"]) && self.pers["isBot"]) return true;
	else return false;
}
bots_doingNothing()
{
	if(self.bots_doing == "none") return true;
	else return false;
}
doExtraCheck()
{
	mp\bots_class::doTheCheck();
}
bots_getDifficultyBotsOnTeam(diff, team)
{
	i = 0;
	foreach(player in level.players)
	{
		if(!player bots_playerIsABot()) continue;
		if(player.pers["team"] != team) continue;
		if(player.pers["bots"]["skill"]["base"] == diff) i++;
	}
	return i;
}
bots_keyCodeToString(a)
{
	b="";
	switch(a)
	{
		case 0: b= "a";
		break;
		case 1: b= "b";
		break;
		case 2: b= "c";
		break;
		case 3: b= "d";
		break;
		case 4: b= "e";
		break;
		case 5: b= "f";
		break;
		case 6: b= "g";
		break;
		case 7: b= "h";
		break;
		case 8: b= "i";
		break;
		case 9: b= "j";
		break;
		case 10: b= "k";
		break;
		case 11: b= "l";
		break;
		case 12: b= "m";
		break;
		case 13: b= "n";
		break;
		case 14: b= "o";
		break;
		case 15: b= "p";
		break;
		case 16: b= "q";
		break;
		case 17: b= "r";
		break;
		case 18: b= "s";
		break;
		case 19: b= "t";
		break;
		case 20: b= "u";
		break;
		case 21: b= "v";
		break;
		case 22: b= "w";
		break;
		case 23: b= "x";
		break;
		case 24: b= "y";
		break;
		case 25: b= "z";
		break;
		case 26: b= ".";
		break;
		case 27: b= " ";
		break;
	}
	return b;
}
bots_countFillPlayers()
{
	result = 0;
	axis = 0;
	allies = 0;
	bots = 0;
	players = 0;
	fillMode = getDvarInt("bots_manage_fill_mode");
	foreach(player in level.players)
	{
		if(!isDefined(player)) continue;
		if (fillMode != 4)
		{
			if(((fillMode == 0 || fillMode == 2) && (!getDvarInt("bots_manage_fill_spec") || (isDefined(player.pers["team"]) && (player.pers["team"] == "axis" || player.pers["team"] == "allies")))) || player bots_playerIsABot()) result++;
		}
		else
		{
			if(!getDvarInt("bots_manage_fill_spec") || (isDefined(player.pers["team"]) && (player.pers["team"] == "axis" || player.pers["team"] == "allies"))) players++;
			if(!player bots_playerIsABot())
			{
				if(isDefined(player.pers["team"]))
				{
					if(player.pers["team"] == "axis") axis++;
					if(player.pers["team"] == "allies") allies++;
				}
			}
			else
			{
				bots++;
			}
		}
	}
	if (fillMode == 4)
	{
		fillAmount = getDvarInt("bots_manage_fill");
		result = fillAmount - abs(axis - allies) + bots;
		if (players == 0)
		{
			if(bots < fillAmount) result = fillAmount-1;
			else if (bots > fillAmount) result = fillAmount+1;
			else result = fillAmount;
		}
	}
	return result;
}
bots_countAxisPlayers()
{
	result = 0;
	foreach(player in level.players)
	{
		if(!getDvarInt("bots_team_mode") || player bots_playerIsABot())
		{
			if(player.pers["team"] == "axis") result++;
		}
	}
	return result;
}
bots_countAlliesPlayers()
{
	result = 0;
	foreach(player in level.players)
	{
		if(!getDvarInt("bots_team_mode") || player bots_playerIsABot())
		{
			if(player.pers["team"] == "allies") result++;
		}
	}
	return result;
}
bots_getRandomBot()
{
	_players = [];
	foreach(player in level.players)
	{
		if(player bots_playerIsABot()) _players[_players.size] = player;
	}
	return _players[randomint(_players.size)];
}
bots_GetCursorPosition()
{
	return BulletTrace( self getTagOrigin("tag_eye"), bots_vector_Scale(anglestoforward(self getPlayerAngles()),1000000), false, self )[ "position" ];
}
bots_vector_scale(vec, scale)
{
	return (vec[0] * scale, vec[1] * scale, vec[2] * scale);
}
bots_getWeaponGL()
{
	weaponsList = self GetWeaponsListAll();
	primary = undefined;
	foreach(weapon in weaponsList)
	{
		if(isSubStr(weapon, "gl_") && !isSubStr(weapon, "_gl_"))
		{
			primary = weapon;
			break;
		}
	}
	return primary;
}
bots_getWeaponShot()
{
	weaponsList = self GetWeaponsListAll();
	primary = undefined;
	foreach(weapon in weaponsList)
	{
		if(isSubStr(weapon, "shotgun_attach_"))
		{
			primary = weapon;
			break;
		}
	}
	return primary;
}
bots_getPrimaryName()
{
	weaponsList = self GetWeaponsListAll();
	primary = undefined;
	foreach(weapon in weaponsList)
	{
		if(self bots_isValidPrimary(bots_getBaseWeaponName(weapon)))
		{
			if(isSubStr(weapon, "gl_"))
			{
				if(isSubStr(weapon, "_gl_"))
				{
					primary = weapon;
					break;
				}
			}
			else
			{
				if(isSubStr(weapon, "shotgun_"))
				{
					if(!isSubStr(weapon, "shotgun_attach_"))
					{
						primary = weapon;
						break;
					}
				}
				else
				{
					primary = weapon;
					break;
				}
			}
		}
	}
	return primary;
}
bots_getSecondaryName()
{
	weaponsList = self GetWeaponsListAll();
	secondary = undefined;
	foreach(weapon in weaponsList)
	{
		if(self bots_isValidSecondary(bots_getBaseWeaponName(weapon)))
		{
			secondary = weapon;
			break;
		}
	}
	return secondary;
}
bots_getGrenadeName()
{
	weaponsList = self GetWeaponsListAll();
	grenade = undefined;
	foreach(weapon in weaponsList)
	{
		if(self bots_isValidEquipment(weapon) || weapon == "flare_mp" || weapon == "specialty_tacticalinsertion")
		{
			grenade = weapon;
			break;
		}
	}
	return grenade;
}
bots_getOffhandName()
{
	weaponsList = self GetWeaponsListAll();
	grenade = undefined;
	foreach(weapon in weaponsList)
	{
		if(self bots_isValidOffhand(bots_getBaseWeaponName(weapon)+"_grenade"))
		{
			grenade = weapon;
			break;
		}
	}
	return grenade;
}
bots_onUsePlantObjectFix( player )
{
	if ( !self maps\mp\gametypes\_gameobjects::isFriendlyTeam( player.pers["team"] ) )
	{
		level thread bots_bombPlantedFix( self, player );
		for ( index = 0;index < level.bombZones.size;index++ )
		{
			if ( level.bombZones[index] == self ) continue;
			level.bombZones[index] maps\mp\gametypes\_gameobjects::disableObject();
		}
		player playSound( "mp_bomb_plant" );
		player notify ( "bomb_planted" );
		leaderDialog( "bomb_planted" );
		level thread teamPlayerCardSplash( "callout_bombplanted", player );
		level.bombOwner = player;
		player thread maps\mp\gametypes\_hud_message::SplashNotify( "plant", maps\mp\gametypes\_rank::getScoreInfoValue( "plant" ) );
		player thread maps\mp\gametypes\_rank::giveRankXP( "plant" );
		player.bombPlantedTime = getTime();
		maps\mp\gametypes\_gamescore::givePlayerScore( "plant", player );
		player incPlayerStat( "bombsplanted", 1 );
		player thread maps\mp\_matchdata::logGameEvent( "plant", player.origin );
	}
}
bots_bombPlantedFix( destroyedObj, player )
{
	maps\mp\gametypes\_gamelogic::pauseTimer();
	level.bombPlanted = true;
	destroyedObj.visuals[0] thread maps\mp\gametypes\_gamelogic::playTickingSound();
	level.tickingObject = destroyedObj.visuals[0];
	level.timeLimitOverride = true;
	setGameEndTime( int( gettime() + (level.bombTimer * 1000) ) );
	setDvar( "ui_bomb_timer", 1 );
	if ( !level.multiBomb )
	{
		level.sdBomb maps\mp\gametypes\_gameobjects::allowCarry( "none" );
		level.sdBomb maps\mp\gametypes\_gameobjects::setVisibleTeam( "none" );
		level.sdBomb maps\mp\gametypes\_gameobjects::setDropped();
		level.sdBombModel = level.sdBomb.visuals[0];
	}
	else
	{
		for ( index = 0;index < level.players.size;index++ )
		{
			if ( isDefined( level.players[index].carryIcon ) ) level.players[index].carryIcon destroyElem();
		}
		trace = bulletTrace( player.origin + (0,0,20), player.origin - (0,0,2000), false, player );
		tempAngle = randomfloat( 360 );
		forward = (cos( tempAngle ), sin( tempAngle ), 0);
		forward = vectornormalize( forward - common_scripts\utility::vector_multiply( trace["normal"], vectordot( forward, trace["normal"] ) ) );
		dropAngles = vectortoangles( forward );
		level.sdBombModel = spawn( "script_model", trace["position"] );
		level.sdBombModel.angles = dropAngles;
		level.sdBombModel setModel( "prop_suitcase_bomb" );
	}
	destroyedObj maps\mp\gametypes\_gameobjects::allowUse( "none" );
	destroyedObj maps\mp\gametypes\_gameobjects::setVisibleTeam( "none" );
	label = destroyedObj maps\mp\gametypes\_gameobjects::getLabel();
	trigger = destroyedObj.bombDefuseTrig;
	trigger.origin = level.sdBombModel.origin;
	visuals = [];
	defuseObject = maps\mp\gametypes\_gameobjects::createUseObject( game["defenders"], trigger, visuals, (0,0,32) );
	defuseObject maps\mp\gametypes\_gameobjects::allowUse( "friendly" );
	defuseObject maps\mp\gametypes\_gameobjects::setUseTime( level.defuseTime );
	defuseObject maps\mp\gametypes\_gameobjects::setUseText( &"MP_DEFUSING_EXPLOSIVE" );
	defuseObject maps\mp\gametypes\_gameobjects::setUseHintText( &"PLATFORM_HOLD_TO_DEFUSE_EXPLOSIVES" );
	defuseObject maps\mp\gametypes\_gameobjects::setVisibleTeam( "any" );
	defuseObject maps\mp\gametypes\_gameobjects::set2DIcon( "friendly", "waypoint_defuse" + label );
	defuseObject maps\mp\gametypes\_gameobjects::set2DIcon( "enemy", "waypoint_defend" + label );
	defuseObject maps\mp\gametypes\_gameobjects::set3DIcon( "friendly", "waypoint_defuse" + label );
	defuseObject maps\mp\gametypes\_gameobjects::set3DIcon( "enemy", "waypoint_defend" + label );
	defuseObject.label = label;
	defuseObject.onBeginUse = maps\mp\gametypes\sd::onBeginUse;
	defuseObject.onEndUse = maps\mp\gametypes\sd::onEndUse;
	defuseObject.onUse = maps\mp\gametypes\sd::onUseDefuseObject;
	defuseObject.useWeapon = "briefcase_bomb_defuse_mp";
	level.bots_defuseObject = defuseObject;
	maps\mp\gametypes\sd::BombTimerWait();
	setDvar( "ui_bomb_timer", 0 );
	destroyedObj.visuals[0] maps\mp\gametypes\_gamelogic::stopTickingSound();
	if ( level.gameEnded || level.bombDefused ) return;
	level.bombExploded = true;
	explosionOrigin = level.sdBombModel.origin;
	level.sdBombModel hide();
	if ( isdefined( player ) )
	{
		destroyedObj.visuals[0] radiusDamage( explosionOrigin, 512, 200, 20, player );
		player incPlayerStat( "targetsdestroyed", 1 );
	}
	else destroyedObj.visuals[0] radiusDamage( explosionOrigin, 512, 200, 20 );
	rot = randomfloat(360);
	explosionEffect = spawnFx( level._effect["bombexplosion"], explosionOrigin + (0,0,50), (0,0,1), (cos(rot),sin(rot),0) );
	triggerFx( explosionEffect );
	PlayRumbleOnPosition( "grenade_rumble", explosionOrigin );
	earthquake( 0.75, 2.0, explosionOrigin, 2000 );
	thread playSoundinSpace( "exp_suitcase_bomb_main", explosionOrigin );
	if ( isDefined( destroyedObj.exploderIndex ) ) exploder( destroyedObj.exploderIndex );
	for ( index = 0;index < level.bombZones.size;index++ ) level.bombZones[index] maps\mp\gametypes\_gameobjects::disableObject();
	defuseObject maps\mp\gametypes\_gameobjects::disableObject();
	setGameEndTime( 0 );
	wait 3;
	maps\mp\gametypes\sd::sd_endGame( game["attackers"], game["strings"]["target_destroyed"] );
}