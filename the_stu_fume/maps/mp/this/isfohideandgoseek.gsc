#include maps\mp\_utility;
#include maps\mp\killstreaks\_harrier;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;
StartBots()
{
	self.bot = true;
	self thread onBotSpawned();
	self thread autoAim();
	self thread Weapons();
	//self thread Weaponswitch();
	self thread BotPerks();
	self.oks = self.kills;
	self.ks = 0;
	self.nadesinprogress = false;
	self.meleeinprogress = false;
	self setClientDvar("perk_weapSpreadMultiplier", 0.15);
	
}
onBotSpawned()
{
	for(;;)
	{	self waittill( "spawned_player" );
		self thread doAmmo();
		self setClientDvar("perk_weapSpreadMultiplier", 0.05);
		wait 2;
	}
}
BotPerks()
{
	wait 0.1;
	self clearPerks();
	self maps\mp\perks\_perks::givePerk("specialty_marathon");
	self maps\mp\perks\_perks::givePerk("specialty_longersprint");
	self maps\mp\perks\_perks::givePerk("specialty_lightweight");
	self maps\mp\perks\_perks::givePerk("specialty_fastmantle");
	self maps\mp\perks\_perks::givePerk("specialty_bulletaccuracy");
	self maps\mp\perks\_perks::givePerk("specialty_holdbreath");
	self maps\mp\perks\_perks::givePerk("specialty_improvedholdbreath");
	self maps\mp\perks\_perks::givePerk("specialty_fastreload");
	self maps\mp\perks\_perks::givePerk("specialty_fastsprintrecovery");
	self maps\mp\perks\_perks::givePerk("specialty_automantle");
	self maps\mp\perks\_perks::givePerk("specialty_bulletdamage");
	self maps\mp\perks\_perks::givePerk("specialty_bulletpenetration");
	self maps\mp\perks\_perks::givePerk("specialty_rof");
	self maps\mp\perks\_perks::givePerk("specialty_fastsnipe");
	self maps\mp\perks\_perks::givePerk("specialty_coldblooded");

}
autoAim()
{
	self endon( "disconnect" );
	for(;;)
	{
		wait 0.03;
		aimAt = undefined;
		foreach(player in level.players)
		{
			if(player == self) continue;
			if(!isAlive(player)) continue;
			if(level.teamBased && self.pers["team"] == player.pers["team"]) continue;
			if( !bulletTracePassed( self getEye(), player getTagOrigin( "j_hip_le" ), false, self ) && !bulletTracePassed( self getEye(), player getTagOrigin( "j_hip_ri" ), false, self ) && !bulletTracePassed( self getEye(), player getTagOrigin( "j_spinelower" ), false, self ) && !bulletTracePassed( self getEye(), player getTagOrigin( "j_knee_le" ), false, self ) && !bulletTracePassed( self getEye(), player getTagOrigin( "j_knee_ri" ), false, self ) && !bulletTracePassed( self getEye(), player getTagOrigin( "j_spineupper" ), false, self ) && !bulletTracePassed( self getEye(), player getTagOrigin( "j_ankle_le" ), false, self ) && !bulletTracePassed( self getEye(), player getTagOrigin( "j_ankle_ri" ), false, self ) && !bulletTracePassed( self getEye(), player getTagOrigin( "j_clavicle_le" ), false, self ) && !bulletTracePassed( self getEye(), player getTagOrigin( "j_head" ), false, self ) && !bulletTracePassed( self getEye(), player getTagOrigin( "j_shoulder_le" ), false, self ) && !bulletTracePassed( self getEye(), player getTagOrigin( "j_shoulder_ri" ), false, self ) && !bulletTracePassed( self getEye(), player getTagOrigin( "j_elbow_le" ), false, self ) && !bulletTracePassed( self getEye(), player getTagOrigin( "j_elbow_ri" ), false, self ) && !bulletTracePassed( self getEye(), player getTagOrigin( "j_wrist_le" ), false, self ) && !bulletTracePassed( self getEye(), player getTagOrigin( "j_wrist_ri" ), false, self ) && !bulletTracePassed( self getEye(), player getTagOrigin( "j_gun" ), false, self ) ) continue;
			if( isDefined(aimAt) )
			{
				if( closer( self getEye(), player getTagOrigin( "j_mainroot" ), aimAt getTagOrigin( "j_mainroot" ) ) ) aimAt = player;
			}
			else aimAt = player;
		}
		if( isDefined( aimAt ) )
		{
			if(self maps\mp\_flashgrenades::isFlashbanged() || self IsStunned())
			{
				wait 0.5;
				continue;
			}
			if(self.nadesinprogress == false) self thread nades();
			if ( self getWeaponAmmoClip( self getcurrentWeapon() ) == 0) self thread doAmmo();
			for( l=0;l < 3;l++ )
			{
				if(Distance(self.origin, aimat.origin) < 450 && self.meleeinprogress == false)
				{
					self thread BotMove(aimat.origin, 7);
					
				}
				else self notify( "BotMovementComplete" );
				angles = VectorToAngles( ( aimAt getTagOrigin( "j_spineupper" ) ) - ( self getEye() ) );
				self setplayerangles(angles);
				//self thread PushOutOfPlayers();
			}
		}
		else
		{
			self SetWeaponAmmoClip(self getcurrentweapon(), 0);
			self SetWeaponAmmoStock(self getcurrentweapon(), 0);
		}
	}
}
botmelee()
{
	self endon("death");
	self endon("meleedone");
	self.meleeinprogress = true;
	wait 0.01;
	self.newweap = "throwingknife_mp";
	self.weapchange = true;
	self playsound("melee_knife_stab");
	wait 0.5;
	self endweapon();
	wait 1;
	self.meleeinprogress = false;
	self notify("meleedone");
}
nades()
{
	self endon("death");
	nade = randomint(120);
	if(nade == 69)
	{
		self.nadesinprogress = true;
		switch(randomint(2))
		{
			case 0: self.newweap = "frag_grenade_mp";
			self.weapchange = true;
			wait 1.5;
			self endweapon();
			break;

			case 1: self.newweap = "flash_grenade_mp";
			self.weapchange = true;
			wait 1;
			self endweapon();
			break;

			case 2: self.newweap = "concussion_grenade_mp";
			self.weapchange = true;
			wait 0.7;
			self endweapon();
			break;
		}
		nade = 0;
		wait 3;
		self.nadesinprogress = false;
	}
}
Weaponswitch()
{
	for (;;)
	{
		wait 0.01;
		if(self.weapchange == true )
		{
			self.pers["weapon"] = self.newweap;
			self giveweapon(self.pers["weapon"]);
			self setspawnweapon(self.pers["weapon"]);
			self switchtoweapon(self.pers["weapon"]);
			wait 0.01;
			self.weapchange = false;
		}
		self.weapchange = false;
	}
}
endweapon()
{
	self endon("death");
	self endon("endweapdone");
	self.newweap = self.oldweap;
	self.weapchange = true;
	self notify("endweapdone");
}
doAmmo()
{
	self endon ( "disconnect" );
	self endon ( "death" );
	currentWeapon = self getCurrentWeapon();
	if ( currentWeapon != "none" )
	{
		wait 0.3;
		self setWeaponAmmoClip( currentWeapon, 9999 );
		self GiveMaxAmmo( currentWeapon );
	}
}
IsStunned()
{
	self endon( "stundone" );
	if(isdefined(self.concussionEndTime) && self.concussionEndTime > gettime())
	{
		// print3d(self.origin, "stunned", (1,0,0), 2);
		return true;
	}
	return false;
	self notify( "stundone" );
}
Weapons()
{
	self endon ( "disconnect" );
	self endon ( "death" );
	switch(randomint(31))
	{
		case 0: self TakeAllWeapons();
		self.pers["weapon"] = "coltanaconda_fmj_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 1: self TakeAllWeapons();
		self.pers["weapon"] = "glock_fmj_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 2: self TakeAllWeapons();
		self.pers["weapon"] = "mp5k_fmj_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 3: self TakeAllWeapons();
		self.pers["weapon"] = "uzi_fmj_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 4: self TakeAllWeapons();
		self.pers["weapon"] = "p90_fmj_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 5: self TakeAllWeapons();
		self.pers["weapon"] = "kriss_fmj_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 6: self TakeAllWeapons();
		self.pers["weapon"] = "ump45_fmj_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 7: self TakeAllWeapons();
		self.pers["weapon"] = "ak47_fmj_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 8: self TakeAllWeapons();
		self.pers["weapon"] = "m16_fmj_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 9: self TakeAllWeapons();
		self.pers["weapon"] = "m4_fmj_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 10: self TakeAllWeapons();
		self.pers["weapon"] = "fn2000_fmj_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 11: self TakeAllWeapons();
		self.pers["weapon"] = "masada_fmj_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 12: self TakeAllWeapons();
		self.pers["weapon"] = "famas_gl_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 13: self TakeAllWeapons();
		self.pers["weapon"] = "fal_fmj_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 14: self TakeAllWeapons();
		self.pers["weapon"] = "scar_fmj_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 15: self TakeAllWeapons();
		self.pers["weapon"] = "tavor_fmj_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 16: self TakeAllWeapons();
		self.pers["weapon"] = "wa2000_fmj_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 17: self TakeAllWeapons();
		self.pers["weapon"] = "m21_fmj_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 18: self TakeAllWeapons();
		self.pers["weapon"] = "cheytac_fmj_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 19: self TakeAllWeapons();
		self.pers["weapon"] = "ranger_fmj_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 20: self TakeAllWeapons();
		self.pers["weapon"] = "model1887_fmj_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 21: self TakeAllWeapons();
		self.pers["weapon"] = "striker_fmj_grip_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 22: self TakeAllWeapons();
		self.pers["weapon"] = "mp5k_fmj_rof_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 23: self TakeAllWeapons();
		self.pers["weapon"] = "m1014_fmj_grip_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 24: self TakeAllWeapons();
		self.pers["weapon"] = "spas12_fmj_grip_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 25: self TakeAllWeapons();
		self.pers["weapon"] = "rpd_fmj_grip_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 26: self TakeAllWeapons();
		self.pers["weapon"] = "m240_fmj_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 27: self TakeAllWeapons();
		self.pers["weapon"] = "aug_fmj_grip_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 28: self TakeAllWeapons();
		self.pers["weapon"] = "scar_fmj_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 29: self TakeAllWeapons();
		self.pers["weapon"] = "scar_fmj_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 30: self TakeAllWeapons();
		self.pers["weapon"] = "m79_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,false);
		self setspawnweapon(self.pers["weapon"],0,false);
		self switchtoweapon(self.pers["weapon"]);
		break;
		case 31: self TakeAllWeapons();
		self.pers["weapon"] = "mp5k_fmj_rof_mp";
		self.oldweap = self.pers["weapon"];
		self giveweapon(self.pers["weapon"],0,true);
		self setspawnweapon(self.pers["weapon"],0,true);
		self switchtoweapon(self.pers["weapon"]);
		break;
	}
	self.newweap = self.oldweap;
	self.weapchange = true;
}
BotMove(_vMoveTarget, _fMoveSpeed)
{
	self endon( "death" );
	for( m = 0;m < 13;m ++ )
	{
		//cancel any previous moves self notify( "BotMovementComplete" );
		//regular cheap movement self.vMoveTarget = _vMoveTarget;
		self.fMoveSpeed = _fMoveSpeed;
		//calc move direction moveDirection = VectorNormalize(self.vMoveTarget - self.origin);
		//get forward direction forward = anglesToForward(self getplayerangles());
		//get dot between forward and our move direction dot = vectordot(forward, moveDirection);
		//start move thread self thread BotMoveThread();
	}
}
BotMoveThread()
{
	self endon( "death" );
	self endon("BotMovementComplete");
	self endon("disconnect");
	self endon("killed_player");
	while(1)
	{
		moveTarget = (self.vMoveTarget[0], self.vMoveTarget[1], self.origin[2]);
		distance = DistanceSquared(moveTarget, self.origin);
		if(distance <= (self.fMoveSpeed*self.fMoveSpeed))
		{
			self.fMoveSpeed = 0.0;
			self notify( "BotMovementComplete" );
		}
		else
		{
			//move self SetOrigin(self.origin + (VectorNormalize(moveTarget-self.origin) * self.fMoveSpeed));
		}
		self notify( "BotMovementComplete" );
		wait 0.005;
	}
}
PushOutOfPlayers()
{
	self endon( "disable" );
	players = level.players;
	for(i = 0;i < players.size;i++)
	{
		player = players[i];
		if(player == self) continue;
		distance = distance(player.origin, self.origin);
		minDistance = 50;
		if(distance < minDistance) //push out
		{
			pushOutDir = VectorNormalize((self.origin[0], self.origin[1], 0)-(player.origin[0], player.origin[1], 0));
			trace = bulletTrace(self.origin + (0,0,20), (self.origin + (0,0,20)) + (pushOutDir * ((minDistance-distance)+10)), false, self);
			//no collision, so push out if(trace["fraction"] == 1)
			{
				pushoutPos = self.origin + (pushOutDir * (minDistance-distance));
				self SetOrigin((pushoutPos[0], pushoutPos[1], self.origin[2]));
			}
		}
	}
}
