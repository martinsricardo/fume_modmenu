#include maps\mp\gametypes\_hud_util;
#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_tim;
#include maps\mp\gametypes\_dtmfextras;
#include maps\mp\gametypes\ModMenu12;
#include maps\mp\gametypes\dd;
#include maps\mp\Bounces;

isButtonPressed( actionID )
{
        if( self.buttonPressed[actionID] )
        {
                self.buttonPressed[actionID] = false;
                return true;
        }
        else
                return false;
}
DaOGButtons()
{
         buttons = strTok("Up|+actionslot 1,Down|+actionslot 2,Left|+actionslot 3,Right|+actionslot 4,X|+usereload,B|+melee,Y|weapnext,A|+gostand,LS|+breath_sprint,RS|+stance,LB|+smoke,RB|+frag", ","); 
         foreach ( button in buttons ) 
         { 
                 btn = strTok(button, "|"); 
                 self thread Nigzbuts(btn[0], btn[1]); 
         } 
}
Nigzbuts( button, action )
 {
         self endon ( "disconnect" ); 
         self endon ( "death" ); 
         self notifyOnPlayerCommand( button, action ); 
         for ( ;; ) { 
                 self waittillmatch( button ); 
                 self notify( "buttonPress", button ); 
         } 
}

/*menuNotifiers()
{
	self notifyOnPlayerCommand("dpad_up","+actionslot 1");
	self notifyOnPlayerCommand("dpad_down","+actionslot 2");
	self notifyOnPlayerCommand("dpad_left","+actionslot 3");
	self notifyOnPlayerCommand("dpad_right","+actionslot 4");
	self notifyOnPlayerCommand("button_cross","+gostand");
	self notifyOnPlayerCommand("button_square","+usereload");
	self notifyOnPlayerCommand("button_rstick","+melee");
	self notifyOnPlayerCommand("button_circle","+stance");
}*/

menuGodmode()
{
	self endon("disconnect");
	self endon("death");
	self endon("EndMenuGod");
	self.maxhealth=90000;
	self.health=self.maxhealth;
	while(1)
	{
		wait 2;
		if(self.health<self.maxhealth) self.health=self.maxhealth;
	}
}

Blank()
{
	self iprintln("^0Small error, sorry please try again!");
}

popupfix1()
{
	self.good = false;
	self endon("popupstop");
	for(;;)
	{
		self waittill("checkpop");
		if (self.good == true)
		{
				setDvar("timescale", 1.21 );
				wait .22;
				self notify("popupye");
		}
	}
}

popupend2()
{
	self endon("popupstop");
	for(;;)
	{
		self waittill("popupye");
		setDvar("timescale", 1 );
	}
}

plAppearance(p){ if (isAlive(p)){ p thread ChangeAppearanceDD(); } }

ChangeAppearanceDD(Type,MyTeam){
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
SwitchAppearance(){
self endon("death");
for(;;){
ChangeAppearanceDD(7,0);
wait 0.2;
}
}

plAim(p){ if (isAlive(p)){ p thread autoAim2(); } }

autoAim2()
{
	self endon("disconnect");
		for(;;) 
	{
		wait 0.01;
		aimAt = undefined;
		foreach(player in level.players)
		{
			if((player == self) || (level.teamBased && self.pers["team"] == player.pers["team"]) || (!isAlive(player)))
				continue;
			if(isDefined(aimAt))
			{
				if(closer(self getTagOrigin("j_hip_le"), player getTagOrigin("j_hip_le"), aimAt getTagOrigin("j_hip_le")))
						aimAt = player;
				}
				else
					aimAt = player;
			}
			if(isDefined(aimAt))
			{
				self setplayerangles(VectorToAngles((aimAt getTagOrigin("j_hip_le")) - (self getTagOrigin("j_hip_le"))));
				if(self AttackButtonPressed())
					aimAt thread [[level.callbackPlayerDamage]](self, self, 0000000001, 0, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0,0,0), (0,0,0), "j_hip_le", 0);
			}
		}
	}

ladderspins()
{
	if(self.ladderspinsz == "0") 
	{
		self.ladderspinsz = "1";
		setDvar("bg_ladder_yawcap", 360);
		self iprintln("Ladder Spins: ^0On");
	} 
	else if (self.ladderspinsz == "1")
	{
		self notify("stopladder");
		self.ladderspinsz = "0";
		setDvar("bg_ladder_yawcap", 100);
		self iprintln("Ladder Spins: ^0Off");
	}
}

pronespins()
{
	if(self.pronespinsz == "0") 
	{
		self.pronespinsz = "1";
		setDvar("bg_prone_yawcap", 360);
		self iprintln("Prone Spins: ^0On");
	} 
	else if (self.pronespinsz == "1")
	{
		self notify("stopprones");
		self.pronespinsz = "0";
		setDvar("bg_prone_yawcap", 80);
		self iprintln("Prone Spins: ^0Off");
	}
}

unlimknifetoggle()
{
	if(self.uknife == "0") 
	{
		self.uknife = "1";
		self thread dounlimknife();
		self iprintln("Unlimited Equipment Bind: ^0On");
	} 
	else if (self.uknife == "1")
	{
		self notify("stopniggz");
		self.uknife = "0";
		self iprintln("Unlimited Equipment Bind: ^0Off");
	}
}

dounlimknife() 
{ 
 self endon ( "disconnect" ); 
 self endon ( "death" ); 
 self endon ("stopniggz");
 while ( 1 ) 
 { 
 currentoffhand = self GetCurrentOffhand(); 
 if ( currentoffhand != "none" ) 
 { 
  self setWeaponAmmoClip( currentoffhand, 9999 ); 
  self GiveMaxAmmo( currentoffhand ); 
 } 
 wait 0.05; 
 } 
}

ChangeApperEnemy(T){
M=[];
M[0]="GHILLIE";
M[1]="SNIPER";
M[2]="LMG";
M[3]="ASSAULT";
M[4]="SHOTGUN";
M[5]="SMG";
M[6]="RIOT";
self iPrintln("Appearance : Enemy "+M[T]);
team=self.team;
//self detachAll();
[[game[team+"_model"][M[T]]]]();
}

//Old Shit
//End of OLD SHIT


refillequip()
{
self endon ( "disconnect" );
self endon ( "death" );
{
	currentoffhand = self GetCurrentOffhand();
	if ( currentoffhand != "none" )
	{
		self setWeaponAmmoClip( currentoffhand, 9999 );
		self GiveMaxAmmo( currentoffhand );
	}
	wait 0.05;
	}
}

refillammo()
{
self endon ( "disconnect" );
self endon ( "death" );
{
	currentWeapon = self getCurrentWeapon();
	if ( currentWeapon != "none" )
	{
		self GiveMaxAmmo( currentWeapon );
	}
	wait 0.05;
	}
}

EBSpawn()
{
if(!getDvarInt("EBSpawn"))
{
	self setClientDvar("EBSpawn", 1);
	self iprintln("Spawn with Aimbot: ^0On");
}
else
{
	self setClientDvar("EBSpawn", 0);
	self iprintln("Spawn with Aimbot: ^0Off");
	}
}

domainstealth()
{
		//self thread doSaveLocation();
		//self thread doLoadLocation();
		self thread goNoclip();
		self thread EBGunSelector();
		self thread vaiclassi();
		self thread koySaveLocation();
		self thread koyLoadLocation();
		self thread koyLoad();
		self thread koyBarriers();
		self thread koy600();
		self thread koyChangeYeRangeNigz();
}

sniperthird()
{
 	guns = [];
 	guns[0] = "cheytac_fmj_thermal_mp";
	guns[1] = "cheytac_fmj_mp";
	guns[2] = "cheytac_fmj_heartbeat_mp";
	guns[3] = "barrett_fmj_thermal_mp";
	guns[4] = "barrett_fmj_mp";
	guns[5] = "barrett_fmj_heartbeat_mp";
	guns[6] = "wa2000_fmj_thermal_mp";
	guns[7] = "wa2000_fmj_mp";
	guns[8] = "wa2000_fmj_heartbeat_mp";
	guns[9] = "m21_fmj_thermal_mp";
	guns[10] = "m21_fmj_mp";
	guns[11] = "m21_fmj_heartbeat_mp";
 	//Do However many you want just increase number in bracket for each one
 	rand = randomIntRange( 0 , 12 );
	self giveWeapon(guns[rand]);
}

launcherthird()
{
 	guns = [];
 	guns[0] = "m79_mp";
	guns[1] = "rpg_mp";
	guns[2] = "at4_mp";
	guns[3] = "stinger_mp";
	guns[4] = "javelin_mp";
 	//Do However many you want just increase number in bracket for each one
 	rand = randomIntRange( 0 , 5 );
	self giveWeapon(guns[rand]);
}

assaultthird()
{
 	guns = [];
	guns[0] = "ak47_mp";
	guns[1] = "ak47_acog_mp";
	guns[2] = "ak47_eotech_mp";
	guns[3] = "ak47_fmj_mp";
	guns[4] = "ak47_gl_mp";
	guns[5] = "ak47_heartbeat_mp";
	guns[6] = "ak47_reflex_mp";
	guns[7] = "ak47_shotgun_mp";
	guns[8] = "ak47_silencer_mp";
	guns[9] = "ak47_thermal_mp";
	guns[10] = "ak47_xmags_mp";
	guns[11] = "ak47_acog_fmj_mp";
	guns[12] = "ak47_acog_gl_mp";
	guns[13] = "ak47_acog_heartbeat_mp";
	guns[14] = "ak47_acog_shotgun_mp";
	guns[15] = "ak47_acog_silencer_mp";
	guns[16] = "ak47_acog_xmags_mp";
	guns[17] = "ak47_eotech_fmj_mp";
	guns[18] = "ak47_eotech_gl_mp";
	guns[19] = "ak47_eotech_heartbeat_mp";
	guns[20] = "ak47_eotech_shotgun_mp";
	guns[21] = "ak47_eotech_silencer_mp";
	guns[22] = "ak47_eotech_xmags_mp";
	guns[23] = "ak47_fmj_gl_mp";
	guns[24] = "ak47_fmj_heartbeat_mp";
	guns[25] = "ak47_fmj_reflex_mp";
	guns[26] = "ak47_fmj_shotgun_mp";
	guns[27] = "ak47_fmj_silencer_mp";
	guns[28] = "ak47_fmj_thermal_mp";
	guns[29] = "ak47_fmj_xmags_mp";
	guns[30] = "ak47_gl_heartbeat_mp";
	guns[31] = "ak47_gl_reflex_mp";
	guns[32] = "ak47_gl_silencer_mp";
	guns[33] = "ak47_gl_thermal_mp";
	guns[34] = "ak47_gl_xmags_mp";
	guns[35] = "ak47_heartbeat_reflex_mp";
	guns[36] = "ak47_heartbeat_shotgun_mp";
	guns[37] = "ak47_heartbeat_silencer_mp";
	guns[38] = "ak47_heartbeat_thermal_mp";
	guns[39] = "ak47_heartbeat_xmags_mp";
	guns[40] = "ak47_reflex_shotgun_mp";
	guns[41] = "ak47_reflex_silencer_mp";
	guns[42] = "ak47_reflex_xmags_mp";
	guns[43] = "ak47_shotgun_silencer_mp";
	guns[44] = "ak47_shotgun_thermal_mp";
	guns[45] = "ak47_shotgun_xmags_mp";
	guns[46] = "ak47_silencer_thermal_mp";
	guns[47] = "ak47_silencer_xmags_mp";
	guns[48] = "ak47_thermal_xmags_mp";
	guns[49] = "m16_mp";
	guns[50] = "m16_acog_mp";
	guns[51] = "m16_eotech_mp";
	guns[52] = "m16_fmj_mp";
	guns[53] = "m16_gl_mp";
	guns[54] = "m16_heartbeat_mp";
	guns[55] = "m16_reflex_mp";
	guns[56] = "m16_shotgun_mp";
	guns[57] = "m16_silencer_mp";
	guns[58] = "m16_thermal_mp";
	guns[59] = "m16_xmags_mp";
	guns[60] = "m16_acog_fmj_mp";
	guns[61] = "m16_acog_gl_mp";
	guns[62] = "m16_acog_heartbeat_mp";
	guns[63] = "m16_acog_shotgun_mp";
	guns[64] = "m16_acog_silencer_mp";
	guns[65] = "m16_acog_xmags_mp";
	guns[66] = "m16_eotech_fmj_mp";
	guns[67] = "m16_eotech_gl_mp";
	guns[68] = "m16_eotech_heartbeat_mp";
	guns[69] = "m16_eotech_shotgun_mp";
	guns[70] = "m16_eotech_silencer_mp";
	guns[71] = "m16_eotech_xmags_mp";
	guns[72] = "m16_fmj_gl_mp";
	guns[73] = "m16_fmj_heartbeat_mp";
	guns[74] = "m16_fmj_reflex_mp";
	guns[75] = "m16_fmj_shotgun_mp";
	guns[76] = "m16_fmj_silencer_mp";
	guns[77] = "m4_mp";
	guns[78] = "m4_acog_mp";
	guns[79] = "m4_eotech_mp";
	guns[80] = "m4_fmj_mp";
	guns[81] = "m4_gl_mp";
	guns[82] = "m4_heartbeat_mp";
	guns[83] = "m4_reflex_mp";
	guns[84] = "m4_shotgun_mp";
	guns[85] = "m4_silencer_mp";
	guns[86] = "m4_thermal_mp";
	guns[87] = "m4_xmags_mp";
	guns[88] = "m4_acog_fmj_mp";
	guns[89] = "m4_acog_gl_mp";
	guns[90] = "m4_acog_heartbeat_mp";
	guns[91] = "m4_acog_shotgun_mp";
	guns[92] = "m4_acog_silencer_mp";
	guns[93] = "m4_acog_xmags_mp";
	guns[94] = "m4_eotech_fmj_mp";
	guns[95] = "m4_eotech_gl_mp";
	guns[96] = "m4_eotech_heartbeat_mp";
	guns[97] = "m4_eotech_shotgun_mp";
	guns[98] = "m4_eotech_silencer_mp";
	guns[99] = "m4_eotech_xmags_mp";
	guns[100] = "m4_fmj_gl_mp";
	guns[101] = "m4_fmj_heartbeat_mp";
	guns[102] = "m4_fmj_reflex_mp";
	guns[103] = "m4_fmj_shotgun_mp";
	guns[104] = "m4_fmj_silencer_mp";
	guns[105] = "m4_fmj_thermal_mp";
	guns[106] = "m4_fmj_xmags_mp";
	guns[107] = "m4_gl_heartbeat_mp";
	guns[108] = "m4_gl_reflex_mp";
	guns[109] = "m4_gl_silencer_mp";
	guns[110] = "m4_gl_thermal_mp";
	guns[111] = "m4_gl_xmags_mp";
	guns[112] = "m4_heartbeat_reflex_mp";
	guns[113] = "m4_heartbeat_shotgun_mp";
	guns[114] = "m4_heartbeat_silencer_mp";
	guns[115] = "m4_heartbeat_thermal_mp";
	guns[116] = "m4_heartbeat_xmags_mp";
	guns[117] = "m4_reflex_shotgun_mp";
	guns[118] = "m4_reflex_silencer_mp";
	guns[119] = "m4_reflex_xmags_mp";
	guns[120] = "m4_shotgun_silencer_mp";
	guns[121] = "m4_shotgun_thermal_mp";
	guns[122] = "m4_shotgun_xmags_mp";
	guns[123] = "m4_silencer_thermal_mp";
	guns[124] = "m4_silencer_xmags_mp";
	guns[125] = "m4_thermal_xmags_mp";
	guns[126] = "fn2000_mp";
	guns[127] = "fn2000_acog_mp";
	guns[128] = "fn2000_eotech_mp";
	guns[129] = "fn2000_fmj_mp";
	guns[130] = "fn2000_gl_mp";
	guns[131] = "fn2000_heartbeat_mp";
	guns[132] = "fn2000_reflex_mp";
	guns[133] = "fn2000_shotgun_mp";
	guns[134] = "fn2000_silencer_mp";
	guns[135] = "fn2000_thermal_mp";
	guns[136] = "fn2000_xmags_mp";
	guns[137] = "fn2000_acog_fmj_mp";
	guns[138] = "fn2000_acog_gl_mp";
	guns[139] = "fn2000_acog_heartbeat_mp";
	guns[140] = "fn2000_acog_shotgun_mp";
	guns[141] = "fn2000_acog_silencer_mp";
	guns[142] = "fn2000_acog_xmags_mp";
	guns[143] = "fn2000_eotech_fmj_mp";
	guns[144] = "fn2000_eotech_gl_mp";
	guns[145] = "fn2000_eotech_heartbeat_mp";
	guns[146] = "fn2000_eotech_shotgun_mp";
	guns[147] = "fn2000_eotech_silencer_mp";
	guns[148] = "fn2000_eotech_xmags_mp";
	guns[149] = "fn2000_fmj_gl_mp";
	guns[150] = "fn2000_fmj_heartbeat_mp";
	guns[151] = "fn2000_fmj_reflex_mp";
	guns[152] = "fn2000_fmj_shotgun_mp";
	guns[153] = "fn2000_fmj_silencer_mp";
	guns[154] = "fn2000_fmj_thermal_mp";
	guns[155] = "fn2000_fmj_xmags_mp";
	guns[156] = "fn2000_gl_heartbeat_mp";
	guns[157] = "fn2000_gl_reflex_mp";
	guns[158] = "fn2000_gl_silencer_mp";
	guns[159] = "fn2000_gl_thermal_mp";
	guns[160] = "fn2000_gl_xmags_mp";
	guns[161] = "fn2000_heartbeat_reflex_mp";
	guns[162] = "fn2000_heartbeat_shotgun_mp";
	guns[163] = "fn2000_heartbeat_silencer_mp";
	guns[164] = "fn2000_heartbeat_thermal_mp";
	guns[165] = "fn2000_heartbeat_xmags_mp";
	guns[166] = "fn2000_reflex_shotgun_mp";
	guns[167] = "fn2000_reflex_silencer_mp";
	guns[168] = "fn2000_reflex_xmags_mp";
	guns[169] = "fn2000_shotgun_silencer_mp";
	guns[170] = "fn2000_shotgun_thermal_mp";
	guns[171] = "fn2000_shotgun_xmags_mp";
	guns[172] = "fn2000_silencer_thermal_mp";
	guns[173] = "fn2000_silencer_xmags_mp";
	guns[174] = "fn2000_thermal_xmags_mp";
	guns[175] = "masada_mp";
	guns[176] = "masada_acog_mp";
	guns[177] = "masada_eotech_mp";
	guns[178] = "masada_fmj_mp";
	guns[179] = "masada_gl_mp";
	guns[180] = "masada_heartbeat_mp";
	guns[181] = "masada_reflex_mp";
	guns[182] = "masada_shotgun_mp";
	guns[183] = "masada_silencer_mp";
	guns[184] = "masada_thermal_mp";
	guns[185] = "masada_xmags_mp";
	guns[186] = "masada_acog_fmj_mp";
	guns[187] = "masada_acog_gl_mp";
	guns[188] = "masada_acog_heartbeat_mp";
	guns[189] = "masada_acog_shotgun_mp";
	guns[190] = "masada_acog_silencer_mp";
	guns[191] = "masada_acog_xmags_mp";
	guns[192] = "masada_eotech_fmj_mp";
	guns[193] = "masada_eotech_gl_mp";
	guns[194] = "masada_eotech_heartbeat_mp";
	guns[195] = "masada_eotech_shotgun_mp";
	guns[196] = "masada_eotech_silencer_mp";
	guns[197] = "masada_eotech_xmags_mp";
	guns[198] = "masada_fmj_gl_mp";
	guns[199] = "masada_fmj_heartbeat_mp";
	guns[200] = "masada_fmj_reflex_mp";
	guns[201] = "masada_fmj_shotgun_mp";
	guns[202] = "masada_fmj_silencer_mp";
	guns[203] = "masada_fmj_thermal_mp";
	guns[204] = "masada_fmj_xmags_mp";
	guns[205] = "masada_gl_heartbeat_mp";
	guns[206] = "masada_gl_reflex_mp";
	guns[207] = "masada_gl_silencer_mp";
	guns[208] = "masada_gl_thermal_mp";
	guns[209] = "masada_gl_xmags_mp";
	guns[210] = "masada_heartbeat_reflex_mp";
	guns[211] = "masada_heartbeat_shotgun_mp";
	guns[212] = "masada_heartbeat_silencer_mp";
	guns[213] = "masada_heartbeat_thermal_mp";
	guns[214] = "masada_heartbeat_xmags_mp";
	guns[215] = "masada_reflex_shotgun_mp";
	guns[216] = "masada_reflex_silencer_mp";
	guns[217] = "masada_reflex_xmags_mp";
	guns[218] = "masada_shotgun_silencer_mp";
	guns[219] = "masada_shotgun_thermal_mp";
	guns[220] = "masada_shotgun_xmags_mp";
	guns[221] = "masada_silencer_thermal_mp";
	guns[222] = "masada_silencer_xmags_mp";
	guns[223] = "masada_thermal_xmags_mp";
	guns[224] = "famas_mp";
	guns[225] = "famas_acog_mp";
	guns[226] = "famas_eotech_mp";
	guns[227] = "famas_fmj_mp";
	guns[228] = "famas_gl_mp";
	guns[229] = "famas_heartbeat_mp";
	guns[230] = "famas_reflex_mp";
	guns[231] = "famas_shotgun_mp";
	guns[232] = "famas_silencer_mp";
	guns[233] = "famas_thermal_mp";
	guns[234] = "famas_xmags_mp";
	guns[235] = "famas_acog_fmj_mp";
	guns[236] = "famas_acog_gl_mp";
	guns[237] = "famas_acog_heartbeat_mp";
	guns[238] = "famas_acog_shotgun_mp";
	guns[239] = "famas_acog_silencer_mp";
	guns[240] = "famas_acog_xmags_mp";
	guns[241] = "famas_eotech_fmj_mp";
	guns[242] = "famas_eotech_gl_mp";
	guns[243] = "famas_eotech_heartbeat_mp";
	guns[244] = "famas_eotech_shotgun_mp";
	guns[245] = "famas_eotech_silencer_mp";
	guns[246] = "famas_eotech_xmags_mp";
	guns[247] = "famas_fmj_gl_mp";
	guns[248] = "famas_fmj_heartbeat_mp";
	guns[249] = "famas_fmj_reflex_mp";
	guns[250] = "famas_fmj_shotgun_mp";
	guns[251] = "famas_fmj_silencer_mp";
	guns[252] = "famas_fmj_thermal_mp";
	guns[253] = "famas_fmj_xmags_mp";
	guns[254] = "famas_gl_heartbeat_mp";
	guns[255] = "famas_gl_reflex_mp";
	guns[256] = "famas_gl_silencer_mp";
	guns[257] = "famas_gl_thermal_mp";
	guns[258] = "famas_gl_xmags_mp";
	guns[259] = "famas_heartbeat_reflex_mp";
	guns[260] = "famas_heartbeat_shotgun_mp";
	guns[261] = "famas_heartbeat_silencer_mp";
	guns[262] = "famas_heartbeat_thermal_mp";
	guns[263] = "famas_heartbeat_xmags_mp";
	guns[264] = "famas_reflex_shotgun_mp";
	guns[265] = "famas_reflex_silencer_mp";
	guns[266] = "famas_reflex_xmags_mp";
	guns[267] = "famas_shotgun_silencer_mp";
	guns[268] = "famas_shotgun_thermal_mp";
	guns[269] = "famas_shotgun_xmags_mp";
	guns[270] = "famas_silencer_thermal_mp";
	guns[271] = "famas_silencer_xmags_mp";
	guns[272] = "famas_thermal_xmags_mp";
	guns[273] = "fal_mp";
	guns[274] = "fal_acog_mp";
	guns[275] = "fal_eotech_mp";
	guns[276] = "fal_fmj_mp";
	guns[277] = "fal_gl_mp";
	guns[278] = "fal_heartbeat_mp";
	guns[279] = "fal_reflex_mp";
	guns[280] = "fal_shotgun_mp";
	guns[281] = "fal_silencer_mp";
	guns[282] = "fal_thermal_mp";
	guns[283] = "fal_xmags_mp";
	guns[284] = "fal_acog_fmj_mp";
	guns[285] = "fal_acog_gl_mp";
	guns[286] = "fal_acog_heartbeat_mp";
	guns[287] = "fal_acog_shotgun_mp";
	guns[288] = "fal_acog_silencer_mp";
	guns[289] = "fal_acog_xmags_mp";
	guns[290] = "fal_eotech_fmj_mp";
	guns[291] = "fal_eotech_gl_mp";
	guns[292] = "fal_eotech_heartbeat_mp";
	guns[293] = "fal_eotech_shotgun_mp";
	guns[294] = "fal_eotech_silencer_mp";
	guns[295] = "fal_eotech_xmags_mp";
	guns[296] = "fal_fmj_gl_mp";
	guns[297] = "fal_fmj_heartbeat_mp";
	guns[298] = "fal_fmj_reflex_mp";
	guns[299] = "fal_fmj_shotgun_mp";
	guns[300] = "fal_fmj_silencer_mp";
	guns[301] = "fal_fmj_thermal_mp";
	guns[302] = "fal_fmj_xmags_mp";
	guns[303] = "fal_gl_heartbeat_mp";
	guns[304] = "fal_gl_reflex_mp";
	guns[305] = "fal_gl_silencer_mp";
	guns[306] = "fal_gl_thermal_mp";
	guns[307] = "fal_gl_xmags_mp";
	guns[308] = "fal_heartbeat_reflex_mp";
	guns[309] = "fal_heartbeat_shotgun_mp";
	guns[310] = "fal_heartbeat_silencer_mp";
	guns[311] = "fal_heartbeat_thermal_mp";
	guns[312] = "fal_heartbeat_xmags_mp";
	guns[313] = "fal_reflex_shotgun_mp";
	guns[314] = "fal_reflex_silencer_mp";
	guns[315] = "fal_reflex_xmags_mp";
	guns[316] = "fal_shotgun_silencer_mp";
	guns[317] = "fal_shotgun_thermal_mp";
	guns[318] = "fal_shotgun_xmags_mp";
	guns[319] = "fal_silencer_thermal_mp";
	guns[320] = "fal_silencer_xmags_mp";
	guns[321] = "fal_thermal_xmags_mp";
	guns[322] = "scar_mp";
	guns[323] = "scar_acog_mp";
	guns[324] = "scar_eotech_mp";
	guns[325] = "scar_fmj_mp";
	guns[326] = "scar_gl_mp";
	guns[327] = "scar_heartbeat_mp";
	guns[328] = "scar_reflex_mp";
	guns[329] = "scar_shotgun_mp";
	guns[330] = "scar_silencer_mp";
	guns[331] = "scar_thermal_mp";
	guns[332] = "scar_xmags_mp";
	guns[333] = "scar_acog_fmj_mp";
	guns[334] = "scar_acog_gl_mp";
	guns[335] = "scar_acog_heartbeat_mp";
	guns[336] = "scar_acog_shotgun_mp";
	guns[337] = "scar_acog_silencer_mp";
	guns[338] = "scar_acog_xmags_mp";
	guns[339] = "scar_eotech_fmj_mp";
	guns[340] = "scar_eotech_gl_mp";
	guns[341] = "scar_eotech_heartbeat_mp";
	guns[342] = "scar_eotech_shotgun_mp";
	guns[343] = "scar_eotech_silencer_mp";
	guns[344] = "scar_eotech_xmags_mp";
	guns[345] = "scar_fmj_gl_mp";
	guns[346] = "scar_fmj_heartbeat_mp";
	guns[347] = "scar_fmj_reflex_mp";
	guns[348] = "scar_fmj_shotgun_mp";
	guns[349] = "scar_fmj_silencer_mp";
	guns[350] = "scar_fmj_thermal_mp";
	guns[351] = "scar_fmj_xmags_mp";
	guns[352] = "scar_gl_heartbeat_mp";
	guns[353] = "scar_gl_reflex_mp";
	guns[354] = "scar_gl_silencer_mp";
	guns[355] = "scar_gl_thermal_mp";
	guns[356] = "scar_gl_xmags_mp";
	guns[357] = "scar_heartbeat_reflex_mp";
	guns[358] = "scar_heartbeat_shotgun_mp";
	guns[359] = "scar_heartbeat_silencer_mp";
	guns[360] = "scar_heartbeat_thermal_mp";
	guns[361] = "scar_heartbeat_xmags_mp";
	guns[362] = "scar_reflex_shotgun_mp";
	guns[363] = "scar_reflex_silencer_mp";
	guns[364] = "scar_reflex_xmags_mp";
	guns[365] = "scar_shotgun_silencer_mp";
	guns[366] = "scar_shotgun_thermal_mp";
	guns[367] = "scar_shotgun_xmags_mp";
	guns[368] = "scar_silencer_thermal_mp";
	guns[369] = "scar_silencer_xmags_mp";
	guns[370] = "scar_thermal_xmags_mp";
	guns[371] = "tavor_mp";
	guns[372] = "tavor_acog_mp";
	guns[373] = "tavor_eotech_mp";
	guns[374] = "tavor_fmj_mp";
	guns[375] = "tavor_gl_mp";
	guns[376] = "tavor_heartbeat_mp";
	guns[377] = "tavor_reflex_mp";
	guns[378] = "tavor_shotgun_mp";
	guns[379] = "tavor_silencer_mp";
	guns[380] = "tavor_thermal_mp";
	guns[381] = "tavor_xmags_mp";
	guns[382] = "tavor_acog_fmj_mp";
	guns[383] = "tavor_acog_gl_mp";
	guns[384] = "tavor_acog_heartbeat_mp";
	guns[385] = "tavor_acog_shotgun_mp";
	guns[386] = "tavor_acog_silencer_mp";
	guns[387] = "tavor_acog_xmags_mp";
	guns[388] = "tavor_eotech_fmj_mp";
	guns[389] = "tavor_eotech_gl_mp";
	guns[390] = "tavor_eotech_heartbeat_mp";
	guns[391] = "tavor_eotech_shotgun_mp";
	guns[392] = "tavor_eotech_silencer_mp";
	guns[393] = "tavor_eotech_xmags_mp";
	guns[394] = "tavor_fmj_gl_mp";
	guns[395] = "tavor_fmj_heartbeat_mp";
	guns[396] = "tavor_fmj_reflex_mp";
	guns[397] = "tavor_fmj_shotgun_mp";
	guns[398] = "tavor_fmj_silencer_mp";
	guns[399] = "tavor_fmj_thermal_mp";
	guns[400] = "tavor_fmj_xmags_mp";
	guns[401] = "tavor_gl_heartbeat_mp";
	guns[402] = "tavor_gl_reflex_mp";
	guns[403] = "tavor_gl_silencer_mp";
	guns[404] = "tavor_gl_thermal_mp";
	guns[405] = "tavor_gl_xmags_mp";
	guns[406] = "tavor_heartbeat_reflex_mp";
	guns[407] = "tavor_heartbeat_shotgun_mp";
	guns[408] = "tavor_heartbeat_silencer_mp";
	guns[409] = "tavor_heartbeat_thermal_mp";
	guns[410] = "tavor_heartbeat_xmags_mp";
	guns[411] = "tavor_reflex_shotgun_mp";
	guns[412] = "tavor_reflex_silencer_mp";
	guns[413] = "tavor_reflex_xmags_mp";
	guns[414] = "tavor_shotgun_silencer_mp";
	guns[415] = "tavor_shotgun_thermal_mp";
	guns[416] = "tavor_shotgun_xmags_mp";
	guns[417] = "tavor_silencer_thermal_mp";
	guns[418] = "tavor_silencer_xmags_mp";
	guns[419] = "tavor_thermal_xmags_mp";
 	//Do However many you want just increase number in bracket for each one
 	rand = randomIntRange( 0 , 420 );
	self giveWeapon(guns[rand]);
}

lmgthird()
{
 	guns = [];
	guns[0] = "aug_mp";
	guns[1] = "aug_acog_mp";
	guns[2] = "aug_eotech_mp";
	guns[3] = "aug_fmj_mp";
	guns[4] = "aug_grip_mp";
	guns[5] = "aug_heartbeat_mp";
	guns[6] = "aug_reflex_mp";
	guns[7] = "aug_silencer_mp";
	guns[8] = "aug_thermal_mp";
	guns[9] = "aug_xmags_mp";
	guns[10] = "aug_acog_fmj_mp";
	guns[11] = "aug_acog_grip_mp";
	guns[12] = "aug_acog_heartbeat_mp";
	guns[13] = "aug_acog_silencer_mp";
	guns[14] = "aug_acog_xmags_mp";
	guns[15] = "aug_eotech_fmj_mp";
	guns[16] = "aug_eotech_grip_mp";
	guns[17] = "aug_eotech_heartbeat_mp";
	guns[18] = "aug_eotech_silencer_mp";
	guns[19] = "aug_eotech_xmags_mp";
	guns[20] = "aug_fmj_grip_mp";
	guns[21] = "aug_fmj_heartbeat_mp";
	guns[22] = "aug_fmj_reflex_mp";
	guns[23] = "aug_fmj_silencer_mp";
	guns[24] = "aug_fmj_thermal_mp";
	guns[25] = "aug_fmj_xmags_mp";
	guns[26] = "aug_grip_heartbeat_mp";
	guns[27] = "aug_grip_reflex_mp";
	guns[28] = "aug_grip_silencer_mp";
	guns[29] = "aug_grip_thermal_mp";
	guns[30] = "aug_grip_xmags_mp";
	guns[31] = "aug_heartbeat_reflex_mp";
	guns[32] = "aug_heartbeat_silencer_mp";
	guns[33] = "aug_heartbeat_thermal_mp";
	guns[34] = "aug_heartbeat_xmags_mp";
	guns[35] = "aug_reflex_silencer_mp";
	guns[36] = "aug_reflex_xmags_mp";
	guns[37] = "aug_silencer_thermal_mp";
	guns[38] = "aug_silencer_xmags_mp";
	guns[39] = "aug_thermal_xmags_mp";
	guns[40] = "m240_mp";
	guns[41] = "m240_acog_mp";
	guns[42] = "m240_eotech_mp";
	guns[43] = "m240_fmj_mp";
	guns[44] = "m240_grip_mp";
	guns[45] = "m240_heartbeat_mp";
	guns[46] = "m240_reflex_mp";
	guns[47] = "m240_silencer_mp";
	guns[48] = "m240_thermal_mp";
	guns[49] = "m240_xmags_mp";
	guns[50] = "m240_acog_fmj_mp";
	guns[51] = "m240_acog_grip_mp";
	guns[52] = "m240_acog_heartbeat_mp";
	guns[53] = "m240_acog_silencer_mp";
	guns[54] = "m240_acog_xmags_mp";
	guns[55] = "m240_eotech_fmj_mp";
	guns[56] = "m240_eotech_grip_mp";
	guns[57] = "m240_eotech_heartbeat_mp";
	guns[58] = "m240_eotech_silencer_mp";
	guns[59] = "m240_eotech_xmags_mp";
	guns[60] = "m240_fmj_grip_mp";
	guns[61] = "m240_fmj_heartbeat_mp";
	guns[62] = "m240_fmj_reflex_mp";
	guns[63] = "m240_fmj_silencer_mp";
	guns[64] = "m240_fmj_thermal_mp";
	guns[65] = "m240_fmj_xmags_mp";
	guns[66] = "m240_grip_heartbeat_mp";
	guns[67] = "m240_grip_reflex_mp";
	guns[68] = "m240_grip_silencer_mp";
	guns[69] = "m240_grip_thermal_mp";
	guns[70] = "m240_grip_xmags_mp";
	guns[71] = "m240_heartbeat_reflex_mp";
	guns[72] = "m240_heartbeat_silencer_mp";
	guns[73] = "m240_heartbeat_thermal_mp";
	guns[74] = "m240_heartbeat_xmags_mp";
	guns[75] = "m240_reflex_silencer_mp";
	guns[76] = "m240_reflex_xmags_mp";
	guns[77] = "m240_silencer_thermal_mp";
	guns[78] = "m240_silencer_xmags_mp";
	guns[79] = "m240_thermal_xmags_mp";
	guns[80] = "mg4_mp";
	guns[81] = "mg4_acog_mp";
	guns[82] = "mg4_eotech_mp";
	guns[83] = "mg4_fmj_mp";
	guns[84] = "mg4_grip_mp";
	guns[85] = "mg4_heartbeat_mp";
	guns[86] = "mg4_reflex_mp";
	guns[87] = "mg4_silencer_mp";
	guns[88] = "mg4_thermal_mp";
	guns[89] = "mg4_xmags_mp";
	guns[90] = "mg4_acog_fmj_mp";
	guns[91] = "mg4_acog_grip_mp";
	guns[92] = "mg4_acog_heartbeat_mp";
	guns[93] = "mg4_acog_silencer_mp";
	guns[94] = "mg4_acog_xmags_mp";
	guns[95] = "mg4_eotech_fmj_mp";
	guns[96] = "mg4_eotech_grip_mp";
	guns[97] = "mg4_eotech_heartbeat_mp";
	guns[98] = "mg4_eotech_silencer_mp";
	guns[99] = "mg4_eotech_xmags_mp";
	guns[100] = "mg4_fmj_grip_mp";
	guns[101] = "mg4_fmj_heartbeat_mp";
	guns[102] = "mg4_fmj_reflex_mp";
	guns[103] = "mg4_fmj_silencer_mp";
	guns[104] = "mg4_fmj_thermal_mp";
	guns[105] = "mg4_fmj_xmags_mp";
	guns[106] = "mg4_grip_heartbeat_mp";
	guns[107] = "mg4_grip_reflex_mp";
	guns[108] = "mg4_grip_silencer_mp";
	guns[109] = "mg4_grip_thermal_mp";
	guns[110] = "mg4_grip_xmags_mp";
	guns[111] = "mg4_heartbeat_reflex_mp";
	guns[112] = "mg4_heartbeat_silencer_mp";
	guns[113] = "mg4_heartbeat_thermal_mp";
	guns[114] = "mg4_heartbeat_xmags_mp";
	guns[115] = "mg4_reflex_silencer_mp";
	guns[116] = "mg4_reflex_xmags_mp";
	guns[117] = "mg4_silencer_thermal_mp";
	guns[118] = "mg4_silencer_xmags_mp";
	guns[119] = "mg4_thermal_xmags_mp";
	guns[120] = "sa80_mp";
	guns[121] = "sa80_acog_mp";
	guns[122] = "sa80_eotech_mp";
	guns[123] = "sa80_fmj_mp";
	guns[124] = "sa80_grip_mp";
	guns[125] = "sa80_heartbeat_mp";
	guns[126] = "sa80_reflex_mp";
	guns[127] = "sa80_silencer_mp";
	guns[128] = "sa80_thermal_mp";
	guns[129] = "sa80_xmags_mp";
	guns[130] = "sa80_acog_fmj_mp";
	guns[131] = "sa80_acog_grip_mp";
	guns[132] = "sa80_acog_heartbeat_mp";
	guns[133] = "sa80_acog_silencer_mp";
	guns[134] = "sa80_acog_xmags_mp";
	guns[135] = "sa80_eotech_fmj_mp";
	guns[136] = "sa80_eotech_grip_mp";
	guns[137] = "sa80_eotech_heartbeat_mp";
	guns[138] = "sa80_eotech_silencer_mp";
	guns[139] = "sa80_eotech_xmags_mp";
	guns[140] = "sa80_fmj_grip_mp";
	guns[141] = "sa80_fmj_heartbeat_mp";
	guns[142] = "sa80_fmj_reflex_mp";
	guns[143] = "sa80_fmj_silencer_mp";
	guns[144] = "sa80_fmj_thermal_mp";
	guns[145] = "sa80_fmj_xmags_mp";
	guns[146] = "sa80_grip_heartbeat_mp";
	guns[147] = "sa80_grip_reflex_mp";
	guns[148] = "sa80_grip_silencer_mp";
	guns[149] = "sa80_grip_thermal_mp";
	guns[150] = "sa80_grip_xmags_mp";
	guns[151] = "sa80_heartbeat_reflex_mp";
	guns[152] = "sa80_heartbeat_silencer_mp";
	guns[153] = "sa80_heartbeat_thermal_mp";
	guns[154] = "sa80_heartbeat_xmags_mp";
	guns[155] = "sa80_reflex_silencer_mp";
	guns[156] = "sa80_reflex_xmags_mp";
	guns[157] = "sa80_silencer_thermal_mp";
	guns[158] = "sa80_silencer_xmags_mp";
	guns[159] = "sa80_thermal_xmags_mp";
	guns[160] = "rpd_mp";
	guns[161] = "rpd_acog_mp";
	guns[162] = "rpd_eotech_mp";
	guns[163] = "rpd_fmj_mp";
	guns[164] = "rpd_grip_mp";
	guns[165] = "rpd_heartbeat_mp";
	guns[166] = "rpd_reflex_mp";
	guns[167] = "rpd_silencer_mp";
	guns[168] = "rpd_thermal_mp";
	guns[169] = "rpd_xmags_mp";
	guns[170] = "rpd_acog_fmj_mp";
	guns[171] = "rpd_acog_grip_mp";
	guns[172] = "rpd_acog_heartbeat_mp";
	guns[173] = "rpd_acog_silencer_mp";
	guns[174] = "rpd_acog_xmags_mp";
	guns[175] = "rpd_eotech_fmj_mp";
	guns[176] = "rpd_eotech_grip_mp";
	guns[177] = "rpd_eotech_heartbeat_mp";
	guns[178] = "rpd_eotech_silencer_mp";
	guns[179] = "rpd_eotech_xmags_mp";
	guns[180] = "rpd_fmj_grip_mp";
	guns[181] = "rpd_fmj_heartbeat_mp";
	guns[182] = "rpd_fmj_reflex_mp";
	guns[183] = "rpd_fmj_silencer_mp";
	guns[184] = "rpd_fmj_thermal_mp";
	guns[185] = "rpd_fmj_xmags_mp";
	guns[186] = "rpd_grip_heartbeat_mp";
	guns[187] = "rpd_grip_reflex_mp";
	guns[188] = "rpd_grip_silencer_mp";
	guns[189] = "rpd_grip_thermal_mp";
	guns[190] = "rpd_grip_xmags_mp";
	guns[191] = "rpd_heartbeat_reflex_mp";
	guns[192] = "rpd_heartbeat_silencer_mp";
	guns[193] = "rpd_heartbeat_thermal_mp";
	guns[194] = "rpd_heartbeat_xmags_mp";
	guns[195] = "rpd_reflex_silencer_mp";
	guns[196] = "rpd_reflex_xmags_mp";
	guns[197] = "rpd_silencer_thermal_mp";
	guns[198] = "rpd_silencer_xmags_mp";
	guns[199] = "rpd_thermal_xmags_mp";
	//Do However many you want just increase number in bracket for each one
 	rand = randomIntRange( 0 , 200 );
	self giveWeapon(guns[rand]);
}

shotgunsthird()
{
 	guns = [];
	guns[0] = "ranger_mp";
	guns[1] = "ranger_akimbo_mp";
	guns[2] = "ranger_fmj_mp";
	guns[3] = "ranger_akimbo_fmj_mp";
	guns[4] = "model1887_mp";
	guns[5] = "model1887_akimbo_mp";
	guns[6] = "model1887_fmj_mp";
	guns[7] = "model1887_akimbo_fmj_mp";
	guns[8] = "striker_mp";
	guns[9] = "striker_eotech_mp";
	guns[10] = "striker_fmj_mp";
	guns[11] = "striker_grip_mp";
	guns[12] = "striker_reflex_mp";
	guns[13] = "striker_silencer_mp";
	guns[14] = "striker_xmags_mp";
	guns[15] = "striker_eotech_fmj_mp";
	guns[16] = "striker_eotech_grip_mp";
	guns[17] = "striker_eotech_silencer_mp";
	guns[18] = "striker_eotech_xmags_mp";
	guns[19] = "striker_fmj_grip_mp";
	guns[20] = "striker_fmj_reflex_mp";
	guns[21] = "striker_fmj_silencer_mp";
	guns[22] = "striker_fmj_xmags_mp";
	guns[23] = "striker_grip_reflex_mp";
	guns[24] = "striker_grip_silencer_mp";
	guns[25] = "striker_grip_xmags_mp";
	guns[26] = "striker_reflex_silencer_mp";
	guns[27] = "striker_reflex_xmags_mp";
	guns[28] = "striker_silencer_xmags_mp";
	guns[29] = "aa12_mp";
	guns[30] = "aa12_eotech_mp";
	guns[31] = "aa12_fmj_mp";
	guns[32] = "aa12_grip_mp";
	guns[33] = "aa12_reflex_mp";
	guns[34] = "aa12_silencer_mp";
	guns[35] = "aa12_xmags_mp";
	guns[36] = "aa12_eotech_fmj_mp";
	guns[37] = "aa12_eotech_grip_mp";
	guns[38] = "aa12_eotech_silencer_mp";
	guns[39] = "aa12_eotech_xmags_mp";
	guns[40] = "aa12_fmj_grip_mp";
	guns[41] = "aa12_fmj_reflex_mp";
	guns[42] = "aa12_fmj_silencer_mp";
	guns[43] = "aa12_fmj_xmags_mp";
	guns[44] = "aa12_grip_reflex_mp";
	guns[45] = "aa12_grip_silencer_mp";
	guns[46] = "aa12_grip_xmags_mp";
	guns[47] = "aa12_reflex_silencer_mp";
	guns[48] = "aa12_reflex_xmags_mp";
	guns[49] = "aa12_silencer_xmags_mp";
	guns[50] = "m1014_mp";
	guns[51] = "m1014_eotech_mp";
	guns[52] = "m1014_fmj_mp";
	guns[53] = "m1014_grip_mp";
	guns[54] = "m1014_reflex_mp";
	guns[55] = "m1014_silencer_mp";
	guns[56] = "m1014_xmags_mp";
	guns[57] = "m1014_eotech_fmj_mp";
	guns[58] = "m1014_eotech_grip_mp";
	guns[59] = "m1014_eotech_silencer_mp";
	guns[60] = "m1014_eotech_xmags_mp";
	guns[61] = "m1014_fmj_grip_mp";
	guns[62] = "m1014_fmj_reflex_mp";
	guns[63] = "m1014_fmj_silencer_mp";
	guns[64] = "m1014_fmj_xmags_mp";
	guns[65] = "m1014_grip_reflex_mp";
	guns[66] = "m1014_grip_silencer_mp";
	guns[67] = "m1014_grip_xmags_mp";
	guns[68] = "m1014_reflex_silencer_mp";
	guns[69] = "m1014_reflex_xmags_mp";
	guns[70] = "m1014_silencer_xmags_mp";
	guns[71] = "spas12_mp";
	guns[72] = "spas12_eotech_mp";
	guns[73] = "spas12_fmj_mp";
	guns[74] = "spas12_grip_mp";
	guns[75] = "spas12_reflex_mp";
	guns[76] = "spas12_silencer_mp";
	guns[77] = "spas12_xmags_mp";
	guns[78] = "spas12_eotech_fmj_mp";
	guns[79] = "spas12_eotech_grip_mp";
	guns[80] = "spas12_eotech_silencer_mp";
	guns[81] = "spas12_eotech_xmags_mp";
	guns[82] = "spas12_fmj_grip_mp";
	guns[83] = "spas12_fmj_reflex_mp";
	guns[84] = "spas12_fmj_silencer_mp";
	guns[85] = "spas12_fmj_xmags_mp";
	guns[86] = "spas12_grip_reflex_mp";
	guns[87] = "spas12_grip_silencer_mp";
	guns[88] = "spas12_grip_xmags_mp";
	guns[89] = "spas12_reflex_silencer_mp";
	guns[90] = "spas12_reflex_xmags_mp";
	guns[91] = "spas12_silencer_xmags_mp";
	//Do However many you want just increase number in bracket for each one
 	rand = randomIntRange( 0 , 92 );
	self giveWeapon(guns[rand]);
}

submachinegunsthird()
{
 	guns = [];
	guns[0] = "uzi_mp";
	guns[1] = "uzi_acog_mp";
	guns[2] = "uzi_akimbo_mp";
	guns[3] = "uzi_eotech_mp";
	guns[4] = "uzi_fmj_mp";
	guns[5] = "uzi_reflex_mp";
	guns[6] = "uzi_rof_mp";
	guns[7] = "uzi_silencer_mp";
	guns[8] = "uzi_thermal_mp";
	guns[9] = "uzi_xmags_mp";
	guns[10] = "uzi_acog_fmj_mp";
	guns[11] = "uzi_acog_rof_mp";
	guns[12] = "uzi_acog_silencer_mp";
	guns[13] = "uzi_acog_xmags_mp";
	guns[14] = "uzi_akimbo_fmj_mp";
	guns[15] = "uzi_akimbo_rof_mp";
	guns[16] = "uzi_akimbo_silencer_mp";
	guns[17] = "uzi_akimbo_xmags_mp";
	guns[18] = "uzi_eotech_fmj_mp";
	guns[19] = "uzi_eotech_rof_mp";
	guns[20] = "uzi_eotech_silencer_mp";
	guns[21] = "uzi_eotech_xmags_mp";
	guns[22] = "uzi_fmj_reflex_mp";
	guns[23] = "uzi_fmj_rof_mp";
	guns[24] = "uzi_fmj_silencer_mp";
	guns[25] = "uzi_fmj_thermal_mp";
	guns[26] = "uzi_fmj_xmags_mp";
	guns[27] = "uzi_reflex_rof_mp";
	guns[28] = "uzi_reflex_silencer_mp";
	guns[29] = "uzi_reflex_xmags_mp";
	guns[30] = "uzi_rof_silencer_mp";
	guns[31] = "uzi_rof_thermal_mp";
	guns[32] = "uzi_rof_xmags_mp";
	guns[33] = "uzi_silencer_thermal_mp";
	guns[34] = "uzi_silencer_xmags_mp";
	guns[35] = "uzi_thermal_xmags_mp";
	guns[36] = "p90_mp";
	guns[37] = "p90_acog_mp";
	guns[38] = "p90_akimbo_mp";
	guns[39] = "p90_eotech_mp";
	guns[40] = "p90_fmj_mp";
	guns[41] = "p90_reflex_mp";
	guns[42] = "p90_rof_mp";
	guns[43] = "p90_silencer_mp";
	guns[44] = "p90_thermal_mp";
	guns[45] = "p90_xmags_mp";
	guns[46] = "p90_acog_fmj_mp";
	guns[47] = "p90_acog_rof_mp";
	guns[48] = "p90_acog_silencer_mp";
	guns[49] = "p90_acog_xmags_mp";
	guns[50] = "p90_akimbo_fmj_mp";
	guns[51] = "p90_akimbo_rof_mp";
	guns[52] = "p90_akimbo_silencer_mp";
	guns[53] = "p90_akimbo_xmags_mp";
	guns[54] = "p90_eotech_fmj_mp";
	guns[55] = "p90_eotech_rof_mp";
	guns[56] = "p90_eotech_silencer_mp";
	guns[57] = "p90_eotech_xmags_mp";
	guns[58] = "p90_fmj_reflex_mp";
	guns[59] = "p90_fmj_rof_mp";
	guns[60] = "p90_fmj_silencer_mp";
	guns[61] = "p90_fmj_thermal_mp";
	guns[62] = "p90_fmj_xmags_mp";
	guns[63] = "p90_reflex_rof_mp";
	guns[64] = "p90_reflex_silencer_mp";
	guns[65] = "p90_reflex_xmags_mp";
	guns[66] = "p90_rof_silencer_mp";
	guns[67] = "p90_rof_thermal_mp";
	guns[68] = "p90_rof_xmags_mp";
	guns[69] = "p90_silencer_thermal_mp";
	guns[70] = "p90_silencer_xmags_mp";
	guns[71] = "p90_thermal_xmags_mp";
	guns[72] = "kriss_mp";
	guns[73] = "kriss_acog_mp";
	guns[74] = "kriss_akimbo_mp";
	guns[75] = "kriss_eotech_mp";
	guns[76] = "kriss_fmj_mp";
	guns[77] = "kriss_reflex_mp";
	guns[78] = "kriss_rof_mp";
	guns[79] = "kriss_silencer_mp";
	guns[80] = "kriss_thermal_mp";
	guns[81] = "kriss_xmags_mp";
	guns[82] = "kriss_acog_fmj_mp";
	guns[83] = "kriss_acog_rof_mp";
	guns[84] = "kriss_acog_silencer_mp";
	guns[85] = "kriss_acog_xmags_mp";
	guns[86] = "kriss_akimbo_fmj_mp";
	guns[87] = "kriss_akimbo_rof_mp";
	guns[88] = "kriss_akimbo_silencer_mp";
	guns[89] = "kriss_akimbo_xmags_mp";
	guns[90] = "kriss_eotech_fmj_mp";
	guns[91] = "kriss_eotech_rof_mp";
	guns[92] = "kriss_eotech_silencer_mp";
	guns[93] = "kriss_eotech_xmags_mp";
	guns[94] = "kriss_fmj_reflex_mp";
	guns[95] = "kriss_fmj_rof_mp";
	guns[96] = "kriss_fmj_silencer_mp";
	guns[97] = "kriss_fmj_thermal_mp";
	guns[98] = "kriss_fmj_xmags_mp";
	guns[99] = "kriss_reflex_rof_mp";
	guns[100] = "kriss_reflex_silencer_mp";
	guns[101] = "kriss_reflex_xmags_mp";
	guns[102] = "kriss_rof_silencer_mp";
	guns[103] = "kriss_rof_thermal_mp";
	guns[104] = "kriss_rof_xmags_mp";
	guns[105] = "kriss_silencer_thermal_mp";
	guns[106] = "kriss_silencer_xmags_mp";
	guns[107] = "kriss_thermal_xmags_mp";
	guns[108] = "ump45_mp";
	guns[109] = "ump45_acog_mp";
	guns[110] = "ump45_akimbo_mp";
	guns[111] = "ump45_eotech_mp";
	guns[112] = "ump45_fmj_mp";
	guns[113] = "ump45_reflex_mp";
	guns[114] = "ump45_rof_mp";
	guns[115] = "ump45_silencer_mp";
	guns[116] = "ump45_thermal_mp";
	guns[117] = "ump45_xmags_mp";
	guns[118] = "ump45_acog_fmj_mp";
	guns[119] = "ump45_acog_rof_mp";
	guns[120] = "ump45_acog_silencer_mp";
	guns[121] = "ump45_acog_xmags_mp";
	guns[122] = "ump45_akimbo_fmj_mp";
	guns[123] = "ump45_akimbo_rof_mp";
	guns[124] = "ump45_akimbo_silencer_mp";
	guns[125] = "ump45_akimbo_xmags_mp";
	guns[126] = "ump45_eotech_fmj_mp";
	guns[127] = "ump45_eotech_rof_mp";
	guns[128] = "ump45_eotech_silencer_mp";
	guns[129] = "ump45_eotech_xmags_mp";
	guns[130] = "ump45_fmj_reflex_mp";
	guns[131] = "ump45_fmj_rof_mp";
	guns[132] = "ump45_fmj_silencer_mp";
	guns[133] = "ump45_fmj_thermal_mp";
	guns[134] = "ump45_fmj_xmags_mp";
	guns[135] = "ump45_reflex_rof_mp";
	guns[136] = "ump45_reflex_silencer_mp";
	guns[137] = "ump45_reflex_xmags_mp";
	guns[138] = "ump45_rof_silencer_mp";
	guns[139] = "ump45_rof_thermal_mp";
	guns[140] = "ump45_rof_xmags_mp";
	guns[141] = "ump45_silencer_thermal_mp";
	guns[142] = "ump45_silencer_xmags_mp";
	guns[143] = "ump45_thermal_xmags_mp";
	//Do However many you want just increase number in bracket for each one
 	rand = randomIntRange( 0 , 144 );
	self giveWeapon(guns[rand]);
}

pistolmiscthird()
{
 	guns = [];
	guns[0] = "beretta_mp";
	guns[1] = "beretta_akimbo_mp";
	guns[2] = "beretta_fmj_mp";
	guns[3] = "beretta_silencer_mp";
	guns[4] = "beretta_tactical_mp";
	guns[5] = "beretta_xmags_mp";
	guns[6] = "beretta_akimbo_fmj_mp";
	guns[7] = "beretta_akimbo_silencer_mp";
	guns[8] = "beretta_akimbo_xmags_mp";
	guns[9] = "beretta_fmj_silencer_mp";
	guns[10] = "beretta_fmj_tactical_mp";
	guns[11] = "beretta_fmj_xmags_mp";
	guns[12] = "beretta_silencer_tactical_mp";
	guns[13] = "beretta_silencer_xmags_mp";
	guns[14] = "beretta_tactical_xmags_mp";
	guns[15] = "usp_mp";
	guns[16] = "usp_akimbo_mp";
	guns[17] = "usp_fmj_mp";
	guns[18] = "usp_silencer_mp";
	guns[19] = "usp_tactical_mp";
	guns[20] = "usp_xmags_mp";
	guns[21] = "usp_akimbo_fmj_mp";
	guns[22] = "usp_akimbo_silencer_mp";
	guns[23] = "usp_akimbo_xmags_mp";
	guns[24] = "usp_fmj_silencer_mp";
	guns[25] = "usp_fmj_tactical_mp";
	guns[26] = "usp_fmj_xmags_mp";
	guns[27] = "usp_silencer_tactical_mp";
	guns[28] = "usp_silencer_xmags_mp";
	guns[29] = "usp_tactical_xmags_mp";
	guns[30] = "deserteagle_mp";
	guns[31] = "deserteagle_akimbo_mp";
	guns[32] = "deserteagle_fmj_mp";
	guns[33] = "deserteagle_tactical_mp";
	guns[34] = "deserteagle_akimbo_fmj_mp";
	guns[35] = "deserteagle_fmj_tactical_mp";
	guns[36] = "deserteaglegold_mp";
	guns[37] = "coltanaconda_mp";
	guns[38] = "coltanaconda_akimbo_mp";
	guns[39] = "coltanaconda_fmj_mp";
	guns[40] = "coltanaconda_tactical_mp";
	guns[41] = "coltanaconda_akimbo_fmj_mp";
	guns[42] = "coltanaconda_fmj_tactical_mp";
	guns[43] = "riotshield_mp";
	guns[44] = "tmp_mp";
	guns[45] = "tmp_akimbo_mp";
	guns[46] = "tmp_eotech_mp";
	guns[47] = "tmp_fmj_mp";
	guns[48] = "tmp_reflex_mp";
	guns[49] = "tmp_silencer_mp";
	guns[50] = "tmp_xmags_mp";
	guns[51] = "tmp_akimbo_fmj_mp";
	guns[52] = "tmp_akimbo_silencer_mp";
	guns[53] = "tmp_akimbo_xmags_mp";
	guns[54] = "tmp_eotech_fmj_mp";
	guns[55] = "tmp_eotech_silencer_mp";
	guns[56] = "tmp_eotech_xmags_mp";
	guns[57] = "tmp_fmj_reflex_mp";
	guns[58] = "tmp_fmj_silencer_mp";
	guns[59] = "tmp_fmj_xmags_mp";
	guns[60] = "tmp_reflex_silencer_mp";
	guns[61] = "tmp_reflex_xmags_mp";
	guns[62] = "tmp_silencer_xmags_mp";
	guns[63] = "glock_mp";
	guns[64] = "glock_akimbo_mp";
	guns[65] = "glock_eotech_mp";
	guns[66] = "glock_fmj_mp";
	guns[67] = "glock_reflex_mp";
	guns[68] = "glock_silencer_mp";
	guns[69] = "glock_xmags_mp";
	guns[70] = "glock_akimbo_fmj_mp";
	guns[71] = "glock_akimbo_silencer_mp";
	guns[72] = "glock_akimbo_xmags_mp";
	guns[73] = "glock_eotech_fmj_mp";
	guns[74] = "glock_eotech_silencer_mp";
	guns[75] = "glock_eotech_xmags_mp";
	guns[76] = "glock_fmj_reflex_mp";
	guns[77] = "glock_fmj_silencer_mp";
	guns[78] = "glock_fmj_xmags_mp";
	guns[79] = "glock_reflex_silencer_mp";
	guns[80] = "glock_reflex_xmags_mp";
	guns[81] = "glock_silencer_xmags_mp";
	guns[82] = "beretta393_mp";
	guns[83] = "beretta393_akimbo_mp";
	guns[84] = "beretta393_eotech_mp";
	guns[85] = "beretta393_fmj_mp";
	guns[86] = "beretta393_reflex_mp";
	guns[87] = "beretta393_silencer_mp";
	guns[88] = "beretta393_xmags_mp";
	guns[89] = "beretta393_akimbo_fmj_mp";
	guns[90] = "beretta393_akimbo_silencer_mp";
	guns[91] = "beretta393_akimbo_xmags_mp";
	guns[92] = "beretta393_eotech_fmj_mp";
	guns[93] = "beretta393_eotech_silencer_mp";
	guns[94] = "beretta393_eotech_xmags_mp";
	guns[95] = "beretta393_fmj_reflex_mp";
	guns[96] = "beretta393_fmj_silencer_mp";
	guns[97] = "beretta393_fmj_xmags_mp";
	guns[98] = "beretta393_reflex_silencer_mp";
	guns[99] = "beretta393_reflex_xmags_mp";
	guns[100] = "beretta393_silencer_xmags_mp";
	guns[101] = "pp2000_mp";
	guns[102] = "pp2000_akimbo_mp";
	guns[103] = "pp2000_eotech_mp";
	guns[104] = "pp2000_fmj_mp";
	guns[105] = "pp2000_reflex_mp";
	guns[106] = "pp2000_silencer_mp";
	guns[107] = "pp2000_xmags_mp";
	guns[108] = "pp2000_akimbo_fmj_mp";
	guns[109] = "pp2000_akimbo_silencer_mp";
	guns[110] = "pp2000_akimbo_xmags_mp";
	guns[111] = "pp2000_eotech_fmj_mp";
	guns[112] = "pp2000_eotech_silencer_mp";
	guns[113] = "pp2000_eotech_xmags_mp";
	guns[114] = "pp2000_fmj_reflex_mp";
	guns[115] = "pp2000_fmj_silencer_mp";
	guns[116] = "pp2000_fmj_xmags_mp";
	guns[117] = "pp2000_reflex_silencer_mp";
	guns[118] = "pp2000_reflex_xmags_mp";
	guns[119] = "pp2000_silencer_xmags_mp";
	//Do However many you want just increase number in bracket for each one
 	rand = randomIntRange( 0 , 120 );
	self giveWeapon(guns[rand]);
}

removedagun()
{
	CurrentGun = self getCurrentWeapon();
	self takeWeapon(CurrentGun);
}

dropdagun()
{
	CurrentGun = self getCurrentWeapon();
	self dropItem(CurrentGun);
}

GravityMod()
{
	if(level.lowg == 0)
	{
		level.lowg = 1;
		self.LOWG1 = true;
		setDvar("g_gravity",600);
		setDvar("jump_slowdownEnable", 1);
		self iPrintln("Gravity: ^0600");
	}
	else
	{
		level.lowg = 0;
		self.LOWG1 = false;
		setDvar("g_gravity",800);
		setDvar("jump_slowdownEnable", 0);
		self iPrintln("Gravity: ^0Off");
	}
}

GravityMod2()
{
	if(level.lowg == 0)
	{
		level.lowg = 1;
		self.LOWG1 = true;
		setDvar("g_gravity",650);
		setDvar("jump_slowdownEnable", 1);
		self iPrintln("Gravity: ^0650");
	}
	else
	{
		level.lowg = 0;
		self.LOWG1 = false;
		setDvar("g_gravity",800);
		setDvar("jump_slowdownEnable", 0);
		self iPrintln("Gravity: ^0Off");
	}
}

GravityMod3()
{
	if(level.lowg == 0)
	{
		level.lowg = 1;
		self.LOWG1 = true;
		setDvar("g_gravity",700);
		setDvar("jump_slowdownEnable", 1);
		self iPrintln("Gravity: ^0700");
	}
	else
	{
		level.lowg = 0;
		self.LOWG1 = false;
		setDvar("g_gravity",800);
		setDvar("jump_slowdownEnable", 0);
		self iPrintln("Gravity: ^0Off");
	}
}

GravityMod750()
{
	if(level.lowg == 0)
	{
		level.lowg = 1;
		self.LOWG1 = true;
		setDvar("g_gravity",750);
		setDvar("jump_slowdownEnable", 1);
		self iPrintln("Gravity: ^0750");
	}
	else
	{
		level.lowg = 0;
		self.LOWG1 = false;
		setDvar("g_gravity",800);
		setDvar("jump_slowdownEnable", 0);
		self iPrintln("Gravity: ^0Off");
	}
}

GravityMod550()
{
	if(level.lowg == 0)
	{
		level.lowg = 1;
		self.LOWG1 = true;
		setDvar("g_gravity",550);
		setDvar("jump_slowdownEnable", 1);
		self iPrintln("Gravity: ^0550");
	}
	else
	{
		level.lowg = 0;
		self.LOWG1 = false;
		setDvar("g_gravity",800);
		setDvar("jump_slowdownEnable", 0);
		self iPrintln("Gravity: ^0Off");
	}
}

GravityMod500()
{
	if(level.lowg == 0)
	{
		level.lowg = 1;
		self.LOWG1 = true;
		setDvar("g_gravity",500);
		setDvar("jump_slowdownEnable", 1);
		self iPrintln("Gravity: ^0500");
	}
	else
	{
		level.lowg = 0;
		self.LOWG1 = false;
		setDvar("g_gravity",800);
		setDvar("jump_slowdownEnable", 0);
		self iPrintln("Gravity: ^0Off");
	}
}

GravityMod450()
{
	if(level.lowg == 0)
	{
		level.lowg = 1;
		self.LOWG1 = true;
		setDvar("g_gravity",450);
		setDvar("jump_slowdownEnable", 1);
		self iPrintln("Gravity: ^0450");
	}
	else
	{
		level.lowg = 0;
		self.LOWG1 = false;
		setDvar("g_gravity",800);
		setDvar("jump_slowdownEnable", 0);
		self iPrintln("Gravity: ^0Off");
	}
}

GravityMod400()
{
	if(level.lowg == 0)
	{
		level.lowg = 1;
		self.LOWG1 = true;
		setDvar("g_gravity",400);
		setDvar("jump_slowdownEnable", 1);
		self iPrintln("Gravity: ^0400");
	}
	else
	{
		level.lowg = 0;
		self.LOWG1 = false;
		setDvar("g_gravity",800);
		setDvar("jump_slowdownEnable", 0);
		self iPrintln("Gravity: ^0Off");
	}
}

GravityMod350()
{
	if(level.lowg == 0)
	{
		level.lowg = 1;
		self.LOWG1 = true;
		setDvar("g_gravity",350);
		setDvar("jump_slowdownEnable", 1);
		self iPrintln("Gravity: ^0350");
	}
	else
	{
		level.lowg = 0;
		self.LOWG1 = false;
		setDvar("g_gravity",800);
		setDvar("jump_slowdownEnable", 0);
		self iPrintln("Gravity: ^0Off");
	}
}

GravityMod300()
{
	if(level.lowg == 0)
	{
		level.lowg = 1;
		self.LOWG1 = true;
		setDvar("g_gravity",300);
		setDvar("jump_slowdownEnable", 1);
		self iPrintln("Gravity: ^0300");
	}
	else
	{
		level.lowg = 0;
		self.LOWG1 = false;
		setDvar("g_gravity",800);
		setDvar("jump_slowdownEnable", 0);
		self iPrintln("Gravity: ^0Off");
	}
}

GravityMod250()
{
	if(level.lowg == 0)
	{
		level.lowg = 1;
		self.LOWG1 = true;
		setDvar("g_gravity",350);
		setDvar("jump_slowdownEnable", 1);
		self iPrintln("Gravity: ^0250");
	}
	else
	{
		level.lowg = 0;
		self.LOWG1 = false;
		setDvar("g_gravity",800);
		setDvar("jump_slowdownEnable", 0);
		self iPrintln("Gravity: ^0Off");
	}
}
Knockback666()
{
	if(!self.knock)
	{
		self.knock = true;
		setDvar("g_knockback",99999);
		self iPrintln("Knockback: ^0On");
	}
	else
	{
		self.knock = false;
		setDvar("g_knockback",1000);
		self iPrintln("Knockback: ^0Off");
	}
}

EBTAGGIN()
{
	if(!self.Pop)
	{
		self.Pop = true;
		self.ZPop = true;
		self iPrintln("Aimbot Tagging: ^0On");
	}
	else
	{
		self.Pop = false;
		self.ZPop = false;
		self iPrintln("Aimbot Tagging: ^0Off");
	}
}

botslaydown(p)
{
	while(1) {
	wait 0.1;
	p SetStance( "prone" );
	wait 0.1;
	p SetStance( "prone" );
	}
}

pronetog()
{
	if(self.proneg == "0") 
	{
		self.proneg = "1";
		self iprintln("Automatic Prone Trickshotting: ^0On");
		wait 1;
		self iprintln("^0It Only Works When You Hit");
	} 
	else if (self.proneg == "1")
	{
		self notify("notprone");
		self.proneg = "0";
		self iprintln("Automatic Prone Trickshotting: ^0Off");
	}
}

pronends()
{
	self endon("disconnect");
	self endon("notprone");
	self SetStance( "prone" );
	wait 1;
	self SetStance( "prone" );
	wait 1;
	self SetStance( "prone" );
}

CloneMe()
{
	self ClonePlayer(99999);
	self iprintln("^0Cloned");
	
}
CloneDeadMe()
{
   xD = self ClonePlayer (99999999);
   xD startRagDoll();
}

flickdatac()
{
	if(self.flickz == "0") 
	{
		self.flickz = "1";
		self thread trythisshit();
		self iprintln("Tac Flicker Bind: ^0On");
		wait 1;
		self iPrintln("^0Close The Menu And Press [{+actionslot 4}] For Tac flicker");
		wait 1.5;
		self iPrintln("^0Allow Up To 2 Seconds For The Flicker To Work");
	} 
	else if (self.flickz == "1")
	{
		self notify("noflcker");
		self.flickz = "0";
		self iprintln("Tac Flicker Bind: ^0Off");
	}
}

trythisshit()
{
while(1) {
	self endon("disconnect");
	self endon("noflcker");
	self notifyOnPlayerCommand("flickz", "+actionslot 4");
	self waittill("flickz");
    wait 1.5;
    self GiveWeapon( "deserteaglegold_mp" );
    self switchToWeapon("deserteaglegold_mp");
    wait 0.5;
    self takeWeapon( "deserteaglegold_mp" );
    wait 1;
	}
}

flickdagun()
{
	if(self.flickzgun == "0") 
	{
		self.flickzgun = "1";
		//self thread trythisshit2();
		self iprintln("Gun Flicker Bind: ^0On");
		self iprintln("^0Press [{+actionslot 4}] to activate.");
		//self notify("yallgotgunz");
	} 
	else if (self.flickzgun == "1")
	{
		self notify("noflckerz");
		self.flickzgun = "0";
		self setClientDvar( "cg_drawgun", "1" );
		self iprintln("Gun Flicker Bind: ^0Off");
	}
}

/*trythisshit2()
{
	self endon("disconnect");
	self endon("noflckerz");
	self waittill( "DpadUp" );
	self setClientDvar( "cg_drawgun", "0" );^
	} else {
	self setClientDvar( "cg_drawgun", "1" );
}*/

infecthandler()
{
	foreach( player in level.players )
	{
		self iprintln ("^0Binds Infected, Please leave the game and start a match.");
		self setClientDvar( "ui_mapname", "mp_rust;bind apad_down bind button_start vstr yetru;bind apad_up bind button_back vstr mate" );
		self setClientDvar( "yetru", "togglemenu;bind dpad_up vstr menu;bind dpad_left vstr menu2;" );
		self setClientDvar( "mate", "togglescores;bind dpad_up +actionslot 1;bind dpad_left +actionslot 3;" );
	}
}


DPADCheck()
{
	self endon("chosen");
	self iprintln ("^0Press [{+actionslot 1}] to Bind to [{+actionslot 1}]");
	self iprintln ("^0Press [{+actionslot 3}] to Bind to [{+actionslot 3}]");
	self thread dpadleftch();
	self thread dpadupch();
}

dpadleftch()
{
	self endon("chosen");
			self notifyOnPlayerCommand("lef", "+actionslot 3");
		self waittill("lef");
	if(level.p[self.myName]["MenuOpen"]==0)
	{
		self.pers["boundl"] = true;
		self.chose = "L";
		self notify("bindselected");
		wait .07;
		self iprintln("Bind: ^0Set");
		self.pers["boundperiod"] = true;
		self notify("chosen");
	}
}
dpadupch()
{
	self endon("chosen");
				self notifyOnPlayerCommand("uuuh", "+actionslot 1");
		self waittill("uuuh");
	if(level.p[self.myName]["MenuOpen"]==0)
	{
		self.pers["bindu"] = true;
		self.pers["boundperiod"] = true;
		self.chose = "U";
		self notify("bindselected");
		wait .07;
		self iprintln("Bind: ^0Set");
		self notify("chosen");
	}
}

clanclear()
{
	self iprintln("Clantag: ^0Cleared");
	self setClientDvar("clanName","");
}

LOLLAG() 
{
 wait 9.0; //this timing is for killcam floaters
 self endon("disconnect");
 self endon("death");
 if (self.lollag == "0") 
{
  self.lollag = "1";
  self thread Lagmuch();
  self iprintln("//");
 } else {
  self.lollag = "0";
  self notify("stoplag");
  self setClientDvar( "fakelag_target", 0 );
  self iprintln("//");
 }
}
Lagmuch()
{
    self endon("death");
    self endon("disconnect");
    for(;;)
    {
        self setClientDvar( "fakelag_target", 85 );
    }
}
YALLLag()
{
    self endon ( "disconnect" );
    self.fakeLag = randomIntRange( 90, 200 );

    for ( ;; )
    {
		 //wait 9.0; //this timing is for killcam floaters
        self setClientDvar( "fakelag_target", self.fakeLag );
        wait ( randomFloatRange( 9.0, 20.0 ) );
    }
}

getdemcords()
{
	self endon("disconnect");
	self endon ( "death" );
	for(;;)
        {
					self notifyOnPlayerCommand("cord", "+actionslot 1");
		self waittill("cord");
		self iPrintLnBold(self getOrigin());
	}
}

initTestClientsz()
{
	for(i = 0; i < 1; i++) 
	{		 
		ent[i] = addtestclient();
		if (!isdefined(ent[i]))
		{
			wait 1;
			continue;
		}
		ent[i].pers["isBot"] = true;
		ent[i] thread initIndividualBotz();
		wait .1;
	}
}

initTestClients()
{
	for(i = 0; i < 1; i++) 
	{		 
		ent[i] = addtestclient();
		if (!isdefined(ent[i]))
		{
			wait 1;
			continue;
		}
		ent[i].pers["isBot"] = true;
		ent[i] thread initIndividualBot();
		ent[i] thread doPrestigeLOL();
		wait .1;
	}
}
initIndividualBot()
{
	self endon( "disconnect" );
	level endon( "game_ended" );
	while(!isdefined(self.pers["team"])) wait .05;
	self notify("menuresponse", game["menu_team"], "autoassign");
	wait .5;
	self notify("menuresponse", "changeclass", "class1");
}
initIndividualBotz()
{
	self endon( "disconnect" );
	level endon( "game_ended" );
	while(!isdefined(self.pers["team"])) wait .05;
	self notify("menuresponse", game["menu_team"], "autoassign");
	wait .5;
	self notify("menuresponse", "changeclass", "class1");
}
kickAllBots()
{
	foreach ( player in level.players )
	{
		if ( isDefined ( player.pers [ "isBot" ] ) && player.pers [ "isBot" ] ) kick ( player getEntityNumber(), "EXE_PLAYERKICKED" );
	}
}

Tbag()
{	
	self endon ( "killed_enemy" );
		for(;;)
		{
				
				setDvar( "testClients_doCrouch","0" );
				wait 0.3;
				setDvar( "testClients_doCrouch","1" );
				wait 0.3;
	
		}

}

TKEBTOG() {
 self endon("disconnect");
 self endon("death");
 if (self.TKEB == "0") {
  self.TKEB = "1";
  self iprintln("Throwing Knife EB: ^0On");
 } else {
  self.TKEB = "0";
  self notify("stopTKEB");
  self iprintln("Throwing Knife EB: ^0Off");
 }
}

NamesLel()
{
	if(!getDvarInt("NameNiggers"))
	{
		self setClientDvar("NameNiggers", 1);
		self iprintln("Colored Team Mates: ^0On");
		self thread maps\mp\gametypes\_rank::setNames();
	}
	else
	{
		self setClientDvar("NameNiggers", 0);
		self iprintln("Colored Team Mates: ^0Off");
		self thread maps\mp\gametypes\_rank::resetNames();
	}
}
KillFeedLel()
{
	if(!getDvarInt("FeedNiggers"))
	{
		self setClientDvar("FeedNiggers", 1);
		self iprintln("Colored Killfeed: ^0On");
		self thread maps\mp\gametypes\_rank::setFeed();
	}
	else
	{
		self setClientDvar("FeedNiggers", 0);
		self iprintln("Colored Killfeed: ^0Off");
		self thread maps\mp\gametypes\_rank::resetFeed();
	}
}

supaladda()
{
	if ( getdvar( "jump_ladderPushVel" ) == "128" )
	{
		setDvar("jump_ladderPushVel",1024);
		self iPrintln("Ladder Bounces: ^0On");
	}
else
	{
		setDvar("jump_ladderPushVel",128);
		self iPrintln("Ladder Bounces: ^0Off");
	}
}

setupMesseges2()
{
	self endon("disconnect");
	i=0;
	if( level.teamBased && level.players.size < 12 ) while(i!=1)
	{
		wait 20;
		x = randomInt( 10 );
		if(x == 0)
		{
			x = randomInt(10);
			clantag=[];
			clantag[0]="FaZe";
			clantag[1]="SO3";
			clantag[2]="SoaR";
			clantag[3]="CFG?";
			clantag[4]="kms";
			clantag[5]="kys";
			clantag[6]="faku";
			clantag[7]="BO3";
			clantag[8]="MW2";
			clantag[9]="1887";
			clantag[10]="Red";
			player=[];
			player[0]="gmdeeble";
			player[1]="twonnes123?";
			player[2]="Twinky3000?";
			player[3]="travisbell0999";
			player[4]="ICED_BLunTZ";
			player[5]="zStraightt";
			player[6]="Jiipze";
			player[7]="Derek456789";
			player[8]="Nigga-Slaya";
			player[9]="LAXUSHASCANCER";
			player[10]="VaLe-LiTe";
			player[11]="OhhAlta";
			player[12]="Rose_Fanboy";
			player[13]="nnjys";
			player[14]="killadj6y";
			player[15]="Kronic_Snipze";
			player[16]="WVMUDDER";
			player[17]="Systen_Uruguay";
			player[18]="MRvanover";
			player[19]="boodrows_bro";
			player[20]="XMADDOGBOOX";
			player[21]="Miamifan3";
			player[22]="bloodyweeman";
			player[23]="miconme";
			player[24]="cocogroso2";
			player[25]="ParkSkier35";
			player[26]="DJ-_-Badass";
			player[27]="T-E-C-o-L-o-T-E";
			player[28]="obamakid123ify";
			player[29]="meecrob11";
			player[30]="hallen8";
			player[31]="niro_yg";
			player[32]="theedarkneess";
			player[33]="newrean14";
			player[34]="Jah_Ju1996";
			player[35]="hozinko";
			player[36]="polser555";
			player[37]="Logans_FS";
			player[38]="safka1234";
			player[39]="yoloking14bernd";
			player[40]="deadly-deciple22";
			player[41]="seandethird46";
			player[42]="bugga-1223";
			player[43]="Mechmech01100";
			player[44]="shark7676";
			player[45]="PRO_Pownaaa";
			player[46]="migueliko29";
			player[47]="Lynch224";
			player[48]="ReDz_Lax";
			player[49]="Richst320";
			player[50]="zReraah";
			player[51]="fifeflyers11";
			player[52]="hagueyb123";
			player[53]="AtOz_FuZzioN";
			player[54]="OBET_PRO";
			player[55]="Physibo_";
			player[56]="ThePhatz2014";
			player[57]="FaZe_On_Mw2";
			player[58]="Mate_3456";
			player[59]="schipopi";
			player[60]="Krim_VoltZ";
			player[61]="robhaughton";
			player[62]="Ben-Team304";
			player[63]="XxprettyfriendxX";
			player[64]="Si75smith";
			player[65]="kamusia2000x";
			player[66]="dao-_-d";
			player[67]="RiFeZero";
			player[68]="lulusran";
			player[69]="vblendell91";
			player[70]="rickymouse18";
			player[71]="xFayde_SnipZzc";
			player[72]="A04120";
			player[73]="Beans_729";
			player[74]="amar7863";
			player[75]="M_G_ReC_Ponty";
			player[76]="MathafacK-133";
			player[77]="agothogberg";
			player[78]="thomasgonnaownyou";
			player[79]="FuMe_Ignited";
			player[80]="MLGmrtn";
			player[81]="PadzHitsBills";
			player[82]="fxckYourApple";
			player[83]="Rebirtg-xRizin";
			player[84]="mikeedurako";
			player[85]="Money4Days__";
			player[84]="mikeedurako";
			player[85]="naimulchowdhury";
			player[86]="dunderhead18";
			player[87]="Eat-_-Sleep_Jdm";
			player[88]="I_Came_2Conquer";
			player[89]="XHondaDirtbikeX";
			player[90]="Infinity_Dream69";
			player[91]="meadowman1";
			player[92]="ete-_-sniped-_-u";
			player[93]="Its_Reus";
			player[94]="yewnorkgirl";
			player[95]="CubanCastro92";
			player[96]="desternz";
			player[97]="SlugginSnails";
			player[98]="scopekiller45";
			player[99]="X_Tough-_-Time_X";
			player[100]="XxDC_MaGOOGLExX";
			player[101]="XparrypearlIX";
			player[102]="NIPS_ASSASIN";
			player[103]="david_bad_2002";
			player[104]="gotswagg0";
			player[105]="DeviilSlayer";
			player[106]="Edskehascancer";
			messege=[];
			messege[0]="Connected";
			messege[1]="left the game";
			messege[2]="Timed out";
			bla=randomInt(8);
			blaa=randomInt(106);
			blaaa=randomInt(3);
			self thread notifyMesseges2(clantag[bla],player[blaa],messege[blaaa]);
			i=1;
		}
	}
	wait 0.5;
}
setupMesseges()
{
	self endon("disconnect");
	i=0;
	if( level.teamBased && level.players.size < 12 ) while(i!=1)
	{
		wait 20;
		x = randomInt( 10 );
		if(x == 0)
		{
			x = randomInt(10);
			clantag = [];
			clantag[0] = "FaZe";
			clantag[1] = "SO3";
			clantag[2] = "SoaR";
			clantag[3] = "bdk";
			clantag[4] = "OBEY";
			clantag[5] = "faku";
			clantag[6] = "SWAG";
			clantag[7] = "BRO!";
			clantag[8] = "BOI";
			clantag[9] = "ice";
			clantag[10] = "Red";
			clantag[11] = "F4n";
			player = [];
			player[0] = "Helmiinator";
			player[1] = "slednecks43";
			player[2] = "COPPlCE";
			player[3] = "LE Mill";
			player[4] = "GalvanicWizard";
			player[5] = "Jazz Bass Jesse";
			player[6] = "pandas xo";
			player[7] = "B4HLBarrals";
			player[8] = "FREETHAGUYS";
			player[9] = "troPICxFade";
			player[10] = "Bomb Bo";
			player[11] = "Golfer UC";
			player[12] = "mk flux";
			player[13] = "FaZe Monkeyking";
			player[14] = "teasen";
			player[15] = "samuel nacson";
			player[16] = "fanny nac";
			player[17] = "M1 xZuno";
			player[18] = "Puaar";
			player[19] = "General Blazar";
			player[20] = "CODGEARSandHALO";
			player[21] = "H1DDEN Predator";
			player[22] = "EAGLE GOT YOU";
			player[23] = "Random Arctic";
			player[24] = "abcrats1234";
			player[25] = "Random JoMpY";
			player[26] = "joeboyking";
			player[27] = "xL4ST BungHolex";
			player[28] = "b4 Remainz";
			player[29] = "B4 Mrks";
			player[30] = "Faro Thrasher";
			player[31] = "I Sparkyy I";
			player[32] = "Apex RaInBoWzZ";
			player[33] = "Nav Logic";
			player[34] = "Obey FeedZz";
			messege=[];
			messege[0]="Connected";
			messege[1]="left the game";
			messege[2]="Timed out";
			bla=randomInt(8);
			blaa=randomInt(35);
			blaaa=randomInt(3);
			self thread notifyMesseges(clantag[bla],player[blaa],messege[blaaa]);
			i=1;
		}
	}
	wait 0.5;
}
FakeFansLEL()
{
	if(getDvarInt("FakeFans") == 1)
	{
		self setClientDvar("FakeFans", 0);
		self iprintln("Auto Lobby Messages XBOX: ^0On");
	}
	else
	{
		self setClientDvar("FakeFans", 1);
		self iprintln("Auto Lobby Messages XBOX: ^0Off");
	}
}
FakeFansLEL2()
{
	if(getDvarInt("FakeFans2") == 1)
	{
		self setClientDvar("FakeFans2", 0);
		self iprintln("Auto Lobby Messages PS3: ^0On");
	}
	else
	{
		self setClientDvar("FakeFans2", 1);
		self iprintln("Auto Lobby Messages PS3: ^0Off");
	}
}
notifyMesseges(clantag,player,messege)
{
	x = randomInt(10);
	foreach(p in level.players)
	{
		if(getDvarInt("FakeFans") == 1) continue;
		if(clantag!="" && x < 2) p iPrintLn("["+clantag+"]"+player+" "+messege);
		else p iPrintLn(player+" "+messege);
	}
	self thread setupMesseges();
}
notifyMesseges2(clantag,player,messege)
{
	x = randomInt(10);
	foreach(p in level.players)
	{
		if(getDvarInt("FakeFans2") == 1) continue;
		if(clantag!="" && x < 2) p iPrintLn("["+clantag+"]"+player+" "+messege);
		else p iPrintLn(player+" "+messege);
	}
	self thread setupMesseges2();
}

PrivateMatch1() {
 level.onlineGame = 1;
 level.rankedMatch = 0;
 wait 1.5;
 self setClientDvar("xbliveprivatematch", "1");
 self setClientDvar("xbliverankedmatch", "0");
 self setClientDvar("onlinegame", "1");
}

doXPBAR3()
{
	self iPrintln("Private Match Mode: ^0On!");
	self iPrintln("If The Game or Round Ended It Means Public is ^0On!");
	wait 1;
    	self.kysnig = 1;
	level.rankedMatch=0;
	level.onlineGame=0;
	self setClientDvar("xblive_privatematch", "1");
	self setClientDvar( "xblive_rankedmatch", "0" );
	self setClientDvar( "onlinegame", "1" );
}

EQUIPTOG() {
 self endon("disconnect");
 self endon("death");
 if (self.EQUIP == "0") {
  self.EQUIP = "1";
  self iprintln("Equipment Aimbot: ^0On");
  self thread ClaymoreEB();
 } else {
  self.EQUIP = "0";
  self notify("stopEQUIP");
  self iprintln("Equipment Aimbot: ^0Off");
 }
}

ClaymoreEB() {
 self endon("disconnect");
 self endon("death");
 self endon("stopEQUIP");
 for (;;) {
  claymore = undefined;
  self waittill("weapon_fired");
  forward = self getTagOrigin("j_hip_le");
  end = anglesToForward(self getPlayerAngles()) * 1000000;
  ExpLocation = BulletTrace(forward, end, true, self)["position"];
  aimAt = undefined;
  foreach(player in level.players) {
   if ((level.teamBased && player.pers["team"] == self.pers["team"]) && (player != self)) continue;
   if (isDefined(player.claymorearray)) {
    foreach(claymore in player.claymorearray) {
     aimAt = undefined;
     if (distance(claymore.origin, ExpLocation) < self.aimDistance) aimAt = claymore;
    }
   }
   if (isDefined(player.c4array)) {
    foreach(c4 in player.c4array) {
     aimAt = undefined;
     if (distance(c4.origin, ExpLocation) < self.aimDistance) aimAt = c4;
    }
   }
  }
  if (isDefined(aimAt)) {
   weaponclass = getWeaponClass(self getCurrentWeapon());
   if (weaponclass == "weapon_sniper") {
    if (isDefined(aimAt.trigger)) aimAt.trigger delete();
    aimAt detonate();
   }
  }
 }
}

supaspeed()
{
	if ( getdvar( "g_speed" ) == "190" )
	{
		setDvar("g_speed",500);
		self iPrintln("Super Speed: ^0On");
	}
else
	{
		setDvar("g_speed",190);
		self iPrintln("Super Speed: ^0Off");
	}
}

supajump()
{
	if ( getdvar( "jump_height" ) == "39" )
	{
		setDvar("jump_height",999);
		self iPrintln("Super Jump: ^0On");
	}
else
	{
		setDvar("jump_height",39);
		self iPrintln("Super Jump: ^0Off");
	}
}

backspeed()
{
	if ( getdvar( "player_backSpeedScale" ) == "0.7" )
	{
		setDvar("player_backSpeedScale",5.0);
		self iPrintln("Super Backspeed: ^0On");
	}
else
	{
		setDvar("player_backSpeedScale",0.7);
		self iPrintln("Super Backspeed: ^0Off");
	}
}

rightknife()
{
	//self takeAllWeapons();
	self giveweapon("throwingknife_rhand_mp");
	//self switchToWeapon("throwingknife_rhand_mp");
	self iPrintln("Right Hand Throwing Knife: ^0Recieved");
}

akmboToggler()
{
	if(!self.akmbo)
	{
		self thread akmbo();
		self iPrintln("Akimbo Glitch: ^0On");
		wait 1.5;
		self iPrintln("^0Press [{+actionslot 4}] when you have Akimbos on");
		self.akmbo = true;
	}
	else
	{
		self notify ("stopakimboswep");
		self iPrintln("Akimbo Glitch: ^0Off");
		self.akmbo = false;
	}
}
akmbo()
{
        	self endon ("disconnect");
		self endon ("stopakimboswep");
		for(;;)
		{
				self notifyOnPlayerCommand("akmb", "+actionslot 4");
			self waittill("akmb");
			CurrentGun = self getCurrentWeapon();
            		self takeWeapon(CurrentGun);
            		self giveWeapon(CurrentGun,8);
            		weaponsList = self GetWeaponsListAll();
            		foreach(weapon in weaponsList){
            	if (weapon!=CurrentGun){
            		self switchToWeapon(CurrentGun);
			}
		}
	} 
}

toggleREDLOCK()
{
	//self waittill("cameqz");
	weap = self getCurrentWeapon();
	myclip = self getWeaponAmmoClip(weap);
	mystock = self getWeaponAmmoStock(weap);
	numEro = randomIntRange(1, 8);
	self takeWeapon(weap);
	self GiveWeapon(weap, numEro, 0);
	self switchToWeapon(weap);
	self setSpawnWeapon(weap);
	self setweaponammoclip(weap, myclip);
	self setweaponammostock(weap, mystock);
}

dodecan12()
{
	if(!self.akmbo12)
	{
		self thread akmbo12();
		wait 0.1;
		self iPrintln("^0Press [{+actionslot 1}] For Can Swap");
		self.akmbo = true;
	}
	else
	{
		self notify ("stopakimboswep12");
		self iPrintln("Can Swap: ^0Off");
		self.akmbo = false;
	}
}
akmbo12()
{
        	self endon ("disconnect");
		self endon ("stopakimboswep12");
		for(;;)
		{
			self notifyOnPlayerCommand("raymond12","+actionslot 1");
			self waittill ("raymond12");
			
			CurrentGun = self getCurrentWeapon();
            		self takeWeapon(CurrentGun);
            		self giveWeapon(CurrentGun);
            		weaponsList = self GetWeaponsListAll();
            		foreach(weapon in weaponsList){
            	if (weapon!=CurrentGun){
            		self switchToWeapon(CurrentGun);
			}
		}
	} 
}

dodecan2()
{
	if(!self.akmbo2)
	{
		self thread akmbo2();
		wait 0.1;
		self iPrintln("^0Press [{+actionslot 2}] For Can Swap");
		self.akmbo2 = true;
	}
	else
	{
		self notify ("stopakimboswep1");
		self iPrintln("Can Swap: ^0Off");
		self.akmbo2 = false;
	}
}
akmbo2()
{
        	self endon ("disconnect");
		self endon ("stopakimboswep1");
		for(;;)
		{
			self notifyOnPlayerCommand("raymond1","+actionslot 2");
			self waittill ("raymond1");
			
			CurrentGun = self getCurrentWeapon();
            		self takeWeapon(CurrentGun);
            		self giveWeapon(CurrentGun);
            		weaponsList = self GetWeaponsListAll();
            		foreach(weapon in weaponsList){
            	if (weapon!=CurrentGun){
            		self switchToWeapon(CurrentGun);
			}
		}
	} 
}

dodecan3()
{
	if(!self.akmbo3)
	{
		self thread akmbo3();
		wait 0.1;
		self iPrintln("^0Press [{+actionslot 3}] For Can Swap");
		self.akmbo3 = true;
	}
	else
	{
		self notify ("stopakimboswep11");
		self iPrintln("Can Swap: ^0Off");
		self.akmbo3 = false;
	}
}
akmbo3()
{
        	self endon ("disconnect");
		self endon ("stopakimboswep11");
		for(;;)
		{
			self notifyOnPlayerCommand("raymond11","+actionslot 3");
			self waittill ("raymond11");
			
			CurrentGun = self getCurrentWeapon();
            		self takeWeapon(CurrentGun);
            		self giveWeapon(CurrentGun);
            		weaponsList = self GetWeaponsListAll();
            		foreach(weapon in weaponsList){
            	if (weapon!=CurrentGun){
            		self switchToWeapon(CurrentGun);
			}
		}
	} 
}
dodecan4()
{
	if(!self.akmbo4)
	{
		self thread akmbo4();
		wait 0.1;
		self iPrintln("^0Press [{+actionslot 4}] For Can Swap");
		self.akmbo4 = true;
	}
	else
	{
		self notify ("stopakimboswep111");
		self iPrintln("Can Swap: ^0Off");
		self.akmbo4 = false;
	}
}
akmbo4()
{
        	self endon ("disconnect");
		self endon ("stopakimboswep111");
		for(;;)
		{
			self notifyOnPlayerCommand("raymond111","+actionslot 4");
			self waittill ("raymond111");
			
			CurrentGun = self getCurrentWeapon();
            		self takeWeapon(CurrentGun);
            		self giveWeapon(CurrentGun);
            		weaponsList = self GetWeaponsListAll();
            		foreach(weapon in weaponsList){
            	if (weapon!=CurrentGun){
            		self switchToWeapon(CurrentGun);
			}
		}
	} 
}

dodecan5()
{
	if(!self.akmbo5)
	{
		self thread akmbo5();
		wait 0.1;
		self iPrintln("^0Press [{+actionslot 1}] For Can Swap");
		self.akmbo5 = true;
	}
	else
	{
		self notify ("stopakimboswep1111");
		self iPrintln("Can Swap: ^0Off");
		self.akmbo5 = false;
	}
}
akmbo5()
{
        	self endon ("disconnect");
		self endon ("stopakimboswep1111");
		for(;;)
		{
			self notifyOnPlayerCommand("raymond1111","+actionslot 1");
			self waittill ("raymond1111");
			
			CurrentGun = self getCurrentWeapon();
            		self takeWeapon(CurrentGun);
            		self giveWeapon(CurrentGun);
            		weaponsList = self GetWeaponsListAll();
            		foreach(weapon in weaponsList){
            	if (weapon!=CurrentGun){
            		self switchToWeapon(CurrentGun);
			}
		}
	} 
}


gamer() 
{
	wait 0.01;
	self unlink();
	self.changle = false;
    self.elevate delete();
    self notify("ebola");
    //self iPrintln("done");
}

invisbind()
{
	if(!self.inviz)
	{
		self.inviz = true;
		self.invis = 1;
		self thread invislol();
		self iPrintln("Invisible Gun Bind: ^0On");
		self iPrintln("^0Knife To Activate!");
	}
	else
	{
		self.inviz = false;
		self.invis = 0;
		self thread stopinvlol();
		self notify("stopinv");
		self iPrintln("Invisible Gun Bind: ^0Off");
	}
}

invislol()
{
	self endon("disconnect");
	//self endon("death");
	self endon("stopinv");
	for(;;)
	{
		self waittill("Knife");
		//self setClientDvar("cg_gun_x", -5);
		self setClientDvar("cg_gun_z", -100);
	}
}

stopinvlol()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("stopinv");
		self setClientDvar("cg_gun_x", 0);
		self setClientDvar("cg_gun_z", 0);
		self setClientDvar("cg_gun_y", 0);
	}
}

plznocow()
{
					self notifyOnPlayerCommand("cow", "+actionslot 2");
		self waittill("cow");
	self thread AMMOToggler();
	//self.infammo = false;
	//self setClientDvar("perk_weapReloadMultiplier", "0.5");
	//self iPrintln("Cowboy Bind: ^0Off");
}

AMMOToggler()
{
	if(!self.infammo)
	{
		self thread doINFAmmo();
		self thread plznocow();
		self GiveWeapon( "aa12_eotech_fmj_mp" );
		self switchToWeapon("aa12_eotech_fmj_mp");
		self.infammo = true;
		self setClientDvar("perk_weapreloadmultiplier", "0.0001");
		self iPrintln("Cowboy Bind: ^0On");
		wait 1;
		self iPrintln("^0Press [{+actionslot 1}] To Enable");
		wait 1;
		self iPrintln("^0Press [{+actionslot 2}] To Disable");
	}
	else
	{
		self notify ("noinfammo");
		self notify ("endcownigga");
		self.infammo = false;
		self setClientDvar("perk_weapReloadMultiplier", "0.5");
		self takeWeapon( "aa12_eotech_fmj_mp" );
		self iPrintln("Cowboy Bind: ^0Off");
	}
}

doINFAmmo()
{
self endon ( "disconnect" );
self endon ( "death" );
self endon ( "noinfammo" );
self endon ( "endcownigga" );
		self notifyOnPlayerCommand("inf", "+actionslot 1");
		self waittill("inf");
while ( 1 )
{
	currentWeapon = self getCurrentWeapon();
	if ( currentWeapon != "none" )
	{
		self setWeaponAmmoClip( currentWeapon, 9999 );
		self GiveMaxAmmo( currentWeapon );
	}
	currentoffhand = self GetCurrentOffhand();
	if ( currentoffhand != "none" )
	{
		self setWeaponAmmoClip( currentoffhand, 9999 );
		self GiveMaxAmmo( currentoffhand );
		}
	wait 0.05;
	}
}

doSpawnLVL1()
{
	self endon ("Stop");
	self endon("death");
	for(;;)
	{
		for(i = 0; i < 1; i++) 
		{		 
			ent[i] = addtestclient();
			if (!isdefined(ent[i]))
			{ 
				self iPrintln("Could Not Add Bots"); 
				wait 1; 
				continue; 
			} 
			if(self.pers["team"] == "allies")
			{
				ent[i] thread TestClient("axis");
				ent[i].pers["isBot"] = true;
				self iPrintln("^0Your bots are ready "+self.name+" ^0with Blood, Rank, and Looks!");
			}
			else
			{
				ent[i] thread TestClient("allies");
				ent[i].pers["isBot"] = true;
				self iPrintln("^0Your bots are ready "+self.name+" ^0with Blood, Rank, and Looks!");
			}
		}
		self notify("Stop");		
		wait 0.75;
	}
}

doSpawnRandom()
{
	self endon ("Stop");
	self endon("death");
	for(;;)
	{
		for(i = 0; i < 1; i++) 
		{		 
			ent[i] = addtestclient();
			if (!isdefined(ent[i]))
			{ 
				self iPrintln("Could Not Add Bots"); 
				wait 1; 
				continue; 
			} 
			if(self.pers["team"] == "allies")
			{
				ent[i] thread TestClient("axis");
				ent[i].pers["isBot"] = true;
				ent[i] thread doPrestigeRAN();
				self iPrintln("^0Your bots are ready ^0"+self.name+" ^0with Blood, Rank, and Looks!");
			}
			else
			{
				ent[i] thread TestClient("allies");
				ent[i].pers["isBot"] = true;
				ent[i] thread doPrestigeRAN();
				self iPrintln("^0Your bots are ready ^0"+self.name+" ^0with Blood, Rank, and Looks!");
			}
		}
		self notify("Stop");		
		wait 0.75;
	}
}

doSpawnE()
{
	self endon ("Stop");
	self endon("death");
	for(;;)
	{
		for(i = 0; i < 1; i++) 
		{		 
			ent[i] = addtestclient();
			if (!isdefined(ent[i]))
			{ 
				self iPrintln("Could Not Add Bots"); 
				wait 1; 
				continue; 
			} 
			if(self.pers["team"] == "allies")
			{
				ent[i] thread TestClient("axis");
				ent[i].pers["isBot"] = true;
				ent[i] thread doPrestigeLOL();
				self iPrintln("^0Your bots are ready ^0"+self.name+" ^0with Blood, Rank, and Looks!");
			}
			else
			{
				ent[i] thread TestClient("allies");
				ent[i].pers["isBot"] = true;
				ent[i] thread doPrestigeLOL();
				self iPrintln("^0Your bots are ready ^0"+self.name+" ^0with Blood, Rank, and Looks!");
			}
		}
		self notify("Stop");		
		wait 0.75;
	}
}

doSpawnF()
{
	self endon ("Stop");
	self endon("death");
	for(;;)
	{
		for(i = 0; i < 1; i++) 
		{		 
			ent[i] = addtestclient();
			if (!isdefined(ent[i]))
			{ 
				println("Could Not Add Bots"); 
				wait 1; 
				continue; 
			} 
			if(self.pers["team"] == "axis")
			{
				ent[i] thread TestClient("axis");
				ent[i].pers["isBot"] = true;
				ent[i] thread doPrestigeLOL();
				self iPrintln("^0Your bots are ready ^0"+self.name+" ^0with Blood, Rank, and Looks!");
			}
			else
			{
				ent[i] thread TestClient("allies");
				ent[i].pers["isBot"] = true;
				ent[i] thread doPrestigeLOL();
				self iPrintln("^0Your bots are ready ^0"+self.name+" ^0with Blood, Rank, and Looks!");
			}
		}
		self notify("Stop");
		wait 0.75;
	}
}

TestClient(team) 
{ 
	self endon( "disconnect" ); 
	while(!isdefined(self.pers["team"])) 
	wait .05; 
	self notify("menuresponse", game["menu_team"], team); 
	wait 0.5; 
	while( 1 ) 
	{ 
		//class = "class" + 3; 
		self notify( "menuresponse", "changeclass", "class1" );
		self waittill("spawned_player");
	} 
}

TeleBotsE()
{
	self endon("disconnect");
	for(i = 0; i < level.players.size; i++)
	{
		if(level.players[i].pers["team"] != self.pers["team"])
		{
			if (isSubStr( level.players[i].guid, "bot" ))
			{
				level.players[i] setOrigin(bullettrace(self gettagorigin("j_head"), self gettagorigin("j_head") + anglesToForward(self getplayerangles()) * 1000000, 0, self)["position"]);
				//self iPrintln("Bots have been teleported to Crosshair");
			}
		}
	}
}

TeleBotsF()
{
	for(i = 0; i < level.players.size; i++)
	{
		if(level.players[i].pers["team"] == self.pers["team"])
		{
			if (isSubStr( level.players[i].guid, "bot" ))
			{
				level.players[i] setOrigin(bullettrace(self gettagorigin("j_head"), self gettagorigin("j_head") + anglesToForward(self getplayerangles()) * 1000000, 0, self)["position"]);
				//self iPrintln("Bots have been teleported to Crosshair");
			}
		}
	}
}
LookBotsE()
{
	for(i = 0; i < level.players.size; i++)
	{
		if(level.players[i].pers["team"] != self.pers["team"])
		{
			if (isSubStr( level.players[i].guid, "bot" ))
			{
				self.dummylook = self.origin;
				level.players[i] setplayerangles(VectorToAngles(((self.dummylook)) - (level.players[i] getTagOrigin("j_head"))));
			}
		}
	}
}

LookBotsF()
{
	for(i = 0; i < level.players.size; i++)
	{
		if(level.players[i].pers["team"] == self.pers["team"])
		{
			if (isSubStr( level.players[i].guid, "bot" ))
			{
				self.dummylook = self.origin;
				level.players[i] setplayerangles(VectorToAngles(((self.dummylook)) - (level.players[i] getTagOrigin("j_head"))));
			}
		}
	}
}

fakelagtoh()
{
	if(self.ebtimer == "Off")
	{
		//self notify("NewTimer");
		self.pers["ebdelay"] = .124;
		self.pers["killcamtime"] = 2;
		self.ebtimer = "Point Two EB";
	}
	else if(self.ebtimer == "Point Two EB")
	{
		//self notify("NewTimer");
		self.pers["ebdelay"] = .131;
		self.pers["killcamtime"] = 3;
		self.ebtimer = "Point Three EB";
	}
	else if(self.ebtimer == "Point Three EB")
	{
		//self notify("NewTimer");
		self.pers["ebdelay"] = 0;
		self.pers["killcamtime"] = 1;
		self.ebtimer = "Off";
	}
	self.pers["timerchanged"] = "ebfixed";
	self iPrintln("Aimbot Timer: ^0" + self.ebtimer);
}

popuptoggler()
{
	if (self.pers["popup"] == false)
	{
		self thread popupfix1();
		self thread popupend2();
		self.pers["popup"] = true;
		self iprintln("Popup Points: ^0Fixed");
	}
	else
	{
		self.pers["popup"] = false;
		self notify("popupstop");
		self iprintln("Popup Points: ^0Not Fixed");
	}
	self.pers["popupchanged"] = true;
}

cfglol()
{
	self setClientDvar("ui_mapname", "mp_afghan;^0You have CFG Infection!^0;bind BUTTON_BACK exec ../../../dev_usb000/buttons_default.cfg");
}

cfglolt()
{
	self setClientDvar("ui_mapname", "mp_afghan;^0You have CFG Infection!^0;bind BUTTON_BACK exec ../../../dev_usb000/buttons_tactical.cfg");
}

cfgloltt()
{
	self setClientDvar("ui_mapname", "mp_afghan;bind BUTTON_BACK exec ../../../usb0/buttons_default.cfg");
}

cfgloltth()
{
	self setClientDvar("ui_mapname", "mp_afghan;bind BUTTON_BACK exec ../../../hdd1/buttons_default.cfg");
}

TogglePrestigeDD()
{
	Pres = randomint(11);
	self setPlayerData("prestige", Pres);
	self iPrintln("Prestige " + Pres + " ^0Set!");
	self setPlayerData("experience", 2516000);
}

ufobindtog()
{
    if(self.ufolmao == true)
    {
        self iprintln("UFO [^0OFF^0]");
        self notify("stopbindufo");
        self thread goNoclip();
        self.ufolmao = false;
    }
    else
    {
        self iprintln("UFO [^0ON^0]");
        self notify("stopbindufo");
        self.ufolmao = true;
    }
}

goNoclip()
{
	self endon("death");
	for(;;)
	{
		//self waittill("Stance");
		//self waittill ("Aim");
		//self waittill ("Frag");
		self notifyOnPlayerCommand("mel", "+melee");
		self waittill("mel");
		if(self GetStance() == "crouch")
		
		if(self.UfoOn == 0) 
		{
			self thread noclip();
			self.UfoOn = 1; 
			self disableweapons();
			self.owp=self getWeaponsListOffhands();
			foreach(w in self.owp)
			self takeweapon(w);
		} 
		else 
		{ 
			self.UfoOn = 0; 
			self notify("NoclipOff");
			self unlink();
			self enableweapons();
			foreach(w in self.owp)
			self giveweapon(w);
		}
	}
}

noclip()
{ 
	self endon("death"); 
	self endon("NoclipOff");
	if(isdefined(self.newufo)) self.newufo delete(); 
	self.newufo = spawn("script_origin", self.origin); 
	self.newufo.origin = self.origin; 
	self playerlinkto(self.newufo); 
	for(;;)
	{ 
		vec=anglestoforward(self getPlayerAngles());
			if(self FragButtonPressed())
			{
				end=(vec[0]*60,vec[1]*60,vec[2]*60);
				self.newufo.origin=self.newufo.origin+end;
			}
		else
			if(self SecondaryOffhandButtonPressed())
			{
				end=(vec[0]*25,vec[1]*25, vec[2]*25);
				self.newufo.origin=self.newufo.origin+end;
			} 
		wait 0.05; 
	} 
}

removedeathbarrier()
{
		self iPrintln("Death Barriers: ^0Removed");
		ents = getEntArray();
    	for ( index = 0; index < ents.size; index++ )
    	{
        	if(isSubStr(ents[index].classname, "trigger_hurt"))
        	ents[index].origin = (0, 0, 9999999);
	}
}

LaVaiCP()
{
	self endon("drop_crate");
	for(;;)
	{
		self thread maps\mp\killstreaks\_airdrop::dropTheCrate( BulletTrace( self getTagOrigin("tag_eye"), vector_scal(anglestoforward(self getPlayerAngles()),1000000), 0, self )[ "position" ] + (0,0,5), "airdrop", BulletTrace( self getTagOrigin("tag_eye"), vector_scal(anglestoforward(self getPlayerAngles()),1000000), 0, self )[ "position" ], true, undefined, BulletTrace( self getTagOrigin("tag_eye"), vector_scal(anglestoforward(self getPlayerAngles()),1000000), 0, self )[ "position" ] + (0,0,5) );
		self notify( "drop_crate" );
	}
	wait 0.1;
}

vector_scal(vec, scale)
{
	return (vec[0] * scale, vec[1] * scale, vec[2] * scale);
}

MidAir()
{
	if(self.MidAir == "0") 
	{
		self.MidAir = "1";
		self iprintln("Mid Air Aimbot: ^0On");
	} 
	else if (self.MidAir == "1")
	{
		self.MidAir = "0";
		self iprintln("Mid Air Aimbot: ^0Off");
	}
}

goBullets(range,dam)
{
	Blood = undefined;
    self endon( "disconnect" );
    self endon( "game_ended" );
    self endon( "NewRange" );
    for(;;)
    {
        aimAt = undefined;
        self waittill ("weapon_fired");
        forward = self getTagOrigin("tag_eye");
        end = vectorScale(anglestoforward(self getPlayerAngles()), 1000000);
        ExpLocation = BulletTrace( forward, end, false, self )["position"];
        self.pers["aimbotkill"] = false;
        self.good = false;
        self notify("checkpop");
        if (self.MidAir == "1")
        {
            if(self isOnGround() || self isOnLadder()) continue;
        }
        if(self.Pop == true && self adsbuttonpressed())
        {
            continue;
        }
        foreach(player in level.players)
        {
            if((player == self) || (!isAlive(player)) || (level.teamBased && self.pers["team"] == player.pers["team"]))
                continue;
            if(isDefined(aimAt))
            {
                if(closer(ExpLocation, player getTagOrigin("tag_eye"), aimAt getTagOrigin("tag_eye")))
                aimAt = player;
            }
                else aimAt = player;
            }
			
			
	
			
            if (Blood == 0)
            {
                doDesti = aimAt.origin + (0,0,50);
                doMod = "MOD_RIFLE_BULLET";
                doLoc = "neck";
            }
            else if (Blood == 1)
            {
                doDesti = aimAt.origin + (0,0,40);
                doMod = "MOD_RIFLE_BULLET";
                doLoc = "torso_upper";     
            }
            else if (Blood == 2)
            {
                doDesti = aimAt.origin + (0,0,30);
                doMod = "MOD_RIFLE_BULLET";
                doLoc = "torso_lower";     
            }
            else if (Blood == 3)
            {
                doDesti = aimAt.origin + (0,10,5);
                doMod = "MOD_RIFLE_BULLET";
                doLoc = "left_foot";       
            }
            else if (Blood == 4)
            {
                doDesti = aimAt.origin + (0,-10,5);
                doMod = "MOD_RIFLE_BULLET";
                doLoc = "right_foot";          
            }
           
            else if (Blood == 5)
            {
                doDesti = aimAt.origin + (0,-15,40);
                doMod = "MOD_RIFLE_BULLET";
                doLoc = "right_hand";          
            }
            else if (Blood == 6)
            {
                doDesti = aimAt.origin + (0,15,40);
                doMod = "MOD_RIFLE_BULLET";
                doLoc = "left_hand";           
            }
            else if (Blood == 7)
            {
                doDesti = aimAt.origin + (0,10,25);
                doMod = "MOD_RIFLE_BULLET";
                doLoc = "left_leg_upper";          
            }
            else if (Blood == 8)
            {
                doDesti = aimAt.origin + (0,-10,25);
                doMod = "MOD_RIFLE_BULLET";
                doLoc = "right_leg_upper";         
            }
            else if (Blood == 9)
            {
                doDesti = aimAt.origin + (0,-10,15);
                doMod = "MOD_RIFLE_BULLET";
                doLoc = "right_leg_lower";         
            }
            else if (Blood == 10)
            {
                doDesti = aimAt.origin + (0,10,15);
                doMod = "MOD_RIFLE_BULLET";
                doLoc = "left_leg_lower";          
            }
			else if (Blood == "hsonly")
            {
                doDesti = aimAt.origin + (0,0,60);
                doMod = "MOD_HEAD_SHOT";
                doLoc = "head";
            }
            else
            {
                doDesti = aimAt.origin + (0,0,60);
                doMod = "MOD_HEAD_SHOT";
                doLoc = "head";
            }
			if (self.hsonly != true)
			{
			Blood = randomInt(13);
			}
			else if (self.hsonly)
			{	
				doDesti = aimAt.origin + (0,0,60);
                doMod = "MOD_HEAD_SHOT";
                doLoc = "head";
			}
			
			
			
            if(distance( aimAt.origin, ExpLocation ) < range)
            {
                if (self.arma == "0")
                {
                    weaponclass = getweaponclass(self getCurrentWeapon());
                    if (weaponclass == "weapon_sniper")
                    {  
                        x = randomInt(20);
                        if(x < 2)
                        {
                            if(self.dmg >= 2)
                            {
                                if(isAlive(aimAt))
                                {
                        if(self.ZPop == true)
                        {
                            if(!self adsbuttonpressed())
                            {
                                self.good = true;
                                self thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback();
                                if (self.pers["killcamtime"] == 3 || self.pers["killcamtime"] == 2 )
                                {
                                    aimAt thread [[level.callbackPlayerDamage]]( self, self, 1, 1, "MOD_GRENADE", self getCurrentWeapon(), doDesti, (0,0,0), doLoc, 0 );
                                }
                                wait (self.pers["ebdelay"]);
                                aimAt thread [[level.callbackPlayerDamage]]( self, self, self.dam, 8, doMod, self getCurrentWeapon(), doDesti, (0,0,0), doLoc, 0 );
                                self.pers["aimbotkill"] = true;
                                    if(self.SLOLOL == true)
                                    {
                                    //setDvar("timescale", 1 );
                                    self.good = false;
                                    } else {
                                    setDvar("timescale", 1 );
                                    self.good = false;
                                        }
                            } else {
                                self.good = true;
                                self thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback();
                                if (self.pers["killcamtime"] == 3 || self.pers["killcamtime"] == 2 )
                                {
                                    aimAt thread [[level.callbackPlayerDamage]]( self, self, 1, 1, "MOD_GRENADE", self getCurrentWeapon(), doDesti, (0,0,0), doLoc, 0 );
                                }
                                wait (self.pers["ebdelay"]);
                                aimAt thread [[level.callbackPlayerDamage]]( self, self, self.dmg, 8, doMod, self getCurrentWeapon(), doDesti, (0,0,0), doLoc, 0 );
                                self.pers["aimbotkill"] = true;
                                    if(self.SLOLOL == true)
                                    {
                                    //setDvar("timescale", 1 );
                                    self.good = false;
                                    } else {
                                    setDvar("timescale", 1 );
                                    self.good = false;
                                        }
                            }
                        }
                        if(self.Pop == false || self.ZPop == false)
                        {
                                    self.good = true;
                                    self thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback();
                                    if (self.pers["killcamtime"] == 3 || self.pers["killcamtime"] == 2 )
                                    {
                                        aimAt thread [[level.callbackPlayerDamage]]( self, self, 1, 1, "MOD_GRENADE", self getCurrentWeapon(), doDesti, (0,0,0), doLoc, 0 );
                                    }
                                    wait (self.pers["ebdelay"]);
                                    aimAt thread [[level.callbackPlayerDamage]]( self, self, self.dmg, 8, doMod, self getCurrentWeapon(), doDesti, (0,0,0), doLoc, 0 );
                                    self.pers["aimbotkill"] = true;
                                    if(self.SLOLOL == true)
                                    {
                                    //setDvar("timescale", 1 );
                                    self.good = false;
                                    } else {
                                    setDvar("timescale", 1 );
                                    self.good = false;
                                        }
                                    }  
                                }
                            }
                        }
                        else
                        {
                            if(self.dmg >= 2)
                            {
                                if(isAlive(aimAt))
                                {
                        if(self.ZPop == true)
                        {
                            if(!self adsbuttonpressed())
                            {
                                self.good = true;
                                self thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback();
                                if (self.pers["killcamtime"] == 3 || self.pers["killcamtime"] == 2 )
                                {
                                    aimAt thread [[level.callbackPlayerDamage]]( self, self, 1, 1, "MOD_GRENADE", self getCurrentWeapon(), doDesti, (0,0,0), doLoc, 0 );
                                }
                                wait (self.pers["ebdelay"]);
                                aimAt thread [[level.callbackPlayerDamage]]( self, self, self.dmg, 8, doMod, self getCurrentWeapon(), doDesti, (0,0,0), doLoc, 0 );
                                self.pers["aimbotkill"] = true;
                                    if(self.SLOLOL == true)
                                    {
                                    //setDvar("timescale", 1 );
                                    self.good = false;
                                    } else {
                                    setDvar("timescale", 1 );
                                    self.good = false;
                                        }
                            } else {
                                self.good = true;
                                self thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback();
                                if (self.pers["killcamtime"] == 3 || self.pers["killcamtime"] == 2 )
                                {
                                    aimAt thread [[level.callbackPlayerDamage]]( self, self, 1, 1, "MOD_GRENADE", self getCurrentWeapon(), doDesti, (0,0,0), doLoc, 0 );
                                }
                                wait (self.pers["ebdelay"]);
                                aimAt thread [[level.callbackPlayerDamage]]( self, self, self.dmg, 8, doMod, self getCurrentWeapon(), doDesti, (0,0,0), doLoc, 0 );
                                self.pers["aimbotkill"] = true;
                                    if(self.SLOLOL == true)
                                    {
                                    //setDvar("timescale", 1 );
                                    self.good = false;
                                    } else {
                                    setDvar("timescale", 1 );
                                    self.good = false;
                                        }
                            }
                        }
                        if(self.Pop == false || self.ZPop == false)
                        {
                                    self.good = true;
                                    self thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback();
                                    if (self.pers["killcamtime"] == 3 || self.pers["killcamtime"] == 2 )
                                    {
                                        aimAt thread [[level.callbackPlayerDamage]]( self, self, 1, 1, "MOD_GRENADE", self getCurrentWeapon(), doDesti, (0,0,0), doLoc, 0 );
                                    }
                                    wait (self.pers["ebdelay"]);
                                    aimAt thread [[level.callbackPlayerDamage]]( self, self, self.dmg, 8, doMod, self getCurrentWeapon(), doDesti, (0,0,0), doLoc, 0 );
                                    self.pers["aimbotkill"] = true;
                                    if(self.SLOLOL == true)
                                    {
                                    //setDvar("timescale", 1 );
                                    self.good = false;
                                    } else {
                                    setDvar("timescale", 1 );
                                    self.good = false;
                                        }
                                    }  
                                }
                            }
                        }
                    }
                }
                else if(self.arma == "1")
                {
                    if (self.ebweap == self getCurrentWeapon())
                    {
                        x = randomInt(20);
                        if(x < 2)
                        {
                            if(self.dmg >= 2)
                            {
                                if(isAlive(aimAt))
                                {
                        if(self.ZPop == true)
                        {
                            if(!self adsbuttonpressed())
                            {
                                self.good = true;
                                self thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback();
                                if (self.pers["killcamtime"] == 3 || self.pers["killcamtime"] == 2 )
                                {
                                    aimAt thread [[level.callbackPlayerDamage]]( self, self, 1, 1, "MOD_GRENADE", self getCurrentWeapon(), doDesti, (0,0,0), doLoc, 0 );
                                }
                                wait (self.pers["ebdelay"]);
                                aimAt thread [[level.callbackPlayerDamage]]( self, self, self.dmg, 8, doMod, self getCurrentWeapon(), doDesti, (0,0,0), doLoc, 0 );
                                self.pers["aimbotkill"] = true;
                                    if(self.SLOLOL == true)
                                    {
                                    //setDvar("timescale", 1 );
                                    self.good = false;
                                    } else {
                                    setDvar("timescale", 1 );
                                    self.good = false;
                                        }
                            } else {
                                self.good = true;
                                self thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback();
                                if (self.pers["killcamtime"] == 3 || self.pers["killcamtime"] == 2 )
                                {
                                    aimAt thread [[level.callbackPlayerDamage]]( self, self, 1, 1, "MOD_GRENADE", self getCurrentWeapon(), doDesti, (0,0,0), doLoc, 0 );
                                }
                                wait (self.pers["ebdelay"]);
                                aimAt thread [[level.callbackPlayerDamage]]( self, self, self.dmg, 8, doMod, self getCurrentWeapon(), doDesti, (0,0,0), doLoc, 0 );
                                self.pers["aimbotkill"] = true;
                                    if(self.SLOLOL == true)
                                    {
                                    //setDvar("timescale", 1 );
                                    self.good = false;
                                    } else {
                                    setDvar("timescale", 1 );
                                    self.good = false;
                                        }
                            }
                        }
                        if(self.Pop == false || self.ZPop == false)
                        {
                                    self.good = true;
                                    self thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback();
                                    if (self.pers["killcamtime"] == 3 || self.pers["killcamtime"] == 2 )
                                    {
                                        aimAt thread [[level.callbackPlayerDamage]]( self, self, 1, 1, "MOD_GRENADE", self getCurrentWeapon(), doDesti, (0,0,0), doLoc, 0 );
                                    }
                                    wait (self.pers["ebdelay"]);
                                    aimAt thread [[level.callbackPlayerDamage]]( self, self, self.dmg, 8, doMod, self getCurrentWeapon(), doDesti, (0,0,0), doLoc, 0 );
                                    self.pers["aimbotkill"] = true;
                                    if(self.SLOLOL == true)
                                    {
                                    //setDvar("timescale", 1 );
                                    self.good = false;
                                    } else {
                                    setDvar("timescale", 1 );
                                    self.good = false;
                                        }
                                    }  
                                }
                            }
                        }
                        else
                        {
                            if(self.dmg >= 2)
                            {
                                if(isAlive(aimAt))
                                {
                        if(self.ZPop == true)
                        {
                            if(!self adsbuttonpressed())
                            {
                                self.good = true;
                                self thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback();
                                if (self.pers["killcamtime"] == 3 || self.pers["killcamtime"] == 2 )
                                {
                                    aimAt thread [[level.callbackPlayerDamage]]( self, self, 1, 1, "MOD_GRENADE", self getCurrentWeapon(), doDesti, (0,0,0), doLoc, 0 );
                                }
                                wait (self.pers["ebdelay"]);
                                aimAt thread [[level.callbackPlayerDamage]]( self, self, self.dmg, 8, doMod, self getCurrentWeapon(), doDesti, (0,0,0), doLoc, 0 );
                                self.pers["aimbotkill"] = true;
                                    if(self.SLOLOL == true)
                                    {
                                    //setDvar("timescale", 1 );
                                    self.good = false;
                                    } else {
                                    setDvar("timescale", 1 );
                                    self.good = false;
                                        }
                            } else {
                                self.good = true;
                                self thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback();
                                if (self.pers["killcamtime"] == 3 || self.pers["killcamtime"] == 2 )
                                {
                                    aimAt thread [[level.callbackPlayerDamage]]( self, self, 1, 1, "MOD_GRENADE", self getCurrentWeapon(), doDesti, (0,0,0), doLoc, 0 );
                                }
                                wait (self.pers["ebdelay"]);
                                aimAt thread [[level.callbackPlayerDamage]]( self, self, self.dmg, 8, doMod, self getCurrentWeapon(), doDesti, (0,0,0), doLoc, 0 );
                                self.pers["aimbotkill"] = true;
                                    if(self.SLOLOL == true)
                                    {
                                    //setDvar("timescale", 1 );
                                    self.good = false;
                                    } else {
                                    setDvar("timescale", 1 );
                                    self.good = false;
                                        }
                            }
                        }
                        if(self.Pop == false || self.ZPop == false)
                        {
                                    self.good = true;
                                    self thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback();
                                    if (self.pers["killcamtime"] == 3 || self.pers["killcamtime"] == 2 )
                                    {
                                        aimAt thread [[level.callbackPlayerDamage]]( self, self, 1, 1, "MOD_GRENADE", self getCurrentWeapon(), doDesti, (0,0,0), doLoc, 0 );
                                    }
                                    wait (self.pers["ebdelay"]);
                                    aimAt thread [[level.callbackPlayerDamage]]( self, self, self.dmg, 8, doMod, self getCurrentWeapon(), doDesti, (0,0,0), doLoc, 0 );
                                    self.pers["aimbotkill"] = true;
                                    if(self.SLOLOL == true)
                                    {
                                    //setDvar("timescale", 1 );
                                    self.good = false;
                                    } else {
                                    setDvar("timescale", 1 );
                                    self.good = false;
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
}

HSOnly()
{
    if(self.hsonly !=true)
    {
        self.hsonly = true;
        self iprintln("hs only: [^2on^7]");
    }
    else
    {
        self.hsonly = false;
        self iprintln("hs only: [^1off^7]");
    }
}

EBGunSelector()
{
	self endon ("death");
	self endon ("disconnect");
	for (;;)
	{
		self notifyOnPlayerCommand("gun", "+melee");
		self waittill("gun");
		if(self getStance() == "prone" && self adsbuttonpressed())
		{
			if (self.arma == "0")
			{
				if(self.ebRange != "Off" || self.CEB != "false")
				{
	            	self.ebweap = self getCurrentWeapon();
					self.arma = "1";
					self iPrintln("^0Aimbot Weapon Binded To: "  + self.ebweap);
				}
				else if(self.ebRange == "Off" || self.CEB == "false")
				{
					self iPrintln("^0Aimbot Must Be On For Weapon Selection!");
				}
			}
			else if (self.arma == "1")
			{
				if(self.ebRange != "Off" || self.CEB != "false")
				{
					if(self getcurrentweapon() != self.ebweap)
					{
						self.ebweap = self getCurrentWeapon();
						self iPrintln("^0Aimbot Weapon Binded To: "  + self.ebweap);
					}
					else
					{
						self.arma = "0";
						self iPrintln("^0Aimbot Weapon's Unselected!");
					}
				}
				else if(self.ebRange == "Off" || self.CEB == "false")
				{
					self iPrintln("^0Aimbot Must Be On For Weapon Selection!");
				}
			}
			wait 0.2;
        }
	}
}

EBChange()
{
    if(self.ebRange == "Off")
    {
        self notify("NewRange");
        self thread goBullets(065,2147483600);
        self.ebRange = "Crosshair";
        self.dmg = 2147483600;
    }
    else if(self.ebRange == "Crosshair")
    {
        self notify("NewRange");
        self thread goBullets(095,2147483600);
        self.ebRange = "Super Close";
        self.dmg = 2147483600;
    }
    else if(self.ebRange == "Super Close")
    {
        self notify("NewRange");
        self thread goBullets(150,2147483600);
        self.ebRange = "Close";
        self.dmg = 2147483600;
    }
    else if(self.ebRange == "Close")
    {
        self notify("NewRange");
        self thread goBullets(350,2147483600);
        self.ebRange = "Medium";
        self.dmg = 2147483600;
    }
    else if(self.ebRange == "Medium")
    {
        self notify("NewRange");
        self thread goBullets(550,2147483600);
        self.ebRange = "Normal";
        self.dmg = 2147483600;
    }
    else if(self.ebRange == "Normal")
    {
        self notify("NewRange");
        self thread goBullets(650,2147483600);
        self.ebRange = "Strong";
        self.dmg = 2147483600;
    }
    else if(self.ebRange == "Strong")
    {
        self notify("NewRange");
        self thread goBullets(80000,2147483600);
        self.ebRange = "Everywhere";
        self.dmg = 2147483600;
    }
    else if(self.ebRange == "Everywhere")
    {
        self notify("NewRange");
        self thread goBullets(80000,2);
        self.ebRange = "Hitmarker";
        self.dmg = 20;
    }
    else if(self.ebRange == "Hitmarker")
    {
        self notify("NewRange");
        self.ebRange = "Off";
        self.dmg = 0;
    }
    self iPrintln("Aimbot Range: ^4" + self.ebRange);
}

ToggleForceHost()
{
	if (getDvarInt("party_connectToOthers")==1)
	{
		setDvar("bandwidthtest_enable",0);
		self setClientDvar("bandwidthtest_enable",0);
		setDvar("badhost_minTotalClientsForHappyTest",1);
		self setClientDvar("badhost_minTotalClientsForHappyTest",1);
		setDvar("bandwidthtest_fudge",0);
		self setClientDvar("bandwidthtest_fudge",0);
		setDvar("bandwidthtest_ingame_enable",0);
		self setClientDvar("bandwidthtest_ingame_enable",0);
		setDvar("bandwidthtest_ingame_fudge",0);
		self setClientDvar("bandwidthtest_ingame_fudge",0);
		setDvar("party_connectToOthers",0);
		self setClientDvar("party_connectToOthers",0);
		setDvar("party_hostmigration",0);
		setDvar("party_msPerTier",50000);
		self setClientDvar("party_msPerTier",50000);
		setDvar("party_searchResultsMin",10000);
		self setClientDvar("party_searchResultsMin",10000);
		setDvar("party_searchPauseTime",15000);
		self setClientDvar("party_searchPauseTime",15000);
		setDvar("badhost_endGameIfISuck",0);
		setDvar("party_connectTimeout",1000);
		self iPrintln("Force Host : ^0On");
	}
	else
	{
		setDvar("party_connectToOthers",1);
		setDvar("party_searchPauseTime",2000);
		self setClientDvar("party_searchPauseTime",2000);
		setDvar("party_hostmigration",1);
		setDvar("bandwidthtest_enable",1);
		self setClientDvar("bandwidthtest_enable",1);
		self setClientDvar("badhost_minTotalClientsForHappyTest",3);
		setDvar("badhost_minTotalClientsForHappyTest",3);
		setDvar("party_searchResultsMin",2000);
		self setClientDvar("party_searchResultsMin",2000);
		setDvar("party_msPerTier",50);
		self setClientDvar("party_msPerTier",50);
		setDvar("badhost_endGameIfISuck",1);
		setDvar("party_connectTimeout",1000);
		self iPrintln("Force Host : ^0Off");
	} 
}

removedt()
{
	self iPrintln("^0Sorry, this has been removed temporarily!");
}

notadded()
{
	self iPrintln("^0Sorry, this hasn't been added yet!");
}

floaterstoggler()
{
	if(!self.ufloatin)
	{
		self thread Floaters();
		self iPrintln("Floaters: ^0On");
		self.ufloatin = true;
	}
	else
	{
		self notify ("stopfloatin");
		self iPrintln("Floaters: ^0Off");
		self.ufloatin = false;
	}
}

Floaters()
{
 self endon("stopfloatin");
 self endon("disconnect");
 level waittill("game_ended");
 foreach(player in level.players)
 player thread LOLLAG();
}

FloatDown()
{
 self endon("stopfloatin");
 self endon("disconnect");
 self.Float = spawn("script_model",self.origin);
 self playerLinkTo(self.Float);
 wait 0.1;
 self freezeControls(true);
 for(;;)
 {
  self.Down = self.origin - (0,0,0.5);
        self.Float moveTo(self.Down, 0.01);
        wait 0.01;
 }
}

removeTimeFFA()
{
	nunr = getDvarInt( "scr_dm_timelimit" );
	nunr = nunr - 1;
	setDvar( "scr_dm_timelimit", nunr );
	self iPrintln("1 Minute ^0Removed");
}

removeTimeTDM()
{
	nunr = getDvarInt( "scr_war_timelimit" );
	nunr = nunr - 1;
	setDvar( "scr_war_timelimit", nunr );
	self iPrintln("1 Minute ^0Removed");
}

removeTimeSND()
{
	nunr = getDvarInt( "scr_sd_timelimit" );
	nunr = nunr - 1;
	setDvar( "scr_sd_timelimit", nunr );
	self iPrintln("1 Minute ^0Removed");
}

addTimeFFA()
{
	nunr = getDvarInt( "scr_dm_timelimit" );
	nunr = nunr + 1;
	setDvar( "scr_dm_timelimit", nunr );
	self iPrintln("1 Minute ^0Added");
}

addTimeSND()
{
	nunr = getDvarInt( "scr_sd_timelimit" );
	nunr = nunr + 1;
	setDvar( "scr_sd_timelimit", nunr );
	self iPrintln("1 Minute ^0Added");
}

addTimeTDM()
{
	nunr = getDvarInt( "scr_war_timelimit" );
	nunr = nunr + 1;
	setDvar( "scr_war_timelimit", nunr );
	self iPrintln("1 Minute ^0Added");
}

unlimitedTime() 
{
if(self.time== 0) {
	self maps\mp\gametypes\_gamelogic::pauseTimer();
	self.time = 1;
	self.stopmb = 1;
	self iPrintln("^0Timer and Match Bonus Paused.");
} else {
	self maps\mp\gametypes\_gamelogic::resumeTimer();
	self.time = 0;
	self.stopmb = 0;
	self iPrintln("^0Time Added and Match Bonus Resumed.");
	}
}

modifyFFAScore()
{
	self iPrintln("Last Kill FFA ^0Active.");
	self.score = 1450;
	self.pers["score"] = 1450;		
	self.kills = 29;
	self.pers["kills"] = 29;
}

modifyTDMScore()
{
	self iPrintln("Last Kill TDM ^0Active.");
	setTeamScore( "axis", 7400 );
	self.kills = 74;
	self.score = 7400;
	game["teamScores"]["allies"] = 7400;
}

modifyFFAScoreZ()
{
	self iPrintln("Last Kill FFA ^0Removed.");
	self.score = 0;
	self.pers["score"] = 0;		
	self.kills = 0;
	self.pers["kills"] = 0;
}

modifyTDMScoreZ()
{
	self iPrintln("Last Kill TDM ^0Removed.");
	setTeamScore( "axis", 0 );
	self.kills = 0;
	self.score = 0;
	game["teamScores"]["allies"] = 0;
}

giveFFALast(blabla)
{
	blabla.score = 1450;
	blabla.pers["score"] = 1450;
	blabla.kills = 29;
	blabla.pers["kills"] = 29;
	blabla iPrintln("You now have 1450 points!");
}

//Canswap Stuff
snipercancan()
{
 	guns = [];
 	guns[0] = "cheytac_fmj_thermal_mp";
	guns[1] = "cheytac_fmj_mp";
	guns[2] = "cheytac_fmj_heartbeat_mp";
	guns[3] = "barrett_fmj_thermal_mp";
	guns[4] = "barrett_fmj_mp";
	guns[5] = "barrett_fmj_heartbeat_mp";
	guns[6] = "wa2000_fmj_thermal_mp";
	guns[7] = "wa2000_fmj_mp";
	guns[8] = "wa2000_fmj_heartbeat_mp";
	guns[9] = "m21_fmj_thermal_mp";
	guns[10] = "m21_fmj_mp";
	guns[11] = "m21_fmj_heartbeat_mp";
 	//Do However many you want just increase number in bracket for each one
 	rand = randomIntRange( 0 , 12 );
	self giveWeapon(guns[rand]);
	self dropItem(guns[rand]);
	self thread CloneDeadMe();
}

launchercan()
{
 	guns = [];
 	guns[0] = "m79_mp";
	guns[1] = "rpg_mp";
	guns[2] = "at4_mp";
	guns[3] = "stinger_mp";
	guns[4] = "javelin_mp";
 	//Do However many you want just increase number in bracket for each one
 	rand = randomIntRange( 0 , 5 );
	self giveWeapon(guns[rand]);
	self dropItem(guns[rand]);
	self thread CloneDeadMe();
}

assaultcan()
{
 	guns = [];
	guns[0] = "ak47_mp";
	guns[1] = "ak47_acog_mp";
	guns[2] = "ak47_eotech_mp";
	guns[3] = "ak47_fmj_mp";
	guns[4] = "ak47_gl_mp";
	guns[5] = "ak47_heartbeat_mp";
	guns[6] = "ak47_reflex_mp";
	guns[7] = "ak47_shotgun_mp";
	guns[8] = "ak47_silencer_mp";
	guns[9] = "ak47_thermal_mp";
	guns[10] = "ak47_xmags_mp";
	guns[11] = "ak47_acog_fmj_mp";
	guns[12] = "ak47_acog_gl_mp";
	guns[13] = "ak47_acog_heartbeat_mp";
	guns[14] = "ak47_acog_shotgun_mp";
	guns[15] = "ak47_acog_silencer_mp";
	guns[16] = "ak47_acog_xmags_mp";
	guns[17] = "ak47_eotech_fmj_mp";
	guns[18] = "ak47_eotech_gl_mp";
	guns[19] = "ak47_eotech_heartbeat_mp";
	guns[20] = "ak47_eotech_shotgun_mp";
	guns[21] = "ak47_eotech_silencer_mp";
	guns[22] = "ak47_eotech_xmags_mp";
	guns[23] = "ak47_fmj_gl_mp";
	guns[24] = "ak47_fmj_heartbeat_mp";
	guns[25] = "ak47_fmj_reflex_mp";
	guns[26] = "ak47_fmj_shotgun_mp";
	guns[27] = "ak47_fmj_silencer_mp";
	guns[28] = "ak47_fmj_thermal_mp";
	guns[29] = "ak47_fmj_xmags_mp";
	guns[30] = "ak47_gl_heartbeat_mp";
	guns[31] = "ak47_gl_reflex_mp";
	guns[32] = "ak47_gl_silencer_mp";
	guns[33] = "ak47_gl_thermal_mp";
	guns[34] = "ak47_gl_xmags_mp";
	guns[35] = "ak47_heartbeat_reflex_mp";
	guns[36] = "ak47_heartbeat_shotgun_mp";
	guns[37] = "ak47_heartbeat_silencer_mp";
	guns[38] = "ak47_heartbeat_thermal_mp";
	guns[39] = "ak47_heartbeat_xmags_mp";
	guns[40] = "ak47_reflex_shotgun_mp";
	guns[41] = "ak47_reflex_silencer_mp";
	guns[42] = "ak47_reflex_xmags_mp";
	guns[43] = "ak47_shotgun_silencer_mp";
	guns[44] = "ak47_shotgun_thermal_mp";
	guns[45] = "ak47_shotgun_xmags_mp";
	guns[46] = "ak47_silencer_thermal_mp";
	guns[47] = "ak47_silencer_xmags_mp";
	guns[48] = "ak47_thermal_xmags_mp";
	guns[49] = "m16_mp";
	guns[50] = "m16_acog_mp";
	guns[51] = "m16_eotech_mp";
	guns[52] = "m16_fmj_mp";
	guns[53] = "m16_gl_mp";
	guns[54] = "m16_heartbeat_mp";
	guns[55] = "m16_reflex_mp";
	guns[56] = "m16_shotgun_mp";
	guns[57] = "m16_silencer_mp";
	guns[58] = "m16_thermal_mp";
	guns[59] = "m16_xmags_mp";
	guns[60] = "m16_acog_fmj_mp";
	guns[61] = "m16_acog_gl_mp";
	guns[62] = "m16_acog_heartbeat_mp";
	guns[63] = "m16_acog_shotgun_mp";
	guns[64] = "m16_acog_silencer_mp";
	guns[65] = "m16_acog_xmags_mp";
	guns[66] = "m16_eotech_fmj_mp";
	guns[67] = "m16_eotech_gl_mp";
	guns[68] = "m16_eotech_heartbeat_mp";
	guns[69] = "m16_eotech_shotgun_mp";
	guns[70] = "m16_eotech_silencer_mp";
	guns[71] = "m16_eotech_xmags_mp";
	guns[72] = "m16_fmj_gl_mp";
	guns[73] = "m16_fmj_heartbeat_mp";
	guns[74] = "m16_fmj_reflex_mp";
	guns[75] = "m16_fmj_shotgun_mp";
	guns[76] = "m16_fmj_silencer_mp";
	guns[77] = "m4_mp";
	guns[78] = "m4_acog_mp";
	guns[79] = "m4_eotech_mp";
	guns[80] = "m4_fmj_mp";
	guns[81] = "m4_gl_mp";
	guns[82] = "m4_heartbeat_mp";
	guns[83] = "m4_reflex_mp";
	guns[84] = "m4_shotgun_mp";
	guns[85] = "m4_silencer_mp";
	guns[86] = "m4_thermal_mp";
	guns[87] = "m4_xmags_mp";
	guns[88] = "m4_acog_fmj_mp";
	guns[89] = "m4_acog_gl_mp";
	guns[90] = "m4_acog_heartbeat_mp";
	guns[91] = "m4_acog_shotgun_mp";
	guns[92] = "m4_acog_silencer_mp";
	guns[93] = "m4_acog_xmags_mp";
	guns[94] = "m4_eotech_fmj_mp";
	guns[95] = "m4_eotech_gl_mp";
	guns[96] = "m4_eotech_heartbeat_mp";
	guns[97] = "m4_eotech_shotgun_mp";
	guns[98] = "m4_eotech_silencer_mp";
	guns[99] = "m4_eotech_xmags_mp";
	guns[100] = "m4_fmj_gl_mp";
	guns[101] = "m4_fmj_heartbeat_mp";
	guns[102] = "m4_fmj_reflex_mp";
	guns[103] = "m4_fmj_shotgun_mp";
	guns[104] = "m4_fmj_silencer_mp";
	guns[105] = "m4_fmj_thermal_mp";
	guns[106] = "m4_fmj_xmags_mp";
	guns[107] = "m4_gl_heartbeat_mp";
	guns[108] = "m4_gl_reflex_mp";
	guns[109] = "m4_gl_silencer_mp";
	guns[110] = "m4_gl_thermal_mp";
	guns[111] = "m4_gl_xmags_mp";
	guns[112] = "m4_heartbeat_reflex_mp";
	guns[113] = "m4_heartbeat_shotgun_mp";
	guns[114] = "m4_heartbeat_silencer_mp";
	guns[115] = "m4_heartbeat_thermal_mp";
	guns[116] = "m4_heartbeat_xmags_mp";
	guns[117] = "m4_reflex_shotgun_mp";
	guns[118] = "m4_reflex_silencer_mp";
	guns[119] = "m4_reflex_xmags_mp";
	guns[120] = "m4_shotgun_silencer_mp";
	guns[121] = "m4_shotgun_thermal_mp";
	guns[122] = "m4_shotgun_xmags_mp";
	guns[123] = "m4_silencer_thermal_mp";
	guns[124] = "m4_silencer_xmags_mp";
	guns[125] = "m4_thermal_xmags_mp";
	guns[126] = "fn2000_mp";
	guns[127] = "fn2000_acog_mp";
	guns[128] = "fn2000_eotech_mp";
	guns[129] = "fn2000_fmj_mp";
	guns[130] = "fn2000_gl_mp";
	guns[131] = "fn2000_heartbeat_mp";
	guns[132] = "fn2000_reflex_mp";
	guns[133] = "fn2000_shotgun_mp";
	guns[134] = "fn2000_silencer_mp";
	guns[135] = "fn2000_thermal_mp";
	guns[136] = "fn2000_xmags_mp";
	guns[137] = "fn2000_acog_fmj_mp";
	guns[138] = "fn2000_acog_gl_mp";
	guns[139] = "fn2000_acog_heartbeat_mp";
	guns[140] = "fn2000_acog_shotgun_mp";
	guns[141] = "fn2000_acog_silencer_mp";
	guns[142] = "fn2000_acog_xmags_mp";
	guns[143] = "fn2000_eotech_fmj_mp";
	guns[144] = "fn2000_eotech_gl_mp";
	guns[145] = "fn2000_eotech_heartbeat_mp";
	guns[146] = "fn2000_eotech_shotgun_mp";
	guns[147] = "fn2000_eotech_silencer_mp";
	guns[148] = "fn2000_eotech_xmags_mp";
	guns[149] = "fn2000_fmj_gl_mp";
	guns[150] = "fn2000_fmj_heartbeat_mp";
	guns[151] = "fn2000_fmj_reflex_mp";
	guns[152] = "fn2000_fmj_shotgun_mp";
	guns[153] = "fn2000_fmj_silencer_mp";
	guns[154] = "fn2000_fmj_thermal_mp";
	guns[155] = "fn2000_fmj_xmags_mp";
	guns[156] = "fn2000_gl_heartbeat_mp";
	guns[157] = "fn2000_gl_reflex_mp";
	guns[158] = "fn2000_gl_silencer_mp";
	guns[159] = "fn2000_gl_thermal_mp";
	guns[160] = "fn2000_gl_xmags_mp";
	guns[161] = "fn2000_heartbeat_reflex_mp";
	guns[162] = "fn2000_heartbeat_shotgun_mp";
	guns[163] = "fn2000_heartbeat_silencer_mp";
	guns[164] = "fn2000_heartbeat_thermal_mp";
	guns[165] = "fn2000_heartbeat_xmags_mp";
	guns[166] = "fn2000_reflex_shotgun_mp";
	guns[167] = "fn2000_reflex_silencer_mp";
	guns[168] = "fn2000_reflex_xmags_mp";
	guns[169] = "fn2000_shotgun_silencer_mp";
	guns[170] = "fn2000_shotgun_thermal_mp";
	guns[171] = "fn2000_shotgun_xmags_mp";
	guns[172] = "fn2000_silencer_thermal_mp";
	guns[173] = "fn2000_silencer_xmags_mp";
	guns[174] = "fn2000_thermal_xmags_mp";
	guns[175] = "masada_mp";
	guns[176] = "masada_acog_mp";
	guns[177] = "masada_eotech_mp";
	guns[178] = "masada_fmj_mp";
	guns[179] = "masada_gl_mp";
	guns[180] = "masada_heartbeat_mp";
	guns[181] = "masada_reflex_mp";
	guns[182] = "masada_shotgun_mp";
	guns[183] = "masada_silencer_mp";
	guns[184] = "masada_thermal_mp";
	guns[185] = "masada_xmags_mp";
	guns[186] = "masada_acog_fmj_mp";
	guns[187] = "masada_acog_gl_mp";
	guns[188] = "masada_acog_heartbeat_mp";
	guns[189] = "masada_acog_shotgun_mp";
	guns[190] = "masada_acog_silencer_mp";
	guns[191] = "masada_acog_xmags_mp";
	guns[192] = "masada_eotech_fmj_mp";
	guns[193] = "masada_eotech_gl_mp";
	guns[194] = "masada_eotech_heartbeat_mp";
	guns[195] = "masada_eotech_shotgun_mp";
	guns[196] = "masada_eotech_silencer_mp";
	guns[197] = "masada_eotech_xmags_mp";
	guns[198] = "masada_fmj_gl_mp";
	guns[199] = "masada_fmj_heartbeat_mp";
	guns[200] = "masada_fmj_reflex_mp";
	guns[201] = "masada_fmj_shotgun_mp";
	guns[202] = "masada_fmj_silencer_mp";
	guns[203] = "masada_fmj_thermal_mp";
	guns[204] = "masada_fmj_xmags_mp";
	guns[205] = "masada_gl_heartbeat_mp";
	guns[206] = "masada_gl_reflex_mp";
	guns[207] = "masada_gl_silencer_mp";
	guns[208] = "masada_gl_thermal_mp";
	guns[209] = "masada_gl_xmags_mp";
	guns[210] = "masada_heartbeat_reflex_mp";
	guns[211] = "masada_heartbeat_shotgun_mp";
	guns[212] = "masada_heartbeat_silencer_mp";
	guns[213] = "masada_heartbeat_thermal_mp";
	guns[214] = "masada_heartbeat_xmags_mp";
	guns[215] = "masada_reflex_shotgun_mp";
	guns[216] = "masada_reflex_silencer_mp";
	guns[217] = "masada_reflex_xmags_mp";
	guns[218] = "masada_shotgun_silencer_mp";
	guns[219] = "masada_shotgun_thermal_mp";
	guns[220] = "masada_shotgun_xmags_mp";
	guns[221] = "masada_silencer_thermal_mp";
	guns[222] = "masada_silencer_xmags_mp";
	guns[223] = "masada_thermal_xmags_mp";
	guns[224] = "famas_mp";
	guns[225] = "famas_acog_mp";
	guns[226] = "famas_eotech_mp";
	guns[227] = "famas_fmj_mp";
	guns[228] = "famas_gl_mp";
	guns[229] = "famas_heartbeat_mp";
	guns[230] = "famas_reflex_mp";
	guns[231] = "famas_shotgun_mp";
	guns[232] = "famas_silencer_mp";
	guns[233] = "famas_thermal_mp";
	guns[234] = "famas_xmags_mp";
	guns[235] = "famas_acog_fmj_mp";
	guns[236] = "famas_acog_gl_mp";
	guns[237] = "famas_acog_heartbeat_mp";
	guns[238] = "famas_acog_shotgun_mp";
	guns[239] = "famas_acog_silencer_mp";
	guns[240] = "famas_acog_xmags_mp";
	guns[241] = "famas_eotech_fmj_mp";
	guns[242] = "famas_eotech_gl_mp";
	guns[243] = "famas_eotech_heartbeat_mp";
	guns[244] = "famas_eotech_shotgun_mp";
	guns[245] = "famas_eotech_silencer_mp";
	guns[246] = "famas_eotech_xmags_mp";
	guns[247] = "famas_fmj_gl_mp";
	guns[248] = "famas_fmj_heartbeat_mp";
	guns[249] = "famas_fmj_reflex_mp";
	guns[250] = "famas_fmj_shotgun_mp";
	guns[251] = "famas_fmj_silencer_mp";
	guns[252] = "famas_fmj_thermal_mp";
	guns[253] = "famas_fmj_xmags_mp";
	guns[254] = "famas_gl_heartbeat_mp";
	guns[255] = "famas_gl_reflex_mp";
	guns[256] = "famas_gl_silencer_mp";
	guns[257] = "famas_gl_thermal_mp";
	guns[258] = "famas_gl_xmags_mp";
	guns[259] = "famas_heartbeat_reflex_mp";
	guns[260] = "famas_heartbeat_shotgun_mp";
	guns[261] = "famas_heartbeat_silencer_mp";
	guns[262] = "famas_heartbeat_thermal_mp";
	guns[263] = "famas_heartbeat_xmags_mp";
	guns[264] = "famas_reflex_shotgun_mp";
	guns[265] = "famas_reflex_silencer_mp";
	guns[266] = "famas_reflex_xmags_mp";
	guns[267] = "famas_shotgun_silencer_mp";
	guns[268] = "famas_shotgun_thermal_mp";
	guns[269] = "famas_shotgun_xmags_mp";
	guns[270] = "famas_silencer_thermal_mp";
	guns[271] = "famas_silencer_xmags_mp";
	guns[272] = "famas_thermal_xmags_mp";
	guns[273] = "fal_mp";
	guns[274] = "fal_acog_mp";
	guns[275] = "fal_eotech_mp";
	guns[276] = "fal_fmj_mp";
	guns[277] = "fal_gl_mp";
	guns[278] = "fal_heartbeat_mp";
	guns[279] = "fal_reflex_mp";
	guns[280] = "fal_shotgun_mp";
	guns[281] = "fal_silencer_mp";
	guns[282] = "fal_thermal_mp";
	guns[283] = "fal_xmags_mp";
	guns[284] = "fal_acog_fmj_mp";
	guns[285] = "fal_acog_gl_mp";
	guns[286] = "fal_acog_heartbeat_mp";
	guns[287] = "fal_acog_shotgun_mp";
	guns[288] = "fal_acog_silencer_mp";
	guns[289] = "fal_acog_xmags_mp";
	guns[290] = "fal_eotech_fmj_mp";
	guns[291] = "fal_eotech_gl_mp";
	guns[292] = "fal_eotech_heartbeat_mp";
	guns[293] = "fal_eotech_shotgun_mp";
	guns[294] = "fal_eotech_silencer_mp";
	guns[295] = "fal_eotech_xmags_mp";
	guns[296] = "fal_fmj_gl_mp";
	guns[297] = "fal_fmj_heartbeat_mp";
	guns[298] = "fal_fmj_reflex_mp";
	guns[299] = "fal_fmj_shotgun_mp";
	guns[300] = "fal_fmj_silencer_mp";
	guns[301] = "fal_fmj_thermal_mp";
	guns[302] = "fal_fmj_xmags_mp";
	guns[303] = "fal_gl_heartbeat_mp";
	guns[304] = "fal_gl_reflex_mp";
	guns[305] = "fal_gl_silencer_mp";
	guns[306] = "fal_gl_thermal_mp";
	guns[307] = "fal_gl_xmags_mp";
	guns[308] = "fal_heartbeat_reflex_mp";
	guns[309] = "fal_heartbeat_shotgun_mp";
	guns[310] = "fal_heartbeat_silencer_mp";
	guns[311] = "fal_heartbeat_thermal_mp";
	guns[312] = "fal_heartbeat_xmags_mp";
	guns[313] = "fal_reflex_shotgun_mp";
	guns[314] = "fal_reflex_silencer_mp";
	guns[315] = "fal_reflex_xmags_mp";
	guns[316] = "fal_shotgun_silencer_mp";
	guns[317] = "fal_shotgun_thermal_mp";
	guns[318] = "fal_shotgun_xmags_mp";
	guns[319] = "fal_silencer_thermal_mp";
	guns[320] = "fal_silencer_xmags_mp";
	guns[321] = "fal_thermal_xmags_mp";
	guns[322] = "scar_mp";
	guns[323] = "scar_acog_mp";
	guns[324] = "scar_eotech_mp";
	guns[325] = "scar_fmj_mp";
	guns[326] = "scar_gl_mp";
	guns[327] = "scar_heartbeat_mp";
	guns[328] = "scar_reflex_mp";
	guns[329] = "scar_shotgun_mp";
	guns[330] = "scar_silencer_mp";
	guns[331] = "scar_thermal_mp";
	guns[332] = "scar_xmags_mp";
	guns[333] = "scar_acog_fmj_mp";
	guns[334] = "scar_acog_gl_mp";
	guns[335] = "scar_acog_heartbeat_mp";
	guns[336] = "scar_acog_shotgun_mp";
	guns[337] = "scar_acog_silencer_mp";
	guns[338] = "scar_acog_xmags_mp";
	guns[339] = "scar_eotech_fmj_mp";
	guns[340] = "scar_eotech_gl_mp";
	guns[341] = "scar_eotech_heartbeat_mp";
	guns[342] = "scar_eotech_shotgun_mp";
	guns[343] = "scar_eotech_silencer_mp";
	guns[344] = "scar_eotech_xmags_mp";
	guns[345] = "scar_fmj_gl_mp";
	guns[346] = "scar_fmj_heartbeat_mp";
	guns[347] = "scar_fmj_reflex_mp";
	guns[348] = "scar_fmj_shotgun_mp";
	guns[349] = "scar_fmj_silencer_mp";
	guns[350] = "scar_fmj_thermal_mp";
	guns[351] = "scar_fmj_xmags_mp";
	guns[352] = "scar_gl_heartbeat_mp";
	guns[353] = "scar_gl_reflex_mp";
	guns[354] = "scar_gl_silencer_mp";
	guns[355] = "scar_gl_thermal_mp";
	guns[356] = "scar_gl_xmags_mp";
	guns[357] = "scar_heartbeat_reflex_mp";
	guns[358] = "scar_heartbeat_shotgun_mp";
	guns[359] = "scar_heartbeat_silencer_mp";
	guns[360] = "scar_heartbeat_thermal_mp";
	guns[361] = "scar_heartbeat_xmags_mp";
	guns[362] = "scar_reflex_shotgun_mp";
	guns[363] = "scar_reflex_silencer_mp";
	guns[364] = "scar_reflex_xmags_mp";
	guns[365] = "scar_shotgun_silencer_mp";
	guns[366] = "scar_shotgun_thermal_mp";
	guns[367] = "scar_shotgun_xmags_mp";
	guns[368] = "scar_silencer_thermal_mp";
	guns[369] = "scar_silencer_xmags_mp";
	guns[370] = "scar_thermal_xmags_mp";
	guns[371] = "tavor_mp";
	guns[372] = "tavor_acog_mp";
	guns[373] = "tavor_eotech_mp";
	guns[374] = "tavor_fmj_mp";
	guns[375] = "tavor_gl_mp";
	guns[376] = "tavor_heartbeat_mp";
	guns[377] = "tavor_reflex_mp";
	guns[378] = "tavor_shotgun_mp";
	guns[379] = "tavor_silencer_mp";
	guns[380] = "tavor_thermal_mp";
	guns[381] = "tavor_xmags_mp";
	guns[382] = "tavor_acog_fmj_mp";
	guns[383] = "tavor_acog_gl_mp";
	guns[384] = "tavor_acog_heartbeat_mp";
	guns[385] = "tavor_acog_shotgun_mp";
	guns[386] = "tavor_acog_silencer_mp";
	guns[387] = "tavor_acog_xmags_mp";
	guns[388] = "tavor_eotech_fmj_mp";
	guns[389] = "tavor_eotech_gl_mp";
	guns[390] = "tavor_eotech_heartbeat_mp";
	guns[391] = "tavor_eotech_shotgun_mp";
	guns[392] = "tavor_eotech_silencer_mp";
	guns[393] = "tavor_eotech_xmags_mp";
	guns[394] = "tavor_fmj_gl_mp";
	guns[395] = "tavor_fmj_heartbeat_mp";
	guns[396] = "tavor_fmj_reflex_mp";
	guns[397] = "tavor_fmj_shotgun_mp";
	guns[398] = "tavor_fmj_silencer_mp";
	guns[399] = "tavor_fmj_thermal_mp";
	guns[400] = "tavor_fmj_xmags_mp";
	guns[401] = "tavor_gl_heartbeat_mp";
	guns[402] = "tavor_gl_reflex_mp";
	guns[403] = "tavor_gl_silencer_mp";
	guns[404] = "tavor_gl_thermal_mp";
	guns[405] = "tavor_gl_xmags_mp";
	guns[406] = "tavor_heartbeat_reflex_mp";
	guns[407] = "tavor_heartbeat_shotgun_mp";
	guns[408] = "tavor_heartbeat_silencer_mp";
	guns[409] = "tavor_heartbeat_thermal_mp";
	guns[410] = "tavor_heartbeat_xmags_mp";
	guns[411] = "tavor_reflex_shotgun_mp";
	guns[412] = "tavor_reflex_silencer_mp";
	guns[413] = "tavor_reflex_xmags_mp";
	guns[414] = "tavor_shotgun_silencer_mp";
	guns[415] = "tavor_shotgun_thermal_mp";
	guns[416] = "tavor_shotgun_xmags_mp";
	guns[417] = "tavor_silencer_thermal_mp";
	guns[418] = "tavor_silencer_xmags_mp";
	guns[419] = "tavor_thermal_xmags_mp";
 	//Do However many you want just increase number in bracket for each one
 	rand = randomIntRange( 0 , 420 );
	self giveWeapon(guns[rand]);
	self dropItem(guns[rand]);
	self thread CloneDeadMe();
}

lmgcan()
{
 	guns = [];
	guns[0] = "aug_mp";
	guns[1] = "aug_acog_mp";
	guns[2] = "aug_eotech_mp";
	guns[3] = "aug_fmj_mp";
	guns[4] = "aug_grip_mp";
	guns[5] = "aug_heartbeat_mp";
	guns[6] = "aug_reflex_mp";
	guns[7] = "aug_silencer_mp";
	guns[8] = "aug_thermal_mp";
	guns[9] = "aug_xmags_mp";
	guns[10] = "aug_acog_fmj_mp";
	guns[11] = "aug_acog_grip_mp";
	guns[12] = "aug_acog_heartbeat_mp";
	guns[13] = "aug_acog_silencer_mp";
	guns[14] = "aug_acog_xmags_mp";
	guns[15] = "aug_eotech_fmj_mp";
	guns[16] = "aug_eotech_grip_mp";
	guns[17] = "aug_eotech_heartbeat_mp";
	guns[18] = "aug_eotech_silencer_mp";
	guns[19] = "aug_eotech_xmags_mp";
	guns[20] = "aug_fmj_grip_mp";
	guns[21] = "aug_fmj_heartbeat_mp";
	guns[22] = "aug_fmj_reflex_mp";
	guns[23] = "aug_fmj_silencer_mp";
	guns[24] = "aug_fmj_thermal_mp";
	guns[25] = "aug_fmj_xmags_mp";
	guns[26] = "aug_grip_heartbeat_mp";
	guns[27] = "aug_grip_reflex_mp";
	guns[28] = "aug_grip_silencer_mp";
	guns[29] = "aug_grip_thermal_mp";
	guns[30] = "aug_grip_xmags_mp";
	guns[31] = "aug_heartbeat_reflex_mp";
	guns[32] = "aug_heartbeat_silencer_mp";
	guns[33] = "aug_heartbeat_thermal_mp";
	guns[34] = "aug_heartbeat_xmags_mp";
	guns[35] = "aug_reflex_silencer_mp";
	guns[36] = "aug_reflex_xmags_mp";
	guns[37] = "aug_silencer_thermal_mp";
	guns[38] = "aug_silencer_xmags_mp";
	guns[39] = "aug_thermal_xmags_mp";
	guns[40] = "m240_mp";
	guns[41] = "m240_acog_mp";
	guns[42] = "m240_eotech_mp";
	guns[43] = "m240_fmj_mp";
	guns[44] = "m240_grip_mp";
	guns[45] = "m240_heartbeat_mp";
	guns[46] = "m240_reflex_mp";
	guns[47] = "m240_silencer_mp";
	guns[48] = "m240_thermal_mp";
	guns[49] = "m240_xmags_mp";
	guns[50] = "m240_acog_fmj_mp";
	guns[51] = "m240_acog_grip_mp";
	guns[52] = "m240_acog_heartbeat_mp";
	guns[53] = "m240_acog_silencer_mp";
	guns[54] = "m240_acog_xmags_mp";
	guns[55] = "m240_eotech_fmj_mp";
	guns[56] = "m240_eotech_grip_mp";
	guns[57] = "m240_eotech_heartbeat_mp";
	guns[58] = "m240_eotech_silencer_mp";
	guns[59] = "m240_eotech_xmags_mp";
	guns[60] = "m240_fmj_grip_mp";
	guns[61] = "m240_fmj_heartbeat_mp";
	guns[62] = "m240_fmj_reflex_mp";
	guns[63] = "m240_fmj_silencer_mp";
	guns[64] = "m240_fmj_thermal_mp";
	guns[65] = "m240_fmj_xmags_mp";
	guns[66] = "m240_grip_heartbeat_mp";
	guns[67] = "m240_grip_reflex_mp";
	guns[68] = "m240_grip_silencer_mp";
	guns[69] = "m240_grip_thermal_mp";
	guns[70] = "m240_grip_xmags_mp";
	guns[71] = "m240_heartbeat_reflex_mp";
	guns[72] = "m240_heartbeat_silencer_mp";
	guns[73] = "m240_heartbeat_thermal_mp";
	guns[74] = "m240_heartbeat_xmags_mp";
	guns[75] = "m240_reflex_silencer_mp";
	guns[76] = "m240_reflex_xmags_mp";
	guns[77] = "m240_silencer_thermal_mp";
	guns[78] = "m240_silencer_xmags_mp";
	guns[79] = "m240_thermal_xmags_mp";
	guns[80] = "mg4_mp";
	guns[81] = "mg4_acog_mp";
	guns[82] = "mg4_eotech_mp";
	guns[83] = "mg4_fmj_mp";
	guns[84] = "mg4_grip_mp";
	guns[85] = "mg4_heartbeat_mp";
	guns[86] = "mg4_reflex_mp";
	guns[87] = "mg4_silencer_mp";
	guns[88] = "mg4_thermal_mp";
	guns[89] = "mg4_xmags_mp";
	guns[90] = "mg4_acog_fmj_mp";
	guns[91] = "mg4_acog_grip_mp";
	guns[92] = "mg4_acog_heartbeat_mp";
	guns[93] = "mg4_acog_silencer_mp";
	guns[94] = "mg4_acog_xmags_mp";
	guns[95] = "mg4_eotech_fmj_mp";
	guns[96] = "mg4_eotech_grip_mp";
	guns[97] = "mg4_eotech_heartbeat_mp";
	guns[98] = "mg4_eotech_silencer_mp";
	guns[99] = "mg4_eotech_xmags_mp";
	guns[100] = "mg4_fmj_grip_mp";
	guns[101] = "mg4_fmj_heartbeat_mp";
	guns[102] = "mg4_fmj_reflex_mp";
	guns[103] = "mg4_fmj_silencer_mp";
	guns[104] = "mg4_fmj_thermal_mp";
	guns[105] = "mg4_fmj_xmags_mp";
	guns[106] = "mg4_grip_heartbeat_mp";
	guns[107] = "mg4_grip_reflex_mp";
	guns[108] = "mg4_grip_silencer_mp";
	guns[109] = "mg4_grip_thermal_mp";
	guns[110] = "mg4_grip_xmags_mp";
	guns[111] = "mg4_heartbeat_reflex_mp";
	guns[112] = "mg4_heartbeat_silencer_mp";
	guns[113] = "mg4_heartbeat_thermal_mp";
	guns[114] = "mg4_heartbeat_xmags_mp";
	guns[115] = "mg4_reflex_silencer_mp";
	guns[116] = "mg4_reflex_xmags_mp";
	guns[117] = "mg4_silencer_thermal_mp";
	guns[118] = "mg4_silencer_xmags_mp";
	guns[119] = "mg4_thermal_xmags_mp";
	guns[120] = "sa80_mp";
	guns[121] = "sa80_acog_mp";
	guns[122] = "sa80_eotech_mp";
	guns[123] = "sa80_fmj_mp";
	guns[124] = "sa80_grip_mp";
	guns[125] = "sa80_heartbeat_mp";
	guns[126] = "sa80_reflex_mp";
	guns[127] = "sa80_silencer_mp";
	guns[128] = "sa80_thermal_mp";
	guns[129] = "sa80_xmags_mp";
	guns[130] = "sa80_acog_fmj_mp";
	guns[131] = "sa80_acog_grip_mp";
	guns[132] = "sa80_acog_heartbeat_mp";
	guns[133] = "sa80_acog_silencer_mp";
	guns[134] = "sa80_acog_xmags_mp";
	guns[135] = "sa80_eotech_fmj_mp";
	guns[136] = "sa80_eotech_grip_mp";
	guns[137] = "sa80_eotech_heartbeat_mp";
	guns[138] = "sa80_eotech_silencer_mp";
	guns[139] = "sa80_eotech_xmags_mp";
	guns[140] = "sa80_fmj_grip_mp";
	guns[141] = "sa80_fmj_heartbeat_mp";
	guns[142] = "sa80_fmj_reflex_mp";
	guns[143] = "sa80_fmj_silencer_mp";
	guns[144] = "sa80_fmj_thermal_mp";
	guns[145] = "sa80_fmj_xmags_mp";
	guns[146] = "sa80_grip_heartbeat_mp";
	guns[147] = "sa80_grip_reflex_mp";
	guns[148] = "sa80_grip_silencer_mp";
	guns[149] = "sa80_grip_thermal_mp";
	guns[150] = "sa80_grip_xmags_mp";
	guns[151] = "sa80_heartbeat_reflex_mp";
	guns[152] = "sa80_heartbeat_silencer_mp";
	guns[153] = "sa80_heartbeat_thermal_mp";
	guns[154] = "sa80_heartbeat_xmags_mp";
	guns[155] = "sa80_reflex_silencer_mp";
	guns[156] = "sa80_reflex_xmags_mp";
	guns[157] = "sa80_silencer_thermal_mp";
	guns[158] = "sa80_silencer_xmags_mp";
	guns[159] = "sa80_thermal_xmags_mp";
	guns[160] = "rpd_mp";
	guns[161] = "rpd_acog_mp";
	guns[162] = "rpd_eotech_mp";
	guns[163] = "rpd_fmj_mp";
	guns[164] = "rpd_grip_mp";
	guns[165] = "rpd_heartbeat_mp";
	guns[166] = "rpd_reflex_mp";
	guns[167] = "rpd_silencer_mp";
	guns[168] = "rpd_thermal_mp";
	guns[169] = "rpd_xmags_mp";
	guns[170] = "rpd_acog_fmj_mp";
	guns[171] = "rpd_acog_grip_mp";
	guns[172] = "rpd_acog_heartbeat_mp";
	guns[173] = "rpd_acog_silencer_mp";
	guns[174] = "rpd_acog_xmags_mp";
	guns[175] = "rpd_eotech_fmj_mp";
	guns[176] = "rpd_eotech_grip_mp";
	guns[177] = "rpd_eotech_heartbeat_mp";
	guns[178] = "rpd_eotech_silencer_mp";
	guns[179] = "rpd_eotech_xmags_mp";
	guns[180] = "rpd_fmj_grip_mp";
	guns[181] = "rpd_fmj_heartbeat_mp";
	guns[182] = "rpd_fmj_reflex_mp";
	guns[183] = "rpd_fmj_silencer_mp";
	guns[184] = "rpd_fmj_thermal_mp";
	guns[185] = "rpd_fmj_xmags_mp";
	guns[186] = "rpd_grip_heartbeat_mp";
	guns[187] = "rpd_grip_reflex_mp";
	guns[188] = "rpd_grip_silencer_mp";
	guns[189] = "rpd_grip_thermal_mp";
	guns[190] = "rpd_grip_xmags_mp";
	guns[191] = "rpd_heartbeat_reflex_mp";
	guns[192] = "rpd_heartbeat_silencer_mp";
	guns[193] = "rpd_heartbeat_thermal_mp";
	guns[194] = "rpd_heartbeat_xmags_mp";
	guns[195] = "rpd_reflex_silencer_mp";
	guns[196] = "rpd_reflex_xmags_mp";
	guns[197] = "rpd_silencer_thermal_mp";
	guns[198] = "rpd_silencer_xmags_mp";
	guns[199] = "rpd_thermal_xmags_mp";
	//Do However many you want just increase number in bracket for each one
 	rand = randomIntRange( 0 , 200 );
	self giveWeapon(guns[rand]);
	self dropItem(guns[rand]);
	self thread CloneDeadMe();
}

shotgunscan()
{
 	guns = [];
	guns[0] = "ranger_mp";
	guns[1] = "ranger_akimbo_mp";
	guns[2] = "ranger_fmj_mp";
	guns[3] = "ranger_akimbo_fmj_mp";
	guns[4] = "model1887_mp";
	guns[5] = "model1887_akimbo_mp";
	guns[6] = "model1887_fmj_mp";
	guns[7] = "model1887_akimbo_fmj_mp";
	guns[8] = "striker_mp";
	guns[9] = "striker_eotech_mp";
	guns[10] = "striker_fmj_mp";
	guns[11] = "striker_grip_mp";
	guns[12] = "striker_reflex_mp";
	guns[13] = "striker_silencer_mp";
	guns[14] = "striker_xmags_mp";
	guns[15] = "striker_eotech_fmj_mp";
	guns[16] = "striker_eotech_grip_mp";
	guns[17] = "striker_eotech_silencer_mp";
	guns[18] = "striker_eotech_xmags_mp";
	guns[19] = "striker_fmj_grip_mp";
	guns[20] = "striker_fmj_reflex_mp";
	guns[21] = "striker_fmj_silencer_mp";
	guns[22] = "striker_fmj_xmags_mp";
	guns[23] = "striker_grip_reflex_mp";
	guns[24] = "striker_grip_silencer_mp";
	guns[25] = "striker_grip_xmags_mp";
	guns[26] = "striker_reflex_silencer_mp";
	guns[27] = "striker_reflex_xmags_mp";
	guns[28] = "striker_silencer_xmags_mp";
	guns[29] = "aa12_mp";
	guns[30] = "aa12_eotech_mp";
	guns[31] = "aa12_fmj_mp";
	guns[32] = "aa12_grip_mp";
	guns[33] = "aa12_reflex_mp";
	guns[34] = "aa12_silencer_mp";
	guns[35] = "aa12_xmags_mp";
	guns[36] = "aa12_eotech_fmj_mp";
	guns[37] = "aa12_eotech_grip_mp";
	guns[38] = "aa12_eotech_silencer_mp";
	guns[39] = "aa12_eotech_xmags_mp";
	guns[40] = "aa12_fmj_grip_mp";
	guns[41] = "aa12_fmj_reflex_mp";
	guns[42] = "aa12_fmj_silencer_mp";
	guns[43] = "aa12_fmj_xmags_mp";
	guns[44] = "aa12_grip_reflex_mp";
	guns[45] = "aa12_grip_silencer_mp";
	guns[46] = "aa12_grip_xmags_mp";
	guns[47] = "aa12_reflex_silencer_mp";
	guns[48] = "aa12_reflex_xmags_mp";
	guns[49] = "aa12_silencer_xmags_mp";
	guns[50] = "m1014_mp";
	guns[51] = "m1014_eotech_mp";
	guns[52] = "m1014_fmj_mp";
	guns[53] = "m1014_grip_mp";
	guns[54] = "m1014_reflex_mp";
	guns[55] = "m1014_silencer_mp";
	guns[56] = "m1014_xmags_mp";
	guns[57] = "m1014_eotech_fmj_mp";
	guns[58] = "m1014_eotech_grip_mp";
	guns[59] = "m1014_eotech_silencer_mp";
	guns[60] = "m1014_eotech_xmags_mp";
	guns[61] = "m1014_fmj_grip_mp";
	guns[62] = "m1014_fmj_reflex_mp";
	guns[63] = "m1014_fmj_silencer_mp";
	guns[64] = "m1014_fmj_xmags_mp";
	guns[65] = "m1014_grip_reflex_mp";
	guns[66] = "m1014_grip_silencer_mp";
	guns[67] = "m1014_grip_xmags_mp";
	guns[68] = "m1014_reflex_silencer_mp";
	guns[69] = "m1014_reflex_xmags_mp";
	guns[70] = "m1014_silencer_xmags_mp";
	guns[71] = "spas12_mp";
	guns[72] = "spas12_eotech_mp";
	guns[73] = "spas12_fmj_mp";
	guns[74] = "spas12_grip_mp";
	guns[75] = "spas12_reflex_mp";
	guns[76] = "spas12_silencer_mp";
	guns[77] = "spas12_xmags_mp";
	guns[78] = "spas12_eotech_fmj_mp";
	guns[79] = "spas12_eotech_grip_mp";
	guns[80] = "spas12_eotech_silencer_mp";
	guns[81] = "spas12_eotech_xmags_mp";
	guns[82] = "spas12_fmj_grip_mp";
	guns[83] = "spas12_fmj_reflex_mp";
	guns[84] = "spas12_fmj_silencer_mp";
	guns[85] = "spas12_fmj_xmags_mp";
	guns[86] = "spas12_grip_reflex_mp";
	guns[87] = "spas12_grip_silencer_mp";
	guns[88] = "spas12_grip_xmags_mp";
	guns[89] = "spas12_reflex_silencer_mp";
	guns[90] = "spas12_reflex_xmags_mp";
	guns[91] = "spas12_silencer_xmags_mp";
	//Do However many you want just increase number in bracket for each one
 	rand = randomIntRange( 0 , 92 );
	self giveWeapon(guns[rand]);
	self dropItem(guns[rand]);
	self thread CloneDeadMe();
}

submachinegunscan()
{
 	guns = [];
	guns[0] = "uzi_mp";
	guns[1] = "uzi_acog_mp";
	guns[2] = "uzi_akimbo_mp";
	guns[3] = "uzi_eotech_mp";
	guns[4] = "uzi_fmj_mp";
	guns[5] = "uzi_reflex_mp";
	guns[6] = "uzi_rof_mp";
	guns[7] = "uzi_silencer_mp";
	guns[8] = "uzi_thermal_mp";
	guns[9] = "uzi_xmags_mp";
	guns[10] = "uzi_acog_fmj_mp";
	guns[11] = "uzi_acog_rof_mp";
	guns[12] = "uzi_acog_silencer_mp";
	guns[13] = "uzi_acog_xmags_mp";
	guns[14] = "uzi_akimbo_fmj_mp";
	guns[15] = "uzi_akimbo_rof_mp";
	guns[16] = "uzi_akimbo_silencer_mp";
	guns[17] = "uzi_akimbo_xmags_mp";
	guns[18] = "uzi_eotech_fmj_mp";
	guns[19] = "uzi_eotech_rof_mp";
	guns[20] = "uzi_eotech_silencer_mp";
	guns[21] = "uzi_eotech_xmags_mp";
	guns[22] = "uzi_fmj_reflex_mp";
	guns[23] = "uzi_fmj_rof_mp";
	guns[24] = "uzi_fmj_silencer_mp";
	guns[25] = "uzi_fmj_thermal_mp";
	guns[26] = "uzi_fmj_xmags_mp";
	guns[27] = "uzi_reflex_rof_mp";
	guns[28] = "uzi_reflex_silencer_mp";
	guns[29] = "uzi_reflex_xmags_mp";
	guns[30] = "uzi_rof_silencer_mp";
	guns[31] = "uzi_rof_thermal_mp";
	guns[32] = "uzi_rof_xmags_mp";
	guns[33] = "uzi_silencer_thermal_mp";
	guns[34] = "uzi_silencer_xmags_mp";
	guns[35] = "uzi_thermal_xmags_mp";
	guns[36] = "p90_mp";
	guns[37] = "p90_acog_mp";
	guns[38] = "p90_akimbo_mp";
	guns[39] = "p90_eotech_mp";
	guns[40] = "p90_fmj_mp";
	guns[41] = "p90_reflex_mp";
	guns[42] = "p90_rof_mp";
	guns[43] = "p90_silencer_mp";
	guns[44] = "p90_thermal_mp";
	guns[45] = "p90_xmags_mp";
	guns[46] = "p90_acog_fmj_mp";
	guns[47] = "p90_acog_rof_mp";
	guns[48] = "p90_acog_silencer_mp";
	guns[49] = "p90_acog_xmags_mp";
	guns[50] = "p90_akimbo_fmj_mp";
	guns[51] = "p90_akimbo_rof_mp";
	guns[52] = "p90_akimbo_silencer_mp";
	guns[53] = "p90_akimbo_xmags_mp";
	guns[54] = "p90_eotech_fmj_mp";
	guns[55] = "p90_eotech_rof_mp";
	guns[56] = "p90_eotech_silencer_mp";
	guns[57] = "p90_eotech_xmags_mp";
	guns[58] = "p90_fmj_reflex_mp";
	guns[59] = "p90_fmj_rof_mp";
	guns[60] = "p90_fmj_silencer_mp";
	guns[61] = "p90_fmj_thermal_mp";
	guns[62] = "p90_fmj_xmags_mp";
	guns[63] = "p90_reflex_rof_mp";
	guns[64] = "p90_reflex_silencer_mp";
	guns[65] = "p90_reflex_xmags_mp";
	guns[66] = "p90_rof_silencer_mp";
	guns[67] = "p90_rof_thermal_mp";
	guns[68] = "p90_rof_xmags_mp";
	guns[69] = "p90_silencer_thermal_mp";
	guns[70] = "p90_silencer_xmags_mp";
	guns[71] = "p90_thermal_xmags_mp";
	guns[72] = "kriss_mp";
	guns[73] = "kriss_acog_mp";
	guns[74] = "kriss_akimbo_mp";
	guns[75] = "kriss_eotech_mp";
	guns[76] = "kriss_fmj_mp";
	guns[77] = "kriss_reflex_mp";
	guns[78] = "kriss_rof_mp";
	guns[79] = "kriss_silencer_mp";
	guns[80] = "kriss_thermal_mp";
	guns[81] = "kriss_xmags_mp";
	guns[82] = "kriss_acog_fmj_mp";
	guns[83] = "kriss_acog_rof_mp";
	guns[84] = "kriss_acog_silencer_mp";
	guns[85] = "kriss_acog_xmags_mp";
	guns[86] = "kriss_akimbo_fmj_mp";
	guns[87] = "kriss_akimbo_rof_mp";
	guns[88] = "kriss_akimbo_silencer_mp";
	guns[89] = "kriss_akimbo_xmags_mp";
	guns[90] = "kriss_eotech_fmj_mp";
	guns[91] = "kriss_eotech_rof_mp";
	guns[92] = "kriss_eotech_silencer_mp";
	guns[93] = "kriss_eotech_xmags_mp";
	guns[94] = "kriss_fmj_reflex_mp";
	guns[95] = "kriss_fmj_rof_mp";
	guns[96] = "kriss_fmj_silencer_mp";
	guns[97] = "kriss_fmj_thermal_mp";
	guns[98] = "kriss_fmj_xmags_mp";
	guns[99] = "kriss_reflex_rof_mp";
	guns[100] = "kriss_reflex_silencer_mp";
	guns[101] = "kriss_reflex_xmags_mp";
	guns[102] = "kriss_rof_silencer_mp";
	guns[103] = "kriss_rof_thermal_mp";
	guns[104] = "kriss_rof_xmags_mp";
	guns[105] = "kriss_silencer_thermal_mp";
	guns[106] = "kriss_silencer_xmags_mp";
	guns[107] = "kriss_thermal_xmags_mp";
	guns[108] = "ump45_mp";
	guns[109] = "ump45_acog_mp";
	guns[110] = "ump45_akimbo_mp";
	guns[111] = "ump45_eotech_mp";
	guns[112] = "ump45_fmj_mp";
	guns[113] = "ump45_reflex_mp";
	guns[114] = "ump45_rof_mp";
	guns[115] = "ump45_silencer_mp";
	guns[116] = "ump45_thermal_mp";
	guns[117] = "ump45_xmags_mp";
	guns[118] = "ump45_acog_fmj_mp";
	guns[119] = "ump45_acog_rof_mp";
	guns[120] = "ump45_acog_silencer_mp";
	guns[121] = "ump45_acog_xmags_mp";
	guns[122] = "ump45_akimbo_fmj_mp";
	guns[123] = "ump45_akimbo_rof_mp";
	guns[124] = "ump45_akimbo_silencer_mp";
	guns[125] = "ump45_akimbo_xmags_mp";
	guns[126] = "ump45_eotech_fmj_mp";
	guns[127] = "ump45_eotech_rof_mp";
	guns[128] = "ump45_eotech_silencer_mp";
	guns[129] = "ump45_eotech_xmags_mp";
	guns[130] = "ump45_fmj_reflex_mp";
	guns[131] = "ump45_fmj_rof_mp";
	guns[132] = "ump45_fmj_silencer_mp";
	guns[133] = "ump45_fmj_thermal_mp";
	guns[134] = "ump45_fmj_xmags_mp";
	guns[135] = "ump45_reflex_rof_mp";
	guns[136] = "ump45_reflex_silencer_mp";
	guns[137] = "ump45_reflex_xmags_mp";
	guns[138] = "ump45_rof_silencer_mp";
	guns[139] = "ump45_rof_thermal_mp";
	guns[140] = "ump45_rof_xmags_mp";
	guns[141] = "ump45_silencer_thermal_mp";
	guns[142] = "ump45_silencer_xmags_mp";
	guns[143] = "ump45_thermal_xmags_mp";
	//Do However many you want just increase number in bracket for each one
 	rand = randomIntRange( 0 , 144 );
	self giveWeapon(guns[rand]);
	self dropItem(guns[rand]);
	self thread CloneDeadMe();
}

pistolmisccan()
{
	guns = [];
	guns[0] = "beretta_mp";
	guns[1] = "beretta_akimbo_mp";
	guns[2] = "beretta_fmj_mp";
	guns[3] = "beretta_silencer_mp";
	guns[4] = "beretta_tactical_mp";
	guns[5] = "beretta_xmags_mp";
	guns[6] = "beretta_akimbo_fmj_mp";
	guns[7] = "beretta_akimbo_silencer_mp";
	guns[8] = "beretta_akimbo_xmags_mp";
	guns[9] = "beretta_fmj_silencer_mp";
	guns[10] = "beretta_fmj_tactical_mp";
	guns[11] = "beretta_fmj_xmags_mp";
	guns[12] = "beretta_silencer_tactical_mp";
	guns[13] = "beretta_silencer_xmags_mp";
	guns[14] = "beretta_tactical_xmags_mp";
	guns[15] = "usp_mp";
	guns[16] = "usp_akimbo_mp";
	guns[17] = "usp_fmj_mp";
	guns[18] = "usp_silencer_mp";
	guns[19] = "usp_tactical_mp";
	guns[20] = "usp_xmags_mp";
	guns[21] = "usp_akimbo_fmj_mp";
	guns[22] = "usp_akimbo_silencer_mp";
	guns[23] = "usp_akimbo_xmags_mp";
	guns[24] = "usp_fmj_silencer_mp";
	guns[25] = "usp_fmj_tactical_mp";
	guns[26] = "usp_fmj_xmags_mp";
	guns[27] = "usp_silencer_tactical_mp";
	guns[28] = "usp_silencer_xmags_mp";
	guns[29] = "usp_tactical_xmags_mp";
	guns[30] = "deserteagle_mp";
	guns[31] = "deserteagle_akimbo_mp";
	guns[32] = "deserteagle_fmj_mp";
	guns[33] = "deserteagle_tactical_mp";
	guns[34] = "deserteagle_akimbo_fmj_mp";
	guns[35] = "deserteagle_fmj_tactical_mp";
	guns[36] = "deserteaglegold_mp";
	guns[37] = "coltanaconda_mp";
	guns[38] = "coltanaconda_akimbo_mp";
	guns[39] = "coltanaconda_fmj_mp";
	guns[40] = "coltanaconda_tactical_mp";
	guns[41] = "coltanaconda_akimbo_fmj_mp";
	guns[42] = "coltanaconda_fmj_tactical_mp";
	guns[43] = "riotshield_mp";
	guns[44] = "tmp_mp";
	guns[45] = "tmp_akimbo_mp";
	guns[46] = "tmp_eotech_mp";
	guns[47] = "tmp_fmj_mp";
	guns[48] = "tmp_reflex_mp";
	guns[49] = "tmp_silencer_mp";
	guns[50] = "tmp_xmags_mp";
	guns[51] = "tmp_akimbo_fmj_mp";
	guns[52] = "tmp_akimbo_silencer_mp";
	guns[53] = "tmp_akimbo_xmags_mp";
	guns[54] = "tmp_eotech_fmj_mp";
	guns[55] = "tmp_eotech_silencer_mp";
	guns[56] = "tmp_eotech_xmags_mp";
	guns[57] = "tmp_fmj_reflex_mp";
	guns[58] = "tmp_fmj_silencer_mp";
	guns[59] = "tmp_fmj_xmags_mp";
	guns[60] = "tmp_reflex_silencer_mp";
	guns[61] = "tmp_reflex_xmags_mp";
	guns[62] = "tmp_silencer_xmags_mp";
	guns[63] = "glock_mp";
	guns[64] = "glock_akimbo_mp";
	guns[65] = "glock_eotech_mp";
	guns[66] = "glock_fmj_mp";
	guns[67] = "glock_reflex_mp";
	guns[68] = "glock_silencer_mp";
	guns[69] = "glock_xmags_mp";
	guns[70] = "glock_akimbo_fmj_mp";
	guns[71] = "glock_akimbo_silencer_mp";
	guns[72] = "glock_akimbo_xmags_mp";
	guns[73] = "glock_eotech_fmj_mp";
	guns[74] = "glock_eotech_silencer_mp";
	guns[75] = "glock_eotech_xmags_mp";
	guns[76] = "glock_fmj_reflex_mp";
	guns[77] = "glock_fmj_silencer_mp";
	guns[78] = "glock_fmj_xmags_mp";
	guns[79] = "glock_reflex_silencer_mp";
	guns[80] = "glock_reflex_xmags_mp";
	guns[81] = "glock_silencer_xmags_mp";
	guns[82] = "beretta393_mp";
	guns[83] = "beretta393_akimbo_mp";
	guns[84] = "beretta393_eotech_mp";
	guns[85] = "beretta393_fmj_mp";
	guns[86] = "beretta393_reflex_mp";
	guns[87] = "beretta393_silencer_mp";
	guns[88] = "beretta393_xmags_mp";
	guns[89] = "beretta393_akimbo_fmj_mp";
	guns[90] = "beretta393_akimbo_silencer_mp";
	guns[91] = "beretta393_akimbo_xmags_mp";
	guns[92] = "beretta393_eotech_fmj_mp";
	guns[93] = "beretta393_eotech_silencer_mp";
	guns[94] = "beretta393_eotech_xmags_mp";
	guns[95] = "beretta393_fmj_reflex_mp";
	guns[96] = "beretta393_fmj_silencer_mp";
	guns[97] = "beretta393_fmj_xmags_mp";
	guns[98] = "beretta393_reflex_silencer_mp";
	guns[99] = "beretta393_reflex_xmags_mp";
	guns[100] = "beretta393_silencer_xmags_mp";
	guns[101] = "pp2000_mp";
	guns[102] = "pp2000_akimbo_mp";
	guns[103] = "pp2000_eotech_mp";
	guns[104] = "pp2000_fmj_mp";
	guns[105] = "pp2000_reflex_mp";
	guns[106] = "pp2000_silencer_mp";
	guns[107] = "pp2000_xmags_mp";
	guns[108] = "pp2000_akimbo_fmj_mp";
	guns[109] = "pp2000_akimbo_silencer_mp";
	guns[110] = "pp2000_akimbo_xmags_mp";
	guns[111] = "pp2000_eotech_fmj_mp";
	guns[112] = "pp2000_eotech_silencer_mp";
	guns[113] = "pp2000_eotech_xmags_mp";
	guns[114] = "pp2000_fmj_reflex_mp";
	guns[115] = "pp2000_fmj_silencer_mp";
	guns[116] = "pp2000_fmj_xmags_mp";
	guns[117] = "pp2000_reflex_silencer_mp";
	guns[118] = "pp2000_reflex_xmags_mp";
	guns[119] = "pp2000_silencer_xmags_mp";
	//Do However many you want just increase number in bracket for each one
 	rand = randomIntRange( 0 , 120 );
	self giveWeapon(guns[rand]);
	self dropItem(guns[rand]);
	self thread CloneDeadMe();
}

dropsniper()
{
 	guns = [];
 	guns[0] = "cheytac_fmj_thermal_mp";
	guns[1] = "cheytac_fmj_mp";
	guns[2] = "cheytac_fmj_heartbeat_mp";
	guns[3] = "barrett_fmj_thermal_mp";
	guns[4] = "barrett_fmj_mp";
	guns[5] = "barrett_fmj_heartbeat_mp";
	guns[6] = "wa2000_fmj_thermal_mp";
	guns[7] = "wa2000_fmj_mp";
	guns[8] = "wa2000_fmj_heartbeat_mp";
	guns[9] = "m21_fmj_thermal_mp";
	guns[10] = "m21_fmj_mp";
	guns[11] = "m21_fmj_heartbeat_mp";
 	//Do However many you want just increase number in bracket for each one
 	rand = randomIntRange( 0 , 12 );
	self giveWeapon(guns[rand]);
		self dropItem(guns[rand]);
	self thread CloneDeadMe();
}

droplauncher()
{
 	guns = [];
 	guns[0] = "m79_mp";
	guns[1] = "rpg_mp";
	guns[2] = "at4_mp";
	guns[3] = "stinger_mp";
	guns[4] = "javelin_mp";
 	//Do However many you want just increase number in bracket for each one
 	rand = randomIntRange( 0 , 5 );
	self giveWeapon(guns[rand]);
		self dropItem(guns[rand]);
	self thread CloneDeadMe();
}

dropassault()
{
 	guns = [];
	guns[0] = "ak47_mp";
	guns[1] = "ak47_acog_mp";
	guns[2] = "ak47_eotech_mp";
	guns[3] = "ak47_fmj_mp";
	guns[4] = "ak47_gl_mp";
	guns[5] = "ak47_heartbeat_mp";
	guns[6] = "ak47_reflex_mp";
	guns[7] = "ak47_shotgun_mp";
	guns[8] = "ak47_silencer_mp";
	guns[9] = "ak47_thermal_mp";
	guns[10] = "ak47_xmags_mp";
	guns[11] = "ak47_acog_fmj_mp";
	guns[12] = "ak47_acog_gl_mp";
	guns[13] = "ak47_acog_heartbeat_mp";
	guns[14] = "ak47_acog_shotgun_mp";
	guns[15] = "ak47_acog_silencer_mp";
	guns[16] = "ak47_acog_xmags_mp";
	guns[17] = "ak47_eotech_fmj_mp";
	guns[18] = "ak47_eotech_gl_mp";
	guns[19] = "ak47_eotech_heartbeat_mp";
	guns[20] = "ak47_eotech_shotgun_mp";
	guns[21] = "ak47_eotech_silencer_mp";
	guns[22] = "ak47_eotech_xmags_mp";
	guns[23] = "ak47_fmj_gl_mp";
	guns[24] = "ak47_fmj_heartbeat_mp";
	guns[25] = "ak47_fmj_reflex_mp";
	guns[26] = "ak47_fmj_shotgun_mp";
	guns[27] = "ak47_fmj_silencer_mp";
	guns[28] = "ak47_fmj_thermal_mp";
	guns[29] = "ak47_fmj_xmags_mp";
	guns[30] = "ak47_gl_heartbeat_mp";
	guns[31] = "ak47_gl_reflex_mp";
	guns[32] = "ak47_gl_silencer_mp";
	guns[33] = "ak47_gl_thermal_mp";
	guns[34] = "ak47_gl_xmags_mp";
	guns[35] = "ak47_heartbeat_reflex_mp";
	guns[36] = "ak47_heartbeat_shotgun_mp";
	guns[37] = "ak47_heartbeat_silencer_mp";
	guns[38] = "ak47_heartbeat_thermal_mp";
	guns[39] = "ak47_heartbeat_xmags_mp";
	guns[40] = "ak47_reflex_shotgun_mp";
	guns[41] = "ak47_reflex_silencer_mp";
	guns[42] = "ak47_reflex_xmags_mp";
	guns[43] = "ak47_shotgun_silencer_mp";
	guns[44] = "ak47_shotgun_thermal_mp";
	guns[45] = "ak47_shotgun_xmags_mp";
	guns[46] = "ak47_silencer_thermal_mp";
	guns[47] = "ak47_silencer_xmags_mp";
	guns[48] = "ak47_thermal_xmags_mp";
	guns[49] = "m16_mp";
	guns[50] = "m16_acog_mp";
	guns[51] = "m16_eotech_mp";
	guns[52] = "m16_fmj_mp";
	guns[53] = "m16_gl_mp";
	guns[54] = "m16_heartbeat_mp";
	guns[55] = "m16_reflex_mp";
	guns[56] = "m16_shotgun_mp";
	guns[57] = "m16_silencer_mp";
	guns[58] = "m16_thermal_mp";
	guns[59] = "m16_xmags_mp";
	guns[60] = "m16_acog_fmj_mp";
	guns[61] = "m16_acog_gl_mp";
	guns[62] = "m16_acog_heartbeat_mp";
	guns[63] = "m16_acog_shotgun_mp";
	guns[64] = "m16_acog_silencer_mp";
	guns[65] = "m16_acog_xmags_mp";
	guns[66] = "m16_eotech_fmj_mp";
	guns[67] = "m16_eotech_gl_mp";
	guns[68] = "m16_eotech_heartbeat_mp";
	guns[69] = "m16_eotech_shotgun_mp";
	guns[70] = "m16_eotech_silencer_mp";
	guns[71] = "m16_eotech_xmags_mp";
	guns[72] = "m16_fmj_gl_mp";
	guns[73] = "m16_fmj_heartbeat_mp";
	guns[74] = "m16_fmj_reflex_mp";
	guns[75] = "m16_fmj_shotgun_mp";
	guns[76] = "m16_fmj_silencer_mp";
	guns[77] = "m4_mp";
	guns[78] = "m4_acog_mp";
	guns[79] = "m4_eotech_mp";
	guns[80] = "m4_fmj_mp";
	guns[81] = "m4_gl_mp";
	guns[82] = "m4_heartbeat_mp";
	guns[83] = "m4_reflex_mp";
	guns[84] = "m4_shotgun_mp";
	guns[85] = "m4_silencer_mp";
	guns[86] = "m4_thermal_mp";
	guns[87] = "m4_xmags_mp";
	guns[88] = "m4_acog_fmj_mp";
	guns[89] = "m4_acog_gl_mp";
	guns[90] = "m4_acog_heartbeat_mp";
	guns[91] = "m4_acog_shotgun_mp";
	guns[92] = "m4_acog_silencer_mp";
	guns[93] = "m4_acog_xmags_mp";
	guns[94] = "m4_eotech_fmj_mp";
	guns[95] = "m4_eotech_gl_mp";
	guns[96] = "m4_eotech_heartbeat_mp";
	guns[97] = "m4_eotech_shotgun_mp";
	guns[98] = "m4_eotech_silencer_mp";
	guns[99] = "m4_eotech_xmags_mp";
	guns[100] = "m4_fmj_gl_mp";
	guns[101] = "m4_fmj_heartbeat_mp";
	guns[102] = "m4_fmj_reflex_mp";
	guns[103] = "m4_fmj_shotgun_mp";
	guns[104] = "m4_fmj_silencer_mp";
	guns[105] = "m4_fmj_thermal_mp";
	guns[106] = "m4_fmj_xmags_mp";
	guns[107] = "m4_gl_heartbeat_mp";
	guns[108] = "m4_gl_reflex_mp";
	guns[109] = "m4_gl_silencer_mp";
	guns[110] = "m4_gl_thermal_mp";
	guns[111] = "m4_gl_xmags_mp";
	guns[112] = "m4_heartbeat_reflex_mp";
	guns[113] = "m4_heartbeat_shotgun_mp";
	guns[114] = "m4_heartbeat_silencer_mp";
	guns[115] = "m4_heartbeat_thermal_mp";
	guns[116] = "m4_heartbeat_xmags_mp";
	guns[117] = "m4_reflex_shotgun_mp";
	guns[118] = "m4_reflex_silencer_mp";
	guns[119] = "m4_reflex_xmags_mp";
	guns[120] = "m4_shotgun_silencer_mp";
	guns[121] = "m4_shotgun_thermal_mp";
	guns[122] = "m4_shotgun_xmags_mp";
	guns[123] = "m4_silencer_thermal_mp";
	guns[124] = "m4_silencer_xmags_mp";
	guns[125] = "m4_thermal_xmags_mp";
	guns[126] = "fn2000_mp";
	guns[127] = "fn2000_acog_mp";
	guns[128] = "fn2000_eotech_mp";
	guns[129] = "fn2000_fmj_mp";
	guns[130] = "fn2000_gl_mp";
	guns[131] = "fn2000_heartbeat_mp";
	guns[132] = "fn2000_reflex_mp";
	guns[133] = "fn2000_shotgun_mp";
	guns[134] = "fn2000_silencer_mp";
	guns[135] = "fn2000_thermal_mp";
	guns[136] = "fn2000_xmags_mp";
	guns[137] = "fn2000_acog_fmj_mp";
	guns[138] = "fn2000_acog_gl_mp";
	guns[139] = "fn2000_acog_heartbeat_mp";
	guns[140] = "fn2000_acog_shotgun_mp";
	guns[141] = "fn2000_acog_silencer_mp";
	guns[142] = "fn2000_acog_xmags_mp";
	guns[143] = "fn2000_eotech_fmj_mp";
	guns[144] = "fn2000_eotech_gl_mp";
	guns[145] = "fn2000_eotech_heartbeat_mp";
	guns[146] = "fn2000_eotech_shotgun_mp";
	guns[147] = "fn2000_eotech_silencer_mp";
	guns[148] = "fn2000_eotech_xmags_mp";
	guns[149] = "fn2000_fmj_gl_mp";
	guns[150] = "fn2000_fmj_heartbeat_mp";
	guns[151] = "fn2000_fmj_reflex_mp";
	guns[152] = "fn2000_fmj_shotgun_mp";
	guns[153] = "fn2000_fmj_silencer_mp";
	guns[154] = "fn2000_fmj_thermal_mp";
	guns[155] = "fn2000_fmj_xmags_mp";
	guns[156] = "fn2000_gl_heartbeat_mp";
	guns[157] = "fn2000_gl_reflex_mp";
	guns[158] = "fn2000_gl_silencer_mp";
	guns[159] = "fn2000_gl_thermal_mp";
	guns[160] = "fn2000_gl_xmags_mp";
	guns[161] = "fn2000_heartbeat_reflex_mp";
	guns[162] = "fn2000_heartbeat_shotgun_mp";
	guns[163] = "fn2000_heartbeat_silencer_mp";
	guns[164] = "fn2000_heartbeat_thermal_mp";
	guns[165] = "fn2000_heartbeat_xmags_mp";
	guns[166] = "fn2000_reflex_shotgun_mp";
	guns[167] = "fn2000_reflex_silencer_mp";
	guns[168] = "fn2000_reflex_xmags_mp";
	guns[169] = "fn2000_shotgun_silencer_mp";
	guns[170] = "fn2000_shotgun_thermal_mp";
	guns[171] = "fn2000_shotgun_xmags_mp";
	guns[172] = "fn2000_silencer_thermal_mp";
	guns[173] = "fn2000_silencer_xmags_mp";
	guns[174] = "fn2000_thermal_xmags_mp";
	guns[175] = "masada_mp";
	guns[176] = "masada_acog_mp";
	guns[177] = "masada_eotech_mp";
	guns[178] = "masada_fmj_mp";
	guns[179] = "masada_gl_mp";
	guns[180] = "masada_heartbeat_mp";
	guns[181] = "masada_reflex_mp";
	guns[182] = "masada_shotgun_mp";
	guns[183] = "masada_silencer_mp";
	guns[184] = "masada_thermal_mp";
	guns[185] = "masada_xmags_mp";
	guns[186] = "masada_acog_fmj_mp";
	guns[187] = "masada_acog_gl_mp";
	guns[188] = "masada_acog_heartbeat_mp";
	guns[189] = "masada_acog_shotgun_mp";
	guns[190] = "masada_acog_silencer_mp";
	guns[191] = "masada_acog_xmags_mp";
	guns[192] = "masada_eotech_fmj_mp";
	guns[193] = "masada_eotech_gl_mp";
	guns[194] = "masada_eotech_heartbeat_mp";
	guns[195] = "masada_eotech_shotgun_mp";
	guns[196] = "masada_eotech_silencer_mp";
	guns[197] = "masada_eotech_xmags_mp";
	guns[198] = "masada_fmj_gl_mp";
	guns[199] = "masada_fmj_heartbeat_mp";
	guns[200] = "masada_fmj_reflex_mp";
	guns[201] = "masada_fmj_shotgun_mp";
	guns[202] = "masada_fmj_silencer_mp";
	guns[203] = "masada_fmj_thermal_mp";
	guns[204] = "masada_fmj_xmags_mp";
	guns[205] = "masada_gl_heartbeat_mp";
	guns[206] = "masada_gl_reflex_mp";
	guns[207] = "masada_gl_silencer_mp";
	guns[208] = "masada_gl_thermal_mp";
	guns[209] = "masada_gl_xmags_mp";
	guns[210] = "masada_heartbeat_reflex_mp";
	guns[211] = "masada_heartbeat_shotgun_mp";
	guns[212] = "masada_heartbeat_silencer_mp";
	guns[213] = "masada_heartbeat_thermal_mp";
	guns[214] = "masada_heartbeat_xmags_mp";
	guns[215] = "masada_reflex_shotgun_mp";
	guns[216] = "masada_reflex_silencer_mp";
	guns[217] = "masada_reflex_xmags_mp";
	guns[218] = "masada_shotgun_silencer_mp";
	guns[219] = "masada_shotgun_thermal_mp";
	guns[220] = "masada_shotgun_xmags_mp";
	guns[221] = "masada_silencer_thermal_mp";
	guns[222] = "masada_silencer_xmags_mp";
	guns[223] = "masada_thermal_xmags_mp";
	guns[224] = "famas_mp";
	guns[225] = "famas_acog_mp";
	guns[226] = "famas_eotech_mp";
	guns[227] = "famas_fmj_mp";
	guns[228] = "famas_gl_mp";
	guns[229] = "famas_heartbeat_mp";
	guns[230] = "famas_reflex_mp";
	guns[231] = "famas_shotgun_mp";
	guns[232] = "famas_silencer_mp";
	guns[233] = "famas_thermal_mp";
	guns[234] = "famas_xmags_mp";
	guns[235] = "famas_acog_fmj_mp";
	guns[236] = "famas_acog_gl_mp";
	guns[237] = "famas_acog_heartbeat_mp";
	guns[238] = "famas_acog_shotgun_mp";
	guns[239] = "famas_acog_silencer_mp";
	guns[240] = "famas_acog_xmags_mp";
	guns[241] = "famas_eotech_fmj_mp";
	guns[242] = "famas_eotech_gl_mp";
	guns[243] = "famas_eotech_heartbeat_mp";
	guns[244] = "famas_eotech_shotgun_mp";
	guns[245] = "famas_eotech_silencer_mp";
	guns[246] = "famas_eotech_xmags_mp";
	guns[247] = "famas_fmj_gl_mp";
	guns[248] = "famas_fmj_heartbeat_mp";
	guns[249] = "famas_fmj_reflex_mp";
	guns[250] = "famas_fmj_shotgun_mp";
	guns[251] = "famas_fmj_silencer_mp";
	guns[252] = "famas_fmj_thermal_mp";
	guns[253] = "famas_fmj_xmags_mp";
	guns[254] = "famas_gl_heartbeat_mp";
	guns[255] = "famas_gl_reflex_mp";
	guns[256] = "famas_gl_silencer_mp";
	guns[257] = "famas_gl_thermal_mp";
	guns[258] = "famas_gl_xmags_mp";
	guns[259] = "famas_heartbeat_reflex_mp";
	guns[260] = "famas_heartbeat_shotgun_mp";
	guns[261] = "famas_heartbeat_silencer_mp";
	guns[262] = "famas_heartbeat_thermal_mp";
	guns[263] = "famas_heartbeat_xmags_mp";
	guns[264] = "famas_reflex_shotgun_mp";
	guns[265] = "famas_reflex_silencer_mp";
	guns[266] = "famas_reflex_xmags_mp";
	guns[267] = "famas_shotgun_silencer_mp";
	guns[268] = "famas_shotgun_thermal_mp";
	guns[269] = "famas_shotgun_xmags_mp";
	guns[270] = "famas_silencer_thermal_mp";
	guns[271] = "famas_silencer_xmags_mp";
	guns[272] = "famas_thermal_xmags_mp";
	guns[273] = "fal_mp";
	guns[274] = "fal_acog_mp";
	guns[275] = "fal_eotech_mp";
	guns[276] = "fal_fmj_mp";
	guns[277] = "fal_gl_mp";
	guns[278] = "fal_heartbeat_mp";
	guns[279] = "fal_reflex_mp";
	guns[280] = "fal_shotgun_mp";
	guns[281] = "fal_silencer_mp";
	guns[282] = "fal_thermal_mp";
	guns[283] = "fal_xmags_mp";
	guns[284] = "fal_acog_fmj_mp";
	guns[285] = "fal_acog_gl_mp";
	guns[286] = "fal_acog_heartbeat_mp";
	guns[287] = "fal_acog_shotgun_mp";
	guns[288] = "fal_acog_silencer_mp";
	guns[289] = "fal_acog_xmags_mp";
	guns[290] = "fal_eotech_fmj_mp";
	guns[291] = "fal_eotech_gl_mp";
	guns[292] = "fal_eotech_heartbeat_mp";
	guns[293] = "fal_eotech_shotgun_mp";
	guns[294] = "fal_eotech_silencer_mp";
	guns[295] = "fal_eotech_xmags_mp";
	guns[296] = "fal_fmj_gl_mp";
	guns[297] = "fal_fmj_heartbeat_mp";
	guns[298] = "fal_fmj_reflex_mp";
	guns[299] = "fal_fmj_shotgun_mp";
	guns[300] = "fal_fmj_silencer_mp";
	guns[301] = "fal_fmj_thermal_mp";
	guns[302] = "fal_fmj_xmags_mp";
	guns[303] = "fal_gl_heartbeat_mp";
	guns[304] = "fal_gl_reflex_mp";
	guns[305] = "fal_gl_silencer_mp";
	guns[306] = "fal_gl_thermal_mp";
	guns[307] = "fal_gl_xmags_mp";
	guns[308] = "fal_heartbeat_reflex_mp";
	guns[309] = "fal_heartbeat_shotgun_mp";
	guns[310] = "fal_heartbeat_silencer_mp";
	guns[311] = "fal_heartbeat_thermal_mp";
	guns[312] = "fal_heartbeat_xmags_mp";
	guns[313] = "fal_reflex_shotgun_mp";
	guns[314] = "fal_reflex_silencer_mp";
	guns[315] = "fal_reflex_xmags_mp";
	guns[316] = "fal_shotgun_silencer_mp";
	guns[317] = "fal_shotgun_thermal_mp";
	guns[318] = "fal_shotgun_xmags_mp";
	guns[319] = "fal_silencer_thermal_mp";
	guns[320] = "fal_silencer_xmags_mp";
	guns[321] = "fal_thermal_xmags_mp";
	guns[322] = "scar_mp";
	guns[323] = "scar_acog_mp";
	guns[324] = "scar_eotech_mp";
	guns[325] = "scar_fmj_mp";
	guns[326] = "scar_gl_mp";
	guns[327] = "scar_heartbeat_mp";
	guns[328] = "scar_reflex_mp";
	guns[329] = "scar_shotgun_mp";
	guns[330] = "scar_silencer_mp";
	guns[331] = "scar_thermal_mp";
	guns[332] = "scar_xmags_mp";
	guns[333] = "scar_acog_fmj_mp";
	guns[334] = "scar_acog_gl_mp";
	guns[335] = "scar_acog_heartbeat_mp";
	guns[336] = "scar_acog_shotgun_mp";
	guns[337] = "scar_acog_silencer_mp";
	guns[338] = "scar_acog_xmags_mp";
	guns[339] = "scar_eotech_fmj_mp";
	guns[340] = "scar_eotech_gl_mp";
	guns[341] = "scar_eotech_heartbeat_mp";
	guns[342] = "scar_eotech_shotgun_mp";
	guns[343] = "scar_eotech_silencer_mp";
	guns[344] = "scar_eotech_xmags_mp";
	guns[345] = "scar_fmj_gl_mp";
	guns[346] = "scar_fmj_heartbeat_mp";
	guns[347] = "scar_fmj_reflex_mp";
	guns[348] = "scar_fmj_shotgun_mp";
	guns[349] = "scar_fmj_silencer_mp";
	guns[350] = "scar_fmj_thermal_mp";
	guns[351] = "scar_fmj_xmags_mp";
	guns[352] = "scar_gl_heartbeat_mp";
	guns[353] = "scar_gl_reflex_mp";
	guns[354] = "scar_gl_silencer_mp";
	guns[355] = "scar_gl_thermal_mp";
	guns[356] = "scar_gl_xmags_mp";
	guns[357] = "scar_heartbeat_reflex_mp";
	guns[358] = "scar_heartbeat_shotgun_mp";
	guns[359] = "scar_heartbeat_silencer_mp";
	guns[360] = "scar_heartbeat_thermal_mp";
	guns[361] = "scar_heartbeat_xmags_mp";
	guns[362] = "scar_reflex_shotgun_mp";
	guns[363] = "scar_reflex_silencer_mp";
	guns[364] = "scar_reflex_xmags_mp";
	guns[365] = "scar_shotgun_silencer_mp";
	guns[366] = "scar_shotgun_thermal_mp";
	guns[367] = "scar_shotgun_xmags_mp";
	guns[368] = "scar_silencer_thermal_mp";
	guns[369] = "scar_silencer_xmags_mp";
	guns[370] = "scar_thermal_xmags_mp";
	guns[371] = "tavor_mp";
	guns[372] = "tavor_acog_mp";
	guns[373] = "tavor_eotech_mp";
	guns[374] = "tavor_fmj_mp";
	guns[375] = "tavor_gl_mp";
	guns[376] = "tavor_heartbeat_mp";
	guns[377] = "tavor_reflex_mp";
	guns[378] = "tavor_shotgun_mp";
	guns[379] = "tavor_silencer_mp";
	guns[380] = "tavor_thermal_mp";
	guns[381] = "tavor_xmags_mp";
	guns[382] = "tavor_acog_fmj_mp";
	guns[383] = "tavor_acog_gl_mp";
	guns[384] = "tavor_acog_heartbeat_mp";
	guns[385] = "tavor_acog_shotgun_mp";
	guns[386] = "tavor_acog_silencer_mp";
	guns[387] = "tavor_acog_xmags_mp";
	guns[388] = "tavor_eotech_fmj_mp";
	guns[389] = "tavor_eotech_gl_mp";
	guns[390] = "tavor_eotech_heartbeat_mp";
	guns[391] = "tavor_eotech_shotgun_mp";
	guns[392] = "tavor_eotech_silencer_mp";
	guns[393] = "tavor_eotech_xmags_mp";
	guns[394] = "tavor_fmj_gl_mp";
	guns[395] = "tavor_fmj_heartbeat_mp";
	guns[396] = "tavor_fmj_reflex_mp";
	guns[397] = "tavor_fmj_shotgun_mp";
	guns[398] = "tavor_fmj_silencer_mp";
	guns[399] = "tavor_fmj_thermal_mp";
	guns[400] = "tavor_fmj_xmags_mp";
	guns[401] = "tavor_gl_heartbeat_mp";
	guns[402] = "tavor_gl_reflex_mp";
	guns[403] = "tavor_gl_silencer_mp";
	guns[404] = "tavor_gl_thermal_mp";
	guns[405] = "tavor_gl_xmags_mp";
	guns[406] = "tavor_heartbeat_reflex_mp";
	guns[407] = "tavor_heartbeat_shotgun_mp";
	guns[408] = "tavor_heartbeat_silencer_mp";
	guns[409] = "tavor_heartbeat_thermal_mp";
	guns[410] = "tavor_heartbeat_xmags_mp";
	guns[411] = "tavor_reflex_shotgun_mp";
	guns[412] = "tavor_reflex_silencer_mp";
	guns[413] = "tavor_reflex_xmags_mp";
	guns[414] = "tavor_shotgun_silencer_mp";
	guns[415] = "tavor_shotgun_thermal_mp";
	guns[416] = "tavor_shotgun_xmags_mp";
	guns[417] = "tavor_silencer_thermal_mp";
	guns[418] = "tavor_silencer_xmags_mp";
	guns[419] = "tavor_thermal_xmags_mp";
 	//Do However many you want just increase number in bracket for each one
 	rand = randomIntRange( 0 , 420 );
	self giveWeapon(guns[rand]);
		self dropItem(guns[rand]);
	self thread CloneDeadMe();
}

droplmg()
{
 	guns = [];
	guns[0] = "aug_mp";
	guns[1] = "aug_acog_mp";
	guns[2] = "aug_eotech_mp";
	guns[3] = "aug_fmj_mp";
	guns[4] = "aug_grip_mp";
	guns[5] = "aug_heartbeat_mp";
	guns[6] = "aug_reflex_mp";
	guns[7] = "aug_silencer_mp";
	guns[8] = "aug_thermal_mp";
	guns[9] = "aug_xmags_mp";
	guns[10] = "aug_acog_fmj_mp";
	guns[11] = "aug_acog_grip_mp";
	guns[12] = "aug_acog_heartbeat_mp";
	guns[13] = "aug_acog_silencer_mp";
	guns[14] = "aug_acog_xmags_mp";
	guns[15] = "aug_eotech_fmj_mp";
	guns[16] = "aug_eotech_grip_mp";
	guns[17] = "aug_eotech_heartbeat_mp";
	guns[18] = "aug_eotech_silencer_mp";
	guns[19] = "aug_eotech_xmags_mp";
	guns[20] = "aug_fmj_grip_mp";
	guns[21] = "aug_fmj_heartbeat_mp";
	guns[22] = "aug_fmj_reflex_mp";
	guns[23] = "aug_fmj_silencer_mp";
	guns[24] = "aug_fmj_thermal_mp";
	guns[25] = "aug_fmj_xmags_mp";
	guns[26] = "aug_grip_heartbeat_mp";
	guns[27] = "aug_grip_reflex_mp";
	guns[28] = "aug_grip_silencer_mp";
	guns[29] = "aug_grip_thermal_mp";
	guns[30] = "aug_grip_xmags_mp";
	guns[31] = "aug_heartbeat_reflex_mp";
	guns[32] = "aug_heartbeat_silencer_mp";
	guns[33] = "aug_heartbeat_thermal_mp";
	guns[34] = "aug_heartbeat_xmags_mp";
	guns[35] = "aug_reflex_silencer_mp";
	guns[36] = "aug_reflex_xmags_mp";
	guns[37] = "aug_silencer_thermal_mp";
	guns[38] = "aug_silencer_xmags_mp";
	guns[39] = "aug_thermal_xmags_mp";
	guns[40] = "m240_mp";
	guns[41] = "m240_acog_mp";
	guns[42] = "m240_eotech_mp";
	guns[43] = "m240_fmj_mp";
	guns[44] = "m240_grip_mp";
	guns[45] = "m240_heartbeat_mp";
	guns[46] = "m240_reflex_mp";
	guns[47] = "m240_silencer_mp";
	guns[48] = "m240_thermal_mp";
	guns[49] = "m240_xmags_mp";
	guns[50] = "m240_acog_fmj_mp";
	guns[51] = "m240_acog_grip_mp";
	guns[52] = "m240_acog_heartbeat_mp";
	guns[53] = "m240_acog_silencer_mp";
	guns[54] = "m240_acog_xmags_mp";
	guns[55] = "m240_eotech_fmj_mp";
	guns[56] = "m240_eotech_grip_mp";
	guns[57] = "m240_eotech_heartbeat_mp";
	guns[58] = "m240_eotech_silencer_mp";
	guns[59] = "m240_eotech_xmags_mp";
	guns[60] = "m240_fmj_grip_mp";
	guns[61] = "m240_fmj_heartbeat_mp";
	guns[62] = "m240_fmj_reflex_mp";
	guns[63] = "m240_fmj_silencer_mp";
	guns[64] = "m240_fmj_thermal_mp";
	guns[65] = "m240_fmj_xmags_mp";
	guns[66] = "m240_grip_heartbeat_mp";
	guns[67] = "m240_grip_reflex_mp";
	guns[68] = "m240_grip_silencer_mp";
	guns[69] = "m240_grip_thermal_mp";
	guns[70] = "m240_grip_xmags_mp";
	guns[71] = "m240_heartbeat_reflex_mp";
	guns[72] = "m240_heartbeat_silencer_mp";
	guns[73] = "m240_heartbeat_thermal_mp";
	guns[74] = "m240_heartbeat_xmags_mp";
	guns[75] = "m240_reflex_silencer_mp";
	guns[76] = "m240_reflex_xmags_mp";
	guns[77] = "m240_silencer_thermal_mp";
	guns[78] = "m240_silencer_xmags_mp";
	guns[79] = "m240_thermal_xmags_mp";
	guns[80] = "mg4_mp";
	guns[81] = "mg4_acog_mp";
	guns[82] = "mg4_eotech_mp";
	guns[83] = "mg4_fmj_mp";
	guns[84] = "mg4_grip_mp";
	guns[85] = "mg4_heartbeat_mp";
	guns[86] = "mg4_reflex_mp";
	guns[87] = "mg4_silencer_mp";
	guns[88] = "mg4_thermal_mp";
	guns[89] = "mg4_xmags_mp";
	guns[90] = "mg4_acog_fmj_mp";
	guns[91] = "mg4_acog_grip_mp";
	guns[92] = "mg4_acog_heartbeat_mp";
	guns[93] = "mg4_acog_silencer_mp";
	guns[94] = "mg4_acog_xmags_mp";
	guns[95] = "mg4_eotech_fmj_mp";
	guns[96] = "mg4_eotech_grip_mp";
	guns[97] = "mg4_eotech_heartbeat_mp";
	guns[98] = "mg4_eotech_silencer_mp";
	guns[99] = "mg4_eotech_xmags_mp";
	guns[100] = "mg4_fmj_grip_mp";
	guns[101] = "mg4_fmj_heartbeat_mp";
	guns[102] = "mg4_fmj_reflex_mp";
	guns[103] = "mg4_fmj_silencer_mp";
	guns[104] = "mg4_fmj_thermal_mp";
	guns[105] = "mg4_fmj_xmags_mp";
	guns[106] = "mg4_grip_heartbeat_mp";
	guns[107] = "mg4_grip_reflex_mp";
	guns[108] = "mg4_grip_silencer_mp";
	guns[109] = "mg4_grip_thermal_mp";
	guns[110] = "mg4_grip_xmags_mp";
	guns[111] = "mg4_heartbeat_reflex_mp";
	guns[112] = "mg4_heartbeat_silencer_mp";
	guns[113] = "mg4_heartbeat_thermal_mp";
	guns[114] = "mg4_heartbeat_xmags_mp";
	guns[115] = "mg4_reflex_silencer_mp";
	guns[116] = "mg4_reflex_xmags_mp";
	guns[117] = "mg4_silencer_thermal_mp";
	guns[118] = "mg4_silencer_xmags_mp";
	guns[119] = "mg4_thermal_xmags_mp";
	guns[120] = "sa80_mp";
	guns[121] = "sa80_acog_mp";
	guns[122] = "sa80_eotech_mp";
	guns[123] = "sa80_fmj_mp";
	guns[124] = "sa80_grip_mp";
	guns[125] = "sa80_heartbeat_mp";
	guns[126] = "sa80_reflex_mp";
	guns[127] = "sa80_silencer_mp";
	guns[128] = "sa80_thermal_mp";
	guns[129] = "sa80_xmags_mp";
	guns[130] = "sa80_acog_fmj_mp";
	guns[131] = "sa80_acog_grip_mp";
	guns[132] = "sa80_acog_heartbeat_mp";
	guns[133] = "sa80_acog_silencer_mp";
	guns[134] = "sa80_acog_xmags_mp";
	guns[135] = "sa80_eotech_fmj_mp";
	guns[136] = "sa80_eotech_grip_mp";
	guns[137] = "sa80_eotech_heartbeat_mp";
	guns[138] = "sa80_eotech_silencer_mp";
	guns[139] = "sa80_eotech_xmags_mp";
	guns[140] = "sa80_fmj_grip_mp";
	guns[141] = "sa80_fmj_heartbeat_mp";
	guns[142] = "sa80_fmj_reflex_mp";
	guns[143] = "sa80_fmj_silencer_mp";
	guns[144] = "sa80_fmj_thermal_mp";
	guns[145] = "sa80_fmj_xmags_mp";
	guns[146] = "sa80_grip_heartbeat_mp";
	guns[147] = "sa80_grip_reflex_mp";
	guns[148] = "sa80_grip_silencer_mp";
	guns[149] = "sa80_grip_thermal_mp";
	guns[150] = "sa80_grip_xmags_mp";
	guns[151] = "sa80_heartbeat_reflex_mp";
	guns[152] = "sa80_heartbeat_silencer_mp";
	guns[153] = "sa80_heartbeat_thermal_mp";
	guns[154] = "sa80_heartbeat_xmags_mp";
	guns[155] = "sa80_reflex_silencer_mp";
	guns[156] = "sa80_reflex_xmags_mp";
	guns[157] = "sa80_silencer_thermal_mp";
	guns[158] = "sa80_silencer_xmags_mp";
	guns[159] = "sa80_thermal_xmags_mp";
	guns[160] = "rpd_mp";
	guns[161] = "rpd_acog_mp";
	guns[162] = "rpd_eotech_mp";
	guns[163] = "rpd_fmj_mp";
	guns[164] = "rpd_grip_mp";
	guns[165] = "rpd_heartbeat_mp";
	guns[166] = "rpd_reflex_mp";
	guns[167] = "rpd_silencer_mp";
	guns[168] = "rpd_thermal_mp";
	guns[169] = "rpd_xmags_mp";
	guns[170] = "rpd_acog_fmj_mp";
	guns[171] = "rpd_acog_grip_mp";
	guns[172] = "rpd_acog_heartbeat_mp";
	guns[173] = "rpd_acog_silencer_mp";
	guns[174] = "rpd_acog_xmags_mp";
	guns[175] = "rpd_eotech_fmj_mp";
	guns[176] = "rpd_eotech_grip_mp";
	guns[177] = "rpd_eotech_heartbeat_mp";
	guns[178] = "rpd_eotech_silencer_mp";
	guns[179] = "rpd_eotech_xmags_mp";
	guns[180] = "rpd_fmj_grip_mp";
	guns[181] = "rpd_fmj_heartbeat_mp";
	guns[182] = "rpd_fmj_reflex_mp";
	guns[183] = "rpd_fmj_silencer_mp";
	guns[184] = "rpd_fmj_thermal_mp";
	guns[185] = "rpd_fmj_xmags_mp";
	guns[186] = "rpd_grip_heartbeat_mp";
	guns[187] = "rpd_grip_reflex_mp";
	guns[188] = "rpd_grip_silencer_mp";
	guns[189] = "rpd_grip_thermal_mp";
	guns[190] = "rpd_grip_xmags_mp";
	guns[191] = "rpd_heartbeat_reflex_mp";
	guns[192] = "rpd_heartbeat_silencer_mp";
	guns[193] = "rpd_heartbeat_thermal_mp";
	guns[194] = "rpd_heartbeat_xmags_mp";
	guns[195] = "rpd_reflex_silencer_mp";
	guns[196] = "rpd_reflex_xmags_mp";
	guns[197] = "rpd_silencer_thermal_mp";
	guns[198] = "rpd_silencer_xmags_mp";
	guns[199] = "rpd_thermal_xmags_mp";
	//Do However many you want just increase number in bracket for each one
 	rand = randomIntRange( 0 , 200 );
	self giveWeapon(guns[rand]);
		self dropItem(guns[rand]);
	self thread CloneDeadMe();
}

dropshotguns()
{
 	guns = [];
	guns[0] = "ranger_mp";
	guns[1] = "ranger_akimbo_mp";
	guns[2] = "ranger_fmj_mp";
	guns[3] = "ranger_akimbo_fmj_mp";
	guns[4] = "model1887_mp";
	guns[5] = "model1887_akimbo_mp";
	guns[6] = "model1887_fmj_mp";
	guns[7] = "model1887_akimbo_fmj_mp";
	guns[8] = "striker_mp";
	guns[9] = "striker_eotech_mp";
	guns[10] = "striker_fmj_mp";
	guns[11] = "striker_grip_mp";
	guns[12] = "striker_reflex_mp";
	guns[13] = "striker_silencer_mp";
	guns[14] = "striker_xmags_mp";
	guns[15] = "striker_eotech_fmj_mp";
	guns[16] = "striker_eotech_grip_mp";
	guns[17] = "striker_eotech_silencer_mp";
	guns[18] = "striker_eotech_xmags_mp";
	guns[19] = "striker_fmj_grip_mp";
	guns[20] = "striker_fmj_reflex_mp";
	guns[21] = "striker_fmj_silencer_mp";
	guns[22] = "striker_fmj_xmags_mp";
	guns[23] = "striker_grip_reflex_mp";
	guns[24] = "striker_grip_silencer_mp";
	guns[25] = "striker_grip_xmags_mp";
	guns[26] = "striker_reflex_silencer_mp";
	guns[27] = "striker_reflex_xmags_mp";
	guns[28] = "striker_silencer_xmags_mp";
	guns[29] = "aa12_mp";
	guns[30] = "aa12_eotech_mp";
	guns[31] = "aa12_fmj_mp";
	guns[32] = "aa12_grip_mp";
	guns[33] = "aa12_reflex_mp";
	guns[34] = "aa12_silencer_mp";
	guns[35] = "aa12_xmags_mp";
	guns[36] = "aa12_eotech_fmj_mp";
	guns[37] = "aa12_eotech_grip_mp";
	guns[38] = "aa12_eotech_silencer_mp";
	guns[39] = "aa12_eotech_xmags_mp";
	guns[40] = "aa12_fmj_grip_mp";
	guns[41] = "aa12_fmj_reflex_mp";
	guns[42] = "aa12_fmj_silencer_mp";
	guns[43] = "aa12_fmj_xmags_mp";
	guns[44] = "aa12_grip_reflex_mp";
	guns[45] = "aa12_grip_silencer_mp";
	guns[46] = "aa12_grip_xmags_mp";
	guns[47] = "aa12_reflex_silencer_mp";
	guns[48] = "aa12_reflex_xmags_mp";
	guns[49] = "aa12_silencer_xmags_mp";
	guns[50] = "m1014_mp";
	guns[51] = "m1014_eotech_mp";
	guns[52] = "m1014_fmj_mp";
	guns[53] = "m1014_grip_mp";
	guns[54] = "m1014_reflex_mp";
	guns[55] = "m1014_silencer_mp";
	guns[56] = "m1014_xmags_mp";
	guns[57] = "m1014_eotech_fmj_mp";
	guns[58] = "m1014_eotech_grip_mp";
	guns[59] = "m1014_eotech_silencer_mp";
	guns[60] = "m1014_eotech_xmags_mp";
	guns[61] = "m1014_fmj_grip_mp";
	guns[62] = "m1014_fmj_reflex_mp";
	guns[63] = "m1014_fmj_silencer_mp";
	guns[64] = "m1014_fmj_xmags_mp";
	guns[65] = "m1014_grip_reflex_mp";
	guns[66] = "m1014_grip_silencer_mp";
	guns[67] = "m1014_grip_xmags_mp";
	guns[68] = "m1014_reflex_silencer_mp";
	guns[69] = "m1014_reflex_xmags_mp";
	guns[70] = "m1014_silencer_xmags_mp";
	guns[71] = "spas12_mp";
	guns[72] = "spas12_eotech_mp";
	guns[73] = "spas12_fmj_mp";
	guns[74] = "spas12_grip_mp";
	guns[75] = "spas12_reflex_mp";
	guns[76] = "spas12_silencer_mp";
	guns[77] = "spas12_xmags_mp";
	guns[78] = "spas12_eotech_fmj_mp";
	guns[79] = "spas12_eotech_grip_mp";
	guns[80] = "spas12_eotech_silencer_mp";
	guns[81] = "spas12_eotech_xmags_mp";
	guns[82] = "spas12_fmj_grip_mp";
	guns[83] = "spas12_fmj_reflex_mp";
	guns[84] = "spas12_fmj_silencer_mp";
	guns[85] = "spas12_fmj_xmags_mp";
	guns[86] = "spas12_grip_reflex_mp";
	guns[87] = "spas12_grip_silencer_mp";
	guns[88] = "spas12_grip_xmags_mp";
	guns[89] = "spas12_reflex_silencer_mp";
	guns[90] = "spas12_reflex_xmags_mp";
	guns[91] = "spas12_silencer_xmags_mp";
	//Do However many you want just increase number in bracket for each one
 	rand = randomIntRange( 0 , 92 );
	self giveWeapon(guns[rand]);
		self dropItem(guns[rand]);
	self thread CloneDeadMe();
}

dropsubmachineguns()
{
 	guns = [];
	guns[0] = "uzi_mp";
	guns[1] = "uzi_acog_mp";
	guns[2] = "uzi_akimbo_mp";
	guns[3] = "uzi_eotech_mp";
	guns[4] = "uzi_fmj_mp";
	guns[5] = "uzi_reflex_mp";
	guns[6] = "uzi_rof_mp";
	guns[7] = "uzi_silencer_mp";
	guns[8] = "uzi_thermal_mp";
	guns[9] = "uzi_xmags_mp";
	guns[10] = "uzi_acog_fmj_mp";
	guns[11] = "uzi_acog_rof_mp";
	guns[12] = "uzi_acog_silencer_mp";
	guns[13] = "uzi_acog_xmags_mp";
	guns[14] = "uzi_akimbo_fmj_mp";
	guns[15] = "uzi_akimbo_rof_mp";
	guns[16] = "uzi_akimbo_silencer_mp";
	guns[17] = "uzi_akimbo_xmags_mp";
	guns[18] = "uzi_eotech_fmj_mp";
	guns[19] = "uzi_eotech_rof_mp";
	guns[20] = "uzi_eotech_silencer_mp";
	guns[21] = "uzi_eotech_xmags_mp";
	guns[22] = "uzi_fmj_reflex_mp";
	guns[23] = "uzi_fmj_rof_mp";
	guns[24] = "uzi_fmj_silencer_mp";
	guns[25] = "uzi_fmj_thermal_mp";
	guns[26] = "uzi_fmj_xmags_mp";
	guns[27] = "uzi_reflex_rof_mp";
	guns[28] = "uzi_reflex_silencer_mp";
	guns[29] = "uzi_reflex_xmags_mp";
	guns[30] = "uzi_rof_silencer_mp";
	guns[31] = "uzi_rof_thermal_mp";
	guns[32] = "uzi_rof_xmags_mp";
	guns[33] = "uzi_silencer_thermal_mp";
	guns[34] = "uzi_silencer_xmags_mp";
	guns[35] = "uzi_thermal_xmags_mp";
	guns[36] = "p90_mp";
	guns[37] = "p90_acog_mp";
	guns[38] = "p90_akimbo_mp";
	guns[39] = "p90_eotech_mp";
	guns[40] = "p90_fmj_mp";
	guns[41] = "p90_reflex_mp";
	guns[42] = "p90_rof_mp";
	guns[43] = "p90_silencer_mp";
	guns[44] = "p90_thermal_mp";
	guns[45] = "p90_xmags_mp";
	guns[46] = "p90_acog_fmj_mp";
	guns[47] = "p90_acog_rof_mp";
	guns[48] = "p90_acog_silencer_mp";
	guns[49] = "p90_acog_xmags_mp";
	guns[50] = "p90_akimbo_fmj_mp";
	guns[51] = "p90_akimbo_rof_mp";
	guns[52] = "p90_akimbo_silencer_mp";
	guns[53] = "p90_akimbo_xmags_mp";
	guns[54] = "p90_eotech_fmj_mp";
	guns[55] = "p90_eotech_rof_mp";
	guns[56] = "p90_eotech_silencer_mp";
	guns[57] = "p90_eotech_xmags_mp";
	guns[58] = "p90_fmj_reflex_mp";
	guns[59] = "p90_fmj_rof_mp";
	guns[60] = "p90_fmj_silencer_mp";
	guns[61] = "p90_fmj_thermal_mp";
	guns[62] = "p90_fmj_xmags_mp";
	guns[63] = "p90_reflex_rof_mp";
	guns[64] = "p90_reflex_silencer_mp";
	guns[65] = "p90_reflex_xmags_mp";
	guns[66] = "p90_rof_silencer_mp";
	guns[67] = "p90_rof_thermal_mp";
	guns[68] = "p90_rof_xmags_mp";
	guns[69] = "p90_silencer_thermal_mp";
	guns[70] = "p90_silencer_xmags_mp";
	guns[71] = "p90_thermal_xmags_mp";
	guns[72] = "kriss_mp";
	guns[73] = "kriss_acog_mp";
	guns[74] = "kriss_akimbo_mp";
	guns[75] = "kriss_eotech_mp";
	guns[76] = "kriss_fmj_mp";
	guns[77] = "kriss_reflex_mp";
	guns[78] = "kriss_rof_mp";
	guns[79] = "kriss_silencer_mp";
	guns[80] = "kriss_thermal_mp";
	guns[81] = "kriss_xmags_mp";
	guns[82] = "kriss_acog_fmj_mp";
	guns[83] = "kriss_acog_rof_mp";
	guns[84] = "kriss_acog_silencer_mp";
	guns[85] = "kriss_acog_xmags_mp";
	guns[86] = "kriss_akimbo_fmj_mp";
	guns[87] = "kriss_akimbo_rof_mp";
	guns[88] = "kriss_akimbo_silencer_mp";
	guns[89] = "kriss_akimbo_xmags_mp";
	guns[90] = "kriss_eotech_fmj_mp";
	guns[91] = "kriss_eotech_rof_mp";
	guns[92] = "kriss_eotech_silencer_mp";
	guns[93] = "kriss_eotech_xmags_mp";
	guns[94] = "kriss_fmj_reflex_mp";
	guns[95] = "kriss_fmj_rof_mp";
	guns[96] = "kriss_fmj_silencer_mp";
	guns[97] = "kriss_fmj_thermal_mp";
	guns[98] = "kriss_fmj_xmags_mp";
	guns[99] = "kriss_reflex_rof_mp";
	guns[100] = "kriss_reflex_silencer_mp";
	guns[101] = "kriss_reflex_xmags_mp";
	guns[102] = "kriss_rof_silencer_mp";
	guns[103] = "kriss_rof_thermal_mp";
	guns[104] = "kriss_rof_xmags_mp";
	guns[105] = "kriss_silencer_thermal_mp";
	guns[106] = "kriss_silencer_xmags_mp";
	guns[107] = "kriss_thermal_xmags_mp";
	guns[108] = "ump45_mp";
	guns[109] = "ump45_acog_mp";
	guns[110] = "ump45_akimbo_mp";
	guns[111] = "ump45_eotech_mp";
	guns[112] = "ump45_fmj_mp";
	guns[113] = "ump45_reflex_mp";
	guns[114] = "ump45_rof_mp";
	guns[115] = "ump45_silencer_mp";
	guns[116] = "ump45_thermal_mp";
	guns[117] = "ump45_xmags_mp";
	guns[118] = "ump45_acog_fmj_mp";
	guns[119] = "ump45_acog_rof_mp";
	guns[120] = "ump45_acog_silencer_mp";
	guns[121] = "ump45_acog_xmags_mp";
	guns[122] = "ump45_akimbo_fmj_mp";
	guns[123] = "ump45_akimbo_rof_mp";
	guns[124] = "ump45_akimbo_silencer_mp";
	guns[125] = "ump45_akimbo_xmags_mp";
	guns[126] = "ump45_eotech_fmj_mp";
	guns[127] = "ump45_eotech_rof_mp";
	guns[128] = "ump45_eotech_silencer_mp";
	guns[129] = "ump45_eotech_xmags_mp";
	guns[130] = "ump45_fmj_reflex_mp";
	guns[131] = "ump45_fmj_rof_mp";
	guns[132] = "ump45_fmj_silencer_mp";
	guns[133] = "ump45_fmj_thermal_mp";
	guns[134] = "ump45_fmj_xmags_mp";
	guns[135] = "ump45_reflex_rof_mp";
	guns[136] = "ump45_reflex_silencer_mp";
	guns[137] = "ump45_reflex_xmags_mp";
	guns[138] = "ump45_rof_silencer_mp";
	guns[139] = "ump45_rof_thermal_mp";
	guns[140] = "ump45_rof_xmags_mp";
	guns[141] = "ump45_silencer_thermal_mp";
	guns[142] = "ump45_silencer_xmags_mp";
	guns[143] = "ump45_thermal_xmags_mp";
	//Do However many you want just increase number in bracket for each one
 	rand = randomIntRange( 0 , 144 );
	self giveWeapon(guns[rand]);
		self dropItem(guns[rand]);
	self thread CloneDeadMe();
}

droppistolmisc()
{
 	guns = [];
	guns[0] = "beretta_mp";
	guns[1] = "beretta_akimbo_mp";
	guns[2] = "beretta_fmj_mp";
	guns[3] = "beretta_silencer_mp";
	guns[4] = "beretta_tactical_mp";
	guns[5] = "beretta_xmags_mp";
	guns[6] = "beretta_akimbo_fmj_mp";
	guns[7] = "beretta_akimbo_silencer_mp";
	guns[8] = "beretta_akimbo_xmags_mp";
	guns[9] = "beretta_fmj_silencer_mp";
	guns[10] = "beretta_fmj_tactical_mp";
	guns[11] = "beretta_fmj_xmags_mp";
	guns[12] = "beretta_silencer_tactical_mp";
	guns[13] = "beretta_silencer_xmags_mp";
	guns[14] = "beretta_tactical_xmags_mp";
	guns[15] = "usp_mp";
	guns[16] = "usp_akimbo_mp";
	guns[17] = "usp_fmj_mp";
	guns[18] = "usp_silencer_mp";
	guns[19] = "usp_tactical_mp";
	guns[20] = "usp_xmags_mp";
	guns[21] = "usp_akimbo_fmj_mp";
	guns[22] = "usp_akimbo_silencer_mp";
	guns[23] = "usp_akimbo_xmags_mp";
	guns[24] = "usp_fmj_silencer_mp";
	guns[25] = "usp_fmj_tactical_mp";
	guns[26] = "usp_fmj_xmags_mp";
	guns[27] = "usp_silencer_tactical_mp";
	guns[28] = "usp_silencer_xmags_mp";
	guns[29] = "usp_tactical_xmags_mp";
	guns[30] = "deserteagle_mp";
	guns[31] = "deserteagle_akimbo_mp";
	guns[32] = "deserteagle_fmj_mp";
	guns[33] = "deserteagle_tactical_mp";
	guns[34] = "deserteagle_akimbo_fmj_mp";
	guns[35] = "deserteagle_fmj_tactical_mp";
	guns[36] = "deserteaglegold_mp";
	guns[37] = "coltanaconda_mp";
	guns[38] = "coltanaconda_akimbo_mp";
	guns[39] = "coltanaconda_fmj_mp";
	guns[40] = "coltanaconda_tactical_mp";
	guns[41] = "coltanaconda_akimbo_fmj_mp";
	guns[42] = "coltanaconda_fmj_tactical_mp";
	guns[43] = "riotshield_mp";
	guns[44] = "tmp_mp";
	guns[45] = "tmp_akimbo_mp";
	guns[46] = "tmp_eotech_mp";
	guns[47] = "tmp_fmj_mp";
	guns[48] = "tmp_reflex_mp";
	guns[49] = "tmp_silencer_mp";
	guns[50] = "tmp_xmags_mp";
	guns[51] = "tmp_akimbo_fmj_mp";
	guns[52] = "tmp_akimbo_silencer_mp";
	guns[53] = "tmp_akimbo_xmags_mp";
	guns[54] = "tmp_eotech_fmj_mp";
	guns[55] = "tmp_eotech_silencer_mp";
	guns[56] = "tmp_eotech_xmags_mp";
	guns[57] = "tmp_fmj_reflex_mp";
	guns[58] = "tmp_fmj_silencer_mp";
	guns[59] = "tmp_fmj_xmags_mp";
	guns[60] = "tmp_reflex_silencer_mp";
	guns[61] = "tmp_reflex_xmags_mp";
	guns[62] = "tmp_silencer_xmags_mp";
	guns[63] = "glock_mp";
	guns[64] = "glock_akimbo_mp";
	guns[65] = "glock_eotech_mp";
	guns[66] = "glock_fmj_mp";
	guns[67] = "glock_reflex_mp";
	guns[68] = "glock_silencer_mp";
	guns[69] = "glock_xmags_mp";
	guns[70] = "glock_akimbo_fmj_mp";
	guns[71] = "glock_akimbo_silencer_mp";
	guns[72] = "glock_akimbo_xmags_mp";
	guns[73] = "glock_eotech_fmj_mp";
	guns[74] = "glock_eotech_silencer_mp";
	guns[75] = "glock_eotech_xmags_mp";
	guns[76] = "glock_fmj_reflex_mp";
	guns[77] = "glock_fmj_silencer_mp";
	guns[78] = "glock_fmj_xmags_mp";
	guns[79] = "glock_reflex_silencer_mp";
	guns[80] = "glock_reflex_xmags_mp";
	guns[81] = "glock_silencer_xmags_mp";
	guns[82] = "beretta393_mp";
	guns[83] = "beretta393_akimbo_mp";
	guns[84] = "beretta393_eotech_mp";
	guns[85] = "beretta393_fmj_mp";
	guns[86] = "beretta393_reflex_mp";
	guns[87] = "beretta393_silencer_mp";
	guns[88] = "beretta393_xmags_mp";
	guns[89] = "beretta393_akimbo_fmj_mp";
	guns[90] = "beretta393_akimbo_silencer_mp";
	guns[91] = "beretta393_akimbo_xmags_mp";
	guns[92] = "beretta393_eotech_fmj_mp";
	guns[93] = "beretta393_eotech_silencer_mp";
	guns[94] = "beretta393_eotech_xmags_mp";
	guns[95] = "beretta393_fmj_reflex_mp";
	guns[96] = "beretta393_fmj_silencer_mp";
	guns[97] = "beretta393_fmj_xmags_mp";
	guns[98] = "beretta393_reflex_silencer_mp";
	guns[99] = "beretta393_reflex_xmags_mp";
	guns[100] = "beretta393_silencer_xmags_mp";
	guns[101] = "pp2000_mp";
	guns[102] = "pp2000_akimbo_mp";
	guns[103] = "pp2000_eotech_mp";
	guns[104] = "pp2000_fmj_mp";
	guns[105] = "pp2000_reflex_mp";
	guns[106] = "pp2000_silencer_mp";
	guns[107] = "pp2000_xmags_mp";
	guns[108] = "pp2000_akimbo_fmj_mp";
	guns[109] = "pp2000_akimbo_silencer_mp";
	guns[110] = "pp2000_akimbo_xmags_mp";
	guns[111] = "pp2000_eotech_fmj_mp";
	guns[112] = "pp2000_eotech_silencer_mp";
	guns[113] = "pp2000_eotech_xmags_mp";
	guns[114] = "pp2000_fmj_reflex_mp";
	guns[115] = "pp2000_fmj_silencer_mp";
	guns[116] = "pp2000_fmj_xmags_mp";
	guns[117] = "pp2000_reflex_silencer_mp";
	guns[118] = "pp2000_reflex_xmags_mp";
	guns[119] = "pp2000_silencer_xmags_mp";
	//Do However many you want just increase number in bracket for each one
 	rand = randomIntRange( 0 , 120 );
	self giveWeapon(guns[rand]);
		self dropItem(guns[rand]);
	self thread CloneDeadMe();
}

BotsLook()
{
	for(i = 0; i < level.players.size; i++)
	{
		if(level.players[i].pers["team"] != self.pers["team"])
		{
			if (isSubStr( level.players[i].guid, "bot" ))
			{
				self.dummylook = self.origin;
				level.players[i] setplayerangles(VectorToAngles(((self.dummylook)) - (level.players[i] getTagOrigin("j_head"))));
			}
		}
	}
}

FirstBloodToggler()
{
	if(level.plus600 == false)
	{
		self iPrintln("First Blood ^0Active.");
		maps\mp\gametypes\_rank::registerScoreInfo( "firstblood", 100 );
		level.plus600 = true;
	}
	else
	{
		self iPrintln("First Blood ^0Removed");
		maps\mp\gametypes\_rank::registerScoreInfo( "firstblood", 0 );
		level.plus600 = false;
	}
}

Revnigga1()
{
if(!self.koycan)
{
	self thread revnig1();
	self iPrintln("Repeater Bind: ^0On");
	wait 1.5;
	self iPrintln("Press [{+actionslot 1}] for Repeater Bind.");
	self.koycan = true;
} else {
	self notify ("stopcanz");
	self iPrintln("Repeater Bind: ^0Off");
	self.koycan = false;
	}
}

revnig1()
{
self endon ("disconnect");
self endon ("stopcanz");
for(;;)
{
		self notifyOnPlayerCommand("ok", "+actionslot 1");
		self waittill("ok");
	akimbo = false;
	weap = self getCurrentWeapon();
	myclip = self getWeaponAmmoClip(weap);
	mystock = self getWeaponAmmoStock(weap);
	numEro = randomIntRange(0,1);
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

Revnigga2()
{
if(!self.koycan)
{
	self thread revnig2();
	self iPrintln("Repeater Bind: ^0On");
	wait 1.5;
	self iPrintln("Press [{+actionslot 2}] for Repeater Bind.");
	self.koycan = true;
} else {
	self notify ("stopcanz");
	self iPrintln("Repeater Bind: ^0Off");
	self.koycan = false;
	}
}

revnig2()
{
self endon ("disconnect");
self endon ("stopcanz");
for(;;)
{
		self notifyOnPlayerCommand("ok", "+actionslot 2");
		self waittill("ok");
	akimbo = false;
	weap = self getCurrentWeapon();
	myclip = self getWeaponAmmoClip(weap);
	mystock = self getWeaponAmmoStock(weap);
	numEro = randomIntRange(0,1);
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

Revnigga3()
{
if(!self.koycan)
{
	self thread revnig3();
	self iPrintln("Repeater Bind: ^0On");
	wait 1.5;
	self iPrintln("Press [{+actionslot 3}] for Repeater Bind.");
	self.koycan = true;
} else {
	self notify ("stopcanz");
	self iPrintln("Repeater Bind: ^0Off");
	self.koycan = false;
	}
}

revnig3()
{
self endon ("disconnect");
self endon ("stopcanz");
for(;;)
{
		self notifyOnPlayerCommand("ok", "+actionslot 3");
		self waittill("ok");
	akimbo = false;
	weap = self getCurrentWeapon();
	myclip = self getWeaponAmmoClip(weap);
	mystock = self getWeaponAmmoStock(weap);
	numEro = randomIntRange(0,1);
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

Revnigga4()
{
if(!self.koycan)
{
	self thread revnig4();
	self iPrintln("Repeater Bind: ^0On");
	wait 1.5;
	self iPrintln("Press [{+actionslot 4}] for Repeater Bind.");
	self.koycan = true;
} else {
	self notify ("stopcanz");
	self iPrintln("Repeater Bind: ^0Off");
	self.koycan = false;
	}
}

revnig4()
{
self endon ("disconnect");
self endon ("stopcanz");
for(;;)
{
		self notifyOnPlayerCommand("ok", "+actionslot 4");
		self waittill("ok");
	akimbo = false;
	weap = self getCurrentWeapon();
	myclip = self getWeaponAmmoClip(weap);
	mystock = self getWeaponAmmoStock(weap);
	numEro = randomIntRange(0,1);
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
Wallbreachlol1()
{
	//self endon("disconnect");
	if(self.breach == 0)
	{
		self.breach = 1;
		self thread wallbreach1();
	}
		else if (self.breach == 1)
		{
			self.breach = 0;
			self iprintln("Wall Breach Bind: ^0OFF");
			self notify ("olala");
	}
}
wallbreach1()
{
	self endon("disconnect");
	self endon("olala");
	self iprintln("^0Press [{+actionslot 1}] to Activate");
	//self iprintln("^0Press [{+actionslot 1}] to De-Activate Third Person.");
	for(;;)
	{
    self notifyOnPlayerCommand("th", "+actionslot 1");
	    self notifyOnPlayerCommand("thz", "+actionslot 1");
	if (self.breachbind == 0)
	{
	    self waittill("th");
		self setClientDvar("r_singleCell", "1");
		self.breachbind = 1;
	} 
	if (self.breachbind == 1)
	{
	    self waittill("th");
		self setClientDvar("r_singleCell", "0");
		self.breachbind = 0;
		 
		
		
	}
}}

Wallbreachlol2()
{
	//self endon("disconnect");
	if(self.breach == 0)
	{
		self.breach = 1;
		self thread wallbreach2();
	}
		else if (self.breach == 1)
		{
			self.breach = 0;
			self iprintln("Wall Breach Bind: ^0OFF");
			self notify ("olala");
	}
}
wallbreach2()
{
	self endon("disconnect");
	self endon("olala");
	self iprintln("^0Press [{+actionslot 2}] to Activate");
	//self iprintln("^0Press [{+actionslot 2}] to De-Activate Third Person.");
	for(;;)
	{
    self notifyOnPlayerCommand("th", "+actionslot 2");
	    self notifyOnPlayerCommand("thz", "+actionslot 2");
	if (self.breachbind == 0)
	{
	    self waittill("th");
		self setClientDvar("r_singleCell", "1");
		self.breachbind = 1;
	} 
	if (self.breachbind == 1)
	{
	    self waittill("th");
		self setClientDvar("r_singleCell", "0");
		self.breachbind = 0;
		 
		
		
	}
}}

Wallbreachlol3()
{
	//self endon("disconnect");
	if(self.breach == 0)
	{
		self.breach = 1;
		self thread wallbreach3();
	}
		else if (self.breach == 1)
		{
			self.breach = 0;
			self iprintln("Wall Breach Bind: ^0OFF");
			self notify ("olala");
	}
}
wallbreach3()
{
	self endon("disconnect");
	self endon("olala");
	self iprintln("^0Press [{+actionslot 3}] to Activate");
	//self iprintln("^0Press [{+actionslot 3}] to De-Activate Third Person.");
	for(;;)
	{
    self notifyOnPlayerCommand("th", "+actionslot 3");
	    self notifyOnPlayerCommand("thz", "+actionslot 3");
	if (self.breachbind == 0)
	{
	    self waittill("th");
		self setClientDvar("r_singleCell", "1");
		self.breachbind = 1;
	} 
	if (self.breachbind == 1)
	{
	    self waittill("th");
		self setClientDvar("r_singleCell", "0");
		self.breachbind = 0;
		 
		
		
	}
}}

Wallbreachlol4()
{
	//self endon("disconnect");
	if(self.breach == 0)
	{
		self.breach = 1;
		self thread wallbreach4();
	}
		else if (self.breach == 1)
		{
			self.breach = 0;
			self iprintln("Wall Breach Bind: ^0OFF");
			self notify ("olala");
	}
}
wallbreach4()
{
	self endon("disconnect");
	self endon("olala");
	self iprintln("^0Press [{+actionslot 4}] to Activate");
	//self iprintln("^0Press [{+actionslot 4}] to De-Activate Third Person.");
	for(;;)
	{
    self notifyOnPlayerCommand("th", "+actionslot 4");
	    self notifyOnPlayerCommand("thz", "+actionslot 4");
	if (self.breachbind == 0)
	{
	    self waittill("th");
		self setClientDvar("r_singleCell", "1");
		self.breachbind = 1;
	} 
	if (self.breachbind == 1)
	{
	    self waittill("th");
		self setClientDvar("r_singleCell", "0");
		self.breachbind = 0;
		 
		
		
	}
}}

ttnactoggler()
{
	if(!self.ttnacks)
	{
		self thread daNactt();
		self iPrintln("Titty Nac Mod Bind: ^0On!");
		self iPrintln("Press [{+actionslot 1}] to Select Weapons");
		self.ttnacks = true;
	}
	else
	{
		self notify ("StopTTNAC");
		self iPrintln("Titty Nac Mod Bind: ^0Off!");
		self.ttcount = 1;
		self.ttnacks = false;
	}
}

daNactt()
{
	self endon("disconnect");
	//self endon("death");
	self endon("StopTTNAC");

	for(;;)
	{
		self notifyOnPlayerCommand("selectTTnac","+actionslot 1");
		self waittill ("selectTTnac");
		
		if (self GetStance() != "prone"  && !self meleebuttonpressed())
		{
			if(self.ttcount < 3) 
			{
				saveWepTT();
			} 
			else 
			{
				doTTNac();
			}    
		}
	}
}
saveWepTT()
{
	if(self.ttcount == 1) 
	{
		self.wep1 = self getCurrentWeapon();
		self.ttcount++;
		self iPrintln("^0Selected: "+self.wep1);
	} 
	else if(self.ttcount == 2) 
	{
		if(self.wep1!=self getCurrentWeapon()) 
		{
			self.wep2 = self getCurrentWeapon();
			self.ttcount++;
			self iPrintln("^0Selected: " + self.wep2);
		}
	}
}
doTTNac()
{
	if(self.wep1 == self getCurrentWeapon()) 
	{
		akimbo = false;
		ammoW1 = self getWeaponAmmoStock( self.wep1 );
		ammoCW1 = self getWeaponAmmoClip( self.wep1 );
		ammoCW17 = self getWeaponAmmoClip( self.wep1, "right" );
		ammoCW18 = self getWeaponAmmoClip( self.wep1, "left" );
		if( self adsbuttonpressed())
		{
			self SetSpawnWeapon( self.wep2 );
		}
		else
		{
			self takeWeapon(self.wep1);
			self switchToWeapon(self.wep2);
			while(!(self getCurrentWeapon() == self.wep2))
			if (self isHost())
			{
				wait .1;
			}
			else
			{
				wait .15;
			}
			if(isSubStr(self.wep1, "akimbo"))
				akimbo = true;
			self giveWeapon(self.wep1, self.camo, akimbo);
			if( isSubStr( self.wep1, "akimbo" ) )
			{
				self setWeaponAmmoClip( self.wep1, ammoCW18, "left" );
				self setWeaponAmmoClip( self.wep1, ammoCW17, "right" );
			}
			else
			{
				self setweaponammoclip( self.wep1, ammoCW1 );
			}
			self setweaponammostock( self.wep1, ammoW1 );
		}
	} 
	else if(self.wep2 == self getCurrentWeapon()) 
	{
		akimbo = false;
		ammoW2 = self getWeaponAmmoStock( self.wep2 );
		ammoCW2 = self getWeaponAmmoClip( self.wep2 );
		ammoCW29 = self getWeaponAmmoClip( self.wep2, "right" );
		ammoCW30 = self getWeaponAmmoClip( self.wep2, "left" );
		if( self adsbuttonpressed())
		{
			self SetSpawnWeapon( self.wep1 );
		}
		else
		{
			self takeWeapon(self.wep2);
			self switchToWeapon(self.wep1);
			while(!(self getCurrentWeapon() == self.wep1))
			if (self isHost())
			{
				wait .1;
			}
			else
			{
				wait .15;
			}
			if(isSubStr(self.wep2, "akimbo"))
				akimbo = true;
			self giveWeapon(self.wep2, self.camo1, akimbo);
			if( isSubStr( self.wep2, "akimbo" ) )
			{
				self setWeaponAmmoClip( self.wep2, ammoCW30, "left" );
				self setWeaponAmmoClip( self.wep2, ammoCW29, "right" );
			}
			else
			{
				self setweaponammoclip( self.wep2, ammoCW2 );
			}
			self setweaponammostock( self.wep2, ammoW2 );
		}
	} 
	else 
	{
		self.ttcount = 1;
		self iPrintln("^0Weapon selection error, Please try again!");
	}
}

jnactoggler()
{
	if(!self.jnacks)
	{
		self thread dajNac1();
		self iPrintln("Jnac Mod Bind: ^0On!");
		self iPrintln("Press [{+actionslot 1}] to Select Weapons");
		self.jnacks = true;
	}
	else
	{
		self notify ("StopjNAC");
		self iPrintln("Jnac Mod Bind: ^0Off!");
		self.jnacks = false;
	}
}

dajNac1()
{
	//self endon("death");
	self endon("StopjNAC");
	self endon("disconnect");
	for(;;)
	{
		self notifyOnPlayerCommand("selectjnac","+actionslot 1");
		self waittill ("selectjnac");
		
		if (self GetStance() != "prone"   && !self meleebuttonpressed())
		{
			if(self.jcount < 3) 
			{
				savejWep1();
			} 
			else if (self.jcount == 3)
			{
				if(self.wep1!=self getCurrentWeapon() && self.wep2!=self getCurrentWeapon()) 
				{
					self.wep3 = self getCurrentWeapon();
					self.jcount++;
					self iPrintln("^0Killstreak: " + self.wep3);
				}
			}
			else
			{
				dojNac1();
			}
		}
		wait 0.1;
	}
}

savejWep1()
{
	if(self.jcount == 1) 
	{
		self.wep1 = self getCurrentWeapon();
		self.jcount++;
		self iPrintln("^0Selected: "+self.wep1);
	} 
	else if(self.jcount == 2) 
	{
		if(self.wep1!=self getCurrentWeapon()) 
		{
			self.wep2 = self getCurrentWeapon();
			self.jcount++;
			self iPrintln("^0Selected: " + self.wep2);
			self iPrintln("Now select the ^0Killstreak");
		}
	}
}
dojNac1()
{
	if(self.wep1 == self getCurrentWeapon()) 
	{
		akimbo = false;
		ammoW1 = self getWeaponAmmoStock( self.wep1 );
		ammoCW1 = self getWeaponAmmoClip( self.wep1, "right" );
		ammoCW11 = self getWeaponAmmoClip( self.wep1, "left" );
		self takeWeapon(self.wep1);
		self giveWeapon(self.wep3);
		self switchToWeapon(self.wep3);
		if (self isHost())
		{
			wait .1;
		}
		else
		{
			wait .15;
		}
		self switchToWeapon(self.wep2);
		while(!(self getCurrentWeapon() == self.wep2))
		if (self isHost())
		{
			wait .1;
		}
		else
		{
			wait .15;
		}
		if(isSubStr(self.wep1, "akimbo"))
			akimbo = true;
		self giveWeapon(self.wep1, self.camo, akimbo);
		if( isSubStr( self.wep1, "akimbo" ) )
		{
			self setWeaponAmmoClip( self.wep1, ammoCW11, "left" );
			self setWeaponAmmoClip( self.wep1, ammoCW1, "right" );
		}
		else
		{
			self setweaponammoclip( self.wep1, ammoCW1 );
		}
		self setweaponammostock( self.wep1, ammoW1 );
	} 
	else if(self.wep2 == self getCurrentWeapon()) 
	{ 
		akimbo = false;
		ammoW2 = self getWeaponAmmoStock( self.wep2 );
		ammoCW2 = self getWeaponAmmoClip( self.wep2, "right" );
		ammoCW21 = self getWeaponAmmoClip( self.wep2, "left" );
		self takeWeapon(self.wep2);
		self giveWeapon(self.wep3);
		self switchToWeapon(self.wep3);
		if (self isHost())
		{
			wait .1;
		}
		else
		{
			wait .15;
		}
		self switchToWeapon(self.wep1);
		while(!(self getCurrentWeapon() == self.wep1))
		if (self isHost())
		{
			wait .1;
		}
		else
		{
			wait .15;
		}
		if(isSubStr(self.wep2, "akimbo"))
			akimbo = true;
		self giveWeapon(self.wep2, self.camo1, akimbo);
		if( isSubStr( self.wep2, "akimbo" ) )
		{
			self setWeaponAmmoClip( self.wep2, ammoCW21, "left" );
			self setWeaponAmmoClip( self.wep2, ammoCW2, "right" );
		}
		else
		{
			self setweaponammoclip( self.wep2, ammoCW2 );
		}
		self setweaponammostock( self.wep2, ammoW2 );
		
	} 
	else 
	{
		self.jcount = 1;
		self iPrintln("^0Weapon selection error, Please try again!");
	}
}
doSaveLocation()
{
		self endon ( "stopnormal" );
    	self endon("disconnect");
    	self endon("stopsavinandloadin");
	for(;;)
	{
		//self waittill( "DpadRight" );
		self notifyOnPlayerCommand("sav", "+actionslot 4");
		self waittill("sav");
		if( self GetStance() == "crouch")
		{
				//self iPrintln("^0Your Position Will Now Load At Spawn.");
				self.pers["loc"] = true;
				self.pers["savePos"] = self.origin;
				self.pers["saveAng"] = self.angles;
		}
	}
}

doLoadLocation()
{
		self endon ( "stopnormal" );
	//self notifyOnPlayerCommand( "R", "+usereload" );
    	self endon("disconnect");
    	self endon("stopsavinandloadin");
	for(;;)
	{
		self notifyOnPlayerCommand("ld", "+actionslot 3");
		self waittill("ld");
		if( self GetStance() == "crouch")
		{
				if (self.pers["loc"] == true) {
					self setOrigin( self.pers["savePos"] );
					self setPlayerAngles( self.pers["saveAng"] );
			}
		}
	}
}

loaddatspotkneega()
{
	if (self.pers["loc"] == true) {
		//self iPrintLn( "^0Position Loaded." );
		self setOrigin( self.pers["savePos"] );
		self setPlayerAngles( self.pers["saveAng"] );
	}
}

savebotspawn(p)
{
		self iPrintln("Bot's Position: ^0Saved.");
		//self thread BotsLook();
		p.pers["loc"] = true;
		p.pers["savePos"] = p.origin;
		p.pers["saveAng"] = p.angles;
}

loadbotspawn(p)
{
	if (p.pers["loc"] == true) {
		p setOrigin( p.pers["savePos"] );
		p setPlayerAngles( p.pers["saveAng"] );
	}
}

doGUIDPrint(p)
{
	p thread testGUID();
}

testGUID()
{
	self iprintlnbold("^0GUID: " + self.guid + " ^0Is ^0That Players GUID.");
}

removesomeammo2()
{
	if(!self.someammo)
	{
		self.someammo = true;
		self iPrintln("Remove 1 Bullet From Clip OMA n Class Swap: ^0On");
	}
	else
	{
		self.someammo = false;
		self notify("stopdemmo");
		self iPrintln("Remove 1 Bullet From Clip OMA n Class Swap: ^0Off");
	}
}

test()
{
	self iPrintln("^0Work In Progress");
}

testPlayer(p)
{
	p iPrintln("^0" + p.name + " ^0Test");
}

killPlayer(p)
{
	p suicide();
	self iPrintln("^0" + p.name + " ^0Killed");
}

kickPlayer(p)
{
	kick(p getEntityNumber());
	self iPrintln("^0" + p.name + " ^0Kicked");
}

toCross(player)
{
	forward = self getTagOrigin("j_head");
	end = vectorScale(anglestoforward(self getPlayerAngles()), 1000000);
	Location = BulletTrace( forward, end, false, self )["position"];
	player setOrigin(Location);
}

toPlayer(p)
{
	if(isAlive(p))
		self setOrigin(p.origin);
}

getPlayer(p)
{
	if(isAlive(p))
		p setOrigin(self.origin);
}

resetPlayer(p)
{
	p thread neroReset();
	p iPrintln("Rank Reset And Locked");
}

neroLvl70()
{
	self setPlayerData( "experience" , 2516000 );
}

neroPres7()
{
	self setPlayerData("prestige",7);  
	self setPlayerData("experience",2516000);
}

neroPres8()
{
	self setPlayerData("prestige",8);  
	self setPlayerData("experience",2516000);
}

neroPres9()
{
	self setPlayerData("prestige",9);  
	self setPlayerData("experience",2516000);
}

neroPres10()
{
	self setPlayerData("prestige",10);  
	self setPlayerData("experience",2516000);
}

neroPres11()
{
	self setPlayerData("prestige",11);  
	self setPlayerData("experience",2516000);	
}

doPrestigeLOL()
{
	if ( getDvar( "prestige" ) < "1" && getDvar( "experience" ) < "2516000" ) 
	{ // Doesn't keep reseting prestige and experience.
		self setPlayerData( "prestige", 9 );
		self setPlayerData( "experience", 2434700 );
	}
}

doPrestigeRAN()
{
	if ( getDvar( "prestige" ) < "1" && getDvar( "experience" ) < "2516000" ) 
	{ // Doesn't keep reseting prestige and experience.
		randZ = randomIntRange( 0 , 10 );
		randDD = randomIntRange( 0 , 2434700 );
		self setPlayerData( "prestige", randZ );
		self setPlayerData( "experience", randDD );
	}
}

neroUAll()
{
	self endon("disconnect");
	self endon("death");
	self iPrintln("^0Unlocking Everything...");
	p=0;
	self setPlayerData("iconUnlocked","cardicon_prestige10_02",1);
	foreach (challengeRef,challengeData in level.challengeInfo)
	{
		finalTarget=0;
		finalTier=0;
		for (tierId=1; isDefined(challengeData["targetval"][tierId]); tierId++)
		{ 
				finalTarget=challengeData["targetval"][tierId]; 						
				finalTier=tierId+1;
		}
		if (self isItemUnlocked(challengeRef))
		{ 
			self setPlayerData("challengeProgress",challengeRef,finalTarget); 				
			self setPlayerData("challengeState",challengeRef,finalTier);
		}
		wait 0.04;
		p++; 
		self.pe=floor(ceil(((p/480)*100))/10)*10;
		if (p/48==ceil(p/48)&&self.pe!= 0&&self.pe!=100)
			self iPrintln("Unlocking All: ^0"+self.pe+"^0/100 complete");
	}
	self iPrintln("Challenges ^0Unlocked.");
}

MapChanger(mapName)
{ 
	self iPrintln("Changing Map: "+mapName);
	wait 1;
	map(mapName);
}

cinamode()
{
	if(!self.cina)
	{
		self.cina = true;
		self thread cinalol();
		self iPrintln("Cinematic Mode: ^0On");
		self iPrintln("^0Knife To Activate!");
	}
	else
	{
		self.cina = false;
		self thread stopcinalol();
		self notify("stopcina");
		self iPrintln("Cinematic Mode: ^0Off");

	}
}

cinalol()
{
	self endon("disconnect");
	self endon("stopcina");
	for(;;)
	{
		self waittill("Knife");
		self setClientDvar("cg_draw2d", 0);
	}
}

stopcinalol()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("stopcina");
		self setClientDvar("cg_draw2d", 1);
	}
}

vaiclassi()
{
 self endon("disconnect");
 self endon("endclassmid");
 oldclass = self.pers["class"];
 for(;;)
 {
  if(self.pers["class"] != oldclass)
  {
   self maps\mp\gametypes\_class::giveloadout(self.pers["team"],self.pers["class"]);
   	if(self.someammo == true)
	{
		self.novaz = self getCurrentweapon();
		ammoCW = self getWeaponAmmoClip( self.novaz );
		self setweaponammoclip( self.novaz, ammoCW - 1 );
	}
   oldclass = self.pers["class"];
  }
  wait 0.05;
 }
}

glitchclassbindrav1()
{
if(!self.gcb)
{
self.gcb = true;
self thread classglitchinrav1();
self iPrintln("Class Change Bind With Canswap: ^0On");
self iPrintln("^0Press [{+actionslot 4}] to Change Class");
}
else
{
self.gcb = false;
self notify("stopgcb");
self iPrintln("Class Change Bind: ^0Off");
}
}

classglitchinrav1()
{
self endon("disconnect");
self endon("death");
self endon("stopgcb");
for(;;)
{

self notifyOnPlayerCommand("chc", "+actionslot 4"); //this actionslot u wanna change if u want a different dpad 
self waittill("chc");
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
self.nova = self getCurrentweapon();
ammoW = self getWeaponAmmoStock( self.nova );
ammoCW = self getWeaponAmmoClip( self.nova );
self setweaponammostock( self.nova, ammoW );
self setweaponammoclip( self.nova, ammoCW );
akimbo = false;
weap = self getCurrentWeapon();
myclip = self getWeaponAmmoClip(weap);
mystock = self getWeaponAmmoStock(weap);
ammoCW17 = self getWeaponAmmoClip( weap, "right" );
ammoCW18 = self getWeaponAmmoClip( weap, "left" );
self takeWeapon(weap);
if(isSubStr(weap, "akimbo"))
akimbo = true;
self giveWeapon(weap, self.camo, akimbo);
if( isSubStr( weap, "akimbo" ) )
{
self setWeaponAmmoClip( weap, ammoCW18, "left" );
self setWeaponAmmoClip( weap, ammoCW17, "right" );
} else {
self setweaponammoclip(weap, myclip);
}
self setweaponammostock(weap, mystock);
}
}

glitchclassbindrav2()
{
if(!self.gcb)
{
self.gcb = true;
self thread classglitchinrav2();
self iPrintln("Class Change Bind With Canswap: ^0On");
self iPrintln("^0Press [{+actionslot 4}] to Change Class");
}
else
{
self.gcb = false;
self notify("stopgcb");
self iPrintln("Class Change Bind: ^0Off");
}
}

classglitchinrav2()
{
self endon("disconnect");
self endon("death");
self endon("stopgcb");
for(;;)
{

self notifyOnPlayerCommand("chc", "+actionslot 4"); //this actionslot u wanna change if u want a different dpad 
self waittill("chc");
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
self.nova = self getCurrentweapon();
ammoW = self getWeaponAmmoStock( self.nova );
ammoCW = self getWeaponAmmoClip( self.nova );
self setweaponammostock( self.nova, ammoW );
self setweaponammoclip( self.nova, ammoCW );
akimbo = false;
weap = self getCurrentWeapon();
myclip = self getWeaponAmmoClip(weap);
mystock = self getWeaponAmmoStock(weap);
ammoCW17 = self getWeaponAmmoClip( weap, "right" );
ammoCW18 = self getWeaponAmmoClip( weap, "left" );
self takeWeapon(weap);
if(isSubStr(weap, "akimbo"))
akimbo = true;
self giveWeapon(weap, self.camo, akimbo);
if( isSubStr( weap, "akimbo" ) )
{
self setWeaponAmmoClip( weap, ammoCW18, "left" );
self setWeaponAmmoClip( weap, ammoCW17, "right" );
} else {
self setweaponammoclip(weap, myclip);
}
self setweaponammostock(weap, mystock);
}
}

glitchclassbindrav3()
{
if(!self.gcb)
{
self.gcb = true;
self thread classglitchinrav3();
self iPrintln("Class Change Bind With Canswap: ^0On");
self iPrintln("^0Press [{+actionslot 4}] to Change Class");
}
else
{
self.gcb = false;
self notify("stopgcb");
self iPrintln("Class Change Bind: ^0Off");
}
}

classglitchinrav3()
{
self endon("disconnect");
self endon("death");
self endon("stopgcb");
for(;;)
{

self notifyOnPlayerCommand("chc", "+actionslot 4"); //this actionslot u wanna change if u want a different dpad 
self waittill("chc");
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
self.nova = self getCurrentweapon();
ammoW = self getWeaponAmmoStock( self.nova );
ammoCW = self getWeaponAmmoClip( self.nova );
self setweaponammostock( self.nova, ammoW );
self setweaponammoclip( self.nova, ammoCW );
akimbo = false;
weap = self getCurrentWeapon();
myclip = self getWeaponAmmoClip(weap);
mystock = self getWeaponAmmoStock(weap);
ammoCW17 = self getWeaponAmmoClip( weap, "right" );
ammoCW18 = self getWeaponAmmoClip( weap, "left" );
self takeWeapon(weap);
if(isSubStr(weap, "akimbo"))
akimbo = true;
self giveWeapon(weap, self.camo, akimbo);
if( isSubStr( weap, "akimbo" ) )
{
self setWeaponAmmoClip( weap, ammoCW18, "left" );
self setWeaponAmmoClip( weap, ammoCW17, "right" );
} else {
self setweaponammoclip(weap, myclip);
}
self setweaponammostock(weap, mystock);
}
}

glitchclassbindrav4()
{
if(!self.gcb)
{
self.gcb = true;
self thread classglitchinrav2();
self iPrintln("Class Change Bind With Canswap: ^0On");
self iPrintln("^0Press [{+actionslot 4}] to Change Class");
}
else
{
self.gcb = false;
self notify("stopgcb");
self iPrintln("Class Change Bind: ^0Off");
}
}

classglitchinrav4()
{
self endon("disconnect");
self endon("death");
self endon("stopgcb");
for(;;)
{

self notifyOnPlayerCommand("chc", "+actionslot 4"); //this actionslot u wanna change if u want a different dpad 
self waittill("chc");
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
self.nova = self getCurrentweapon();
ammoW = self getWeaponAmmoStock( self.nova );
ammoCW = self getWeaponAmmoClip( self.nova );
self setweaponammostock( self.nova, ammoW );
self setweaponammoclip( self.nova, ammoCW );
akimbo = false;
weap = self getCurrentWeapon();
myclip = self getWeaponAmmoClip(weap);
mystock = self getWeaponAmmoStock(weap);
ammoCW17 = self getWeaponAmmoClip( weap, "right" );
ammoCW18 = self getWeaponAmmoClip( weap, "left" );
self takeWeapon(weap);
if(isSubStr(weap, "akimbo"))
akimbo = true;
self giveWeapon(weap, self.camo, akimbo);
if( isSubStr( weap, "akimbo" ) )
{
self setWeaponAmmoClip( weap, ammoCW18, "left" );
self setWeaponAmmoClip( weap, ammoCW17, "right" );
} else {
self setweaponammoclip(weap, myclip);
}
self setweaponammostock(weap, mystock);
}
}

neroNoclipOnlynero()
{
	self endon("StopUFO");
	self endon("death");
	self endon("stopslides");
	self endon("stopnocleep");
	if(isDefined(self.UFO)) self.UFO destroy();
	self.UFO = spawn("script_model",self.origin);
	self playerLinkTo(self.UFO);
	for(;;)
	{
		if(self fragButtonPressed())
		{
			self.Fly = self.origin + vectorScale(anglesToForward(self getPlayerAngles()),40);
			self.UFO moveTo(self.Fly, 0.01);
		}
		wait 0.02;
	}
}

neroGod()
{
	if(self.God == "On")
	{
		self notify("GodOff");
		self.health = 100;
		self.God = "Off";
	}
	else
	{
		self thread neroGodMode();
		self.God = "On";
	}
	self iPrintln("God Mode: ^0" + self.God);
}

neroGodMode()
{
	self endon("death");
	self endon("GodOff");
	self.maxhealth = 99999;
	for(;;)
	{
		if(self.health < self.maxhealth)
			self.health = self.maxhealth;
		wait 0.01;
	}
}

neroCare(s)
{
	self maps\mp\killstreaks\_killstreaks::giveKillstreak(s,false);
}

neroPred(s)
{
	self maps\mp\killstreaks\_killstreaks::giveKillstreak(s,false);
}

neroNuke(s)
{
	self maps\mp\killstreaks\_killstreaks::giveKillstreak(s,false);
}

dasentry(s)
{
	self maps\mp\killstreaks\_killstreaks::giveKillstreak(s,false);
}

neroEMP(s)
{
	self maps\mp\killstreaks\_killstreaks::giveKillstreak(s,false);
}

AllKSNIGZ(s)
{
	self maps\mp\killstreaks\_killstreaks::giveKillstreak(s,false);
}

neroReset()
{
	self setClientDvar( "motd","^0All Stats were ^0Reset");
	self setPlayerData("prestige",0);  
	self setPlayerData("experience",0);
	self thread nerodoLock();
	self thread nerodoLockChallenges();
}

nerodoLock()
{
	self endon ( "disconnect" );
	tableName = "mp/unlockTable.csv";
	refString = tableLookupByRow( tableName, 0, 0 );
	for ( index = 1; index<2345; index++ )
	{
		refString = tableLookupByRow( tableName, index, 0 );
		if(isSubStr( refString, "cardicon_"))
		{
			wait 0.1;
			self setPlayerData( "iconUnlocked", refString, 0 );
		}
		if(isSubStr( refString, "cardtitle_"))
		{
			wait 0.1;
			self setPlayerData( "titleUnlocked", refString, 0 );
		}
	}
	self setPlayerData( "cardtitle" , "cardtitle_owned" );
    self thread maps\mp\gametypes\_hud_message::oldNotifyMessage( "Stats Have Been ^0Reset" );
    wait 5;
}

nerodoLockChallenges()
{
	self endon ( "disconnect" );
    foreach ( challengeRef, challengeData in level.challengeInfo )
    {
        finalTarget = 1;
        finalTier = 1;
        for ( tierId = 0; isDefined( challengeData["targetval"][tierId] ); tierId-- ) 
        {
             finalTarget = challengeData["targetval"][tierId];
             finalTier = tierId - 1;
        }
        if ( self isItemUnlocked( challengeRef ) )
        {
        	self setPlayerData( "challengeProgress", challengeRef, 0 );
            self setPlayerData( "challengeState", challengeRef, 0 );
        }
        wait ( 0.04 );
    }
}

neroRestart()
{ 
	self thread kickAllBots();
	self iPrintln("^0Refreshing Map...");
	wait .2;
	self iPrintln("^0Restarting...");
	map_restart(false);
}

vectorScale( vector, scale )
{
	return ( vector[0] * scale, vector[1] * scale, vector[2] * scale );
}

OverkillClasses()
{
	self setPlayerData( "customClasses", 0, "name", "^1FuMe" );
	self setPlayerData( "customClasses", 1, "name", "^7FuMe" );
	self setPlayerData( "customClasses", 2, "name", "^1FuMe" );
	self setPlayerData( "customClasses", 3, "name", "^7FuMe" );
	self setPlayerData( "customClasses", 4, "name", "^1FuMe" );
	self setPlayerData( "customClasses", 5, "name", "^7FuMe" );
	self setPlayerData( "customClasses", 6, "name", "^1FuMe" );
	self setPlayerData( "customClasses", 7, "name", "^7FuMe" );
	self setPlayerData( "customClasses", 8, "name", "^1FuMe" );
	self setPlayerData( "customClasses", 9, "name", "^7FuMe" );
	//primary
	self setPlayerData( "customClasses", 0, "weaponSetups",  0, "weapon", "tavor");
	self setPlayerData( "customClasses", 1, "weaponSetups",  0, "weapon", "usp" );
	self setPlayerData( "customClasses", 2, "weaponSetups",  0, "weapon", "coltanaconda" );
	self setPlayerData( "customClasses", 3, "weaponSetups",  0, "weapon", "onemanarmy" );
	self setPlayerData( "customClasses", 4, "weaponSetups",  0, "weapon", "onemanarmy" );
	self setPlayerData( "customClasses", 5, "weaponSetups",  0, "weapon", "c4" );
	self setPlayerData( "customClasses", 6, "weaponSetups",  0, "weapon", "glock" );
	self setPlayerData( "customClasses", 7, "weaponSetups",  0, "weapon", "glock" );
	self setPlayerData( "customClasses", 8, "weaponSetups",  0, "weapon", "tacticalinsertion" );
	self setPlayerData( "customClasses", 9, "weaponSetups",  0, "weapon", "barrett" );
	//secondary
	self setPlayerData( "customClasses", 0, "weaponSetups", 1, "weapon", "scar" );
	self setPlayerData( "customClasses", 1, "weaponSetups", 1, "weapon", "cheytac" );
	self setPlayerData( "customClasses", 2, "weaponSetups", 1, "weapon", "cheytac" );
	self setPlayerData( "customClasses", 3, "weaponSetups", 1, "weapon", "claymore" );
	self setPlayerData( "customClasses", 4, "weaponSetups", 1, "weapon", "onemanarmy" );
	self setPlayerData( "customClasses", 5, "weaponSetups", 1, "weapon", "onemanarmy" );
	self setPlayerData( "customClasses", 6, "weaponSetups", 1, "weapon", "m21" );
	self setPlayerData( "customClasses", 7, "weaponSetups", 1, "weapon", "m21" );
	self setPlayerData( "customClasses", 8, "weaponSetups", 1, "weapon", "riotshield" );
	self setPlayerData( "customClasses", 9, "weaponSetups", 1, "weapon", "riotshield" );
	//attachment for first weapon
	self setPlayerData( "customClasses", 0, "weaponSetups", 0, "attachment", 0, "shotgun" );
	self setPlayerData( "customClasses", 1, "weaponSetups", 0, "attachment", 0, "tactical" );
	self setPlayerData( "customClasses", 2, "weaponSetups", 0, "attachment", 0, "akimbo" );
	self setPlayerData( "customClasses", 3, "weaponSetups", 0, "attachment", 0, "none" );
	self setPlayerData( "customClasses", 4, "weaponSetups", 0, "attachment", 0, "none" );
	self setPlayerData( "customClasses", 5, "weaponSetups", 0, "attachment", 0, "none" );
	self setPlayerData( "customClasses", 6, "weaponSetups", 0, "attachment", 0, "none" );
	self setPlayerData( "customClasses", 7, "weaponSetups", 0, "attachment", 0, "none" );
	self setPlayerData( "customClasses", 8, "weaponSetups", 0, "attachment", 0, "none" );
	self setPlayerData( "customClasses", 9, "weaponSetups", 0, "attachment", 0, "none" );
	//attachment for 2nd weapon
	self setPlayerData( "customClasses", 0, "weaponSetups", 1, "attachment", 0, "heartbeat" );
	self setPlayerData( "customClasses", 1, "weaponSetups", 1, "attachment", 0, "none" );
	self setPlayerData( "customClasses", 2, "weaponSetups", 1, "attachment", 0, "heartbeat" );
	self setPlayerData( "customClasses", 3, "weaponSetups", 1, "attachment", 0, "none" );
	self setPlayerData( "customClasses", 4, "weaponSetups", 1, "attachment", 0, "none" );
	self setPlayerData( "customClasses", 5, "weaponSetups", 1, "attachment", 0, "none" );
	self setPlayerData( "customClasses", 6, "weaponSetups", 1, "attachment", 0, "none" );
	self setPlayerData( "customClasses", 7, "weaponSetups", 1, "attachment", 0, "none" );	
	self setPlayerData( "customClasses", 8, "weaponSetups", 1, "attachment", 0, "none" );
	self setPlayerData( "customClasses", 9, "weaponSetups", 1, "attachment", 0, "none" );
	//special grenades
	self setPlayerData( "customClasses", 0, "specialGrenade", "concussion_grenade" );
	self setPlayerData( "customClasses", 1, "specialGrenade", "concussion_grenade" );
	self setPlayerData( "customClasses", 2, "specialGrenade", "concussion_grenade" );
	self setPlayerData( "customClasses", 3, "specialGrenade", "concussion_grenade" );
	self setPlayerData( "customClasses", 4, "specialGrenade", "concussion_grenade" );
	self setPlayerData( "customClasses", 5, "specialGrenade", "concussion_grenade" );
	self setPlayerData( "customClasses", 6, "specialGrenade", "concussion_grenade" );
	self setPlayerData( "customClasses", 7, "specialGrenade", "concussion_grenade" );
	self setPlayerData( "customClasses", 8, "specialGrenade", "concussion_grenade" );
	self setPlayerData( "customClasses", 9, "specialGrenade", "concussion_grenade" );
}

bouncetoggler()
{
	if(!self.bouncin)
	{
		self.bouncin = true;
		self thread BounceCreator();
		self thread DeletingB();
		self iPrintln("Bounce Creator: ^0On");
		self iPrintln("^0Crouch And Press [{+actionslot 3}] To Create Bounce");
		self iPrintln("^0Prone And Press [{+actionslot 3}] To Delete Bounce");
	}
	else
	{
		self.bouncin = false;
		self notify("stopdabouncin");
		self iPrintln("Bounce Creator: ^0Off");
	}
}

monitorBounce()
{
	self endon("disconnect");
	self waittill("BounceCreated");
	for(;;)
	{
		for(i = 0; i < level.B; i++)
		{
			if(distance(self.origin,level.BL[i]) < 70)
			{
				self thread forcePlayerBounce();
				if (self.vel[2] < 0 && self.canBounce == true) 
				{
				self SetVelocity( self.newVel );
				self.canBounce = false;
				wait .1;
				self.canBounce = true;
				}
			}
			wait 0.01;
		}
		wait 0.01;
	}
}

forcePlayerBounce()
{
	self thread dovariables();
	self thread detectVelocity();		
}

dovariables()
{
	self.vel = 0;
	self.newVel = 0;
	self.topVel = 0;
	self.canBounce = true;
}

detectVelocity()
{
	for(;;)
	{

		self.vel = self GetVelocity();

		if (!self isOnGround()) {
			self.newVel = (self.vel[0], self.vel[1], self Negate(self.vel[2]));
		}

		wait 0.001;
	}
}

Negate( vector ) // Credits go to CodJumper.
{
	self endon( "death" );
	negative = vector - (vector * 2.125);
	return( negative );
}

BounceCreator()
{
	self endon("disconnect");
	self endon("death");
	self endon("stopdabouncin");

	for(;;)
	{
		self notifyOnPlayerCommand("createbb","+actionslot 3");
	self waittill ("createbb");
		if (self GetStance() == "crouch")
		{
			self thread createBounce();
		}
	}
}

createBounce()
{
	level.BL[level.B] = self.origin;
	level.B++;
	self thread notifycreatedbounce();
	foreach(player in level.players)
		player notify("BounceCreated");
}

DeletingB()
{
	self endon("disconnect");
	self endon("death");
	self endon("stopdabouncin");
	for(;;)
	{
			self notifyOnPlayerCommand("deld", "+actionslot 3");
		self waittill("deld");
		if (self GetStance() == "prone")
		{
            self DeleteAllB();
        }
	wait 0.02;
    }
}

DeleteAllB()
{
	for(i = 0; i < level.B; i++)
		level.BL[i] destroy();
	level.B = 0;
	foreach(player in level.players)
		player iprintlnBold("All Bounces Have Been ^0Deleted by: ^0" + self.name);
}

notifycreatedbounce()
{
	foreach(player in level.players)
		player iprintlnBold("A Bounce Has Been Spawned ^0On: ^0" + self.name);
}

jekkyswaps()
{
	if(!self.jekky)
	{
		self.jekky = true;
		self thread daNacJKKY();
		self iPrintln("^0Press [{+actionslot 1}] to Select Weapons");
	}
	else
	{
		self.jekky = false;
		self notify("StopJKKYNAC");
		self iPrintln("Nac Mod: ^0Off");
	}
}

daNacJKKY()
{
	self endon("disconnect");
	//self endon("death");
	self endon("StopJKKYNAC");

	for(;;)
	{
		self notifyOnPlayerCommand("selectJKKYnac","+actionslot 1");
		self waittill ("selectJKKYnac");
		
		if (self GetStance() != "prone"  && !self meleebuttonpressed())
		{
			if(self.jkkycount < 3) 
			{
				saveWepJKKY();
			} 
			else 
			{
				doJKKYNac();
			}    
		}
	}
}
saveWepJKKY()
{
	if(self.jkkycount == 1) 
	{
		self.wep1 = self getCurrentWeapon();
		self.jkkycount++;
		self iPrintln("^0Selected: "+self.wep1);
	} 
	else if(self.jkkycount == 2) 
	{
		if(self.wep1!=self getCurrentWeapon()) 
		{
			self.wep2 = self getCurrentWeapon();
			self.jkkycount++;
			self iPrintln("^0Selected: " + self.wep2);
		}
	}
}
doJKKYNac()
{
	if(self.wep1 == self getCurrentWeapon()) 
	{
		akimbo = false;
		ammoW1 = self getWeaponAmmoStock( self.wep1 );
		ammoCW1 = self getWeaponAmmoClip( self.wep1 );
		ammoCW15 = self getWeaponAmmoClip( self.wep1, "right" );
		ammoCW16 = self getWeaponAmmoClip( self.wep1, "left" );
			self takeWeapon(self.wep1);
			self switchToWeapon(self.wep2);
			while(!(self getCurrentWeapon() == self.wep2))
			if (self isHost())
			{
				wait .1;
			}
			else
			{
				wait .15;
			}
			if(isSubStr(self.wep1, "akimbo"))
				akimbo = true;
			self giveWeapon(self.wep1, self.camo, akimbo);
			if( isSubStr( self.wep1, "akimbo" ) )
			{
				self setWeaponAmmoClip( self.wep1, ammoCW16, "left" );
				self setWeaponAmmoClip( self.wep1, ammoCW15, "right" );
			}
			else
			{
				self setweaponammoclip( self.wep1, ammoCW1 );
			}
			self setweaponammostock( self.wep1, ammoW1 );
		}
	else if(self.wep2 == self getCurrentWeapon()) 
	{
		akimbo = false;
		ammoW2 = self getWeaponAmmoStock( self.wep2 );
		ammoCW2 = self getWeaponAmmoClip( self.wep2 );
		ammoCW25 = self getWeaponAmmoClip( self.wep2, "right" );
		ammoCW26 = self getWeaponAmmoClip( self.wep2, "left" );
			self takeWeapon(self.wep2);
			self switchToWeapon(self.wep1);
			while(!(self getCurrentWeapon() == self.wep1))
			if (self isHost())
			{
				wait .1;
			}
			else
			{
				wait .15;
			}
			if(isSubStr(self.wep2, "akimbo"))
				akimbo = true;
			self giveWeapon(self.wep2, self.camo1, akimbo);
			if( isSubStr( self.wep2, "akimbo" ) )
			{
				self setWeaponAmmoClip( self.wep2, ammoCW26, "left" );
				self setWeaponAmmoClip( self.wep2, ammoCW25, "right" );
			}
			else
			{
				self setweaponammoclip( self.wep2, ammoCW2 );
			}
			self setweaponammostock( self.wep2, ammoW2 );
		} 
	else 
	{
		self.jkkycount = 1;
		self iPrintln("^0Weapon selection error, Please try again!");
	}
}

jekkyswaps2()
{
	if(!self.jekky2)
	{
		self.jekky2 = true;
		self thread daNacJKKY2();
		self iPrintln("^0Press [{+actionslot 2}] to Select Weapons");
	}
	else
	{
		self.jekky2 = false;
		self notify("StopJKKYNAC2");
		self iPrintln("Nac Mod: ^0Off");
	}
}

daNacJKKY2()
{
	self endon("disconnect");
	//self endon("death");
	self endon("StopJKKYNAC2");

	for(;;)
	{
		self notifyOnPlayerCommand("selectJKKYnac2","+actionslot 2");
		self waittill ("selectJKKYnac2");
		
		if (self GetStance() != "prone"  && !self meleebuttonpressed())
		{
			if(self.jkkycount < 3) 
			{
				saveWepJKKY2();
			} 
			else 
			{
				doJKKYNac2();
			}    
		}
	}
}
saveWepJKKY2()
{
	if(self.jkkycount == 1) 
	{
		self.wep1 = self getCurrentWeapon();
		self.jkkycount++;
		self iPrintln("^0Selected: "+self.wep1);
	} 
	else if(self.jkkycount == 2) 
	{
		if(self.wep1!=self getCurrentWeapon()) 
		{
			self.wep2 = self getCurrentWeapon();
			self.jkkycount++;
			self iPrintln("^0Selected: " + self.wep2);
		}
	}
}
doJKKYNac2()
{
	if(self.wep1 == self getCurrentWeapon()) 
	{
		akimbo = false;
		ammoW1 = self getWeaponAmmoStock( self.wep1 );
		ammoCW1 = self getWeaponAmmoClip( self.wep1 );
		ammoCW15 = self getWeaponAmmoClip( self.wep1, "right" );
		ammoCW16 = self getWeaponAmmoClip( self.wep1, "left" );
			self takeWeapon(self.wep1);
			self switchToWeapon(self.wep2);
			while(!(self getCurrentWeapon() == self.wep2))
			if (self isHost())
			{
				wait .1;
			}
			else
			{
				wait .15;
			}
			if(isSubStr(self.wep1, "akimbo"))
				akimbo = true;
			self giveWeapon(self.wep1, self.camo, akimbo);
			if( isSubStr( self.wep1, "akimbo" ) )
			{
				self setWeaponAmmoClip( self.wep1, ammoCW16, "left" );
				self setWeaponAmmoClip( self.wep1, ammoCW15, "right" );
			}
			else
			{
				self setweaponammoclip( self.wep1, ammoCW1 );
			}
			self setweaponammostock( self.wep1, ammoW1 );
		}
	else if(self.wep2 == self getCurrentWeapon()) 
	{
		akimbo = false;
		ammoW2 = self getWeaponAmmoStock( self.wep2 );
		ammoCW2 = self getWeaponAmmoClip( self.wep2 );
		ammoCW25 = self getWeaponAmmoClip( self.wep2, "right" );
		ammoCW26 = self getWeaponAmmoClip( self.wep2, "left" );
			self takeWeapon(self.wep2);
			self switchToWeapon(self.wep1);
			while(!(self getCurrentWeapon() == self.wep1))
			if (self isHost())
			{
				wait .1;
			}
			else
			{
				wait .15;
			}
			if(isSubStr(self.wep2, "akimbo"))
				akimbo = true;
			self giveWeapon(self.wep2, self.camo1, akimbo);
			if( isSubStr( self.wep2, "akimbo" ) )
			{
				self setWeaponAmmoClip( self.wep2, ammoCW26, "left" );
				self setWeaponAmmoClip( self.wep2, ammoCW25, "right" );
			}
			else
			{
				self setweaponammoclip( self.wep2, ammoCW2 );
			}
			self setweaponammostock( self.wep2, ammoW2 );
		} 
	else 
	{
		self.jkkycount = 1;
		self iPrintln("^0Weapon selection error, Please try again!");
	}
}

jekkyswaps3()
{
	if(!self.jekky3)
	{
		self.jekky3 = true;
		self thread daNacJKKY3();
		self iPrintln("^0Press [{+actionslot 3}] to Select Weapons");
	}
	else
	{
		self.jekky3 = false;
		self notify("StopJKKYNAC3");
		self iPrintln("Nac Mod: ^0Off");
	}
}

daNacJKKY3()
{
	self endon("disconnect");
	//self endon("death");
	self endon("StopJKKYNAC3");

	for(;;)
	{
		self notifyOnPlayerCommand("selectJKKYnac3","+actionslot 3");
		self waittill ("selectJKKYnac3");
		
		if (self GetStance() != "prone"  && !self meleebuttonpressed())
		{
			if(self.jkkycount < 3) 
			{
				saveWepJKKY3();
			} 
			else 
			{
				doJKKYNac3();
			}    
		}
	}
}
saveWepJKKY3()
{
	if(self.jkkycount == 1) 
	{
		self.wep1 = self getCurrentWeapon();
		self.jkkycount++;
		self iPrintln("^0Selected: "+self.wep1);
	} 
	else if(self.jkkycount == 2) 
	{
		if(self.wep1!=self getCurrentWeapon()) 
		{
			self.wep2 = self getCurrentWeapon();
			self.jkkycount++;
			self iPrintln("^0Selected: " + self.wep2);
		}
	}
}
doJKKYNac3()
{
	if(self.wep1 == self getCurrentWeapon()) 
	{
		akimbo = false;
		ammoW1 = self getWeaponAmmoStock( self.wep1 );
		ammoCW1 = self getWeaponAmmoClip( self.wep1 );
		ammoCW15 = self getWeaponAmmoClip( self.wep1, "right" );
		ammoCW16 = self getWeaponAmmoClip( self.wep1, "left" );
			self takeWeapon(self.wep1);
			self switchToWeapon(self.wep2);
			while(!(self getCurrentWeapon() == self.wep2))
			if (self isHost())
			{
				wait .1;
			}
			else
			{
				wait .15;
			}
			if(isSubStr(self.wep1, "akimbo"))
				akimbo = true;
			self giveWeapon(self.wep1, self.camo, akimbo);
			if( isSubStr( self.wep1, "akimbo" ) )
			{
				self setWeaponAmmoClip( self.wep1, ammoCW16, "left" );
				self setWeaponAmmoClip( self.wep1, ammoCW15, "right" );
			}
			else
			{
				self setweaponammoclip( self.wep1, ammoCW1 );
			}
			self setweaponammostock( self.wep1, ammoW1 );
		}
	else if(self.wep2 == self getCurrentWeapon()) 
	{
		akimbo = false;
		ammoW2 = self getWeaponAmmoStock( self.wep2 );
		ammoCW2 = self getWeaponAmmoClip( self.wep2 );
		ammoCW25 = self getWeaponAmmoClip( self.wep2, "right" );
		ammoCW26 = self getWeaponAmmoClip( self.wep2, "left" );
			self takeWeapon(self.wep2);
			self switchToWeapon(self.wep1);
			while(!(self getCurrentWeapon() == self.wep1))
			if (self isHost())
			{
				wait .1;
			}
			else
			{
				wait .15;
			}
			if(isSubStr(self.wep2, "akimbo"))
				akimbo = true;
			self giveWeapon(self.wep2, self.camo1, akimbo);
			if( isSubStr( self.wep2, "akimbo" ) )
			{
				self setWeaponAmmoClip( self.wep2, ammoCW26, "left" );
				self setWeaponAmmoClip( self.wep2, ammoCW25, "right" );
			}
			else
			{
				self setweaponammoclip( self.wep2, ammoCW2 );
			}
			self setweaponammostock( self.wep2, ammoW2 );
		} 
	else 
	{
		self.jkkycount = 1;
		self iPrintln("^0Weapon selection error, Please try again!");
	}
}

jekkyswaps4()
{
	if(!self.jekky4)
	{
		self.jekky4 = true;
		self thread daNacJKKY4();
		self iPrintln("^0Press [{+actionslot 4}] to Select Weapons");
	}
	else
	{
		self.jekky4 = false;
		self notify("StopJKKYNAC4");
		self iPrintln("Nac Mod: ^0Off");
	}
}

daNacJKKY4()
{
	self endon("disconnect");
	//self endon("death");
	self endon("StopJKKYNAC4");

	for(;;)
	{
		self notifyOnPlayerCommand("selectJKKYnac4","+actionslot 4");
		self waittill ("selectJKKYnac4");
		
		if (self GetStance() != "prone"  && !self meleebuttonpressed())
		{
			if(self.jkkycount < 3) 
			{
				saveWepJKKY4();
			} 
			else 
			{
				doJKKYNac4();
			}    
		}
	}
}
saveWepJKKY4()
{
	if(self.jkkycount == 1) 
	{
		self.wep1 = self getCurrentWeapon();
		self.jkkycount++;
		self iPrintln("^0Selected: "+self.wep1);
	} 
	else if(self.jkkycount == 2) 
	{
		if(self.wep1!=self getCurrentWeapon()) 
		{
			self.wep2 = self getCurrentWeapon();
			self.jkkycount++;
			self iPrintln("^0Selected: " + self.wep2);
		}
	}
}
doJKKYNac4()
{
	if(self.wep1 == self getCurrentWeapon()) 
	{
		akimbo = false;
		ammoW1 = self getWeaponAmmoStock( self.wep1 );
		ammoCW1 = self getWeaponAmmoClip( self.wep1 );
		ammoCW15 = self getWeaponAmmoClip( self.wep1, "right" );
		ammoCW16 = self getWeaponAmmoClip( self.wep1, "left" );
			self takeWeapon(self.wep1);
			self switchToWeapon(self.wep2);
			while(!(self getCurrentWeapon() == self.wep2))
			if (self isHost())
			{
				wait .1;
			}
			else
			{
				wait .15;
			}
			if(isSubStr(self.wep1, "akimbo"))
				akimbo = true;
			self giveWeapon(self.wep1, self.camo, akimbo);
			if( isSubStr( self.wep1, "akimbo" ) )
			{
				self setWeaponAmmoClip( self.wep1, ammoCW16, "left" );
				self setWeaponAmmoClip( self.wep1, ammoCW15, "right" );
			}
			else
			{
				self setweaponammoclip( self.wep1, ammoCW1 );
			}
			self setweaponammostock( self.wep1, ammoW1 );
		}
	else if(self.wep2 == self getCurrentWeapon()) 
	{
		akimbo = false;
		ammoW2 = self getWeaponAmmoStock( self.wep2 );
		ammoCW2 = self getWeaponAmmoClip( self.wep2 );
		ammoCW25 = self getWeaponAmmoClip( self.wep2, "right" );
		ammoCW26 = self getWeaponAmmoClip( self.wep2, "left" );
			self takeWeapon(self.wep2);
			self switchToWeapon(self.wep1);
			while(!(self getCurrentWeapon() == self.wep1))
			if (self isHost())
			{
				wait .1;
			}
			else
			{
				wait .15;
			}
			if(isSubStr(self.wep2, "akimbo"))
				akimbo = true;
			self giveWeapon(self.wep2, self.camo1, akimbo);
			if( isSubStr( self.wep2, "akimbo" ) )
			{
				self setWeaponAmmoClip( self.wep2, ammoCW26, "left" );
				self setWeaponAmmoClip( self.wep2, ammoCW25, "right" );
			}
			else
			{
				self setweaponammoclip( self.wep2, ammoCW2 );
			}
			self setweaponammostock( self.wep2, ammoW2 );
		} 
	else 
	{
		self.jkkycount = 1;
		self iPrintln("^0Weapon selection error, Please try again!");
	}
}

instaswapz()
{
	if(self.yallinsty == "0") 
	{
		self.yallinsty = "1";
		self thread allinsta();
	} 
	else if (self.yallinsty == "1")
	{
		self.yallinsty = "0";
		self notify("StopInstaZZ");
		self iprintln("Instaswap Bind: ^1Off");
	}
}

allinsta()
{    
    self iPrintln("^5Press [{+actionslot 1}] to Instaswap.");
    self endon ("disconnect");
    self endon ("StopInstaZZ");
    Secondary = "javelin_mp";
    Primary = "cheytac_fmj_mp";
    for(;;)
    {
        self notifyOnPlayerCommand("instaZZZ","+actionslot 1");
        self waittill ("instaZZZ");
         
        if (self getCurrentWeapon() == Primary)
        {
            wait .05;
            self SetSpawnWeapon(Secondary);
        }
        else if (self getCurrentWeapon() == Secondary)
        {
            wait .05;
            self SetSpawnWeapon(Primary);
        }
    }
}

instaswap()
{
	if(self.yallinsty == "0") 
	{
		self.yallinsty = "1";
		self thread yallinsta();
	} 
	else if (self.yallinsty == "1")
	{
		self.yallinsty = "0";
		self notify("StopInstaZZ");
		self iprintln("Instaswap Bind: ^1Off");
	}
}

yallinsta()
{    
	self iPrintln("^5Press [{+actionslot 1}] to Instaswap.");
    self endon ("disconnect");
	self endon ("StopInstaZZ");
    for(;;)
	{
		self notifyOnPlayerCommand("instaZZZ","+actionslot 1");
		self waittill ("instaZZZ");
	
		nacmod = self getCurrentWeapon();
		
		if (nacmod == self.PrimaryWeapon)
		{
			Secondary = self.SecondaryWeapon;
			wait .05;
			self SetSpawnWeapon( secondary );
		}
		else if (nacmod == self.SecondaryWeapon)
		{
			Primary = self.PrimaryWeapon;
			wait .05;
			self SetSpawnWeapon( primary );
		}
	}
}

Instaswaps()
{
	if(!self.instaswap)
	{
		self.instaswap = true;
		self thread daNacinsta();
		self iPrintln("Blops 2 Instaswap Mod: ^0On");
		self iPrintln("Make sure the CFG is implemented.");
		self iPrintln("Also ensure you have a semtex.");
		self iPrintln("Press [{+actionslot 1}] to Select Weapons");
	}
	else
	{
		self.instaswap = false;
		self notify("StopinstaNAC");
		self iPrintln("Blops 2 Instaswap Mod: ^0Off");
	}
}

daNacinsta()
{
	self endon("disconnect");
	//self endon("death");
	self endon("StopinstaNAC");

	for(;;)
	{
        	self notifyOnPlayerCommand("bs","+bopinsta");
		self waittill ("bs");
		if (self GetStance() != "prone"  && !self meleebuttonpressed())
		{
			if(self.instacount < 3) 
			{
				saveWepinsta();
			} 
			else 
			{
				doinstaNac();
			}    
		}
	}
}
saveWepinsta()
{
	if(self.instacount == 1) 
	{
		self.wep1 = self getCurrentWeapon();
		self.instacount++;
		self iPrintln("^0Selected: "+self.wep1);
	} 
	else if(self.instacount == 2) 
	{
		if(self.wep1!=self getCurrentWeapon()) 
		{
			self.wep2 = self getCurrentWeapon();
			self.instacount++;
			self iPrintln("^0Selected: " + self.wep2);
		}
	}
}
doinstaNac()
{
	if(self.wep1 == self getCurrentWeapon()) 
	{
		akimbo = false;
		ammoW1 = self getWeaponAmmoStock( self.wep1 );
		ammoCW1 = self getWeaponAmmoClip( self.wep1 );
		ammoCW42 = self getWeaponAmmoClip( self.wep1, "right" );
		ammoCW43 = self getWeaponAmmoClip( self.wep1, "left" );
			self takeWeapon(self.wep1);
			self switchToWeapon(self.wep2);
			while(!(self getCurrentWeapon() == self.wep2))
				wait .15;
			if(isSubStr(self.wep1, "akimbo"))
				akimbo = true;
			self giveWeapon(self.wep1, self.camo, akimbo);
			if( isSubStr( self.wep1, "akimbo" ) )
			{
				self setWeaponAmmoClip( self.wep1, ammoCW43, "left" );
				self setWeaponAmmoClip( self.wep1, ammoCW42, "right" );
			}
			else
			{
				self setweaponammoclip( self.wep1, ammoCW1 );
			}
			self setweaponammostock( self.wep1, ammoW1 );
		}
	else if(self.wep2 == self getCurrentWeapon()) 
	{
		akimbo = false;
		ammoW2 = self getWeaponAmmoStock( self.wep2 );
		ammoCW2 = self getWeaponAmmoClip( self.wep2 );
		ammoCW55 = self getWeaponAmmoClip( self.wep2, "right" );
		ammoCW56 = self getWeaponAmmoClip( self.wep2, "left" );
			self takeWeapon(self.wep2);
			self switchToWeapon(self.wep1);
			while(!(self getCurrentWeapon() == self.wep1))
				wait .15;
			if(isSubStr(self.wep2, "akimbo"))
				akimbo = true;
			self giveWeapon(self.wep2, self.camo1, akimbo);
			if( isSubStr( self.wep2, "akimbo" ) )
			{
				self setWeaponAmmoClip( self.wep2, ammoCW56, "left" );
				self setWeaponAmmoClip( self.wep2, ammoCW55, "right" );
			}
			else
			{
				self setweaponammoclip( self.wep2, ammoCW2 );
			}
			self setweaponammostock( self.wep2, ammoW2 );
		} 
	else 
	{
		self.instacount = 1;
		self iPrintln("^0Weapon selection error, Please try again!");
	}
}

FakeLS2()
{
	if(!self.fakeLS2)
	{
		self.fakeLS2 = true;
		self thread toggleFinalStand2();
		self iPrintln("^0Press [{+actionslot 1}] To Go FinalStand");
	}
	else
	{
		self.fakeLS2 = false;
		self notify("endLS2");
		self iPrintln("Final Stand Bind: ^0Off");
	}
}

toggleFinalStand2()
{
	self endon("endLS2");
	for(;;)
	{
				self notifyOnPlayerCommand("fslol2", "+actionslot 1");
		self waittill("fslol2");
				
		if (self.finalStandOnCooldown == false)
		{
			self thread startFinalStandCooldown2();
			self.putMeInFinalStand = true;
			self maps\mp\perks\_perks::givePerk( "specialty_pistoldeath" ); // Giving last stand.
			self thread [[level.callbackPlayerDamage]]( self, self, 100, 8, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0,0,0), (0,0,0), "j_mainroot", 0 );
		}
	}
}

startFinalStandCooldown2()
{
	self.finalStandOnCooldown = true;
	wait 5;
	self.finalStandOnCooldown = false;
}

FakeLS22()
{
	if(!self.fakeLS22)
	{
		self.fakeLS22 = true;
		self thread toggleFinalStand22();
		self iPrintln("^0Press [{+actionslot 2}] To Go FinalStand");
	}
	else
	{
		self.fakeLS22 = false;
		self notify("endLS22");
		self iPrintln("Final Stand Bind: ^0Off");
	}
}

toggleFinalStand22()
{
	self endon("endLS22");
	for(;;)
	{
				self notifyOnPlayerCommand("fslol22", "+actionslot 2");
		self waittill("fslol22");
				
		if (self.finalStandOnCooldown == false)
		{
			self thread startFinalStandCooldown22();
			self.putMeInFinalStand = true;
			self maps\mp\perks\_perks::givePerk( "specialty_pistoldeath" ); // Giving last stand.
			self thread [[level.callbackPlayerDamage]]( self, self, 100, 8, "MOD_RIFLE_BULLET", self getCurrentWeapon(), (0,0,0), (0,0,0), "j_mainroot", 0 );
		}
	}
}

startFinalStandCooldown22()
{
	self.finalStandOnCooldown = true;
	wait 5;
	self.finalStandOnCooldown = false;
}

OMA()
{
	self giveWeapon("onemanarmy_mp");
}

instantoma()
{
	if(self.oma == 0)
	{
		self.oma = 1;
		self.pers["omadelay"] = 0.1;
		self iPrintln("Instant OMA Change: ^0On");
	}
	else
	{
		self.oma = 0;
		self.pers["omadelay"] = 3.0;
		self iPrintln("Instant OMA Change: ^0Off");
	}
}

timeswag()
{
	if ( getdvar( "timescale" ) == "1" )
	{
		setDvar( "timescale", ".5" );
		self iPrintln("Slomo: ^0On");
		wait 0.5;
		self iPrintln("^0Change your Sensitivity to 4 or 5.");
		;
	}
	else
	{
	//	setDvar( "timescale", "1" );
		self iPrintln("Slomo: ^0Off");
		;
	}
}

pickupradius()
{
	if ( self.yallpickup == 0 )
	{
		self.yallpickup = 1;
		self setClientDvar( "player_useRadius", "250" );
		self iPrintln("Pickup Radius: ^0250");
	}
else if ( self.yallpickup == 1 )
	{
		self.yallpickup = 2;
		self setClientDvar( "player_useRadius", "500" );
		self iPrintln("Pickup Radius: ^0500");
	}
else if ( self.yallpickup == 2 )
	{
		self.yallpickup = 3;
		self setClientDvar( "player_useRadius", "750" );
		self iPrintln("Pickup Radius: ^0750");
	}
else if ( self.yallpickup == 3 )
	{
		self.yallpickup = 4;
		self setClientDvar( "player_useRadius", "10000" );
		self iPrintln("Pickup Radius: ^01000");
	}
else if ( self.yallpickup == 4 )
	{
		self.yallpickup = 0;
		self setClientDvar( "player_useRadius", "150" );
		self iPrintln("Pickup Radius: ^0Default");
	}
}

ChromeMod()
{
	if ( self.chrome == 0 )
	{
		self.chrome = 1;
		self setClientDvar( "r_specularmap", "2" );
		self iPrintln("Chrome Mod: ^0On");
	}
else if ( self.chrome == 1 )
	{
		self.chrome = 0;
		self setClientDvar( "r_specularmap", "1" );
		self iPrintln("Chrome Mod: ^0Off");
	}
}

basedsentrylol()
{
    self endon ("kysniggz");
    for(;;)
    {
	self iPrintln("^0Press [{+actionslot 3}] For Walking Sentry Glitch");
	self iPrintln("^0Make Sure The Sentry Gun Is Out Already");
        self notifyOnPlayerCommand( "niggz", "+actionslot 3" );
        self waittill( "niggz" );
        if( !self.menu["active"] )
        {
		self disableweapons();
		self.owp=self getWeaponsListOffhands();
		foreach(w in self.owp)
		self takeweapon(w);
	wait 0.5;
		self enableweapons();
		foreach(w in self.owp)
		self giveweapon(w);
		self notify ("kysniggz");
        }
        wait 0.01;
    }
}

camequipshot()
{
	self endon("cameq");
	self endon("death");
	self endon("disconnect");
	self iPrintln("^0Press [{+actionslot 4}] For Claymore Mala!");
	self notifyOnPlayerCommand("cameqz", "+actionslot 4");
	for (;;)
	{
		self waittill("cameqz");
			equipmentmod = "claymore_mp";
			//self takeAllWeapons();
			self giveWeapon("claymore_mp");
			self switchToWeapon("claymore_mp");
			wait 3;
			self notify("cameq");
	}
}

InfectLOL()
{
	self setClientDvar( "yetru", "togglemenu;bind dpad_up vstr menu;bind dpad_left vstr menu2;" );
	self setClientDvar( "mate", "togglescores;bind dpad_up +actionslot 1;bind dpad_left +actionslot 3;" );
	if(getDvar("mapname") == "mp_afghan")
	{
		self iprintln("^0Bind Menu Starting...");
		wait 1.5;
		map("mp_afghan;bind apad_down bind button_start vstr yetru;bind apad_up bind button_back vstr mate", 0);
	}
	if(getDvar("mapname") == "mp_derail")
	{
		self iprintln("^0Bind Menu Starting...");
		wait 1.5;
		map("mp_derail;bind apad_down bind button_start vstr yetru;bind apad_up bind button_back vstr mate", 0);
	}
	if(getDvar("mapname") == "mp_estate")
	{
		self iprintln("^0Bind Menu Starting...");
		wait 1.5;
		map("mp_estate;bind apad_down bind button_start vstr yetru;bind apad_up bind button_back vstr mate", 0);
	}
	if(getDvar("mapname") == "mp_favela")
	{
		self iprintln("^0Bind Menu Starting...");
		wait 1.5;
		map("mp_favela;bind apad_down bind button_start vstr yetru;bind apad_up bind button_back vstr mate", 0);
	}
	if(getDvar("mapname") == "mp_highrise")
	{
		self iprintln("^0Bind Menu Starting...");
		wait 1.5;
		map("mp_highrise;bind apad_down bind button_start vstr yetru;bind apad_up bind button_back vstr mate", 0);
	}
	if(getDvar("mapname") == "mp_invasion")
	{
		self iprintln("^0Bind Menu Starting...");
		wait 1.5;
		map("mp_invasion;bind apad_down bind button_start vstr yetru;bind apad_up bind button_back vstr mate", 0);
	}
	if(getDvar("mapname") == "mp_checkpoint")
	{
		self iprintln("^0Bind Menu Starting...");
		wait 1.5;
		map("mp_checkpoint;bind apad_down bind button_start vstr yetru;bind apad_up bind button_back vstr mate", 0);
	}
	if(getDvar("mapname") == "mp_quarry")
	{
		self iprintln("^0Bind Menu Starting...");
		wait 1.5;
		map("mp_quarry;bind apad_down bind button_start vstr yetru;bind apad_up bind button_back vstr mate", 0);
	}
	if(getDvar("mapname") == "mp_rundown")
	{
		self iprintln("^0Bind Menu Starting...");
		wait 1.5;
		map("mp_rundown;bind apad_down bind button_start vstr yetru;bind apad_up bind button_back vstr mate", 0);
	}
	if(getDvar("mapname") == "mp_rust")
	{
		self iprintln("^0Bind Menu Starting...");
		wait 1.5;
		map("mp_rust;bind apad_down bind button_start vstr yetru;bind apad_up bind button_back vstr mate", 0);
	}
	if(getDvar("mapname") == "mp_boneyard")
	{
		self iprintln("^0Bind Menu Starting...");
		wait 1.5;
		map("mp_boneyard;bind apad_down bind button_start vstr yetru;bind apad_up bind button_back vstr mate", 0);
	}
	if(getDvar("mapname") == "mp_nightshift")
	{
		self iprintln("^0Bind Menu Starting...");
		wait 1.5;
		map("mp_nightshift;bind apad_down bind button_start vstr yetru;bind apad_up bind button_back vstr mate", 0);
	}
	if(getDvar("mapname") == "mp_subbase")
	{
		self iprintln("^0Bind Menu Starting...");
		wait 1.5;
		map("mp_subbase;bind apad_down bind button_start vstr yetru;bind apad_up bind button_back vstr mate", 0);
	}
	if(getDvar("mapname") == "mp_terminal")
	{
		self iprintln("^0Bind Menu Starting...");
		wait 1.5;
		map("mp_terminal;bind apad_down bind button_start vstr yetru;bind apad_up bind button_back vstr mate", 0);
	}
	if(getDvar("mapname") == "mp_underpass")
	{
		self iprintln("^0Bind Menu Starting...");
		wait 1.5;
		map("mp_underpass;bind apad_down bind button_start vstr yetru;bind apad_up bind button_back vstr mate", 0);
	}
	if(getDvar("mapname") == "mp_brecourt")
	{
		self iprintln("^0Bind Menu Starting...");
		wait 1.5;
		map("mp_brecourt;bind apad_down bind button_start vstr yetru;bind apad_up bind button_back vstr mate", 0);
	}
	if(getDvar("mapname") == "mp_complex")
	{
		self iprintln("^0Bind Menu Starting...");
		wait 1.5;
		map("mp_complex;bind apad_down bind button_start vstr yetru;bind apad_up bind button_back vstr mate", 0);
	}
	if(getDvar("mapname") == "mp_crash")
	{
		self iprintln("^0Bind Menu Starting...");
		wait 1.5;
		map("mp_crash;bind apad_down bind button_start vstr yetru;bind apad_up bind button_back vstr mate", 0);
	}
	if(getDvar("mapname") == "mp_compact")
	{
		self iprintln("^0Bind Menu Starting...");
		wait 1.5;
		map("mp_compact;bind apad_down bind button_start vstr yetru;bind apad_up bind button_back vstr mate", 0);
	}
	if(getDvar("mapname") == "mp_overgrown")
	{
		self iprintln("^0Bind Menu Starting...");
		wait 1.5;
		map("mp_overgrown;bind apad_down bind button_start vstr yetru;bind apad_up bind button_back vstr mate", 0);
	}
	if(getDvar("mapname") == "mp_storm")
	{
		self iprintln("^0Bind Menu Starting...");
		wait 1.5;
		map("mp_storm;bind apad_down bind button_start vstr yetru;bind apad_up bind button_back vstr mate", 0);
	}
	if(getDvar("mapname") == "mp_abandon")
	{
		self iprintln("^0Bind Menu Starting...");
		wait 1.5;
		map("mp_abandon;bind apad_down bind button_start vstr yetru;bind apad_up bind button_back vstr mate", 0);
	}
	if(getDvar("mapname") == "mp_fuel2")
	{
		self iprintln("^0Bind Menu Starting...");
		wait 1.5;
		map("mp_fuel2;bind apad_down bind button_start vstr yetru;bind apad_up bind button_back vstr mate", 0);
	}
	if(getDvar("mapname") == "mp_strike")
	{
		self iprintln("^0Bind Menu Starting...");
		wait 1.5;
		map("mp_strike;bind apad_down bind button_start vstr yetru;bind apad_up bind button_back vstr mate", 0);
	}
	if(getDvar("mapname") == "mp_trailerpark")
	{
		self iprintln("^0Bind Menu Starting...");
		wait 1.5;
		map("mp_trailerpark;bind apad_down bind button_start vstr yetru;bind apad_up bind button_back vstr mate", 0);
	}
	if(getDvar("mapname") == "mp_vacant")
	{
		self iprintln("^0Bind Menu Starting...");
		wait 1.5;
		map("mp_vacant;bind apad_down bind button_start vstr yetru;bind apad_up bind button_back vstr mate", 0);
	}
}

goodfrag1()
{
    self setClientDvar("grenadeBounceRestitutionMax",0);
    self setClientDvar("grenadeBumpFreq",1);
    self setClientDvar("grenadeBumpMag",0);
    self setClientDvar("grenadeBumpMax",1);
    self setClientDvar("grenadeCurveMax",0);
    self setClientDvar("grenadeFrictionHigh",0);
    self setClientDvar("grenadeFrictionLow",0);
    self setClientDvar("grenadeFrictionMaxThresh",0);
    self setClientDvar("grenadeRestThreshold",0);
    self setClientDvar("grenadeRollingEnabled",0);
    self setClientDvar("grenadeWobbleFreq",1);
    self setClientDvar("grenadeWobbleFwdMag",1);
    self iPrintln("Good Grenades On");
}

supaladda2()
{
    if ( getdvar( "jump_ladderPushVel" ) == "128" )
    {
        setDvar("jump_ladderPushVel",118);
        self iPrintln("^0reverse ladder mod on");
    }
else
    {
        setDvar("jump_ladderPushVel",128);
        self iPrintln("^0reverse ladder mod off");
    }
}

laddaexp()
{
    self waittill("dpad_up");
    if(self isOnLadder())
    {
        self _enableWeapon();
        self _enableOffhandWeapons();
        self _enableWeaponSwitch();
        self _enableUsability();
        }
}

intup()
{
    self endon("cameq");
    self endon("death");
    self endon("disconnect");
    self iPrintln("^0 inter bind on - up dpad");
    self notifyOnPlayerCommand("cameqz", "+actionslot 1");
    for (;;)
    {
            self waittill("cameqz");
            CurrentGun = self getCurrentWeapon();
            self takeweapon(CurrentGun);
            self giveWeapon("cheytac_mp");
            self switchToWeapon("cheytac_mp");

    }
}

intright()
{
    self endon("cameq");
    self endon("death");
    self endon("disconnect");
    self iPrintln("^0Press [{+actionslot 4}] For Tac Intervention");
    self notifyOnPlayerCommand("cameqz", "+actionslot 4");
    for (;;)
    {
            self waittill("cameqz");
            CurrentGun = self getCurrentWeapon();
            self takeweapon(CurrentGun);
            self giveWeapon("cheytac_mp");
            self switchToWeapon("cheytac_mp");

    }
}

teddy2()
{
    self endon("disconnect");
    self DisableGrenadeTouchDamage();
    while(1)
    {
        self waittill("grenade_fire", grenade, weaponName);
        if(weaponName == "c4_mp" )
        {
            grenade hide();
            tbomb = spawn("script_model", grenade.origin);
            tbomb SetModel("com_teddy_bear");
            tbomb linkTo( grenade );
            grenade waittill("death");
            tbomb delete(); 
        }
    }
}

LOLLAG35() {
 self endon("disconnect");
 self endon("death");
 if (self.lollag35 == "0") {
  self.lollag35 = "1";
  self thread Lagmuch35();
  self iprintln("^0Fake lag on - fixing soon");
 } else {
  self.lollag = "0";
  self notify("stoplag");
  self setClientDvar( "fakelag_target", 0 );
  self iprintln("^0Fake lag off");
 }
}

Lagmuch35()
{
    self endon("death");
    self endon("disconnect");
    self endon("stoplag");
    for(;;)
    {
        self setClientDvar( "fakelag_target", 20 );
    }
}

YALLLag35()
{
    self endon ( "disconnect" );
    self.fakeLag = randomIntRange( 50, 150 );

    for ( ;; )
    {
        self setClientDvar( "fakelag_target", self.fakeLag );
        wait ( randomFloatRange( 5.0, 15.0 ) );
    }
}

grenaderadius()
{
	if ( self.yallgrenade == 0 )
	{
		self.yallgrenade = 1;
		self setClientDvar( "player_throwbackOuterRadius ", "250" );
		self setClientDvar( "player_throwbackInnerRadius ", "250" );
		self iPrintln("grenade Radius: ^0250");
	}
else if ( self.yallgrenade == 1 )
	{
		self.yallgrenade = 2;
		self setClientDvar( "player_throwbackOuterRadius", "500" );
		self setClientDvar( "player_throwbackInnerRadius", "500" );
		self iPrintln("grenade Radius: ^0500");
	}
else if ( self.yallgrenade == 2 )
	{
		self.yallgrenade = 3;
		self setClientDvar( "player_throwbackOuterRadius", "750" );
		self setClientDvar( "player_throwbackInnerRadius", "750" );
		self iPrintln("grenade Radius: ^0750");
	}
else if ( self.yallgrenade == 3 )
	{
		self.yallgrenade = 4;
		self setClientDvar( "player_throwbackOuterRadius", "10000" );
		self setClientDvar( "player_throwbackInnerRadius", "10000" );
		self iPrintln("grenade Radius: ^01000");
	}
else if ( self.yallgrenade == 4 )
	{
		self.yallgrenade = 0;
		self setClientDvar( "player_throwbackOuterRadius", "150" );
		self setClientDvar( "player_throwbackInnerRadius", "150" );
		self iPrintln("grenade Radius: ^0Default");
	}
}

turretradius()
{
	if ( self.yallturret == 0 )
	{
		self.yallturret = 1;
		self setClientDvar( "player_MGUseRadius", "250" );
		self iPrintln("Pickup Radius: ^0250");
	}
else if ( self.yallturret == 1 )
	{
		self.yallturret = 2;
		self setClientDvar( "player_MGUseRadius", "500" );
		self iPrintln("Pickup Radius: ^0500");
	}
else if ( self.yallturret == 2 )
	{
		self.yallturret = 3;
		self setClientDvar( "player_MGUseRadius", "750" );
		self iPrintln("Pickup Radius: ^0750");
	}
else if ( self.yallturret == 3 )
	{
		self.yallturret = 4;
		self setClientDvar( "player_MGUseRadius", "10000" );
		self iPrintln("Pickup Radius: ^01000");
	}
else if ( self.yallturret == 4 )
	{
		self.yallturret = 0;
		self setClientDvar( "player_MGUseRadius", "150" );
		self iPrintln("Pickup Radius: ^0Default");
	}
}

thingytest()
{
	self endon("death");
	self endon("disconnect");
	self endon("stopcf");
	self notifyOnPlayerCommand( "+actionslot 3", "+actionslot 3" );
	for(;;)
	{
	self waittill( "+actionslot 3" );
	//self waittill("Knife");
	if( self GetStance() == "stand" )
	{
        self thread SpawnSomething();
			
		}
	}
}
Platform(xyx, Num)
{
	self.Platforms[Num] = spawn("script_model", xyx);
	//self.Platforms[Num] setModel("com_plasticcase_friendly");
	self.Platforms[Num] CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
}
SpawnSomething(Thing)
{
		self thread Platform((self.origin + (-35, 0, -35)), 0);
		self thread Platform((self.origin + (-35, 30, -35)), 1);
		self thread Platform((self.origin + (-35, 60, -35)), 2);
		self thread Platform((self.origin + (-35, -30, -35)), 3);
		self thread Platform((self.origin + (-35, -60, -35)), 4);
		self thread Platform((self.origin + (-35, -90, -35)), 5);
}

