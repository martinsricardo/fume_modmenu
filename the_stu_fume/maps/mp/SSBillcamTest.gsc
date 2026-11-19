#include maps\mp\gametypes\_hud_util;
#include maps\mp\_utility;
#include common_scripts\utility;
initJet()
{
	self endon("disconnect");
	self endon("death");
	self endon("endjet");
	while(self.menu.open==true)wait 1;
	self thread jetStartup(0,1,1);
	self disableweapons();
	self hide();
	self iPrintlnBold("Press [{+usereload}] to hop on the SS Billcam");
	self.fazeup=1;
	self thread monitorPlayers();
}
monitorPlayers()
{
	self endon("disconnect");
	self endon("death");
	self endon("endjet");
	for(;;)
	{
		foreach(player in level.players)
		{
			if(!isDefined(player.jetflying))
			{
				if(player.fazeup!=1)
				{
					if(Distance(player.origin,level.stealth_owner.origin)< 200)
					{
						player iPrintlnBold("Press [{+usereload}] to hop on the SS Billcam");
						if(player UseButtonPressed())
						{
							player.fazeup=1;
							player playerlinkto(level.stealth_owner);
							player hide();
							player disableweapons();
						}
					}
					//else player clearLowerMessage("Stealth_Billcam",1.0);
				}
				else
				{
					player iPrintlnBold("Press [{+usereload}] to hop off the SS Billcam");
					if(player UseButtonPressed())
					{
						player.fazeup=0;
						player unlink();
						player show();
						player enableweapons();
					}
				}
			}
		}
		wait 0.05;
	}
}
monitorJetEnd()
{
	self endon("disconnect");
	self endon("death");
	self endon("endjet");
	for(;;)
	{
		if(self UseButtonPressed())
		{
			self thread SpawnPlatform();
			if(isDefined(self.jetflying))self.jetflying destroy();
			PlayFx(level._effect["bombexplosion"],self.origin);
			PlayRumbleOnPosition("grenade_rumble",self.origin);
			earthquake(0.75,2.0,self.origin,2000);
			thread playSoundinSpace("exp_suitcase_bomb_main",self.origin);
			self setClientDvars("cg_thirdperson","0","cg_fovscale","1","cg_thirdPersonRange","120");
			self notify("endjet");
		}
		wait 0.05;
	}
}
monitorJetControls()
{
	self endon("disconnect");
	self endon("death");
	self endon("endjet");
	if(isdefined(self.jetflying))self.jetflying delete();
	self.jetflying=spawn("script_origin",self.origin);
	level.stealth_owner=self;
	while(1)
	{
		self.jetflying.origin=self.origin;
		self playerlinkto(self.jetflying);
		vec=anglestoforward(self getPlayerAngles());
		if(self FragButtonPressed())
		{
			self.flyingJetSpeed=50;
			vec2iguess=vector_scalSS(vec,self.flyingJetSpeed);
			self.jetflying.origin=self.jetflying.origin+vec2iguess;
		}
		else if(self SecondaryOffhandButtonPressed())
		{
			self.flyingJetSpeed=-50;
			vec2iguess=vector_scalSS(vec,self.flyingJetSpeed);
			self.jetflying.origin=self.jetflying.origin+vec2iguess;
		}
		if(self AttackButtonPressed())self.jetflying.origin=self.jetflying.origin+(0,0,25);
		else if(self ADSButtonPressed())self.jetflying.origin=self.jetflying.origin+(0,0,-25);
		wait 0.05;
	}
}
vector_scalSS(vec,scale)
{
	vec =(vec[0] * scale,vec[1] * scale,vec[2] * scale);
	return vec;
}
jetStartup(Speed,Silent,ThirdPerson)
{
	self disableweapons();
	self hide();
	if(ThirdPerson==1)
	{
		wait 0.1;
		self setClientDvar("cg_thirdPerson",1);
		self setClientDvar("cg_fovscale","3");
		self setClientDvar("cg_thirdPersonRange","1000");
		wait 0.1;
	}
	jetflying111="vehicle_ac130_low_mp";
	self attach(jetflying111,"tag_weapon_left",false);
	self thread monitorJetEnd();
	self thread monitorJetControls();
	self thread monitorPlayers();
	self thread engineSmoke();
	if(Silent==0)
	{
		//self playLoopSound("veh_b2_dist_loop");
	}
}
engineSmoke()
{
	self endon("endjet");
	playFxOnTag(level.harrier_smoke,self,"tag_engine_left");
	playFxOnTag(level.harrier_smoke,self,"tag_engine_right");
	playFxOnTag(level.harrier_smoke,self,"tag_engine_left");
	playFxOnTag(level.harrier_smoke,self,"tag_engine_right");
}
destroyOnDeath_1(waaat)
{
	self waittill("death");
	waaat destroy();
}
destroyOnEndJet(waaat)
{
	self waittill("endjet");
	waaat destroy();
}
SpawnPlatform()
{
	self endon("Exit_SSBillcam");
	for(;;)
	{
		foreach(player in level.players)if(player.fazeup!=0)
		{
			//player clearLowerMessage("Stealth_Billcam",1.0);
			player show();
			player.fazeup=0;
			player unlink();
			player enableweapons();
			foreach(w in player.owp)player giveweapon(w);
			player.pers["loc"]=true;
			player.pers["savePos"]=player.origin;
			player.pers["saveAng"]=player.angles;
			player iPrintlnBold("Platform spawned and Position saved!");
		}
		vec=anglestoforward(self getPlayerAngles());
		SPLOSIONlocation=BulletTrace(self getTagOrigin("tag_eye"),self getTagOrigin("tag_eye")+(vec[0] * 1,vec[1] * 1,vec[2] * 1),0,self)[ "position" ];
		currentWeapon=self getCurrentWeapon();
		initorigin=self.origin+(0,0,0);
		obj=spawn("script_model",self.origin+(0,0,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(60,0,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(120,0,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(-60,0,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(-120,0,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(0,30,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(60,30,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(120,30,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(-120,30,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(-60,30,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(0,30,-30));
		obj=spawn("script_model",self.origin+(0,60,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,60,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(60,60,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(120,60,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(-120,60,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(-60,60,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(0,30,-30));
		obj=spawn("script_model",self.origin+(0,-30,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(60,-30,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(120,-30,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(-120,-30,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(-60,-30,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(0,-60,-30));
		obj=spawn("script_model",self.origin+(0,-60,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(60,-60,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(120,-60,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(-120,-60,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(-60,-60,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(0,90,-30));
		obj=spawn("script_model",self.origin+(0,90,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(60,90,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(120,90,-30));
		obj setModel("com_plasticcase_friendly");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(-120,90,-30));
		obj setModel("com_plasticcase_friendly");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(-60,90,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(0,-90,-30));
		obj=spawn("script_model",self.origin+(0,-90,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(60,-90,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(120,-90,-30));
		obj setModel("com_plasticcase_friendly");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(-120,-90,-30));
		obj setModel("com_plasticcase_friendly");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(-60,-90,-30));
		obj setModel("com_plasticcase_enemy");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(0,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(-133,90,13));
		obj setModel("com_plasticcase_friendly");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(90,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(133,90,13));
		obj setModel("com_plasticcase_friendly");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(90,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(-133,-90,13));
		obj setModel("com_plasticcase_friendly");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(90,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(133,-90,13));
		obj setModel("com_plasticcase_friendly");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(90,0,0);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		obj=spawn("script_model",self.origin+(0,-350,-350));
		obj setModel("com_plasticcase_friendly");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(60,90,90);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		self thread CreateBounceSS(obj.origin);
		obj=spawn("script_model",self.origin+(0,350,-350));
		obj setModel("com_plasticcase_friendly");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(60,-90,90);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		self thread CreateBounceSS(obj.origin);
		obj=spawn("script_model",self.origin+(350,0,-350));
		obj setModel("com_plasticcase_friendly");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(-60,0,90);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		self thread CreateBounceSS(obj.origin);
		obj=spawn("script_model",self.origin+(-350,0,-350));
		obj setModel("com_plasticcase_friendly");
		obj Solid();
		obj CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
		obj.angles =(60,0,90);
		obj.health=4200;
		self thread ObjManageHealthSS(obj);
		self thread CreateBounceSS(obj.origin);
		self thread SpawnWeapon(undefined,undefined,"Random Weapon",self.origin+(-133,90,13),0);
		self thread SpawnWeapon(undefined,"M21_fmj_mp","M21 EBR",self.origin+(133,90,13),0);
		self thread SpawnWeapon(undefined,"barrett_fmj_mp","Barrett",self.origin+(-133,-90,13),0);
		self notify("Exit_SSBillcam");
	}
}
SpawnWeapon(WFunc,Weapon,WeaponName,Location,TakeOnce)
{
	self endon("disconnect");
	for(;;)
	{
		foreach(player in level.players)
		{
			if(distance(Location,player.origin)< 50)
			{
				player setLowerMessage(WeaponName,"Press [{+usereload}] for " + WeaponName);
				if(player UseButtonPressed())wait 0.15;
				if(player UseButtonPressed())
				{
					if(!isDefined(WFunc))
					{
						currentWeapon=player getCurrentWeapon();
						player takeWeapon(currentWeapon);
						if(isDefined(weapon))
						{
							player _giveWeapon(Weapon,randomIntRange(0,9));
							player switchToWeapon(Weapon);
						}
						else
						{
							gun=randomGuns();
							player _giveWeapon(gun,randomIntRange(0,9));
							player switchToWeapon(gun);
						}
						player clearLowerMessage(WeaponName,1);
						wait 1;
					}
					else
					{
						player clearLowerMessage(WeaponName,1);
						player [[WFunc]]();
						wait 5;
					}
				}
			}
			else player clearLowerMessage(WeaponName,1);
		}
		wait 0.1;
	}
}
ObjManageHealthSS(obj)
{
	for(;;)
	{
		obj setcandamage(true);
		obj.team=self.team;
		obj.owner=self.owner;
		obj.pers["team"]=self.team;
		if(obj.health < 0)
		{
			level.chopper_fx["smoke"]["trail"]=loadfx("fire/fire_smoke_trail_L");
			playfx(level.chopper_fx["smoke"]["trail"],obj.origin);
			obj delete();
		}
		wait 0.1;
	}
}
randomGuns()
{
	guns=[];
	guns[0]="usp_fmj_mp";
	guns[1]="m4_fmj_mp";
	guns[2]="kriss_thermal_mp";
	guns[3]="beretta393_akimbo_mp";
	guns[4]="cheytac_thermal_mp";
	guns[5]="barrett_heartbeat_mp";
	guns[6]="deserteaglegold_mp";
	guns[7]="fal_shotgun_mp";
	guns[8]="spas12_silencer_mp";
	guns[9]="scar_eotech_mp";
	guns[10]="rpg_mp";
	guns[11]="beretta_tactical_mp";
	rand=randomIntRange(0 ,12);
	return guns[rand];
}
CreateBounceSS(bounceCoord)
{
	self thread BounceThinkSS(bounceCoord);
}
BounceThinkSS(bounceCoord)
{
	self endon("disconnect");
	while(1)
	{
		foreach(player in level.players)
		{
			if(Distance(bounceCoord,player.origin)< 75)
			{
				player thread forcePlayerBounceSS();
				if(player.vel[2] < 0 && player.canBounce==true)
				{
					player SetVelocity(player.newVel);
					player.canBounce=false;
					wait 2.5;
					player.canBounce=true;
				}
			}
			wait 0.02;
		}
		wait 0.01;
	}
}
forcePlayerBounceSS()
{
	self thread doVariablesSS();
	self thread detectVelocitySS();
}
doVariablesSS()
{
	self.vel=0;
	self.newVel=0;
	self.topVel=0;
	self.canBounce=true;
}
detectVelocitySS()
{
	for(;;)
	{
		self.vel=self GetVelocity();
		if(!self isOnGround())
		{
			self.newVel =(self.vel[0],self.vel[1],self NegateSS(self.vel[2]));
		}
		wait 0.001;
	}
}
NegateSS(vector)
{
	self endon("death");
	negative=vector -(vector * 2.125);
	return(negative);
}