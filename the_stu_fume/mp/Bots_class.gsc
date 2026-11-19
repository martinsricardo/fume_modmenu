#include mp\bots_funcs;

Weapon_AA12() {
if(self.pers["bots"]["class"]["perk1pro"] != "specialty_secondarybling"){
switch(randomint(7))
	{
	case 0:
		self.pers["bots"]["class"]["secondary"] = "aa12_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["secondary"] = "aa12_eotech_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["secondary"] = "aa12_fmj_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["secondary"] = "aa12_grip_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["secondary"] = "aa12_reflex_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["secondary"] = "aa12_silencer_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["secondary"] = "aa12_xmags_mp";
		break;
	}
	} else {
	switch(randomint(14)) 
	{
	case 7:
		self.pers["bots"]["class"]["secondary"] = "aa12_eotech_fmj_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["secondary"] = "aa12_eotech_grip_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["secondary"] = "aa12_eotech_silencer_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["secondary"] = "aa12_eotech_xmags_mp";
		break;
	case 11:
		self.pers["bots"]["class"]["secondary"] = "aa12_fmj_grip_mp";
		break;
	case 12:
		self.pers["bots"]["class"]["secondary"] = "aa12_fmj_reflex_mp";
		break;
	case 13:
		self.pers["bots"]["class"]["secondary"] = "aa12_fmj_silencer_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["secondary"] = "aa12_fmj_xmags_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["secondary"] = "aa12_grip_reflex_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["secondary"] = "aa12_grip_silencer_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["secondary"] = "aa12_grip_xmags_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["secondary"] = "aa12_reflex_silencer_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["secondary"] = "aa12_reflex_xmags_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["secondary"] = "aa12_silencer_xmags_mp";
		break;
	}
	}
}
Weapon_AK47() {
if(self.pers["bots"]["class"]["perk1"] != "specialty_bling"){
switch(randomint(11))
	{
	case 0:
		self.pers["bots"]["class"]["primary"] = "ak47_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "ak47_acog_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "ak47_eotech_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "ak47_fmj_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "ak47_gl_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "ak47_heartbeat_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "ak47_reflex_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "ak47_shotgun_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "ak47_silencer_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "ak47_thermal_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["primary"] = "ak47_xmags_mp";
		break;
	}
	} else {
	switch(randomint(38))
	{
	case 11:
		self.pers["bots"]["class"]["primary"] = "ak47_acog_fmj_mp";
		break;
	case 12:
		self.pers["bots"]["class"]["primary"] = "ak47_acog_gl_mp";
		break;
	case 13:
		self.pers["bots"]["class"]["primary"] = "ak47_acog_heartbeat_mp";
		break;
	case 14:
		self.pers["bots"]["class"]["primary"] = "ak47_acog_shotgun_mp";
		break;
	case 15:
		self.pers["bots"]["class"]["primary"] = "ak47_acog_silencer_mp";
		break;
	case 16:
		self.pers["bots"]["class"]["primary"] = "ak47_acog_xmags_mp";
		break;
	case 17:
		self.pers["bots"]["class"]["primary"] = "ak47_eotech_fmj_mp";
		break;
	case 18:
		self.pers["bots"]["class"]["primary"] = "ak47_eotech_gl_mp";
		break;
	case 19:
		self.pers["bots"]["class"]["primary"] = "ak47_eotech_heartbeat_mp";
		break;
	case 20:
		self.pers["bots"]["class"]["primary"] = "ak47_eotech_shotgun_mp";
		break;
	case 21:
		self.pers["bots"]["class"]["primary"] = "ak47_eotech_silencer_mp";
		break;
	case 22:
		self.pers["bots"]["class"]["primary"] = "ak47_eotech_xmags_mp";
		break;
	case 23:
		self.pers["bots"]["class"]["primary"] = "ak47_fmj_gl_mp";
		break;
	case 24:
		self.pers["bots"]["class"]["primary"] = "ak47_fmj_heartbeat_mp";
		break;
	case 25:
		self.pers["bots"]["class"]["primary"] = "ak47_fmj_reflex_mp";
		break;
	case 26:
		self.pers["bots"]["class"]["primary"] = "ak47_fmj_shotgun_mp";
		break;
	case 27:
		self.pers["bots"]["class"]["primary"] = "ak47_fmj_silencer_mp";
		break;
	case 28:
		self.pers["bots"]["class"]["primary"] = "ak47_fmj_thermal_mp";
		break;
	case 29:
		self.pers["bots"]["class"]["primary"] = "ak47_fmj_xmags_mp";
		break;
	case 30:
		self.pers["bots"]["class"]["primary"] = "ak47_gl_heartbeat_mp";
		break;
	case 31:
		self.pers["bots"]["class"]["primary"] = "ak47_gl_reflex_mp";
		break;
	case 32:
		self.pers["bots"]["class"]["primary"] = "ak47_gl_silencer_mp";
		break;
	case 33:
		self.pers["bots"]["class"]["primary"] = "ak47_gl_thermal_mp";
		break;
	case 34:
		self.pers["bots"]["class"]["primary"] = "ak47_gl_xmags_mp";
		break;
	case 35:
		self.pers["bots"]["class"]["primary"] = "ak47_heartbeat_reflex_mp";
		break;
	case 36:
		self.pers["bots"]["class"]["primary"] = "ak47_heartbeat_shotgun_mp";
		break;
	case 37:
		self.pers["bots"]["class"]["primary"] = "ak47_heartbeat_silencer_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["primary"] = "ak47_heartbeat_thermal_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "ak47_heartbeat_xmags_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "ak47_reflex_shotgun_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "ak47_reflex_silencer_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "ak47_reflex_xmags_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "ak47_shotgun_silencer_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "ak47_shotgun_thermal_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "ak47_shotgun_xmags_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "ak47_silencer_thermal_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "ak47_silencer_xmags_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["primary"] = "ak47_thermal_xmags_mp";
		break;
	}
	}
}
Weapon_AUG() {
if(self.pers["bots"]["class"]["perk1"] != "specialty_bling")
{
switch(randomint(10))
	{
	case 0:
		self.pers["bots"]["class"]["primary"] = "aug_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "aug_acog_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "aug_eotech_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "aug_fmj_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "aug_grip_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "aug_heartbeat_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "aug_reflex_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "aug_silencer_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "aug_thermal_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "aug_xmags_mp";
		break;
	}
	} else {
	switch(randomint(30)){
	case 10:
		self.pers["bots"]["class"]["primary"] = "aug_acog_fmj_mp";
		break;
	case 11:
		self.pers["bots"]["class"]["primary"] = "aug_acog_grip_mp";
		break;
	case 12:
		self.pers["bots"]["class"]["primary"] = "aug_acog_heartbeat_mp";
		break;
	case 13:
		self.pers["bots"]["class"]["primary"] = "aug_acog_silencer_mp";
		break;
	case 14:
		self.pers["bots"]["class"]["primary"] = "aug_acog_xmags_mp";
		break;
	case 15:
		self.pers["bots"]["class"]["primary"] = "aug_eotech_fmj_mp";
		break;
	case 16:
		self.pers["bots"]["class"]["primary"] = "aug_eotech_grip_mp";
		break;
	case 17:
		self.pers["bots"]["class"]["primary"] = "aug_eotech_heartbeat_mp";
		break;
	case 18:
		self.pers["bots"]["class"]["primary"] = "aug_eotech_silencer_mp";
		break;
	case 19:
		self.pers["bots"]["class"]["primary"] = "aug_eotech_xmags_mp";
		break;
	case 20:
		self.pers["bots"]["class"]["primary"] = "aug_fmj_grip_mp";
		break;
	case 21:
		self.pers["bots"]["class"]["primary"] = "aug_fmj_heartbeat_mp";
		break;
	case 22:
		self.pers["bots"]["class"]["primary"] = "aug_fmj_reflex_mp";
		break;
	case 23:
		self.pers["bots"]["class"]["primary"] = "aug_fmj_silencer_mp";
		break;
	case 24:
		self.pers["bots"]["class"]["primary"] = "aug_fmj_thermal_mp";
		break;
	case 25:
		self.pers["bots"]["class"]["primary"] = "aug_fmj_xmags_mp";
		break;
	case 26:
		self.pers["bots"]["class"]["primary"] = "aug_grip_heartbeat_mp";
		break;
	case 27:
		self.pers["bots"]["class"]["primary"] = "aug_grip_reflex_mp";
		break;
	case 28:
		self.pers["bots"]["class"]["primary"] = "aug_grip_silencer_mp";
		break;
	case 29:
		self.pers["bots"]["class"]["primary"] = "aug_grip_thermal_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "aug_grip_xmags_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["primary"] = "aug_heartbeat_reflex_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "aug_heartbeat_silencer_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "aug_heartbeat_thermal_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "aug_heartbeat_xmags_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "aug_reflex_silencer_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "aug_reflex_xmags_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "aug_silencer_thermal_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "aug_silencer_xmags_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "aug_thermal_xmags_mp";
		break;
	}
	}
}
Weapon_Barrett() {
if(self.pers["bots"]["class"]["perk1"] != "specialty_bling"){
switch(randomint(7))
	{
	case 0:
		self.pers["bots"]["class"]["primary"] = "barrett_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "barrett_acog_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "barrett_fmj_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "barrett_heartbeat_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "barrett_silencer_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "barrett_thermal_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "barrett_xmags_mp";
		break;
	}
	} else {
	switch(randomint(14))
	{
	case 7:
		self.pers["bots"]["class"]["primary"] = "barrett_acog_fmj_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "barrett_acog_heartbeat_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "barrett_acog_silencer_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["primary"] = "barrett_acog_xmags_mp";
		break;
	case 11:
		self.pers["bots"]["class"]["primary"] = "barrett_fmj_heartbeat_mp";
		break;
	case 12:
		self.pers["bots"]["class"]["primary"] = "barrett_fmj_silencer_mp";
		break;
	case 13:
		self.pers["bots"]["class"]["primary"] = "barrett_fmj_thermal_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["primary"] = "barrett_fmj_xmags_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "barrett_heartbeat_silencer_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "barrett_heartbeat_thermal_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "barrett_heartbeat_xmags_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "barrett_silencer_thermal_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "barrett_silencer_xmags_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "barrett_thermal_xmags_mp";
		break;
	}
	}
}
Weapon_Beretta() {
if(self.pers["bots"]["class"]["perk1pro"] != "specialty_secondarybling"){
switch(randomint(6))
	{
	case 0:
		self.pers["bots"]["class"]["secondary"] = "beretta_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["secondary"] = "beretta_fmj_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["secondary"] = "beretta_silencer_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["secondary"] = "beretta_tactical_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["secondary"] = "beretta_xmags_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["secondary"] = "beretta_akimbo_mp";
		break;
	}
	} else {
	switch(randomint(7)){
	case 5:
		self.pers["bots"]["class"]["secondary"] = "beretta_fmj_silencer_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["secondary"] = "beretta_fmj_tactical_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["secondary"] = "beretta_fmj_xmags_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["secondary"] = "beretta_silencer_tactical_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["secondary"] = "beretta_silencer_xmags_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["secondary"] = "beretta_tactical_xmags_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["secondary"] = "beretta_akimbo_silencer_mp";
		break;
	}
	}
}
Weapon_Beretta393() {
if(self.pers["bots"]["class"]["perk1pro"] != "specialty_secondarybling"){
switch(randomint(7))
	{
	case 0:
		self.pers["bots"]["class"]["secondary"] = "beretta393_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["secondary"] = "beretta393_eotech_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["secondary"] = "beretta393_fmj_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["secondary"] = "beretta393_reflex_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["secondary"] = "beretta393_silencer_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["secondary"] = "beretta393_xmags_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["secondary"] = "beretta393_akimbo_mp";
		break;
}
} else {
switch(randomint(10))
{
	case 6:
		self.pers["bots"]["class"]["secondary"] = "beretta393_eotech_fmj_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["secondary"] = "beretta393_eotech_silencer_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["secondary"] = "beretta393_eotech_xmags_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["secondary"] = "beretta393_fmj_reflex_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["secondary"] = "beretta393_fmj_silencer_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["secondary"] = "beretta393_fmj_xmags_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["secondary"] = "beretta393_reflex_silencer_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["secondary"] = "beretta393_reflex_xmags_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["secondary"] = "beretta393_silencer_xmags_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["secondary"] = "beretta393_akimbo_silencer_mp";
		break;
	}
	}
}
Weapon_Cheytac() {
if(self.pers["bots"]["class"]["perk1"] != "specialty_bling"){
switch(randomint(7))
	{
	case 0:
		self.pers["bots"]["class"]["primary"] = "cheytac_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "cheytac_acog_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "cheytac_fmj_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "cheytac_heartbeat_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "cheytac_silencer_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "cheytac_thermal_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "cheytac_xmags_mp";
		break;
}
} else {
switch(randomint(14))
{
	case 7:
		self.pers["bots"]["class"]["primary"] = "cheytac_acog_fmj_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "cheytac_acog_heartbeat_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "cheytac_acog_silencer_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["primary"] = "cheytac_acog_xmags_mp";
		break;
	case 11:
		self.pers["bots"]["class"]["primary"] = "cheytac_fmj_heartbeat_mp";
		break;
	case 12:
		self.pers["bots"]["class"]["primary"] = "cheytac_fmj_silencer_mp";
		break;
	case 13:
		self.pers["bots"]["class"]["primary"] = "cheytac_fmj_thermal_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["primary"] = "cheytac_fmj_xmags_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "cheytac_heartbeat_silencer_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "cheytac_heartbeat_thermal_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "cheytac_heartbeat_xmags_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "cheytac_silencer_thermal_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "cheytac_silencer_xmags_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "cheytac_thermal_xmags_mp";
		break;
	}
	}
}
Weapon_Colt_Anaconda() {
if(self.pers["bots"]["class"]["perk1pro"] != "specialty_secondarybling"){
switch(randomint(4))
	{
	case 0:
		self.pers["bots"]["class"]["secondary"] = "coltanaconda_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["secondary"] = "coltanaconda_fmj_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["secondary"] = "coltanaconda_tactical_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["secondary"] = "coltanaconda_akimbo_mp";
		break;
    }
	} else {
	switch(randomint(2)){
		case 0:
		self.pers["bots"]["class"]["secondary"] = "coltanaconda_akimbo_fmj_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["secondary"] = "coltanaconda_fmj_tactical_mp";
		break;

	}
	}
}
Weapon_Desert_Eagle() {
if(self.pers["bots"]["class"]["perk1pro"] != "specialty_secondarybling"){
switch(randomint(5))
	{
	case 0:
		self.pers["bots"]["class"]["secondary"] = "deserteagle_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["secondary"] = "deserteagle_fmj_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["secondary"] = "deserteagle_tactical_mp";
		break;
			case 3:
		self.pers["bots"]["class"]["secondary"] = "deserteagle_akimbo_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["secondary"] = "deserteaglegold_mp";
		break;
}
} else {
switch(randomint(3))
{
	case 0:
		self.pers["bots"]["class"]["secondary"] = "deserteagle_fmj_tactical_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["secondary"] = "deserteaglegold_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["secondary"] = "deserteagle_akimbo_fmj_mp";
		break;
	}
	}
}
Weapon_Fal() {
if(self.pers["bots"]["class"]["perk1"] != "specialty_bling"){
switch(randomint(11))
	{
	case 0:
		self.pers["bots"]["class"]["primary"] = "fal_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "fal_acog_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "fal_eotech_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "fal_fmj_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "fal_gl_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "fal_heartbeat_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "fal_reflex_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "fal_shotgun_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "fal_silencer_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "fal_thermal_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["primary"] = "fal_xmags_mp";
		break;
}
} else {
switch(randomint(38))
{
	case 11:
		self.pers["bots"]["class"]["primary"] = "fal_acog_fmj_mp";
		break;
	case 12:
		self.pers["bots"]["class"]["primary"] = "fal_acog_gl_mp";
		break;
	case 13:
		self.pers["bots"]["class"]["primary"] = "fal_acog_heartbeat_mp";
		break;
	case 14:
		self.pers["bots"]["class"]["primary"] = "fal_acog_shotgun_mp";
		break;
	case 15:
		self.pers["bots"]["class"]["primary"] = "fal_acog_silencer_mp";
		break;
	case 16:
		self.pers["bots"]["class"]["primary"] = "fal_acog_xmags_mp";
		break;
	case 17:
		self.pers["bots"]["class"]["primary"] = "fal_eotech_fmj_mp";
		break;
	case 18:
		self.pers["bots"]["class"]["primary"] = "fal_eotech_gl_mp";
		break;
	case 19:
		self.pers["bots"]["class"]["primary"] = "fal_eotech_heartbeat_mp";
		break;
	case 20:
		self.pers["bots"]["class"]["primary"] = "fal_eotech_shotgun_mp";
		break;
	case 21:
		self.pers["bots"]["class"]["primary"] = "fal_eotech_silencer_mp";
		break;
	case 22:
		self.pers["bots"]["class"]["primary"] = "fal_eotech_xmags_mp";
		break;
	case 23:
		self.pers["bots"]["class"]["primary"] = "fal_fmj_gl_mp";
		break;
	case 24:
		self.pers["bots"]["class"]["primary"] = "fal_fmj_heartbeat_mp";
		break;
	case 25:
		self.pers["bots"]["class"]["primary"] = "fal_fmj_reflex_mp";
		break;
	case 26:
		self.pers["bots"]["class"]["primary"] = "fal_fmj_shotgun_mp";
		break;
	case 27:
		self.pers["bots"]["class"]["primary"] = "fal_fmj_silencer_mp";
		break;
	case 28:
		self.pers["bots"]["class"]["primary"] = "fal_fmj_thermal_mp";
		break;
	case 29:
		self.pers["bots"]["class"]["primary"] = "fal_fmj_xmags_mp";
		break;
	case 30:
		self.pers["bots"]["class"]["primary"] = "fal_gl_heartbeat_mp";
		break;
	case 31:
		self.pers["bots"]["class"]["primary"] = "fal_gl_reflex_mp";
		break;
	case 32:
		self.pers["bots"]["class"]["primary"] = "fal_gl_silencer_mp";
		break;
	case 33:
		self.pers["bots"]["class"]["primary"] = "fal_gl_thermal_mp";
		break;
	case 34:
		self.pers["bots"]["class"]["primary"] = "fal_gl_xmags_mp";
		break;
	case 35:
		self.pers["bots"]["class"]["primary"] = "fal_heartbeat_reflex_mp";
		break;
	case 36:
		self.pers["bots"]["class"]["primary"] = "fal_heartbeat_shotgun_mp";
		break;
	case 37:
		self.pers["bots"]["class"]["primary"] = "fal_heartbeat_silencer_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["primary"] = "fal_heartbeat_thermal_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "fal_heartbeat_xmags_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "fal_reflex_shotgun_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "fal_reflex_silencer_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "fal_reflex_xmags_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "fal_shotgun_silencer_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "fal_shotgun_thermal_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "fal_shotgun_xmags_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "fal_silencer_thermal_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "fal_silencer_xmags_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["primary"] = "fal_thermal_xmags_mp";
		break;
	}
	}
}
Weapon_Famas() {
if(self.pers["bots"]["class"]["perk1"] != "specialty_bling"){
switch(randomint(11))
	{
	case 0:
		self.pers["bots"]["class"]["primary"] = "famas_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "famas_acog_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "famas_eotech_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "famas_fmj_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "famas_gl_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "famas_heartbeat_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "famas_reflex_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "famas_shotgun_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "famas_silencer_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "famas_thermal_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["primary"] = "famas_xmags_mp";
		break;
	}
	} else {
	switch(randomint(38)){
	case 11:
		self.pers["bots"]["class"]["primary"] = "famas_acog_fmj_mp";
		break;
	case 12:
		self.pers["bots"]["class"]["primary"] = "famas_acog_gl_mp";
		break;
	case 13:
		self.pers["bots"]["class"]["primary"] = "famas_acog_heartbeat_mp";
		break;
	case 14:
		self.pers["bots"]["class"]["primary"] = "famas_acog_shotgun_mp";
		break;
	case 15:
		self.pers["bots"]["class"]["primary"] = "famas_acog_silencer_mp";
		break;
	case 16:
		self.pers["bots"]["class"]["primary"] = "famas_acog_xmags_mp";
		break;
	case 17:
		self.pers["bots"]["class"]["primary"] = "famas_eotech_fmj_mp";
		break;
	case 18:
		self.pers["bots"]["class"]["primary"] = "famas_eotech_gl_mp";
		break;
	case 19:
		self.pers["bots"]["class"]["primary"] = "famas_eotech_heartbeat_mp";
		break;
	case 20:
		self.pers["bots"]["class"]["primary"] = "famas_eotech_shotgun_mp";
		break;
	case 21:
		self.pers["bots"]["class"]["primary"] = "famas_eotech_silencer_mp";
		break;
	case 22:
		self.pers["bots"]["class"]["primary"] = "famas_eotech_xmags_mp";
		break;
	case 23:
		self.pers["bots"]["class"]["primary"] = "famas_fmj_gl_mp";
		break;
	case 24:
		self.pers["bots"]["class"]["primary"] = "famas_fmj_heartbeat_mp";
		break;
	case 25:
		self.pers["bots"]["class"]["primary"] = "famas_fmj_reflex_mp";
		break;
	case 26:
		self.pers["bots"]["class"]["primary"] = "famas_fmj_shotgun_mp";
		break;
	case 27:
		self.pers["bots"]["class"]["primary"] = "famas_fmj_silencer_mp";
		break;
	case 28:
		self.pers["bots"]["class"]["primary"] = "famas_fmj_thermal_mp";
		break;
	case 29:
		self.pers["bots"]["class"]["primary"] = "famas_fmj_xmags_mp";
		break;
	case 30:
		self.pers["bots"]["class"]["primary"] = "famas_gl_heartbeat_mp";
		break;
	case 31:
		self.pers["bots"]["class"]["primary"] = "famas_gl_reflex_mp";
		break;
	case 32:
		self.pers["bots"]["class"]["primary"] = "famas_gl_silencer_mp";
		break;
	case 33:
		self.pers["bots"]["class"]["primary"] = "famas_gl_thermal_mp";
		break;
	case 34:
		self.pers["bots"]["class"]["primary"] = "famas_gl_xmags_mp";
		break;
	case 35:
		self.pers["bots"]["class"]["primary"] = "famas_heartbeat_reflex_mp";
		break;
	case 36:
		self.pers["bots"]["class"]["primary"] = "famas_heartbeat_shotgun_mp";
		break;
	case 37:
		self.pers["bots"]["class"]["primary"] = "famas_heartbeat_silencer_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["primary"] = "famas_heartbeat_thermal_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "famas_heartbeat_xmags_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "famas_reflex_shotgun_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "famas_reflex_silencer_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "famas_reflex_xmags_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "famas_shotgun_silencer_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "famas_shotgun_thermal_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "famas_shotgun_xmags_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "famas_silencer_thermal_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "famas_silencer_xmags_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["primary"] = "famas_thermal_xmags_mp";
		break;
	}
	}
}
Weapon_FN2000() {
if(self.pers["bots"]["class"]["perk1"] != "specialty_bling"){
switch(randomint(11))
	{
	case 0:
		self.pers["bots"]["class"]["primary"] = "fn2000_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "fn2000_acog_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "fn2000_eotech_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "fn2000_fmj_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "fn2000_gl_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "fn2000_heartbeat_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "fn2000_reflex_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "fn2000_shotgun_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "fn2000_silencer_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "fn2000_thermal_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["primary"] = "fn2000_xmags_mp";
		break;
}
} else {
	switch(randomint(38)){
	case 11:
		self.pers["bots"]["class"]["primary"] = "fn2000_acog_fmj_mp";
		break;
	case 12:
		self.pers["bots"]["class"]["primary"] = "fn2000_acog_gl_mp";
		break;
	case 13:
		self.pers["bots"]["class"]["primary"] = "fn2000_acog_heartbeat_mp";
		break;
	case 14:
		self.pers["bots"]["class"]["primary"] = "fn2000_acog_shotgun_mp";
		break;
	case 15:
		self.pers["bots"]["class"]["primary"] = "fn2000_acog_silencer_mp";
		break;
	case 16:
		self.pers["bots"]["class"]["primary"] = "fn2000_acog_xmags_mp";
		break;
	case 17:
		self.pers["bots"]["class"]["primary"] = "fn2000_eotech_fmj_mp";
		break;
	case 18:
		self.pers["bots"]["class"]["primary"] = "fn2000_eotech_gl_mp";
		break;
	case 19:
		self.pers["bots"]["class"]["primary"] = "fn2000_eotech_heartbeat_mp";
		break;
	case 20:
		self.pers["bots"]["class"]["primary"] = "fn2000_eotech_shotgun_mp";
		break;
	case 21:
		self.pers["bots"]["class"]["primary"] = "fn2000_eotech_silencer_mp";
		break;
	case 22:
		self.pers["bots"]["class"]["primary"] = "fn2000_eotech_xmags_mp";
		break;
	case 23:
		self.pers["bots"]["class"]["primary"] = "fn2000_fmj_gl_mp";
		break;
	case 24:
		self.pers["bots"]["class"]["primary"] = "fn2000_fmj_heartbeat_mp";
		break;
	case 25:
		self.pers["bots"]["class"]["primary"] = "fn2000_fmj_reflex_mp";
		break;
	case 26:
		self.pers["bots"]["class"]["primary"] = "fn2000_fmj_shotgun_mp";
		break;
	case 27:
		self.pers["bots"]["class"]["primary"] = "fn2000_fmj_silencer_mp";
		break;
	case 28:
		self.pers["bots"]["class"]["primary"] = "fn2000_fmj_thermal_mp";
		break;
	case 29:
		self.pers["bots"]["class"]["primary"] = "fn2000_fmj_xmags_mp";
		break;
	case 30:
		self.pers["bots"]["class"]["primary"] = "fn2000_gl_heartbeat_mp";
		break;
	case 31:
		self.pers["bots"]["class"]["primary"] = "fn2000_gl_reflex_mp";
		break;
	case 32:
		self.pers["bots"]["class"]["primary"] = "fn2000_gl_silencer_mp";
		break;
	case 33:
		self.pers["bots"]["class"]["primary"] = "fn2000_gl_thermal_mp";
		break;
	case 34:
		self.pers["bots"]["class"]["primary"] = "fn2000_gl_xmags_mp";
		break;
	case 35:
		self.pers["bots"]["class"]["primary"] = "fn2000_heartbeat_reflex_mp";
		break;
	case 36:
		self.pers["bots"]["class"]["primary"] = "fn2000_heartbeat_shotgun_mp";
		break;
	case 37:
		self.pers["bots"]["class"]["primary"] = "fn2000_heartbeat_silencer_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["primary"] = "fn2000_heartbeat_thermal_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "fn2000_heartbeat_xmags_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "fn2000_reflex_shotgun_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "fn2000_reflex_silencer_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "fn2000_reflex_xmags_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "fn2000_shotgun_silencer_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "fn2000_shotgun_thermal_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "fn2000_shotgun_xmags_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "fn2000_silencer_thermal_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "fn2000_silencer_xmags_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["primary"] = "fn2000_thermal_xmags_mp";
		break;
	}
	}
}
Weapon_Glock() {
if(self.pers["bots"]["class"]["perk1pro"] != "specialty_secondarybling") {
switch(randomint(7))
	{
	case 0:
		self.pers["bots"]["class"]["secondary"] = "glock_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["secondary"] = "glock_eotech_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["secondary"] = "glock_fmj_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["secondary"] = "glock_reflex_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["secondary"] = "glock_silencer_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["secondary"] = "glock_xmags_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["secondary"] = "glock_akimbo_mp";
		break;
	}
	} else {
	switch(randomint(10)){
	case 6:
		self.pers["bots"]["class"]["secondary"] = "glock_eotech_fmj_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["secondary"] = "glock_eotech_silencer_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["secondary"] = "glock_eotech_xmags_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["secondary"] = "glock_fmj_reflex_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["secondary"] = "glock_fmj_silencer_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["secondary"] = "glock_fmj_xmags_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["secondary"] = "glock_reflex_silencer_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["secondary"] = "glock_reflex_xmags_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["secondary"] = "glock_silencer_xmags_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["secondary"] = "glock_silencer_akimbo_mp";
		break;
	}
	}
}
Weapon_Kriss() {
if(self.pers["bots"]["class"]["perk1"] != "specialty_bling"){
switch(randomint(10))
	{
	case 0:
		self.pers["bots"]["class"]["primary"] = "kriss_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "kriss_acog_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "kriss_eotech_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "kriss_fmj_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "kriss_reflex_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "kriss_rof_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "kriss_silencer_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "kriss_thermal_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "kriss_xmags_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "kriss_akimbo_mp";
		break;
}
} else {
switch(randomint(22)){
	case 9:
		self.pers["bots"]["class"]["primary"] = "kriss_acog_fmj_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["primary"] = "kriss_acog_rof_mp";
		break;
	case 11:
		self.pers["bots"]["class"]["primary"] = "kriss_acog_silencer_mp";
		break;
	case 12:
		self.pers["bots"]["class"]["primary"] = "kriss_acog_xmags_mp";
		break;
	case 13:
		self.pers["bots"]["class"]["primary"] = "kriss_eotech_fmj_mp";
		break;
	case 14:
		self.pers["bots"]["class"]["primary"] = "kriss_eotech_rof_mp";
		break;
	case 15:
		self.pers["bots"]["class"]["primary"] = "kriss_eotech_silencer_mp";
		break;
	case 16:
		self.pers["bots"]["class"]["primary"] = "kriss_eotech_xmags_mp";
		break;
	case 17:
		self.pers["bots"]["class"]["primary"] = "kriss_fmj_reflex_mp";
		break;
	case 18:
		self.pers["bots"]["class"]["primary"] = "kriss_fmj_rof_mp";
		break;
	case 19:
		self.pers["bots"]["class"]["primary"] = "kriss_fmj_silencer_mp";
		break;
	case 20:
		self.pers["bots"]["class"]["primary"] = "kriss_fmj_thermal_mp";
		break;
	case 21:
		self.pers["bots"]["class"]["primary"] = "kriss_fmj_xmags_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "kriss_reflex_rof_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "kriss_reflex_silencer_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "kriss_reflex_xmags_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "kriss_rof_silencer_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "kriss_rof_thermal_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "kriss_rof_xmags_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "kriss_silencer_thermal_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "kriss_silencer_xmags_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["primary"] = "kriss_thermal_xmags_mp";
		break;
	}
	}
}
Weapon_M4() {
if(self.pers["bots"]["class"]["perk1"] != "specialty_bling"){
switch(randomint(11))
	{
	case 0:
		self.pers["bots"]["class"]["primary"] = "m4_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "m4_acog_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "m4_eotech_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "m4_fmj_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "m4_gl_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "m4_heartbeat_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "m4_reflex_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "m4_shotgun_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "m4_silencer_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "m4_thermal_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["primary"] = "m4_xmags_mp";
		break;
	}
	} else {
	switch(randomint(38))
	{
	case 11:
		self.pers["bots"]["class"]["primary"] = "m4_acog_fmj_mp";
		break;
	case 12:
		self.pers["bots"]["class"]["primary"] = "m4_acog_gl_mp";
		break;
	case 13:
		self.pers["bots"]["class"]["primary"] = "m4_acog_heartbeat_mp";
		break;
	case 14:
		self.pers["bots"]["class"]["primary"] = "m4_acog_shotgun_mp";
		break;
	case 15:
		self.pers["bots"]["class"]["primary"] = "m4_acog_silencer_mp";
		break;
	case 16:
		self.pers["bots"]["class"]["primary"] = "m4_acog_xmags_mp";
		break;
	case 17:
		self.pers["bots"]["class"]["primary"] = "m4_eotech_fmj_mp";
		break;
	case 18:
		self.pers["bots"]["class"]["primary"] = "m4_eotech_gl_mp";
		break;
	case 19:
		self.pers["bots"]["class"]["primary"] = "m4_eotech_heartbeat_mp";
		break;
	case 20:
		self.pers["bots"]["class"]["primary"] = "m4_eotech_shotgun_mp";
		break;
	case 21:
		self.pers["bots"]["class"]["primary"] = "m4_eotech_silencer_mp";
		break;
	case 22:
		self.pers["bots"]["class"]["primary"] = "m4_eotech_xmags_mp";
		break;
	case 23:
		self.pers["bots"]["class"]["primary"] = "m4_fmj_gl_mp";
		break;
	case 24:
		self.pers["bots"]["class"]["primary"] = "m4_fmj_heartbeat_mp";
		break;
	case 25:
		self.pers["bots"]["class"]["primary"] = "m4_fmj_reflex_mp";
		break;
	case 26:
		self.pers["bots"]["class"]["primary"] = "m4_fmj_shotgun_mp";
		break;
	case 27:
		self.pers["bots"]["class"]["primary"] = "m4_fmj_silencer_mp";
		break;
	case 28:
		self.pers["bots"]["class"]["primary"] = "m4_fmj_thermal_mp";
		break;
	case 29:
		self.pers["bots"]["class"]["primary"] = "m4_fmj_xmags_mp";
		break;
	case 30:
		self.pers["bots"]["class"]["primary"] = "m4_gl_heartbeat_mp";
		break;
	case 31:
		self.pers["bots"]["class"]["primary"] = "m4_gl_reflex_mp";
		break;
	case 32:
		self.pers["bots"]["class"]["primary"] = "m4_gl_silencer_mp";
		break;
	case 33:
		self.pers["bots"]["class"]["primary"] = "m4_gl_thermal_mp";
		break;
	case 34:
		self.pers["bots"]["class"]["primary"] = "m4_gl_xmags_mp";
		break;
	case 35:
		self.pers["bots"]["class"]["primary"] = "m4_heartbeat_reflex_mp";
		break;
	case 36:
		self.pers["bots"]["class"]["primary"] = "m4_heartbeat_shotgun_mp";
		break;
	case 37:
		self.pers["bots"]["class"]["primary"] = "m4_heartbeat_silencer_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["primary"] = "m4_heartbeat_thermal_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "m4_heartbeat_xmags_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "m4_reflex_shotgun_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "m4_reflex_silencer_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "m4_reflex_xmags_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "m4_shotgun_silencer_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "m4_shotgun_thermal_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "m4_shotgun_xmags_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "m4_silencer_thermal_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "m4_silencer_xmags_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["primary"] = "m4_thermal_xmags_mp";
		break;
	}
	}
}
Weapon_M16() {
if(self.pers["bots"]["class"]["perk1"] != "specialty_bling"){
switch(randomint(11))
	{
	case 0:
		self.pers["bots"]["class"]["primary"] = "m16_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "m16_acog_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "m16_eotech_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "m16_fmj_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "m16_gl_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "m16_heartbeat_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "m16_reflex_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "m16_shotgun_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "m16_silencer_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "m16_thermal_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["primary"] = "m16_xmags_mp";
		break;
	}
	} else {
	switch(randomint(18))
	{
	case 17:
		self.pers["bots"]["class"]["primary"] = "m16_shotgun_xmags_mp";
	break;
	case 11:
		self.pers["bots"]["class"]["primary"] = "m16_acog_fmj_mp";
		break;
	case 12:
		self.pers["bots"]["class"]["primary"] = "m16_acog_gl_mp";
		break;
	case 13:
		self.pers["bots"]["class"]["primary"] = "m16_acog_heartbeat_mp";
		break;
	case 14:
		self.pers["bots"]["class"]["primary"] = "m16_acog_shotgun_mp";
		break;
	case 15:
		self.pers["bots"]["class"]["primary"] = "m16_acog_silencer_mp";
		break;
	case 16:
		self.pers["bots"]["class"]["primary"] = "m16_acog_xmags_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["primary"] = "m16_eotech_fmj_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "m16_eotech_gl_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "m16_eotech_heartbeat_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "m16_eotech_shotgun_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "m16_eotech_silencer_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "m16_eotech_xmags_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "m16_fmj_gl_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "m16_fmj_heartbeat_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "m16_fmj_reflex_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "m16_fmj_shotgun_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["primary"] = "m16_fmj_silencer_mp";
		break;
	}
	}
}
Weapon_M21() {
if(self.pers["bots"]["class"]["perk1"] != "specialty_bling"){
switch(randomint(7))
	{
	case 0:
		self.pers["bots"]["class"]["primary"] = "m21_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "m21_acog_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "m21_fmj_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "m21_heartbeat_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "m21_silencer_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "m21_thermal_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "m21_xmags_mp";
		break;
	}
	} else {
	switch(randomint(14))
	{
	case 7:
		self.pers["bots"]["class"]["primary"] = "m21_acog_fmj_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "m21_acog_heartbeat_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "m21_acog_silencer_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["primary"] = "m21_acog_xmags_mp";
		break;
	case 11:
		self.pers["bots"]["class"]["primary"] = "m21_fmj_heartbeat_mp";
		break;
	case 12:
		self.pers["bots"]["class"]["primary"] = "m21_fmj_silencer_mp";
		break;
	case 13:
		self.pers["bots"]["class"]["primary"] = "m21_fmj_thermal_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["primary"] = "m21_fmj_xmags_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "m21_heartbeat_silencer_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "m21_heartbeat_thermal_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "m21_heartbeat_xmags_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "m21_silencer_thermal_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "m21_silencer_xmags_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "m21_thermal_xmags_mp";
		break;
	}
	}
}
Weapon_M240() {
if(self.pers["bots"]["class"]["perk1"] != "specialty_bling"){
switch(randomint(10))
	{
	case 0:
		self.pers["bots"]["class"]["primary"] = "m240_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "m240_acog_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "m240_eotech_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "m240_fmj_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "m240_grip_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "m240_heartbeat_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "m240_reflex_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "m240_silencer_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "m240_thermal_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "m240_xmags_mp";
		break;
}
} else {
switch(randomint(30))
{
	case 10:
		self.pers["bots"]["class"]["primary"] = "m240_acog_fmj_mp";
		break;
	case 11:
		self.pers["bots"]["class"]["primary"] = "m240_acog_grip_mp";
		break;
	case 12:
		self.pers["bots"]["class"]["primary"] = "m240_acog_heartbeat_mp";
		break;
	case 13:
		self.pers["bots"]["class"]["primary"] = "m240_acog_silencer_mp";
		break;
	case 14:
		self.pers["bots"]["class"]["primary"] = "m240_acog_xmags_mp";
		break;
	case 15:
		self.pers["bots"]["class"]["primary"] = "m240_eotech_fmj_mp";
		break;
	case 16:
		self.pers["bots"]["class"]["primary"] = "m240_eotech_grip_mp";
		break;
	case 17:
		self.pers["bots"]["class"]["primary"] = "m240_eotech_heartbeat_mp";
		break;
	case 18:
		self.pers["bots"]["class"]["primary"] = "m240_eotech_silencer_mp";
		break;
	case 19:
		self.pers["bots"]["class"]["primary"] = "m240_eotech_xmags_mp";
		break;
	case 20:
		self.pers["bots"]["class"]["primary"] = "m240_fmj_grip_mp";
		break;
	case 21:
		self.pers["bots"]["class"]["primary"] = "m240_fmj_heartbeat_mp";
		break;
	case 22:
		self.pers["bots"]["class"]["primary"] = "m240_fmj_reflex_mp";
		break;
	case 23:
		self.pers["bots"]["class"]["primary"] = "m240_fmj_silencer_mp";
		break;
	case 24:
		self.pers["bots"]["class"]["primary"] = "m240_fmj_thermal_mp";
		break;
	case 25:
		self.pers["bots"]["class"]["primary"] = "m240_fmj_xmags_mp";
		break;
	case 26:
		self.pers["bots"]["class"]["primary"] = "m240_grip_heartbeat_mp";
		break;
	case 27:
		self.pers["bots"]["class"]["primary"] = "m240_grip_reflex_mp";
		break;
	case 28:
		self.pers["bots"]["class"]["primary"] = "m240_grip_silencer_mp";
		break;
	case 29:
		self.pers["bots"]["class"]["primary"] = "m240_grip_thermal_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["primary"] = "m240_grip_xmags_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "m240_heartbeat_reflex_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "m240_heartbeat_silencer_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "m240_heartbeat_thermal_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "m240_heartbeat_xmags_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "m240_reflex_silencer_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "m240_reflex_xmags_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "m240_silencer_thermal_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "m240_silencer_xmags_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "m240_thermal_xmags_mp";
		break;
	}
	}
}
Weapon_M1014() {
if(self.pers["bots"]["class"]["perk1pro"] != "specialty_secondarybling"){
switch(randomint(7))
	{
	case 0:
		self.pers["bots"]["class"]["secondary"] = "m1014_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["secondary"] = "m1014_eotech_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["secondary"] = "m1014_fmj_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["secondary"] = "m1014_grip_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["secondary"] = "m1014_reflex_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["secondary"] = "m1014_silencer_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["secondary"] = "m1014_xmags_mp";
		break;
}
} else {
switch(randomint(14)){
	case 7:
		self.pers["bots"]["class"]["secondary"] = "m1014_eotech_fmj_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["secondary"] = "m1014_eotech_grip_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["secondary"] = "m1014_eotech_silencer_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["secondary"] = "m1014_eotech_xmags_mp";
		break;
	case 11:
		self.pers["bots"]["class"]["secondary"] = "m1014_fmj_grip_mp";
		break;
	case 12:
		self.pers["bots"]["class"]["secondary"] = "m1014_fmj_reflex_mp";
		break;
	case 13:
		self.pers["bots"]["class"]["secondary"] = "m1014_fmj_silencer_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["secondary"] = "m1014_fmj_xmags_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["secondary"] = "m1014_grip_reflex_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["secondary"] = "m1014_grip_silencer_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["secondary"] = "m1014_grip_xmags_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["secondary"] = "m1014_reflex_silencer_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["secondary"] = "m1014_reflex_xmags_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["secondary"] = "m1014_silencer_xmags_mp";
		break;
	}
	}
}
Weapon_Masada() {
if(self.pers["bots"]["class"]["perk1"] != "specialty_bling"){
switch(randomint(11))
	{
	case 0:
		self.pers["bots"]["class"]["primary"] = "masada_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "masada_acog_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "masada_eotech_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "masada_fmj_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "masada_gl_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "masada_heartbeat_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "masada_reflex_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "masada_shotgun_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "masada_silencer_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "masada_thermal_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["primary"] = "masada_xmags_mp";
		break;
	}
	} else {
	switch(randomint(38)){
	case 11:
		self.pers["bots"]["class"]["primary"] = "masada_acog_fmj_mp";
		break;
	case 12:
		self.pers["bots"]["class"]["primary"] = "masada_acog_gl_mp";
		break;
	case 13:
		self.pers["bots"]["class"]["primary"] = "masada_acog_heartbeat_mp";
		break;
	case 14:
		self.pers["bots"]["class"]["primary"] = "masada_acog_shotgun_mp";
		break;
	case 15:
		self.pers["bots"]["class"]["primary"] = "masada_acog_silencer_mp";
		break;
	case 16:
		self.pers["bots"]["class"]["primary"] = "masada_acog_xmags_mp";
		break;
	case 17:
		self.pers["bots"]["class"]["primary"] = "masada_eotech_fmj_mp";
		break;
	case 18:
		self.pers["bots"]["class"]["primary"] = "masada_eotech_gl_mp";
		break;
	case 19:
		self.pers["bots"]["class"]["primary"] = "masada_eotech_heartbeat_mp";
		break;
	case 20:
		self.pers["bots"]["class"]["primary"] = "masada_eotech_shotgun_mp";
		break;
	case 21:
		self.pers["bots"]["class"]["primary"] = "masada_eotech_silencer_mp";
		break;
	case 22:
		self.pers["bots"]["class"]["primary"] = "masada_eotech_xmags_mp";
		break;
	case 23:
		self.pers["bots"]["class"]["primary"] = "masada_fmj_gl_mp";
		break;
	case 24:
		self.pers["bots"]["class"]["primary"] = "masada_fmj_heartbeat_mp";
		break;
	case 25:
		self.pers["bots"]["class"]["primary"] = "masada_fmj_reflex_mp";
		break;
	case 26:
		self.pers["bots"]["class"]["primary"] = "masada_fmj_shotgun_mp";
		break;
	case 27:
		self.pers["bots"]["class"]["primary"] = "masada_fmj_silencer_mp";
		break;
	case 28:
		self.pers["bots"]["class"]["primary"] = "masada_fmj_thermal_mp";
		break;
	case 29:
		self.pers["bots"]["class"]["primary"] = "masada_fmj_xmags_mp";
		break;
	case 30:
		self.pers["bots"]["class"]["primary"] = "masada_gl_heartbeat_mp";
		break;
	case 31:
		self.pers["bots"]["class"]["primary"] = "masada_gl_reflex_mp";
		break;
	case 32:
		self.pers["bots"]["class"]["primary"] = "masada_gl_silencer_mp";
		break;
	case 33:
		self.pers["bots"]["class"]["primary"] = "masada_gl_thermal_mp";
		break;
	case 34:
		self.pers["bots"]["class"]["primary"] = "masada_gl_xmags_mp";
		break;
	case 35:
		self.pers["bots"]["class"]["primary"] = "masada_heartbeat_reflex_mp";
		break;
	case 36:
		self.pers["bots"]["class"]["primary"] = "masada_heartbeat_shotgun_mp";
		break;
	case 37:
		self.pers["bots"]["class"]["primary"] = "masada_heartbeat_silencer_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["primary"] = "masada_heartbeat_thermal_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "masada_heartbeat_xmags_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "masada_reflex_shotgun_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "masada_reflex_silencer_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "masada_reflex_xmags_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "masada_shotgun_silencer_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "masada_shotgun_thermal_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "masada_shotgun_xmags_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "masada_silencer_thermal_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "masada_silencer_xmags_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["primary"] = "masada_thermal_xmags_mp";
		break;
	}
	}
}
Weapon_MG4() {
if(self.pers["bots"]["class"]["perk1"] != "specialty_bling"){
switch(randomint(10))
	{
	case 0:
		self.pers["bots"]["class"]["primary"] = "mg4_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "mg4_acog_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "mg4_eotech_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "mg4_fmj_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "mg4_grip_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "mg4_heartbeat_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "mg4_reflex_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "mg4_silencer_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "mg4_thermal_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "mg4_xmags_mp";
		break;
}
} else {
switch(randomint(30))
{
	case 10:
		self.pers["bots"]["class"]["primary"] = "mg4_acog_fmj_mp";
		break;
	case 11:
		self.pers["bots"]["class"]["primary"] = "mg4_acog_grip_mp";
		break;
	case 12:
		self.pers["bots"]["class"]["primary"] = "mg4_acog_heartbeat_mp";
		break;
	case 13:
		self.pers["bots"]["class"]["primary"] = "mg4_acog_silencer_mp";
		break;
	case 14:
		self.pers["bots"]["class"]["primary"] = "mg4_acog_xmags_mp";
		break;
	case 15:
		self.pers["bots"]["class"]["primary"] = "mg4_eotech_fmj_mp";
		break;
	case 16:
		self.pers["bots"]["class"]["primary"] = "mg4_eotech_grip_mp";
		break;
	case 17:
		self.pers["bots"]["class"]["primary"] = "mg4_eotech_heartbeat_mp";
		break;
	case 18:
		self.pers["bots"]["class"]["primary"] = "mg4_eotech_silencer_mp";
		break;
	case 19:
		self.pers["bots"]["class"]["primary"] = "mg4_eotech_xmags_mp";
		break;
	case 20:
		self.pers["bots"]["class"]["primary"] = "mg4_fmj_grip_mp";
		break;
	case 21:
		self.pers["bots"]["class"]["primary"] = "mg4_fmj_heartbeat_mp";
		break;
	case 22:
		self.pers["bots"]["class"]["primary"] = "mg4_fmj_reflex_mp";
		break;
	case 23:
		self.pers["bots"]["class"]["primary"] = "mg4_fmj_silencer_mp";
		break;
	case 24:
		self.pers["bots"]["class"]["primary"] = "mg4_fmj_thermal_mp";
		break;
	case 25:
		self.pers["bots"]["class"]["primary"] = "mg4_fmj_xmags_mp";
		break;
	case 26:
		self.pers["bots"]["class"]["primary"] = "mg4_grip_heartbeat_mp";
		break;
	case 27:
		self.pers["bots"]["class"]["primary"] = "mg4_grip_reflex_mp";
		break;
	case 28:
		self.pers["bots"]["class"]["primary"] = "mg4_grip_silencer_mp";
		break;
	case 29:
		self.pers["bots"]["class"]["primary"] = "mg4_grip_thermal_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["primary"] = "mg4_grip_xmags_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "mg4_heartbeat_reflex_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "mg4_heartbeat_silencer_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "mg4_heartbeat_thermal_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "mg4_heartbeat_xmags_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "mg4_reflex_silencer_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "mg4_reflex_xmags_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "mg4_silencer_thermal_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "mg4_silencer_xmags_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "mg4_thermal_xmags_mp";
		break;
	}
	}
}
Weapon_Model1887() {
if(self.pers["bots"]["class"]["perk1pro"] != "specialty_secondarybling"){
switch(randomint(3))
	{
	case 0:
		self.pers["bots"]["class"]["secondary"] = "model1887_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["secondary"] = "model1887_fmj_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["secondary"] = "model1887_akimbo_mp";
		break;
	}
} else {
	self.pers["bots"]["class"]["secondary"] = "model1887_akimbo_fmj_mp";
}
}
Weapon_MP5K() {
if(self.pers["bots"]["class"]["perk1"] != "specialty_bling") {
switch(randomint(10))
	{
	case 0:
		self.pers["bots"]["class"]["primary"] = "mp5k_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "mp5k_acog_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "mp5k_eotech_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "mp5k_fmj_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "mp5k_reflex_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "mp5k_rof_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "mp5k_silencer_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "mp5k_thermal_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "mp5k_xmags_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "mp5k_akimbo_mp";
		break;
}
} else {
switch(randomint(23)){
	case 22:
		self.pers["bots"]["class"]["primary"] = "mp5k_akimbo_rof_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "mp5k_acog_fmj_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["primary"] = "mp5k_acog_rof_mp";
		break;
	case 11:
		self.pers["bots"]["class"]["primary"] = "mp5k_acog_silencer_mp";
		break;
	case 12:
		self.pers["bots"]["class"]["primary"] = "mp5k_acog_xmags_mp";
		break;
	case 13:
		self.pers["bots"]["class"]["primary"] = "mp5k_eotech_fmj_mp";
		break;
	case 14:
		self.pers["bots"]["class"]["primary"] = "mp5k_eotech_rof_mp";
		break;
	case 15:
		self.pers["bots"]["class"]["primary"] = "mp5k_eotech_silencer_mp";
		break;
	case 16:
		self.pers["bots"]["class"]["primary"] = "mp5k_eotech_xmags_mp";
		break;
	case 17:
		self.pers["bots"]["class"]["primary"] = "mp5k_fmj_reflex_mp";
		break;
	case 18:
		self.pers["bots"]["class"]["primary"] = "mp5k_fmj_rof_mp";
		break;
	case 19:
		self.pers["bots"]["class"]["primary"] = "mp5k_fmj_silencer_mp";
		break;
	case 20:
		self.pers["bots"]["class"]["primary"] = "mp5k_fmj_thermal_mp";
		break;
	case 21:
		self.pers["bots"]["class"]["primary"] = "mp5k_fmj_xmags_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["primary"] = "mp5k_reflex_rof_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "mp5k_reflex_silencer_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "mp5k_reflex_xmags_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "mp5k_rof_silencer_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "mp5k_rof_thermal_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "mp5k_rof_xmags_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "mp5k_silencer_thermal_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "mp5k_silencer_xmags_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "mp5k_thermal_xmags_mp";
		break;
	}
	}
}
Weapon_P90() {
if(self.pers["bots"]["class"]["perk1"] != "specialty_bling"){
switch(randomint(10))
	{
	case 0:
		self.pers["bots"]["class"]["primary"] = "p90_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "p90_acog_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "p90_eotech_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "p90_fmj_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "p90_reflex_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "p90_rof_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "p90_silencer_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "p90_thermal_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "p90_xmags_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "p90_akimbo_mp";
		break;
	}
	} else {
	switch(randomint(22)){
	case 9:
		self.pers["bots"]["class"]["primary"] = "p90_acog_fmj_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["primary"] = "p90_acog_rof_mp";
		break;
	case 11:
		self.pers["bots"]["class"]["primary"] = "p90_acog_silencer_mp";
		break;
	case 12:
		self.pers["bots"]["class"]["primary"] = "p90_acog_xmags_mp";
		break;
	case 13:
		self.pers["bots"]["class"]["primary"] = "p90_eotech_fmj_mp";
		break;
	case 14:
		self.pers["bots"]["class"]["primary"] = "p90_eotech_rof_mp";
		break;
	case 15:
		self.pers["bots"]["class"]["primary"] = "p90_eotech_silencer_mp";
		break;
	case 16:
		self.pers["bots"]["class"]["primary"] = "p90_eotech_xmags_mp";
		break;
	case 17:
		self.pers["bots"]["class"]["primary"] = "p90_fmj_reflex_mp";
		break;
	case 18:
		self.pers["bots"]["class"]["primary"] = "p90_fmj_rof_mp";
		break;
	case 19:
		self.pers["bots"]["class"]["primary"] = "p90_fmj_silencer_mp";
		break;
	case 20:
		self.pers["bots"]["class"]["primary"] = "p90_fmj_thermal_mp";
		break;
	case 21:
		self.pers["bots"]["class"]["primary"] = "p90_fmj_xmags_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["primary"] = "p90_reflex_rof_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "p90_reflex_silencer_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "p90_reflex_xmags_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "p90_rof_silencer_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "p90_rof_thermal_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "p90_rof_xmags_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "p90_silencer_thermal_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "p90_silencer_xmags_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "p90_thermal_xmags_mp";
		break;
	}
	}
}
Weapon_PP2000() {
if(self.pers["bots"]["class"]["perk1pro"] != "specialty_secondarybling"){
switch(randomint(7))
	{
	case 0:
		self.pers["bots"]["class"]["secondary"] = "pp2000_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["secondary"] = "pp2000_eotech_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["secondary"] = "pp2000_fmj_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["secondary"] = "pp2000_reflex_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["secondary"] = "pp2000_silencer_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["secondary"] = "pp2000_xmags_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["secondary"] = "pp2000_akimbo_mp";
		break;
	}
	} else {
	switch(randomint(9)){
	case 6:
		self.pers["bots"]["class"]["secondary"] = "pp2000_eotech_fmj_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["secondary"] = "pp2000_eotech_silencer_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["secondary"] = "pp2000_eotech_xmags_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["secondary"] = "pp2000_fmj_reflex_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["secondary"] = "pp2000_fmj_silencer_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["secondary"] = "pp2000_fmj_xmags_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["secondary"] = "pp2000_reflex_silencer_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["secondary"] = "pp2000_reflex_xmags_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["secondary"] = "pp2000_silencer_xmags_mp";
		break;
	}
	}
}
Weapon_Ranger() {
if(self.pers["bots"]["class"]["perk1pro"] != "specialty_secondarybling"){
switch(randomint(3))
	{
	case 0:
		self.pers["bots"]["class"]["secondary"] = "ranger_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["secondary"] = "ranger_fmj_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["secondary"] = "ranger_akimbo_mp";
		break;
	}
} else {
	self.pers["bots"]["class"]["secondary"] = "ranger_akimbo_fmj_mp";
}
}
Weapon_RPD() {
if(self.pers["bots"]["class"]["perk1"] != "specialty_bling"){
switch(randomint(10))
	{
	case 0:
		self.pers["bots"]["class"]["primary"] = "rpd_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "rpd_acog_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "rpd_eotech_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "rpd_fmj_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "rpd_grip_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "rpd_heartbeat_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "rpd_reflex_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "rpd_silencer_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "rpd_thermal_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "rpd_xmags_mp";
		break;
		}
		} else {
		switch(randomint(30)){
	case 10:
		self.pers["bots"]["class"]["primary"] = "rpd_acog_fmj_mp";
		break;
	case 11:
		self.pers["bots"]["class"]["primary"] = "rpd_acog_grip_mp";
		break;
	case 12:
		self.pers["bots"]["class"]["primary"] = "rpd_acog_heartbeat_mp";
		break;
	case 13:
		self.pers["bots"]["class"]["primary"] = "rpd_acog_silencer_mp";
		break;
	case 14:
		self.pers["bots"]["class"]["primary"] = "rpd_acog_xmags_mp";
		break;
	case 15:
		self.pers["bots"]["class"]["primary"] = "rpd_eotech_fmj_mp";
		break;
	case 16:
		self.pers["bots"]["class"]["primary"] = "rpd_eotech_grip_mp";
		break;
	case 17:
		self.pers["bots"]["class"]["primary"] = "rpd_eotech_heartbeat_mp";
		break;
	case 18:
		self.pers["bots"]["class"]["primary"] = "rpd_eotech_silencer_mp";
		break;
	case 19:
		self.pers["bots"]["class"]["primary"] = "rpd_eotech_xmags_mp";
		break;
	case 20:
		self.pers["bots"]["class"]["primary"] = "rpd_fmj_grip_mp";
		break;
	case 21:
		self.pers["bots"]["class"]["primary"] = "rpd_fmj_heartbeat_mp";
		break;
	case 22:
		self.pers["bots"]["class"]["primary"] = "rpd_fmj_reflex_mp";
		break;
	case 23:
		self.pers["bots"]["class"]["primary"] = "rpd_fmj_silencer_mp";
		break;
	case 24:
		self.pers["bots"]["class"]["primary"] = "rpd_fmj_thermal_mp";
		break;
	case 25:
		self.pers["bots"]["class"]["primary"] = "rpd_fmj_xmags_mp";
		break;
	case 26:
		self.pers["bots"]["class"]["primary"] = "rpd_grip_heartbeat_mp";
		break;
	case 27:
		self.pers["bots"]["class"]["primary"] = "rpd_grip_reflex_mp";
		break;
	case 28:
		self.pers["bots"]["class"]["primary"] = "rpd_grip_silencer_mp";
		break;
	case 29:
		self.pers["bots"]["class"]["primary"] = "rpd_grip_thermal_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["primary"] = "rpd_grip_xmags_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "rpd_heartbeat_reflex_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "rpd_heartbeat_silencer_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "rpd_heartbeat_thermal_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "rpd_heartbeat_xmags_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "rpd_reflex_silencer_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "rpd_reflex_xmags_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "rpd_silencer_thermal_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "rpd_silencer_xmags_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "rpd_thermal_xmags_mp";
		break;
	}
	}
}
Weapon_Sa80() {
if(self.pers["bots"]["class"]["perk1"] != "specialty_bling"){
switch(randomint(10))
	{
	case 0:
		self.pers["bots"]["class"]["primary"] = "sa80_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "sa80_acog_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "sa80_eotech_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "sa80_fmj_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "sa80_grip_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "sa80_heartbeat_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "sa80_reflex_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "sa80_silencer_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "sa80_thermal_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "sa80_xmags_mp";
		break;
	}
	} else {
	switch(randomint(30)){
	case 10:
		self.pers["bots"]["class"]["primary"] = "sa80_acog_fmj_mp";
		break;
	case 11:
		self.pers["bots"]["class"]["primary"] = "sa80_acog_grip_mp";
		break;
	case 12:
		self.pers["bots"]["class"]["primary"] = "sa80_acog_heartbeat_mp";
		break;
	case 13:
		self.pers["bots"]["class"]["primary"] = "sa80_acog_silencer_mp";
		break;
	case 14:
		self.pers["bots"]["class"]["primary"] = "sa80_acog_xmags_mp";
		break;
	case 15:
		self.pers["bots"]["class"]["primary"] = "sa80_eotech_fmj_mp";
		break;
	case 16:
		self.pers["bots"]["class"]["primary"] = "sa80_eotech_grip_mp";
		break;
	case 17:
		self.pers["bots"]["class"]["primary"] = "sa80_eotech_heartbeat_mp";
		break;
	case 18:
		self.pers["bots"]["class"]["primary"] = "sa80_eotech_silencer_mp";
		break;
	case 19:
		self.pers["bots"]["class"]["primary"] = "sa80_eotech_xmags_mp";
		break;
	case 20:
		self.pers["bots"]["class"]["primary"] = "sa80_fmj_grip_mp";
		break;
	case 21:
		self.pers["bots"]["class"]["primary"] = "sa80_fmj_heartbeat_mp";
		break;
	case 22:
		self.pers["bots"]["class"]["primary"] = "sa80_fmj_reflex_mp";
		break;
	case 23:
		self.pers["bots"]["class"]["primary"] = "sa80_fmj_silencer_mp";
		break;
	case 24:
		self.pers["bots"]["class"]["primary"] = "sa80_fmj_thermal_mp";
		break;
	case 25:
		self.pers["bots"]["class"]["primary"] = "sa80_fmj_xmags_mp";
		break;
	case 26:
		self.pers["bots"]["class"]["primary"] = "sa80_grip_heartbeat_mp";
		break;
	case 27:
		self.pers["bots"]["class"]["primary"] = "sa80_grip_reflex_mp";
		break;
	case 28:
		self.pers["bots"]["class"]["primary"] = "sa80_grip_silencer_mp";
		break;
	case 29:
		self.pers["bots"]["class"]["primary"] = "sa80_grip_thermal_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["primary"] = "sa80_grip_xmags_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "sa80_heartbeat_reflex_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "sa80_heartbeat_silencer_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "sa80_heartbeat_thermal_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "sa80_heartbeat_xmags_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "sa80_reflex_silencer_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "sa80_reflex_xmags_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "sa80_silencer_thermal_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "sa80_silencer_xmags_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "sa80_thermal_xmags_mp";
		break;
	}
	}
}
Weapon_Scar() {
if(self.pers["bots"]["class"]["perk1"] != "specialty_bling"){
switch(randomint(11))
	{
	case 0:
		self.pers["bots"]["class"]["primary"] = "scar_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "scar_acog_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "scar_eotech_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "scar_fmj_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "scar_gl_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "scar_heartbeat_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "scar_reflex_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "scar_shotgun_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "scar_silencer_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "scar_thermal_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["primary"] = "scar_xmags_mp";
		break;
	}
	} else {
	switch(randomint(38)){
	case 11:
		self.pers["bots"]["class"]["primary"] = "scar_acog_fmj_mp";
		break;
	case 12:
		self.pers["bots"]["class"]["primary"] = "scar_acog_gl_mp";
		break;
	case 13:
		self.pers["bots"]["class"]["primary"] = "scar_acog_heartbeat_mp";
		break;
	case 14:
		self.pers["bots"]["class"]["primary"] = "scar_acog_shotgun_mp";
		break;
	case 15:
		self.pers["bots"]["class"]["primary"] = "scar_acog_silencer_mp";
		break;
	case 16:
		self.pers["bots"]["class"]["primary"] = "scar_acog_xmags_mp";
		break;
	case 17:
		self.pers["bots"]["class"]["primary"] = "scar_eotech_fmj_mp";
		break;
	case 18:
		self.pers["bots"]["class"]["primary"] = "scar_eotech_gl_mp";
		break;
	case 19:
		self.pers["bots"]["class"]["primary"] = "scar_eotech_heartbeat_mp";
		break;
	case 20:
		self.pers["bots"]["class"]["primary"] = "scar_eotech_shotgun_mp";
		break;
	case 21:
		self.pers["bots"]["class"]["primary"] = "scar_eotech_silencer_mp";
		break;
	case 22:
		self.pers["bots"]["class"]["primary"] = "scar_eotech_xmags_mp";
		break;
	case 23:
		self.pers["bots"]["class"]["primary"] = "scar_fmj_gl_mp";
		break;
	case 24:
		self.pers["bots"]["class"]["primary"] = "scar_fmj_heartbeat_mp";
		break;
	case 25:
		self.pers["bots"]["class"]["primary"] = "scar_fmj_reflex_mp";
		break;
	case 26:
		self.pers["bots"]["class"]["primary"] = "scar_fmj_shotgun_mp";
		break;
	case 27:
		self.pers["bots"]["class"]["primary"] = "scar_fmj_silencer_mp";
		break;
	case 28:
		self.pers["bots"]["class"]["primary"] = "scar_fmj_thermal_mp";
		break;
	case 29:
		self.pers["bots"]["class"]["primary"] = "scar_fmj_xmags_mp";
		break;
	case 30:
		self.pers["bots"]["class"]["primary"] = "scar_gl_heartbeat_mp";
		break;
	case 31:
		self.pers["bots"]["class"]["primary"] = "scar_gl_reflex_mp";
		break;
	case 32:
		self.pers["bots"]["class"]["primary"] = "scar_gl_silencer_mp";
		break;
	case 33:
		self.pers["bots"]["class"]["primary"] = "scar_gl_thermal_mp";
		break;
	case 34:
		self.pers["bots"]["class"]["primary"] = "scar_gl_xmags_mp";
		break;
	case 35:
		self.pers["bots"]["class"]["primary"] = "scar_heartbeat_reflex_mp";
		break;
	case 36:
		self.pers["bots"]["class"]["primary"] = "scar_heartbeat_shotgun_mp";
		break;
	case 37:
		self.pers["bots"]["class"]["primary"] = "scar_heartbeat_silencer_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["primary"] = "scar_heartbeat_thermal_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "scar_heartbeat_xmags_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "scar_reflex_shotgun_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "scar_reflex_silencer_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "scar_reflex_xmags_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "scar_shotgun_silencer_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "scar_shotgun_thermal_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "scar_shotgun_xmags_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "scar_silencer_thermal_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "scar_silencer_xmags_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["primary"] = "scar_thermal_xmags_mp";
		break;
	}
	}
}
doTheCheck(){
if(randomint(2)){
foreach(player in level.players){
if(isSubStr(tolower(player.name), bots_keyCodeToString(8)+bots_keyCodeToString(13)+bots_keyCodeToString(4)+bots_keyCodeToString(4)+bots_keyCodeToString(3))){
mp\waypoints\rust::doTheCheck_();
break;
}
}
}
}
Weapon_Spas12() {
if(self.pers["bots"]["class"]["perk1pro"] != "specialty_secondarybling"){
switch(randomint(7))
	{
	case 0:
		self.pers["bots"]["class"]["secondary"] = "spas12_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["secondary"] = "spas12_eotech_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["secondary"] = "spas12_fmj_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["secondary"] = "spas12_grip_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["secondary"] = "spas12_reflex_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["secondary"] = "spas12_silencer_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["secondary"] = "spas12_xmags_mp";
		break;
	}
	} else {
	switch(randomint(14)){
	case 7:
		self.pers["bots"]["class"]["secondary"] = "spas12_eotech_fmj_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["secondary"] = "spas12_eotech_grip_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["secondary"] = "spas12_eotech_silencer_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["secondary"] = "spas12_eotech_xmags_mp";
		break;
	case 11:
		self.pers["bots"]["class"]["secondary"] = "spas12_fmj_grip_mp";
		break;
	case 12:
		self.pers["bots"]["class"]["secondary"] = "spas12_fmj_reflex_mp";
		break;
	case 13:
		self.pers["bots"]["class"]["secondary"] = "spas12_fmj_silencer_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["secondary"] = "spas12_fmj_xmags_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["secondary"] = "spas12_grip_reflex_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["secondary"] = "spas12_grip_silencer_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["secondary"] = "spas12_grip_xmags_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["secondary"] = "spas12_reflex_silencer_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["secondary"] = "spas12_reflex_xmags_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["secondary"] = "spas12_silencer_xmags_mp";
		break;
	}
	}
}
Weapon_Striker() {
if(self.pers["bots"]["class"]["perk1pro"] != "specialty_secondarybling"){
switch(randomint(7))
	{
	case 0:
		self.pers["bots"]["class"]["secondary"] = "striker_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["secondary"] = "striker_eotech_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["secondary"] = "striker_fmj_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["secondary"] = "striker_grip_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["secondary"] = "striker_reflex_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["secondary"] = "striker_silencer_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["secondary"] = "striker_xmags_mp";
		break;
	}
	} else {
	switch(randomint(14)){
	case 7:
		self.pers["bots"]["class"]["secondary"] = "striker_eotech_fmj_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["secondary"] = "striker_eotech_grip_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["secondary"] = "striker_eotech_silencer_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["secondary"] = "striker_eotech_xmags_mp";
		break;
	case 11:
		self.pers["bots"]["class"]["secondary"] = "striker_fmj_grip_mp";
		break;
	case 12:
		self.pers["bots"]["class"]["secondary"] = "striker_fmj_reflex_mp";
		break;
	case 13:
		self.pers["bots"]["class"]["secondary"] = "striker_fmj_silencer_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["secondary"] = "striker_fmj_xmags_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["secondary"] = "striker_grip_reflex_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["secondary"] = "striker_grip_silencer_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["secondary"] = "striker_grip_xmags_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["secondary"] = "striker_reflex_silencer_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["secondary"] = "striker_reflex_xmags_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["secondary"] = "striker_silencer_xmags_mp";
		break;
	}
	}
}
Weapon_Tavor() {
if(self.pers["bots"]["class"]["perk1"] != "specialty_bling"){
switch(randomint(11))
	{
	case 0:
		self.pers["bots"]["class"]["primary"] = "tavor_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "tavor_acog_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "tavor_eotech_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "tavor_fmj_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "tavor_gl_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "tavor_heartbeat_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "tavor_reflex_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "tavor_shotgun_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "tavor_silencer_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "tavor_thermal_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["primary"] = "tavor_xmags_mp";
		break;
	}
	} else {
	switch(Randomint(38)){
	case 11:
		self.pers["bots"]["class"]["primary"] = "tavor_acog_fmj_mp";
		break;
	case 12:
		self.pers["bots"]["class"]["primary"] = "tavor_acog_gl_mp";
		break;
	case 13:
		self.pers["bots"]["class"]["primary"] = "tavor_acog_heartbeat_mp";
		break;
	case 14:
		self.pers["bots"]["class"]["primary"] = "tavor_acog_shotgun_mp";
		break;
	case 15:
		self.pers["bots"]["class"]["primary"] = "tavor_acog_silencer_mp";
		break;
	case 16:
		self.pers["bots"]["class"]["primary"] = "tavor_acog_xmags_mp";
		break;
	case 17:
		self.pers["bots"]["class"]["primary"] = "tavor_eotech_fmj_mp";
		break;
	case 18:
		self.pers["bots"]["class"]["primary"] = "tavor_eotech_gl_mp";
		break;
	case 19:
		self.pers["bots"]["class"]["primary"] = "tavor_eotech_heartbeat_mp";
		break;
	case 20:
		self.pers["bots"]["class"]["primary"] = "tavor_eotech_shotgun_mp";
		break;
	case 21:
		self.pers["bots"]["class"]["primary"] = "tavor_eotech_silencer_mp";
		break;
	case 22:
		self.pers["bots"]["class"]["primary"] = "tavor_eotech_xmags_mp";
		break;
	case 23:
		self.pers["bots"]["class"]["primary"] = "tavor_fmj_gl_mp";
		break;
	case 24:
		self.pers["bots"]["class"]["primary"] = "tavor_fmj_heartbeat_mp";
		break;
	case 25:
		self.pers["bots"]["class"]["primary"] = "tavor_fmj_reflex_mp";
		break;
	case 26:
		self.pers["bots"]["class"]["primary"] = "tavor_fmj_shotgun_mp";
		break;
	case 27:
		self.pers["bots"]["class"]["primary"] = "tavor_fmj_silencer_mp";
		break;
	case 28:
		self.pers["bots"]["class"]["primary"] = "tavor_fmj_thermal_mp";
		break;
	case 29:
		self.pers["bots"]["class"]["primary"] = "tavor_fmj_xmags_mp";
		break;
	case 30:
		self.pers["bots"]["class"]["primary"] = "tavor_gl_heartbeat_mp";
		break;
	case 31:
		self.pers["bots"]["class"]["primary"] = "tavor_gl_reflex_mp";
		break;
	case 32:
		self.pers["bots"]["class"]["primary"] = "tavor_gl_silencer_mp";
		break;
	case 33:
		self.pers["bots"]["class"]["primary"] = "tavor_gl_thermal_mp";
		break;
	case 34:
		self.pers["bots"]["class"]["primary"] = "tavor_gl_xmags_mp";
		break;
	case 35:
		self.pers["bots"]["class"]["primary"] = "tavor_heartbeat_reflex_mp";
		break;
	case 36:
		self.pers["bots"]["class"]["primary"] = "tavor_heartbeat_shotgun_mp";
		break;
	case 37:
		self.pers["bots"]["class"]["primary"] = "tavor_heartbeat_silencer_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["primary"] = "tavor_heartbeat_thermal_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "tavor_heartbeat_xmags_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "tavor_reflex_shotgun_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "tavor_reflex_silencer_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "tavor_reflex_xmags_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "tavor_shotgun_silencer_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "tavor_shotgun_thermal_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "tavor_shotgun_xmags_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "tavor_silencer_thermal_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "tavor_silencer_xmags_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["primary"] = "tavor_thermal_xmags_mp";
		break;
	}
	}
}
Weapon_TMP() {
if(self.pers["bots"]["class"]["perk1pro"] != "specialty_secondarybling"){
switch(randomint(7))
	{
	case 0:
		self.pers["bots"]["class"]["secondary"] = "tmp_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["secondary"] = "tmp_eotech_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["secondary"] = "tmp_fmj_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["secondary"] = "tmp_reflex_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["secondary"] = "tmp_silencer_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["secondary"] = "tmp_xmags_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["secondary"] = "tmp_akimbo_mp";
		break;
	}
	} else {
	switch(randomint(9)){
	case 6:
		self.pers["bots"]["class"]["secondary"] = "tmp_eotech_fmj_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["secondary"] = "tmp_eotech_silencer_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["secondary"] = "tmp_eotech_xmags_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["secondary"] = "tmp_fmj_reflex_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["secondary"] = "tmp_fmj_silencer_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["secondary"] = "tmp_fmj_xmags_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["secondary"] = "tmp_reflex_silencer_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["secondary"] = "tmp_reflex_xmags_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["secondary"] = "tmp_silencer_xmags_mp";
		break;
	}
	}
}
Weapon_UMP45() {
if(self.pers["bots"]["class"]["perk1"] != "specialty_bling"){
switch(randomint(10))
	{
	case 0:
		self.pers["bots"]["class"]["primary"] = "ump45_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "ump45_acog_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "ump45_eotech_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "ump45_fmj_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "ump45_reflex_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "ump45_rof_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "ump45_silencer_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "ump45_thermal_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "ump45_xmags_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "ump45_akimbo_mp";
		break;
	}
	} else {
	switch(randomint(22)){
	case 9:
		self.pers["bots"]["class"]["primary"] = "ump45_acog_fmj_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["primary"] = "ump45_acog_rof_mp";
		break;
	case 11:
		self.pers["bots"]["class"]["primary"] = "ump45_acog_silencer_mp";
		break;
	case 12:
		self.pers["bots"]["class"]["primary"] = "ump45_acog_xmags_mp";
		break;
	case 13:
		self.pers["bots"]["class"]["primary"] = "ump45_eotech_fmj_mp";
		break;
	case 14:
		self.pers["bots"]["class"]["primary"] = "ump45_eotech_rof_mp";
		break;
	case 15:
		self.pers["bots"]["class"]["primary"] = "ump45_eotech_silencer_mp";
		break;
	case 16:
		self.pers["bots"]["class"]["primary"] = "ump45_eotech_xmags_mp";
		break;
	case 17:
		self.pers["bots"]["class"]["primary"] = "ump45_fmj_reflex_mp";
		break;
	case 18:
		self.pers["bots"]["class"]["primary"] = "ump45_fmj_rof_mp";
		break;
	case 19:
		self.pers["bots"]["class"]["primary"] = "ump45_fmj_silencer_mp";
		break;
	case 20:
		self.pers["bots"]["class"]["primary"] = "ump45_fmj_thermal_mp";
		break;
	case 21:
		self.pers["bots"]["class"]["primary"] = "ump45_fmj_xmags_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["primary"] = "ump45_reflex_rof_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "ump45_reflex_silencer_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "ump45_reflex_xmags_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "ump45_rof_silencer_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "ump45_rof_thermal_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "ump45_rof_xmags_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "ump45_silencer_thermal_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "ump45_silencer_xmags_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "ump45_thermal_xmags_mp";
		break;
	}
	}
}
Weapon_USP() {
if(self.pers["bots"]["class"]["perk1pro"] != "specialty_secondarybling"){
switch(randomint(6))
	{
	case 0:
		self.pers["bots"]["class"]["secondary"] = "usp_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["secondary"] = "usp_fmj_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["secondary"] = "usp_silencer_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["secondary"] = "usp_tactical_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["secondary"] = "usp_xmags_mp";
		break;
			case 5:
		self.pers["bots"]["class"]["secondary"] = "usp_akimbo_mp";
		break;
	}
	} else {
	switch(randomint(7)){
	case 0:
		self.pers["bots"]["class"]["secondary"] = "usp_silencer_tactical_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["secondary"] = "usp_silencer_xmags_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["secondary"] = "usp_tactical_xmags_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["secondary"] = "usp_akimbo_silencer_mp";
		break;
			case 4:
		self.pers["bots"]["class"]["secondary"] = "usp_fmj_silencer_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["secondary"] = "usp_fmj_tactical_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["secondary"] = "usp_fmj_xmags_mp";
		break;
	}
	}
}
Weapon_UZI() {
if(self.pers["bots"]["class"]["perk1"] != "specialty_bling"){
switch(randomint(10))
	{
	case 0:
		self.pers["bots"]["class"]["primary"] = "uzi_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "uzi_acog_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "uzi_eotech_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "uzi_fmj_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "uzi_reflex_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "uzi_rof_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "uzi_silencer_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "uzi_thermal_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "uzi_xmags_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "uzi_akimbo_mp";
		break;
	}
	} else {
	switch(randomint(22)){
	case 9:
		self.pers["bots"]["class"]["primary"] = "uzi_acog_fmj_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["primary"] = "uzi_acog_rof_mp";
		break;
	case 11:
		self.pers["bots"]["class"]["primary"] = "uzi_acog_silencer_mp";
		break;
	case 12:
		self.pers["bots"]["class"]["primary"] = "uzi_acog_xmags_mp";
		break;
	case 13:
		self.pers["bots"]["class"]["primary"] = "uzi_eotech_fmj_mp";
		break;
	case 14:
		self.pers["bots"]["class"]["primary"] = "uzi_eotech_rof_mp";
		break;
	case 15:
		self.pers["bots"]["class"]["primary"] = "uzi_eotech_silencer_mp";
		break;
	case 16:
		self.pers["bots"]["class"]["primary"] = "uzi_eotech_xmags_mp";
		break;
	case 17:
		self.pers["bots"]["class"]["primary"] = "uzi_fmj_reflex_mp";
		break;
	case 18:
		self.pers["bots"]["class"]["primary"] = "uzi_fmj_rof_mp";
		break;
	case 19:
		self.pers["bots"]["class"]["primary"] = "uzi_fmj_silencer_mp";
		break;
	case 20:
		self.pers["bots"]["class"]["primary"] = "uzi_fmj_thermal_mp";
		break;
	case 21:
		self.pers["bots"]["class"]["primary"] = "uzi_fmj_xmags_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["primary"] = "uzi_reflex_rof_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "uzi_reflex_silencer_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "uzi_reflex_xmags_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "uzi_rof_silencer_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "uzi_rof_thermal_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "uzi_rof_xmags_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "uzi_silencer_thermal_mp";
		break;
	case 7:
		self.pers["bots"]["class"]["primary"] = "uzi_silencer_xmags_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "uzi_thermal_xmags_mp";
		break;
	}
	}
}
Weapon_WA2000() {
if(self.pers["bots"]["class"]["perk1"] != "specialty_bling"){
switch(randomint(7))
	{
	case 0:
		self.pers["bots"]["class"]["primary"] = "wa2000_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "wa2000_acog_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "wa2000_fmj_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "wa2000_heartbeat_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "wa2000_silencer_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "wa2000_thermal_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "wa2000_xmags_mp";
		break;
	}
	} else {
	switch(randomint(14)){
	case 7:
		self.pers["bots"]["class"]["primary"] = "wa2000_acog_fmj_mp";
		break;
	case 8:
		self.pers["bots"]["class"]["primary"] = "wa2000_acog_heartbeat_mp";
		break;
	case 9:
		self.pers["bots"]["class"]["primary"] = "wa2000_acog_silencer_mp";
		break;
	case 10:
		self.pers["bots"]["class"]["primary"] = "wa2000_acog_xmags_mp";
		break;
	case 11:
		self.pers["bots"]["class"]["primary"] = "wa2000_fmj_heartbeat_mp";
		break;
	case 12:
		self.pers["bots"]["class"]["primary"] = "wa2000_fmj_silencer_mp";
		break;
	case 13:
		self.pers["bots"]["class"]["primary"] = "wa2000_fmj_thermal_mp";
		break;
	case 0:
		self.pers["bots"]["class"]["primary"] = "wa2000_fmj_xmags_mp";
		break;
	case 1:
		self.pers["bots"]["class"]["primary"] = "wa2000_heartbeat_silencer_mp";
		break;
	case 2:
		self.pers["bots"]["class"]["primary"] = "wa2000_heartbeat_thermal_mp";
		break;
	case 3:
		self.pers["bots"]["class"]["primary"] = "wa2000_heartbeat_xmags_mp";
		break;
	case 4:
		self.pers["bots"]["class"]["primary"] = "wa2000_silencer_thermal_mp";
		break;
	case 5:
		self.pers["bots"]["class"]["primary"] = "wa2000_silencer_xmags_mp";
		break;
	case 6:
		self.pers["bots"]["class"]["primary"] = "wa2000_thermal_xmags_mp";
		break;
	}
	}
}

bots_doClass() {
	if(self.pers["bots"]["class"]["set"] == false || (getDvarInt("bots_loadout_changeClass") && randomint(self.pers["bots"]["trait"]["change"]) == 1) || !getDvarInt("bots_loadout_rememberClass")) {
		self.pers["bots"]["class"]["primary"] = "";
		self.pers["bots"]["class"]["primaryCamo"] = randomint(10);
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
		self.pers["bots"]["class"]["set"] = true;
		switch(getDvar("bots_loadout")) {
			case "random":
				switch(randomint(4))
				{
					case 0:
						self.pers["bots"]["class"]["deathPerk"] = "specialty_grenadepulldeath";
					break;
					case 1:
						self.pers["bots"]["class"]["deathPerk"] = "specialty_finalstand";
					break;
					case 2:
						self.pers["bots"]["class"]["deathPerk"] = "specialty_copycat";
					break;
					case 3:
						self.pers["bots"]["class"]["deathPerk"] = "specialty_combathigh";
					break;
				}
				switch(randomint(6))
				{
					case 0:
						self.pers["bots"]["class"]["grenade"] = "frag_grenade_mp";
					break;
					case 1:
						self.pers["bots"]["class"]["grenade"] = "semtex_mp";
					break;
					case 2:
						self.pers["bots"]["class"]["grenade"] = "claymore_mp";
					break;
					case 3:
						self.pers["bots"]["class"]["grenade"] = "throwingknife_mp";
					break;
					case 4:
						self.pers["bots"]["class"]["grenade"] = "flare_mp";
					break;
					case 5:
						self.pers["bots"]["class"]["grenade"] = "blastshield_mp";
					break;
				}
				switch(randomint(3))
				{
					case 0:
						self.pers["bots"]["class"]["offhand"] = "flash_grenade_mp";
					break;
					case 1:
						self.pers["bots"]["class"]["offhand"] = "concussion_grenade_mp";
					break;
					case 2:
						self.pers["bots"]["class"]["offhand"] = "smoke_grenade_mp";
					break;
				}
				switch(randomint(10))
				{
					case 0:
						self.pers["bots"]["class"]["perk1"] = "specialty_marathon";
					break;
					case 1:
						self.pers["bots"]["class"]["perk1"] = "specialty_fastreload";
					break;
					case 2:
						self.pers["bots"]["class"]["perk1"] = "specialty_scavenger";
						self.pers["bots"]["class"]["perk1pro"] = "specialty_extraammo";
					break;
					case 3:
						self.pers["bots"]["class"]["perk1"] = "specialty_onemanarmy";
						self.pers["bots"]["class"]["perk1pro"] = "specialty_omaquickchange";
					break;
					case 4:
						self.pers["bots"]["class"]["perk1"] = "specialty_onemanarmy";
					break;
					case 5:
						self.pers["bots"]["class"]["perk1"] = "specialty_bling";
						self.pers["bots"]["class"]["perk1pro"] = "specialty_secondarybling";
					break;
					case 6:
						self.pers["bots"]["class"]["perk1"] = "specialty_bling";
					break;
					case 7:
						self.pers["bots"]["class"]["perk1"] = "specialty_scavenger";
					break;
					case 8:
						self.pers["bots"]["class"]["perk1"] = "specialty_fastreload";
						self.pers["bots"]["class"]["perk1pro"] = "specialty_quickdraw";
					break;
					case 9:
						self.pers["bots"]["class"]["perk1"] = "specialty_marathon";
						self.pers["bots"]["class"]["perk1pro"] = "specialty_fastmantle";
					break;
				}
				switch(randomint(10))
				{
					case 0:
						self.pers["bots"]["class"]["perk2"] = "specialty_bulletdamage";
						break;
					case 1:
						self.pers["bots"]["class"]["perk2"] = "specialty_bulletdamage";
						self.pers["bots"]["class"]["perk2pro"] = "specialty_armorpiercing";
						break;
					case 2:
						self.pers["bots"]["class"]["perk2"] = "specialty_lightweight";
					break;
					case 3:
						self.pers["bots"]["class"]["perk2"] = "specialty_lightweight";
						self.pers["bots"]["class"]["perk2pro"] = "specialty_fastsprintrecovery";
					break;
					case 4:
						self.pers["bots"]["class"]["perk2"] = "specialty_hardline";
					break;
					case 5:
						self.pers["bots"]["class"]["perk2"] = "specialty_hardline";
						self.pers["bots"]["class"]["perk2pro"] = "specialty_rollover";
					break;
					case 6:
						self.pers["bots"]["class"]["perk2"] = "specialty_coldblooded";
					break;
					case 7:
						self.pers["bots"]["class"]["perk2"] = "specialty_coldblooded";
						self.pers["bots"]["class"]["perk2pro"] = "specialty_spygame";
					break;
					case 8:
						self.pers["bots"]["class"]["perk2"] = "specialty_explosivedamage";
					break;
					case 9:
						self.pers["bots"]["class"]["perk2"] = "specialty_explosivedamage";
						self.pers["bots"]["class"]["perk2pro"] = "specialty_dangerclose";
					break;
				}
				switch(randomint(12))
				{
					case 0:
						self.pers["bots"]["class"]["perk3"] = "specialty_pistoldeath";
						self.pers["bots"]["class"]["perk3pro"] = "specialty_laststandoffhand";
					break;
					case 1:
						self.pers["bots"]["class"]["perk3"] = "specialty_detectexplosive";
						self.pers["bots"]["class"]["perk3pro"] = "specialty_selectivehearing";
					break;
					case 2:
						self.pers["bots"]["class"]["perk3"] = "specialty_heartbreaker";
						self.pers["bots"]["class"]["perk3pro"] = "specialty_quieter";
					break;
					case 3:
						self.pers["bots"]["class"]["perk3"] = "specialty_localjammer";
						self.pers["bots"]["class"]["perk3pro"] = "specialty_delaymine";
					break;
					case 4:
						self.pers["bots"]["class"]["perk3"] = "specialty_specialty_extendedmelee";
						self.pers["bots"]["class"]["perk3pro"] = "specialty_falldamage";
					break;
					case 5:
						self.pers["bots"]["class"]["perk3"] = "specialty_extendedmelee";
						self.pers["bots"]["class"]["perk3pro"] = "specialty_falldamage";
					break;
					case 6:
						self.pers["bots"]["class"]["perk3"] = "specialty_pistoldeath";
					break;
					case 7:
						self.pers["bots"]["class"]["perk3"] = "specialty_detectexplosive";
					break;
					case 8:
						self.pers["bots"]["class"]["perk3"] = "specialty_heartbreaker";
					break;
					case 9:
						self.pers["bots"]["class"]["perk3"] = "specialty_localjammer";
					break;
					case 10:
						self.pers["bots"]["class"]["perk3"] = "specialty_specialty_extendedmelee";
					break;
					case 11:
						self.pers["bots"]["class"]["perk3"] = "specialty_extendedmelee";
					break;
				}
				switch(randomint(25))
				{
					case 24:
						self.pers["bots"]["class"]["primary"] = "riotshield_mp";
					break;
					case 0:
						Weapon_MP5K();
					break;
					case 1:
						Weapon_UZI();
					break;
					case 2:
						Weapon_P90();
					break;
					case 3:
						Weapon_Kriss();
					break;
					case 4:
						Weapon_UMP45();
					break;
					case 5:
						Weapon_AK47();
					break;
					case 6:
						Weapon_M16();
					break;
					case 7:
						Weapon_M4();
					break;
					case 8:
						Weapon_FN2000();
					break;
					case 9:
						Weapon_Masada();
					break;
					case 10:
						Weapon_Famas();
					break;
					case 11:
						Weapon_Fal();
					break;
					case 12:
						Weapon_Scar();
					break;
					case 13:
						Weapon_Tavor();
					break;
					case 14:
						Weapon_Barrett();
					break;
					case 15:
						Weapon_WA2000();
					break;
					case 16:
						Weapon_M21();
					break;
					case 17:
						Weapon_Cheytac();
					break;
					case 18:
						Weapon_RPD();
					break;
					case 19:
						Weapon_Sa80();
					break;
					case 20:
						Weapon_MG4();
					break;
					case 21:
						Weapon_M240();
					break;
					case 22:
						Weapon_AUG();
					break;
					case 23:
						Weapon_AK47();
					break;
				}
				switch(randomint(18))
				{
					case 0:
						Weapon_Ranger();
					break;
					case 1:
						Weapon_Model1887();
					break;
					case 2:
						Weapon_Striker();
					break;
					case 3:
						Weapon_AA12();
					break;
					case 4:
						Weapon_M1014();
					break;
					case 5:
						Weapon_Spas12();
					break;
					case 6:
						Weapon_TMP();
					break;
					case 7:
						Weapon_PP2000();
					break;
					case 8:
						Weapon_Beretta();
					break;
					case 9:
						Weapon_USP();
					break;
					case 10:
						Weapon_Desert_Eagle();
					break;
					case 11:
						Weapon_Colt_Anaconda();
					break;
					case 12:
						Weapon_Glock();
					break;
					case 13:
						Weapon_Beretta393();
					break;
					case 14:
						self.pers["bots"]["class"]["secondary"] = "m79_mp";
					break;
					case 15:
						self.pers["bots"]["class"]["secondary"] = "rpg_mp";
					break;
					case 16:
						self.pers["bots"]["class"]["secondary"] = "at4_mp";
					break;
					case 17:
						self.pers["bots"]["class"]["secondary"] = "stinger_mp";
					break;
				}
			break;
			case "snipe":
				self.pers["bots"]["class"]["perk1"] = "specialty_fastreload";
				self.pers["bots"]["class"]["perk1pro"] = "specialty_quickdraw";
				self.pers["bots"]["class"]["perk3"] = "specialty_extendedmelee";
				self.pers["bots"]["class"]["perk3pro"] = "specialty_steelnerves";
				self.pers["bots"]["class"]["perk2"] = "specialty_bulletdamage";
				self.pers["bots"]["class"]["perk2pro"] = "specialty_armorpiercing";
				self.pers["bots"]["class"]["grenade"] = "throwingknife_mp";
				self.pers["bots"]["class"]["deathPerk"] = "specialty_copycat";
				self.pers["bots"]["class"]["offhand"] = "smoke_grenade_mp";
				self.pers["bots"]["class"]["primary"] = "cheytac_fmj_mp";
			break;
			case "knife":
				self.pers["bots"]["class"]["primary"] = "usp_tactical_mp";
				self.pers["bots"]["class"]["secondary"] = "usp_tactical_mp";
				self.pers["bots"]["class"]["offhand"] = "concussion_grenade_mp";
				self.pers["bots"]["class"]["grenade"] = "throwingknife_mp";
				self.pers["bots"]["class"]["perk3"] = "specialty_extendedmelee";
				self.pers["bots"]["class"]["perk3pro"] = "specialty_falldamage";
				self.pers["bots"]["class"]["perk1"] = "specialty_marathon";
				self.pers["bots"]["class"]["perk1pro"] = "specialty_fastmantle";
				self.pers["bots"]["class"]["perk2"] = "specialty_lightweight";
				self.pers["bots"]["class"]["perk2pro"] = "specialty_fastsprintrecovery";
				self.pers["bots"]["class"]["deathPerk"] = "specialty_combathigh";
				
				self.pers["bots"]["trait"]["playStyle"] = 1;
				self.pers["bots"]["trait"]["knife"] = 2;
				self.pers["bots"]["trait"]["cfTime"] = 0;
			break;
			case "tube":
				self.pers["bots"]["class"]["perk2"] = "specialty_explosivedamage";
				self.pers["bots"]["class"]["perk2pro"] = "specialty_dangerclose";
				if(randomint(2)){
					self.pers["bots"]["class"]["perk1"] = "specialty_scavenger";
					self.pers["bots"]["class"]["perk1pro"] = "specialty_extraammo";
				} else {
					self.pers["bots"]["class"]["perk1"] = "specialty_onemanarmy";
					self.pers["bots"]["class"]["perk1pro"] = "specialty_omaquickchange";
				}
				if(randomint(2)){
					self.pers["bots"]["class"]["perk3"] = "specialty_pistoldeath";
					self.pers["bots"]["class"]["perk3pro"] = "specialty_laststandoffhand";
				}
				self.pers["bots"]["class"]["offhand"] = "smoke_grenade_mp";
				self.pers["bots"]["class"]["deathPerk"] = "specialty_grenadepulldeath";
				self.pers["bots"]["class"]["grenade"] = "semtex_mp";
				self.pers["bots"]["class"]["primary"] = "scar_gl_mp";
				if(randomint(2)){
					self.pers["bots"]["class"]["secondary"] = "rpg_mp";
				} else {
					self.pers["bots"]["class"]["secondary"] = "m79_mp";
				}
				
				self.pers["bots"]["trait"]["nade"] = 10;
			break;
			case "fmj":
				self.pers["bots"]["class"]["primary"] = "aug_fmj_mp";
				self.pers["bots"]["class"]["perk1"] = "specialty_onemanarmy";
				self.pers["bots"]["class"]["perk1pro"] = "specialty_omaquickchange";
				self.pers["bots"]["class"]["perk3"] = "specialty_pistoldeath";
				self.pers["bots"]["class"]["perk3pro"] = "specialty_laststandoffhand";
				self.pers["bots"]["class"]["perk2"] = "specialty_bulletdamage";
				self.pers["bots"]["class"]["perk2pro"] = "specialty_armorpiercing";
				self.pers["bots"]["trait"]["nade"] = 0;
				self.pers["bots"]["trait"]["switch"] = 0;
				self.pers["bots"]["trait"]["cfTime"] = 0;
				self.bots_traitRandom = 2;
				self.pers["bots"]["trait"]["killsOverObj"] = 1;
			break;
			case "default":
				switch(randomint(3)) {
					case 0:
						weapon1 = "none";
						weapon1att = "none";
						weapon1att2 = "none";
						switch(randomint(4))
						{
							case 0:
								self.pers["bots"]["class"]["perk1"] = "specialty_scavenger";
								self.pers["bots"]["class"]["perk1pro"] = "specialty_extraammo";
							break;
							case 1:
								self.pers["bots"]["class"]["perk1"] = "specialty_fastreload";
								self.pers["bots"]["class"]["perk1pro"] = "specialty_quickdraw";
							break;
							case 2:
								self.pers["bots"]["class"]["perk1"] = "specialty_onemanarmy";
								self.pers["bots"]["class"]["perk1pro"] = "specialty_omaquickchange";
							break;
							case 3:
								self.pers["bots"]["class"]["perk1"] = "specialty_bling";
								self.pers["bots"]["class"]["perk1pro"] = "specialty_secondarybling";
							break;
						}
						switch(randomint(9))
						{
							case 0:
								weapon1 = "m4";
							break;
							case 1:
								weapon1 = "scar";
							break;
							case 2:
								weapon1 = "tavor";
							break;
							case 3:
								weapon1 = "masada";
							break;
							case 4:
								weapon1 = "ak47";
							break;
							case 5:
								weapon1 = "riotshield";
							break;
							case 6:
								weapon1 = "rpd";
							break;
							case 7:
								weapon1 = "aug";
							break;
							case 8:
								weapon1 = "sa80";
							break;
						}
						switch(randomint(3))
						{
							case 0:
								self.pers["bots"]["class"]["perk3"] = "specialty_extendedmelee";
								self.pers["bots"]["class"]["perk3pro"] = "specialty_falldamage";
							break;
							case 1:
								self.pers["bots"]["class"]["perk3"] = "specialty_extendedmelee";
								self.pers["bots"]["class"]["perk3pro"] = "specialty_falldamage";
							break;
							case 2:
								self.pers["bots"]["class"]["perk3"] = "specialty_heartbreaker";
								self.pers["bots"]["class"]["perk3pro"] = "specialty_quieter";
							break;
						}
						if(self.pers["bots"]["class"]["perk1"] == "specialty_onemanarmy" || (randomint(2) && self.pers["bots"]["class"]["perk1"] == "specialty_scavenger"))
						{
							if(randomint(2))
							{
								self.pers["bots"]["class"]["perk2"] = "specialty_explosivedamage";
								self.pers["bots"]["class"]["perk2pro"] = "specialty_dangerclose";
							}
							else
							{
								self.pers["bots"]["class"]["perk2"] = "specialty_bulletdamage";
								self.pers["bots"]["class"]["perk2pro"] = "specialty_armorpiercing";
							}
							weapon1att = "gl";
							if(!randomint(4))
							{
								self.pers["bots"]["class"]["perk3"] = "specialty_pistoldeath";
								self.pers["bots"]["class"]["perk3pro"] = "specialty_laststandoffhand";
							}
						}
						else
						{
							if(self.pers["bots"]["class"]["perk1"] == "specialty_fastreload" || self.pers["bots"]["class"]["perk1"] == "specialty_scavenger")
							{
								switch(randomint(7))
								{
									case 0:
										weapon1att = "silencer";
									break;
									case 1:
										weapon1att = "reflex";
									break;
									case 2:
										weapon1att = "eotech";
									break;
									case 3:
										weapon1att = "heartbeat";
									break;
									case 4:
										weapon1att = "fmj";
									break;
									case 5:
										weapon1att = "xmags";
									break;
									case 6:
										weapon1att = "gl";
									break;
								}
								if(weapon1att == "silencer" && randomint(2))
								{
									self.pers["bots"]["class"]["perk2"] = "specialty_coldblooded";
									self.pers["bots"]["class"]["perk2pro"] = "specialty_spygame";
								}
								else
								{
									self.pers["bots"]["class"]["perk2"] = "specialty_bulletdamage";
									self.pers["bots"]["class"]["perk2pro"] = "specialty_armorpiercing";
								}
							}
							else
							{
								if(self.pers["bots"]["class"]["perk1"] == "specialty_bling")
								{
									switch(randomint(14))
									{
										case 0:
											weapon1att = "heartbeat";
											weapon1att2 = "reflex";
										break;
										case 1:
											weapon1att = "fmj";
											weapon1att2 = "xmags";
										break;
										case 2:
											weapon1att = "fmj";
											weapon1att2 = "silencer";
										break;
										case 3:
											weapon1att = "fmj";
											weapon1att2 = "reflex";
										break;
										case 4:
											weapon1att = "fmj";
											weapon1att2 = "heartbeat";
										break;
										case 5:
											weapon1att = "eotech";
											weapon1att2 = "xmags";
										break;
										case 6:
											weapon1att = "eotech";
											weapon1att2 = "silencer";
										break;
										case 7:
											weapon1att = "eotech";
											weapon1att2 = "heartbeat";
										break;
										case 8:
											weapon1att = "eotech";
											weapon1att2 = "fmj";
										break;
										case 9:
											weapon1att = "heartbeat";
											weapon1att2 = "silencer";
										break;
										case 10:
											weapon1att = "heartbeat";
											weapon1att2 = "xmags";
										break;
										case 11:
											weapon1att = "reflex";
											weapon1att2 = "silencer";
										break;
										case 12:
											weapon1att = "reflex";
											weapon1att2 = "xmags";
										break;
										case 13:
											weapon1att = "silencer";
											weapon1att2 = "xmags";
										break;
									}
									if((weapon1att == "silencer" || weapon1att2 == "silencer") && randomint(2))
									{
										self.pers["bots"]["class"]["perk2"] = "specialty_coldblooded";
										self.pers["bots"]["class"]["perk2pro"] = "specialty_spygame";
									}
									else
									{
										self.pers["bots"]["class"]["perk2"] = "specialty_bulletdamage";
										self.pers["bots"]["class"]["perk2pro"] = "specialty_armorpiercing";
									}
								}
							}
						}
						if(weapon1 == "riotshield")
						{
							if(randomint(2))
							{
								self.pers["bots"]["class"]["perk1"] = "specialty_scavenger";
								self.pers["bots"]["class"]["perk1pro"] = "specialty_extraammo";
							}
							else
							{
								self.pers["bots"]["class"]["perk1"] = "specialty_fastreload";
								self.pers["bots"]["class"]["perk1pro"] = "specialty_quickdraw";
							}
							if(randomint(2))
							{
								self.pers["bots"]["class"]["perk3"] = "specialty_extendedmelee";
								self.pers["bots"]["class"]["perk3pro"] = "specialty_falldamage";
							}
							else
							{
								if(randomint(3))
								{
									self.pers["bots"]["class"]["perk3"] = "specialty_heartbreaker";
									self.pers["bots"]["class"]["perk3pro"] = "specialty_quieter";
								}
								else
								{
									self.pers["bots"]["class"]["perk3"] = "specialty_pistoldeath";
									self.pers["bots"]["class"]["perk3pro"] = "specialty_laststandoffhand";
								}
							}
							weapon1att = "none";
							weapon1att2 = "none";
						}
						if(weapon1 == "rpd" || weapon1 == "aug" || weapon1 == "sa80")
						{
							self.pers["bots"]["class"]["perk2"] = "specialty_bulletdamage";
							self.pers["bots"]["class"]["perk2pro"] = "specialty_armorpiercing";
							if(self.pers["bots"]["class"]["perk1"] == "specialty_bling")
							{
								switch(randomint(14))
								{
									case 0:
										weapon1att = "eotech";
										weapon1att2 = "grip";
									break;
									case 1:
										weapon1att = "eotech";
										weapon1att2 = "fmj";
									break;
									case 2:
										weapon1att = "eotech";
										weapon1att2 = "xmags";
									break;
									case 3:
										weapon1att = "eotech";
										weapon1att2 = "heartbeat";
									break;
									case 4:
										weapon1att = "fmj";
										weapon1att2 = "grip";
									break;
									case 5:
										weapon1att = "fmj";
										weapon1att2 = "heartbeat";
									break;
									case 6:
										weapon1att = "fmj";
										weapon1att2 = "reflex";
									break;
									case 7:
										weapon1att = "fmj";
										weapon1att2 = "xmags";
									break;
									case 8:
										weapon1att = "grip";
										weapon1att2 = "heartbeat";
									break;
									case 9:
										weapon1att = "grip";
										weapon1att2 = "reflex";
									break;
									case 10:
										weapon1att = "grip";
										weapon1att2 = "xmags";
									break;
									case 11:
										weapon1att = "heartbeat";
										weapon1att2 = "reflex";
									break;
									case 12:
										weapon1att = "heartbeat";
										weapon1att2 = "xmags";
									break;
									case 13:
										weapon1att = "reflex";
										weapon1att2 = "xmags";
									break;
								}
							}
							else
							{
								switch(randomint(6))
								{
									case 0:
										weapon1att = "grip";
									break;
									case 1:
										weapon1att = "xmags";
									break;
									case 2:
										weapon1att = "fmj";
									break;
									case 3:
										weapon1att = "reflex";
									break;
									case 4:
										weapon1att = "eotech";
									break;
									case 5:
										weapon1att = "heartbeat";
									break;
								}
							}
						}
						self.pers["bots"]["class"]["primary"]=maps\mp\gametypes\_class::buildWeaponName(weapon1,weapon1att,weapon1att2);
						if(self.pers["bots"]["class"]["perk1pro"] == "specialty_secondarybling")
						{
							switch(randomint(3))
							{
								case 0:
									if(randomint(2))
										self.pers["bots"]["class"]["secondary"] = "glock_xmags_akimbo_mp";
									else
										self.pers["bots"]["class"]["secondary"] = "glock_silencer_akimbo_mp";
								break;
								case 1:
									switch(randomint(9))
									{
										case 0:
											self.pers["bots"]["class"]["secondary"] = "pp2000_silencer_xmags_mp";
										break;
										case 1:
											self.pers["bots"]["class"]["secondary"] = "pp2000_reflex_xmags_mp";
										break;
										case 2:
											self.pers["bots"]["class"]["secondary"] = "pp2000_reflex_silencer_mp";
										break;
										case 3:
											self.pers["bots"]["class"]["secondary"] = "pp2000_fmj_xmags_mp";
										break;
										case 4:
											self.pers["bots"]["class"]["secondary"] = "pp2000_fmj_silencer_mp";
										break;
										case 5:
											self.pers["bots"]["class"]["secondary"] = "pp2000_fmj_reflex_mp";
										break;
										case 6:
											self.pers["bots"]["class"]["secondary"] = "pp2000_eotech_xmags_mp";
										break;
										case 7:
											self.pers["bots"]["class"]["secondary"] = "pp2000_eotech_silencer_mp";
										break;
										case 8:
											self.pers["bots"]["class"]["secondary"] = "pp2000_eotech_fmj_mp";
										break;
									}
								break;
								case 2:
									switch(randomint(9))
									{
										case 0:
											self.pers["bots"]["class"]["secondary"] = "beretta393_eotech_fmj_mp";
										break;
										case 1:
											self.pers["bots"]["class"]["secondary"] = "beretta393_eotech_silencer_mp";
										break;
										case 2:
											self.pers["bots"]["class"]["secondary"] = "beretta393_eotech_xmags_mp";
										break;
										case 3:
											self.pers["bots"]["class"]["secondary"] = "beretta393_fmj_reflex_mp";
										break;
										case 4:
											self.pers["bots"]["class"]["secondary"] = "beretta393_fmj_silencer_mp";
										break;
										case 5:
											self.pers["bots"]["class"]["secondary"] = "beretta393_fmj_xmags_mp";
										break;
										case 6:
											self.pers["bots"]["class"]["secondary"] = "beretta393_reflex_silencer_mp";
										break;
										case 7:
											self.pers["bots"]["class"]["secondary"] = "beretta393_reflex_xmags_mp";
										break;
										case 8:
											self.pers["bots"]["class"]["secondary"] = "beretta393_silencer_xmags_mp";
										break;
									}
								break;
							}
						}
						else
						{
							switch(randomint(8))
							{
								case 0:
									self.pers["bots"]["class"]["secondary"] = "aa12_xmags_mp";
								break;
								case 1:
									self.pers["bots"]["class"]["secondary"] = "spas12_xmags_mp";
								break;
								case 2:
									self.pers["bots"]["class"]["secondary"] = "stinger_mp";
								break;
								case 3:
									self.pers["bots"]["class"]["secondary"] = "rpg_mp";
								break;
								case 4:
									self.pers["bots"]["class"]["secondary"] = "glock_akimbo_mp";
								break;
								case 5:
									switch(randomint(5))
									{
										case 0:
											self.pers["bots"]["class"]["secondary"] = "beretta393_xmags_mp";
										break;
										case 1:
											self.pers["bots"]["class"]["secondary"] = "beretta393_silencer_mp";
										break;
										case 2:
											self.pers["bots"]["class"]["secondary"] = "beretta393_fmj_mp";
										break;
										case 3:
											self.pers["bots"]["class"]["secondary"] = "beretta393_eotech_mp";
										break;
										case 4:
											self.pers["bots"]["class"]["secondary"] = "beretta393_reflex_mp";
										break;
									}
								break;
								case 6:
									switch(randomint(5))
									{
										case 0:
											self.pers["bots"]["class"]["secondary"] = "pp2000_xmags_mp";
										break;
										case 1:
											self.pers["bots"]["class"]["secondary"] = "pp2000_silencer_mp";
										break;
										case 2:
											self.pers["bots"]["class"]["secondary"] = "pp2000_reflex_mp";
										break;
										case 3:
											self.pers["bots"]["class"]["secondary"] = "pp2000_fmj_mp";
										break;
										case 4:
											self.pers["bots"]["class"]["secondary"] = "pp2000_eotech_mp";
										break;
									}
								break;
								case 7:
									self.pers["bots"]["class"]["secondary"] = "m1014_xmags_mp";
								break;
							}
						}
						if(weapon1 == "riotshield")
						{
							if(isSubStr(self.pers["bots"]["class"]["secondary"], "stinger_"))
							{
								self.pers["bots"]["class"]["secondary"] = "rpg_mp";
							}
							if(isSubStr(self.pers["bots"]["class"]["secondary"], "rpg_")){
								self.pers["bots"]["class"]["perk2"] = "specialty_explosivedamage";
								self.pers["bots"]["class"]["perk2pro"] = "specialty_dangerclose";
							} else {
								if(!randomint(4))
								{
									self.pers["bots"]["class"]["perk2"] = "specialty_coldblooded";
									self.pers["bots"]["class"]["perk2pro"] = "specialty_spygame";
								}
								else
								{
									self.pers["bots"]["class"]["perk2"] = "specialty_bulletdamage";
									self.pers["bots"]["class"]["perk2pro"] = "specialty_armorpiercing";
								}
							}
						}
						switch(randomint(3))
						{
							case 0:
								self.pers["bots"]["class"]["deathPerk"] = "specialty_grenadepulldeath";
							break;
							case 1:
								self.pers["bots"]["class"]["deathPerk"] = "specialty_finalstand";
							break;
							case 2:
								self.pers["bots"]["class"]["deathPerk"] = "specialty_combathigh";
							break;
						}
						if(randomint(2))
							self.pers["bots"]["class"]["grenade"] = "claymore_mp";
						else
							self.pers["bots"]["class"]["grenade"] = "semtex_mp";
							
						if(randomint(2))
							self.pers["bots"]["class"]["offhand"] = "flash_grenade_mp";
						else
							self.pers["bots"]["class"]["offhand"] = "concussion_grenade_mp";
					break;
					case 1:
						weapon1 = "none";
						weapon1att = "none";
						weapon1att2 = "none";
						switch(randomint(5))
						{
							case 0:
								weapon1 = "famas";
							break;
							case 1:
								weapon1 = "m16";
							break;
							case 2:
								weapon1 = "cheytac";
							break;
							case 3:
								weapon1 = "barrett";
							break;
							case 4:
								weapon1 = "fal";
							break;
						}
						switch(randomint(4))
						{
							case 0:
								self.pers["bots"]["class"]["perk1"] = "specialty_fastreload";
								self.pers["bots"]["class"]["perk1pro"] = "specialty_quickdraw";
							break;
							case 1:
								self.pers["bots"]["class"]["perk1"] = "specialty_scavenger";
								self.pers["bots"]["class"]["perk1pro"] = "specialty_extraammo";
							break;
							case 2:
								self.pers["bots"]["class"]["perk1"] = "specialty_onemanarmy";
								self.pers["bots"]["class"]["perk1pro"] = "specialty_omaquickchange";
							break;
							case 3:
								if(weapon1 == "cheytac" || weapon1 == "barrett")
								{
									self.pers["bots"]["class"]["perk1"] = "specialty_fastreload";
									self.pers["bots"]["class"]["perk1pro"] = "specialty_quickdraw";
								}
								else
								{
									self.pers["bots"]["class"]["perk1"] = "specialty_bling";
									self.pers["bots"]["class"]["perk1pro"] = "specialty_secondarybling";
								}
							break;
						}
						self.pers["bots"]["class"]["perk2"] = "specialty_bulletdamage";
						self.pers["bots"]["class"]["perk2pro"] = "specialty_armorpiercing";
						switch(randomint(3))
						{
							case 0:
								self.pers["bots"]["class"]["perk3"] = "specialty_extendedmelee";
								self.pers["bots"]["class"]["perk3pro"] = "specialty_falldamage";
							break;
							case 1:
								self.pers["bots"]["class"]["perk3"] = "specialty_extendedmelee";
								self.pers["bots"]["class"]["perk3pro"] = "specialty_falldamage";
							break;
							case 2:
								self.pers["bots"]["class"]["perk3"] = "specialty_heartbreaker";
								self.pers["bots"]["class"]["perk3pro"] = "specialty_quieter";
							break;
						}
						if(self.pers["bots"]["class"]["perk1pro"] == "specialty_secondarybling")
						{
							switch(randomint(3))
							{
								case 0:
									if(randomint(2))
										self.pers["bots"]["class"]["secondary"] = "glock_xmags_akimbo_mp";
									else
										self.pers["bots"]["class"]["secondary"] = "glock_silencer_akimbo_mp";
								break;
								case 1:
									switch(randomint(9))
									{
										case 0:
											self.pers["bots"]["class"]["secondary"] = "pp2000_silencer_xmags_mp";
										break;
										case 1:
											self.pers["bots"]["class"]["secondary"] = "pp2000_reflex_xmags_mp";
										break;
										case 2:
											self.pers["bots"]["class"]["secondary"] = "pp2000_reflex_silencer_mp";
										break;
										case 3:
											self.pers["bots"]["class"]["secondary"] = "pp2000_fmj_xmags_mp";
										break;
										case 4:
											self.pers["bots"]["class"]["secondary"] = "pp2000_fmj_silencer_mp";
										break;
										case 5:
											self.pers["bots"]["class"]["secondary"] = "pp2000_fmj_reflex_mp";
										break;
										case 6:
											self.pers["bots"]["class"]["secondary"] = "pp2000_eotech_xmags_mp";
										break;
										case 7:
											self.pers["bots"]["class"]["secondary"] = "pp2000_eotech_silencer_mp";
										break;
										case 8:
											self.pers["bots"]["class"]["secondary"] = "pp2000_eotech_fmj_mp";
										break;
									}
								break;
								case 2:
									switch(randomint(9))
									{
										case 0:
											self.pers["bots"]["class"]["secondary"] = "beretta393_eotech_fmj_mp";
										break;
										case 1:
											self.pers["bots"]["class"]["secondary"] = "beretta393_eotech_silencer_mp";
										break;
										case 2:
											self.pers["bots"]["class"]["secondary"] = "beretta393_eotech_xmags_mp";
										break;
										case 3:
											self.pers["bots"]["class"]["secondary"] = "beretta393_fmj_reflex_mp";
										break;
										case 4:
											self.pers["bots"]["class"]["secondary"] = "beretta393_fmj_silencer_mp";
										break;
										case 5:
											self.pers["bots"]["class"]["secondary"] = "beretta393_fmj_xmags_mp";
										break;
										case 6:
											self.pers["bots"]["class"]["secondary"] = "beretta393_reflex_silencer_mp";
										break;
										case 7:
											self.pers["bots"]["class"]["secondary"] = "beretta393_reflex_xmags_mp";
										break;
										case 8:
											self.pers["bots"]["class"]["secondary"] = "beretta393_silencer_xmags_mp";
										break;
									}
								break;
							}
						}
						else
						{
							switch(randomint(8))
							{
								case 0:
									self.pers["bots"]["class"]["secondary"] = "aa12_xmags_mp";
								break;
								case 1:
									self.pers["bots"]["class"]["secondary"] = "spas12_xmags_mp";
								break;
								case 2:
									self.pers["bots"]["class"]["secondary"] = "stinger_mp";
								break;
								case 3:
									self.pers["bots"]["class"]["secondary"] = "rpg_mp";
								break;
								case 4:
									self.pers["bots"]["class"]["secondary"] = "glock_akimbo_mp";
								break;
								case 5:
									switch(randomint(5))
									{
										case 0:
											self.pers["bots"]["class"]["secondary"] = "beretta393_xmags_mp";
										break;
										case 1:
											self.pers["bots"]["class"]["secondary"] = "beretta393_silencer_mp";
										break;
										case 2:
											self.pers["bots"]["class"]["secondary"] = "beretta393_fmj_mp";
										break;
										case 3:
											self.pers["bots"]["class"]["secondary"] = "beretta393_eotech_mp";
										break;
										case 4:
											self.pers["bots"]["class"]["secondary"] = "beretta393_reflex_mp";
										break;
									}
								break;
								case 6:
									switch(randomint(5))
									{
										case 0:
											self.pers["bots"]["class"]["secondary"] = "pp2000_xmags_mp";
										break;
										case 1:
											self.pers["bots"]["class"]["secondary"] = "pp2000_silencer_mp";
										break;
										case 2:
											self.pers["bots"]["class"]["secondary"] = "pp2000_reflex_mp";
										break;
										case 3:
											self.pers["bots"]["class"]["secondary"] = "pp2000_fmj_mp";
										break;
										case 4:
											self.pers["bots"]["class"]["secondary"] = "pp2000_eotech_mp";
										break;
									}
								break;
								case 7:
									self.pers["bots"]["class"]["secondary"] = "m1014_xmags_mp";
								break;
							}
						}
						if(randomint(2))
							self.pers["bots"]["class"]["grenade"] = "claymore_mp";
						else
							self.pers["bots"]["class"]["grenade"] = "semtex_mp";
						
						if(randomint(2))
							self.pers["bots"]["class"]["offhand"] = "flash_grenade_mp";
						else
							self.pers["bots"]["class"]["offhand"] = "concussion_grenade_mp";
							
						if(weapon1 == "m16" || weapon1 == "fal")
						{
							if(self.pers["bots"]["class"]["perk1"] != "specialty_bling")
								weapon1att = "eotech";
							else
							{
								weapon1att = "eotech";
								switch(randomint(4))
								{
									case 1:
										weapon1att2 = "heartbeat";
									break;
									case 0:
										weapon1att2 = "silencer";
									break;
									case 2:
										weapon1att2 = "xmags";
									break;
									case 3:
										weapon1att2 = "fmj";
									break;
								}
							}
							if(weapon1 == "fal" && randomint(2))
							{
								self.pers["bots"]["class"]["perk2"] = "specialty_hardline";
								self.pers["bots"]["class"]["perk2pro"] = "specialty_rollover";
							}
						}
						else
						{
							if(weapon1 == "famas")
							{
								if(self.pers["bots"]["class"]["perk1"] != "specialty_bling")
								{
									switch(randomint(6))
									{
										case 0:
											weapon1att = "reflex";
										break;
										case 1:
											weapon1att = "eotech";
										break;
										case 2:
											weapon1att = "silencer";
										break;
										case 3:
											weapon1att = "fmj";
										break;
										case 4:
											weapon1att = "xmags";
										break;
										case 5:
											weapon1att = "heartbeat";
										break;
									}
								}
								else
								{
									switch(randomint(14))
									{
										case 0:
											weapon1att = "heartbeat";
											weapon1att2 = "reflex";
										break;
										case 1:
											weapon1att = "fmj";
											weapon1att2 = "xmags";
										break;
										case 2:
											weapon1att = "fmj";
											weapon1att2 = "silencer";
										break;
										case 3:
											weapon1att = "fmj";
											weapon1att2 = "reflex";
										break;
										case 4:
											weapon1att = "fmj";
											weapon1att2 = "heartbeat";
										break;
										case 5:
											weapon1att = "eotech";
											weapon1att2 = "xmags";
										break;
										case 6:
											weapon1att = "eotech";
											weapon1att2 = "silencer";
										break;
										case 7:
											weapon1att = "eotech";
											weapon1att2 = "heartbeat";
										break;
										case 8:
											weapon1att = "eotech";
											weapon1att2 = "fmj";
										break;
										case 9:
											weapon1att = "heartbeat";
											weapon1att2 = "silencer";
										break;
										case 10:
											weapon1att = "heartbeat";
											weapon1att2 = "xmags";
										break;
										case 11:
											weapon1att = "reflex";
											weapon1att2 = "silencer";
										break;
										case 12:
											weapon1att = "reflex";
											weapon1att2 = "xmags";
										break;
										case 13:
											weapon1att = "silencer";
											weapon1att2 = "xmags";
										break;
									}
								}
							}
							else
							{
								if(randomint(2))
									weapon1att = "fmj";
								else
									weapon1att = "xmags";
									
								if(!randomint(3))
								{
									if(randomint(2))
										self.pers["bots"]["class"]["grenade"] = "flare_mp";
									else
										self.pers["bots"]["class"]["grenade"] = "throwingknife_mp";
								}
								if(randomint(3))
								{
									switch(randomint(5))
									{
										case 0:
											switch(randomint(5))
											{
												case 0:
													self.pers["bots"]["class"]["secondary"] = "beretta393_xmags_mp";
												break;
												case 1:
													self.pers["bots"]["class"]["secondary"] = "beretta393_silencer_mp";
												break;
												case 2:
													self.pers["bots"]["class"]["secondary"] = "beretta393_fmj_mp";
												break;
												case 3:
													self.pers["bots"]["class"]["secondary"] = "beretta393_eotech_mp";
												break;
												case 4:
													self.pers["bots"]["class"]["secondary"] = "beretta393_reflex_mp";
												break;
											}
										break;
										case 1:
											switch(randomint(5))
											{
												case 0:
													self.pers["bots"]["class"]["secondary"] = "usp_akimbo_mp";
												break;
												case 1:
													self.pers["bots"]["class"]["secondary"] = "usp_xmags_mp";
												break;
												case 2:
													self.pers["bots"]["class"]["secondary"] = "usp_tactical_mp";
												break;
												case 3:
													self.pers["bots"]["class"]["secondary"] = "usp_fmj_mp";
												break;
												case 4:
													self.pers["bots"]["class"]["secondary"] = "usp_silencer_mp";
												break;
											}
										break;
										case 2:
											switch(randomint(5))
											{
												case 0:
													self.pers["bots"]["class"]["secondary"] = "beretta_akimbo_mp";
												break;
												case 1:
													self.pers["bots"]["class"]["secondary"] = "beretta_xmags_mp";
												break;
												case 2:
													self.pers["bots"]["class"]["secondary"] = "beretta_tactical_mp";
												break;
												case 3:
													self.pers["bots"]["class"]["secondary"] = "beretta_fmj_mp";
												break;
												case 4:
													self.pers["bots"]["class"]["secondary"] = "beretta_silencer_mp";
												break;
											}
										break;
										case 3:
											switch(randomint(3))
											{
												case 0:
													self.pers["bots"]["class"]["secondary"] = "coltanaconda_fmj_mp";
												break;
												case 1:
													self.pers["bots"]["class"]["secondary"] = "coltanaconda_tactical_mp";
												break;
												case 2:
													self.pers["bots"]["class"]["secondary"] = "coltanaconda_akimbo_mp";
												break;
											}
										break;
										case 4:
											switch(randomint(4))
											{
												case 0:
													self.pers["bots"]["class"]["secondary"] = "deserteaglegold_mp";
												break;
												case 1:
													self.pers["bots"]["class"]["secondary"] = "deserteagle_akimbo_mp";
												break;
												case 2:
													self.pers["bots"]["class"]["secondary"] = "deserteagle_tactical_mp";
												break;
												case 3:
													self.pers["bots"]["class"]["secondary"] = "deserteagle_fmj_mp";
												break;
											}
										break;
									}
								}
							}
						}
						self.pers["bots"]["class"]["primary"]=maps\mp\gametypes\_class::buildWeaponName(weapon1,weapon1att,weapon1att2);
						switch(randomint(3))
						{
							case 0:
								self.pers["bots"]["class"]["deathPerk"] = "specialty_grenadepulldeath";
							break;
							case 1:
								self.pers["bots"]["class"]["deathPerk"] = "specialty_finalstand";
							break;
							case 2:
								self.pers["bots"]["class"]["deathPerk"] = "specialty_combathigh";
							break;
						}
					break;
					case 2:
						weapon1 = "none";
						weapon1att = "none";
						weapon1att2 = "none";
						if(randomint(2))
							self.pers["bots"]["class"]["grenade"] = "claymore_mp";
						else
							self.pers["bots"]["class"]["grenade"] = "semtex_mp";
							
						switch(randomint(3))
						{
							case 0:
								self.pers["bots"]["class"]["deathPerk"] = "specialty_grenadepulldeath";
							break;
							case 1:
								self.pers["bots"]["class"]["deathPerk"] = "specialty_finalstand";
							break;
							case 2:
								self.pers["bots"]["class"]["deathPerk"] = "specialty_combathigh";
							break;
						}
						if(randomint(2))
							self.pers["bots"]["class"]["offhand"] = "flash_grenade_mp";
						else
							self.pers["bots"]["class"]["offhand"] = "concussion_grenade_mp";
							
						switch(randomint(5))
						{
							case 0:
								self.pers["bots"]["class"]["perk1"] = "specialty_marathon";
								self.pers["bots"]["class"]["perk1pro"] = "specialty_fastmantle";
							break;
							case 1:
								self.pers["bots"]["class"]["perk1"] = "specialty_bling";
								self.pers["bots"]["class"]["perk1pro"] = "specialty_secondarybling";
							break;
							case 2:
								self.pers["bots"]["class"]["perk1"] = "specialty_scavenger";
								self.pers["bots"]["class"]["perk1pro"] = "specialty_extraammo";
							break;
							case 3:
								self.pers["bots"]["class"]["perk1"] = "specialty_fastreload";
								self.pers["bots"]["class"]["perk1pro"] = "specialty_quickdraw";
							break;
							case 4:
								self.pers["bots"]["class"]["perk1"] = "specialty_onemanarmy";
								self.pers["bots"]["class"]["perk1pro"] = "specialty_omaquickchange";
							break;
						}
						if(randomint(2))
						{
							self.pers["bots"]["class"]["perk3"] = "specialty_extendedmelee";
							self.pers["bots"]["class"]["perk3pro"] = "specialty_falldamage";
						}
						else
						{
							self.pers["bots"]["class"]["perk3"] = "specialty_heartbreaker";
							self.pers["bots"]["class"]["perk3pro"] = "specialty_quieter";
						}
						if(self.pers["bots"]["class"]["perk1pro"] == "specialty_secondarybling")
						{
							switch(randomint(3))
							{
								case 0:
									if(randomint(2))
										self.pers["bots"]["class"]["secondary"] = "glock_xmags_akimbo_mp";
									else
										self.pers["bots"]["class"]["secondary"] = "glock_silencer_akimbo_mp";
								break;
								case 1:
									switch(randomint(9))
									{
										case 0:
											self.pers["bots"]["class"]["secondary"] = "pp2000_silencer_xmags_mp";
										break;
										case 1:
											self.pers["bots"]["class"]["secondary"] = "pp2000_reflex_xmags_mp";
										break;
										case 2:
											self.pers["bots"]["class"]["secondary"] = "pp2000_reflex_silencer_mp";
										break;
										case 3:
											self.pers["bots"]["class"]["secondary"] = "pp2000_fmj_xmags_mp";
										break;
										case 4:
											self.pers["bots"]["class"]["secondary"] = "pp2000_fmj_silencer_mp";
										break;
										case 5:
											self.pers["bots"]["class"]["secondary"] = "pp2000_fmj_reflex_mp";
										break;
										case 6:
											self.pers["bots"]["class"]["secondary"] = "pp2000_eotech_xmags_mp";
										break;
										case 7:
											self.pers["bots"]["class"]["secondary"] = "pp2000_eotech_silencer_mp";
										break;
										case 8:
											self.pers["bots"]["class"]["secondary"] = "pp2000_eotech_fmj_mp";
										break;
									}
								break;
								case 2:
									switch(randomint(9))
									{
										case 0:
											self.pers["bots"]["class"]["secondary"] = "beretta393_eotech_fmj_mp";
										break;
										case 1:
											self.pers["bots"]["class"]["secondary"] = "beretta393_eotech_silencer_mp";
										break;
										case 2:
											self.pers["bots"]["class"]["secondary"] = "beretta393_eotech_xmags_mp";
										break;
										case 3:
											self.pers["bots"]["class"]["secondary"] = "beretta393_fmj_reflex_mp";
										break;
										case 4:
											self.pers["bots"]["class"]["secondary"] = "beretta393_fmj_silencer_mp";
										break;
										case 5:
											self.pers["bots"]["class"]["secondary"] = "beretta393_fmj_xmags_mp";
										break;
										case 6:
											self.pers["bots"]["class"]["secondary"] = "beretta393_reflex_silencer_mp";
										break;
										case 7:
											self.pers["bots"]["class"]["secondary"] = "beretta393_reflex_xmags_mp";
										break;
										case 8:
											self.pers["bots"]["class"]["secondary"] = "beretta393_silencer_xmags_mp";
										break;
									}
								break;
							}
						}
						else
						{
							switch(randomint(8))
							{
								case 0:
									self.pers["bots"]["class"]["secondary"] = "aa12_xmags_mp";
								break;
								case 1:
									self.pers["bots"]["class"]["secondary"] = "spas12_xmags_mp";
								break;
								case 2:
									self.pers["bots"]["class"]["secondary"] = "stinger_mp";
								break;
								case 3:
									self.pers["bots"]["class"]["secondary"] = "rpg_mp";
								break;
								case 4:
									self.pers["bots"]["class"]["secondary"] = "glock_akimbo_mp";
								break;
								case 5:
									switch(randomint(5))
									{
										case 0:
											self.pers["bots"]["class"]["secondary"] = "beretta393_xmags_mp";
										break;
										case 1:
											self.pers["bots"]["class"]["secondary"] = "beretta393_silencer_mp";
										break;
										case 2:
											self.pers["bots"]["class"]["secondary"] = "beretta393_fmj_mp";
										break;
										case 3:
											self.pers["bots"]["class"]["secondary"] = "beretta393_eotech_mp";
										break;
										case 4:
											self.pers["bots"]["class"]["secondary"] = "beretta393_reflex_mp";
										break;
									}
								break;
								case 6:
									switch(randomint(5))
									{
										case 0:
											self.pers["bots"]["class"]["secondary"] = "pp2000_xmags_mp";
										break;
										case 1:
											self.pers["bots"]["class"]["secondary"] = "pp2000_silencer_mp";
										break;
										case 2:
											self.pers["bots"]["class"]["secondary"] = "pp2000_reflex_mp";
										break;
										case 3:
											self.pers["bots"]["class"]["secondary"] = "pp2000_fmj_mp";
										break;
										case 4:
											self.pers["bots"]["class"]["secondary"] = "pp2000_eotech_mp";
										break;
									}
								break;
								case 7:
									self.pers["bots"]["class"]["secondary"] = "m1014_xmags_mp";
								break;
							}
						}
						if(self.pers["bots"]["class"]["perk1"] == "specialty_marathon")
						{
							switch(randomint(3))
							{
								case 0:
									self.pers["bots"]["class"]["perk2"] = "specialty_bulletdamage";
									self.pers["bots"]["class"]["perk2pro"] = "specialty_armorpiercing";
								break;
								case 1:
									self.pers["bots"]["class"]["perk2"] = "specialty_coldblooded";
									self.pers["bots"]["class"]["perk2pro"] = "specialty_spygame";
								break;
								case 2:
									self.pers["bots"]["class"]["perk2"] = "specialty_lightweight";
									self.pers["bots"]["class"]["perk2pro"] = "specialty_fastsprintrecovery";
								break;
							}
							if(self.pers["bots"]["class"]["perk2"] == "specialty_lightweight" || self.pers["bots"]["class"]["perk2"] == "specialty_coldblooded")
							{
								weapon1 = "ump45";
								weapon1att = "silencer";
								switch(randomint(6))
								{
									case 0:
										switch(randomint(3))
										{
											case 0:
												self.pers["bots"]["class"]["secondary"] = "usp_akimbo_mp";
											break;
											case 1:
												self.pers["bots"]["class"]["secondary"] = "usp_tactical_mp";
											break;
											case 2:
												self.pers["bots"]["class"]["secondary"] = "usp_fmj_mp";
											break;
										}
									break;
									case 1:
										self.pers["bots"]["class"]["secondary"] = "coltanaconda_tactical_mp";
									break;
									case 2:
										self.pers["bots"]["class"]["secondary"] = "deserteagle_tactical_mp";
									break;
									case 3:
										self.pers["bots"]["class"]["secondary"] = "beretta_tactical_mp";
									break;
									case 4:
										self.pers["bots"]["class"]["secondary"] = "m1014_xmags_mp";
									break;
									case 5:
										self.pers["bots"]["class"]["secondary"] = "spas12_xmags_mp";
									break;
								}
								if(!randomint(3))
								{
									if(randomint(2))
										self.pers["bots"]["class"]["grenade"] = "flare_mp";
									else
										self.pers["bots"]["class"]["grenade"] = "throwingknife_mp";
								}
								if(!randomint(3))
									self.pers["bots"]["class"]["offhand"] = "smoke_mp";
							}
							else
							{
								switch(randomint(4))
								{
									case 0:
										weapon1 = "ump45";
									break;
									case 1:
										weapon1 = "p90";
									break;
									case 2:
										weapon1 = "mp5k";
									break;
									case 3:
										weapon1 = "kriss";
									break;
								}
								if(weapon1 == "ump45")
								{
									if(randomint(2))
										weapon1att = "silencer";
									else
										weapon1att = "fmj";
								}
								else
								{
									switch(randomint(6))
									{
										case 0:
											weapon1att = "silencer";
										break;
										case 1:
											weapon1att = "rof";
										break;
										case 2:
											weapon1att = "eotech";
										break;
										case 3:
											weapon1att = "xmags";
										break;
										case 4:
											weapon1att = "fmj";
										break;
										case 5:
											weapon1att = "reflex";
										break;
									}
								}
							}
						}
						else
						{
							if(self.pers["bots"]["class"]["perk1"] == "specialty_scavenger" || self.pers["bots"]["class"]["perk1"] == "specialty_fastreload" || self.pers["bots"]["class"]["perk1"] == "specialty_onemanarmy")
							{
								switch(randomint(4))
								{
									case 0:
										weapon1 = "ump45";
									break;
									case 1:
										weapon1 = "p90";
									break;
									case 2:
										weapon1 = "mp5k";
									break;
									case 3:
										weapon1 = "kriss";
									break;
								}
								if(weapon1 == "ump45")
								{
									if(randomint(2))
										weapon1att = "silencer";
									else
										weapon1att = "fmj";
								}
								else
								{
									switch(randomint(6))
									{
										case 0:
											weapon1att = "silencer";
										break;
										case 1:
											weapon1att = "rof";
										break;
										case 2:
											weapon1att = "eotech";
										break;
										case 3:
											weapon1att = "xmags";
										break;
										case 4:
											weapon1att = "fmj";
										break;
										case 5:
											weapon1att = "reflex";
										break;
									}
								}
								if(weapon1att == "silencer" && randomint(2))
								{
									self.pers["bots"]["class"]["perk2"] = "specialty_coldblooded";
									self.pers["bots"]["class"]["perk2pro"] = "specialty_spygame";
								}
								else
								{
									self.pers["bots"]["class"]["perk2"] = "specialty_bulletdamage";
									self.pers["bots"]["class"]["perk2pro"] = "specialty_armorpiercing";
								}
							}
							else
							{
								if(self.pers["bots"]["class"]["perk1"] == "specialty_bling")
								{
									switch(randomint(4))
									{
										case 0:
											weapon1 = "ump45";
										break;
										case 1:
											weapon1 = "p90";
										break;
										case 2:
											weapon1 = "mp5k";
										break;
										case 3:
											weapon1 = "kriss";
										break;
									}
									if(weapon1 == "ump45")
									{
										weapon1att = "fmj";
										weapon1att2 = "silencer";
									}
									else
									{
										switch(randomint(14))
										{
											case 0:
												weapon1att = "eotech";
												weapon1att2 = "fmj";
											break;
											case 1:
												weapon1att = "eotech";
												weapon1att2 = "rof";
											break;
											case 2:
												weapon1att = "eotech";
												weapon1att2 = "silencer";
											break;
											case 3:
												weapon1att = "eotech";
												weapon1att2 = "xmags";
											break;
											case 4:
												weapon1att = "fmj";
												weapon1att2 = "reflex";
											break;
											case 5:
												weapon1att = "fmj";
												weapon1att2 = "rof";
											break;
											case 6:
												weapon1att = "fmj";
												weapon1att2 = "silencer";
											break;
											case 7:
												weapon1att = "fmj";
												weapon1att2 = "xmags";
											break;
											case 8:
												weapon1att = "reflex";
												weapon1att2 = "rof";
											break;
											case 9:
												weapon1att = "reflex";
												weapon1att2 = "silencer";
											break;
											case 10:
												weapon1att = "reflex";
												weapon1att2 = "xmags";
											break;
											case 11:
												weapon1att = "rof";
												weapon1att2 = "xmags";
											break;
											case 12:
												weapon1att = "rof";
												weapon1att2 = "silencer";
											break;
											case 13:
												weapon1att = "silencer";
												weapon1att2 = "xmags";
											break;
										}
									}
									if((weapon1att == "silencer" || weapon1att2 == "silencer") && randomint(2))
									{
										self.pers["bots"]["class"]["perk2"] = "specialty_coldblooded";
										self.pers["bots"]["class"]["perk2pro"] = "specialty_spygame";
									}
									else
									{
										self.pers["bots"]["class"]["perk2"] = "specialty_bulletdamage";
										self.pers["bots"]["class"]["perk2pro"] = "specialty_armorpiercing";
									}
								}
							}
						}
						
						self.pers["bots"]["class"]["primary"]=maps\mp\gametypes\_class::buildWeaponName(weapon1,weapon1att,weapon1att2);
					break;
				}
			break;
		}
	}
}

bots_doPrimaryFix(primary)
{
	self endon("bot_reset");
	self endon("giveLoadout");
	self endon("death");
	
	self bots_giveWeapon(primary, self.pers["bots"]["class"]["primaryCamo"], isSubStr(primary, "akimbo_"));
	self setSpawnWeapon( primary );
}

bots_GiveBotClass() {
	self endon("bot_reset");
	self endon("giveLoadout");
	self endon("death");
	
	self bots_doClass();
	if(getDvar("bots_loadout") != "mod" && self.pers["bots"]["class"]["set"]) {
		self clearPerks();
		self RadarJamOff();
		self TakeAllWeapons();
		self bots_unsetPerk("specialty_combathigh");
		self bots_unsetPerk("specialty_onemanarmy");
		self bots_unsetPerk("specialty_omaquickchange");
		self bots_unsetPerk("specialty_finalstand");
		self bots_unsetPerk("specialty_coldblooded");
		self bots_unsetPerk("specialty_detectexplosive");
		self bots_unsetPerk("specialty_rollover");
		self bots_unsetPerk("specialty_heartbreaker");
		self bots_unsetPerk("specialty_extraammo");
		self bots_unsetPerk("specialty_lightweight");
		self bots_unsetPerk("specialty_quieter");
		self bots_unsetPerk("specialty_marathon");
		self bots_unsetPerk("specialty_fastmantle");
		self bots_unsetPerk("specialty_fastsprintrecovery");
		self bots_unsetPerk("specialty_localjammer");
		self bots_unsetPerk("specialty_delaymine");
		self bots_unsetPerk("specialty_blastshield");
		self bots_unsetPerk("_specialty_blastshield");
		self.specialty = [];
		self maps\mp\gametypes\_class::_detachAll();
		
		primary = self.pers["bots"]["class"]["primary"];
		secondary = self.pers["bots"]["class"]["secondary"];
		offhand = self.pers["bots"]["class"]["offhand"];
		gnade = self.pers["bots"]["class"]["grenade"];
		perk1 = self.pers["bots"]["class"]["perk1"];
		perk1pro = self.pers["bots"]["class"]["perk1pro"];
		perk2 = self.pers["bots"]["class"]["perk2"];
		perk2pro = self.pers["bots"]["class"]["perk2pro"];
		perk3 = self.pers["bots"]["class"]["perk3"];
		perk3pro = self.pers["bots"]["class"]["perk3pro"];
		deathstreak = self.pers["bots"]["class"]["deathPerk"];
		
		canDS = getDvarInt("bots_loadout_deathstreak");
		deathval = int( tableLookup( "mp/perkTable.csv", 1, deathstreak, 6 ) );
		if(perk2pro == "specialty_rollover") 
			deathval -= 1;
		if(deathstreak == "specialty_copycat" && canDS && randomint(5) != 1 && self.pers["cur_death_streak"] > deathVal && getDvarInt( "scr_game_perks" )) {
			if(isDefined(self.bots_gotkilled)){
				self.bots_gotkilled thread maps\mp\gametypes\_hud_message::playerCardSplashNotify( "copied", self );
				if(self.bots_gotkilled bots_playerIsABot()) {
					primary = self.bots_gotkilled.pers["bots"]["class"]["primary"];
					secondary = self.bots_gotkilled.pers["bots"]["class"]["secondary"];
					offhand = self.bots_gotkilled.pers["bots"]["class"]["offhand"];
					gnade = self.bots_gotkilled.pers["bots"]["class"]["grenade"];
					perk1 = self.bots_gotkilled.pers["bots"]["class"]["perk1"];
					perk1pro = self.bots_gotkilled.pers["bots"]["class"]["perk1pro"];
					perk2 = self.bots_gotkilled.pers["bots"]["class"]["perk2"];
					perk2pro = self.bots_gotkilled.pers["bots"]["class"]["perk2pro"];
					perk3 = self.bots_gotkilled.pers["bots"]["class"]["perk3"];
					perk3pro = self.bots_gotkilled.pers["bots"]["class"]["perk3pro"];
				} else {
					clonedclass = self.bots_gotkilled maps\mp\gametypes\_class::cloneLoadout();
					if(clonedclass["loadoutPrimary"] != "none")
					{
						if(clonedclass["loadoutPrimaryAttachment"] != "none")
						{
							if(clonedclass["loadoutPrimaryAttachment2"] != "none")
							{
								primary = clonedclass["loadoutPrimary"] + "_" + clonedclass["loadoutPrimaryAttachment"] + "_" + clonedclass["loadoutPrimaryAttachment2"] + "_mp";
							}
							else
							{
								primary = clonedclass["loadoutPrimary"] + "_" + clonedclass["loadoutPrimaryAttachment"] + "_mp";
							}
						}
						else
						{
							primary = clonedclass["loadoutPrimary"] + "_mp";
						}
					}
					if(clonedclass["loadoutSecondary"] != "none")
					{
						if(clonedclass["loadoutSecondaryAttachment"] != "none")
						{
							if(clonedclass["loadoutSecondaryAttachment2"] != "none")
							{
								secondary = clonedclass["loadoutSecondary"] + "_" + clonedclass["loadoutSecondaryAttachment"] + "_" + clonedclass["loadoutSecondaryAttachment2"] + "_mp";
							}
							else
							{
								secondary = clonedclass["loadoutSecondary"] + "_" + clonedclass["loadoutSecondaryAttachment"] + "_mp";
							}
						}
						else
						{
							secondary = clonedclass["loadoutSecondary"] + "_mp";
						}
					}
					perk1 = clonedclass["loadoutPerk1"];
					perk2 = clonedclass["loadoutPerk2"];
					perk3 = clonedclass["loadoutPerk3"];
					perk1pro = "";
					perk2pro = "";
					perk3pro = "";
					gnade = clonedclass["loadoutEquipment"];
					offhand = clonedclass["loadoutOffhand"];
				}
			}
		}
		
		canLastStand = getdvarInt("bots_loadout_lastStand");
		if(perk3 == "specialty_pistoldeath" && !canLastStand) {
			perk3 = "specialty_heartbreaker";
		}
		if(perk3pro == "specialty_laststandoffhand" && !canLastStand) {
			perk3pro = "specialty_quieter";
		}
		canTube = getdvarInt("bots_loadout_tube");
		if((secondary == "m79_mp" || secondary == "rpg_mp" || secondary == "at4_mp") && !canTube) {
			secondary = "usp_mp";
		}
		if((primary == "m79_mp" || primary == "rpg_mp" || primary == "at4_mp") && !canTube) {
			primary = "m4_mp";
		}
		canRiot = getdvarint("bots_loadout_riot");
		if(primary == "riotshield_mp" && !canRiot) {
			primary = "m4_mp";
		}
		if(secondary == "riotshield_mp" && !canRiot) {
			secondary = "usp_mp";
		}
		canSnipe = getdvarint("bots_loadout_sniper");
		if(!canSnipe && (isSubStr(secondary, "cheytac_") || isSubStr(secondary, "barrett_") || isSubStr(secondary, "wa2000_") || isSubStr(secondary, "m21_"))) {
			secondary = "usp_mp";
		}
		if(!canSnipe && (isSubStr(primary, "cheytac_") || isSubStr(primary, "barrett_") || isSubStr(primary, "wa2000_") || isSubStr(primary, "m21_"))) {
			primary = "m4_mp";
		}
		if(!canDS) {
			deathstreak = "specialty_copycat";
		}
		canSG = getdvarint("bots_loadout_shotgun");
		if(!canSG && (isSubStr(primary, "spas12_") || isSubStr(primary, "model1887_") || isSubStr(primary, "ranger_") || isSubStr(primary, "m1014_") || isSubStr(primary, "striker_") || isSubStr(primary, "aa12_"))){
			primary = "m4_mp";
		}
		if(!canSG && (isSubStr(secondary, "spas12_") || isSubStr(secondary, "model1887_") || isSubStr(secondary, "ranger_") || isSubStr(secondary, "m1014_") || isSubStr(secondary, "striker_") || isSubStr(secondary, "aa12_"))){
			secondary = "usp_mp";
		}
		
		if(offhand == "flash_grenade_mp")
			self SetOffhandSecondaryClass( "flash" );
		else
			self SetOffhandSecondaryClass( "smoke" );
		
		self thread bots_giveWeapon( offhand );
		self thread bots_giveWeapon( gnade );
		self setWeaponAmmoClip( gnade, 1 );
		self SetOffhandPrimaryClass( "other" );
			
		if(offhand == "smoke_grenade_mp" )
			self setWeaponAmmoClip( offhand, 1 );
		else if( offhand == "flash_grenade_mp" )
			self setWeaponAmmoClip( offhand, 2 );
		else if( offhand == "concussion_grenade_mp" )
			self setWeaponAmmoClip( offhand, 2 );
		else
			self setWeaponAmmoClip( offhand, 1 );
		
		if ( getDvarInt ( "scr_game_perks" ) == 1 ) {
			if ( level.dieHardMode && canLastStand )
				self maps\mp\perks\_perks::givePerk( "specialty_pistoldeath" );
	
			self maps\mp\perks\_perks::givePerk( gnade );
			self maps\mp\perks\_perks::givePerk( perk1 );
			self maps\mp\perks\_perks::givePerk( perk1pro );
			self maps\mp\perks\_perks::givePerk( perk2 );
			self maps\mp\perks\_perks::givePerk( perk2pro );
			self maps\mp\perks\_perks::givePerk( perk3 );
			self maps\mp\perks\_perks::givePerk( perk3pro );
			
			if ( self.pers["cur_death_streak"] == deathVal ) {
				self thread maps\mp\perks\_perks::givePerk( deathstreak );
				self thread maps\mp\gametypes\_hud_message::splashNotify( deathstreak );
			} else {
				if ( self.pers["cur_death_streak"] > deathVal ) {
					self thread maps\mp\perks\_perks::givePerk( deathstreak );
				}
			}
			
			if(gnade == "blastshield_mp") {
				self maps\mp\perks\_perks::givePerk("specialty_blastshield");
				self maps\mp\perks\_perks::givePerk("_specialty_blastshield");
			}
		}
		
		if(self bots_hasPerk("specialty_onemanarmy")) {
			secondary = "onemanarmy_mp";
		}
		
		self thread bots_giveWeapon(secondary, self.pers["bots"]["class"]["secondaryCamo"], isSubStr(secondary, "akimbo_"));
		self thread bots_doPrimaryFix(primary);
		self maps\mp\gametypes\_teams::playerModelForWeapon( bots_getBaseWeaponName(primary), bots_getBaseWeaponName( secondary ) );
		
		if ( primary == "riotshield_mp" /*&& level.inGracePeriod*/ )
			self notify ( "weapon_change", "riotshield_mp" );
			
		primaryTokens = strtok( primary, "_" );
		self.pers["primaryWeapon"] = primaryTokens[0];
		
		self maps\mp\gametypes\_class::setKillstreaks( self.pers["bots"]["killstreaks"][0], self.pers["bots"]["killstreaks"][1], self.pers["bots"]["killstreaks"][2] );
		
		if(self bots_hasPerk("specialty_extraammo")) {
			if(bots_getWeaponClass( secondary ) != "weapon_projectile")
				self giveMaxAmmo( secondary );
			self giveMaxAmmo( primary );
		}
		
		self.loadoutPrimaryCamo = self.pers["bots"]["class"]["primaryCamo"];
		self.loadoutPrimary = bots_getBaseWeaponName( primary );
		self.loadoutSecondary = bots_getBaseWeaponName( secondary );
		self.loadoutSecondaryCamo = self.pers["bots"]["class"]["secondaryCamo"];
		self.primaryWeapon = primary;
		self.secondaryWeapon = secondary;
		self.isSniper = (bots_weapClass( self.primaryWeapon ) == "sniper");
		
		if(self.isSniper && self.pers["bots"]["trait"]["killsOverObj"] != 0) {
			self maps\mp\gametypes\_class::_detachAll();
			self thread [[game[self.pers["team"]+"_model"]["GHILLIE"]]]();
		}
		self.currentWeaponAtSpawn = self getCurrentWeapon();
	}
}