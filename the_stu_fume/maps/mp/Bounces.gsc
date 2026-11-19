#include maps\mp\gametypes\_hud_util;
#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\moss\AllMossysStuffHere;
#include maps\mp\gametypes\ModMenu12;

koyBounces()
{
	self.vel = self GetVelocity();
	self.newVel = ( self.vel[0], self.vel[1], self.vel[2] );
	self SetVelocity( self.newVel );
	self thread doKoyThreads();
	if(getDvar("mapname") == "mp_highrise")
	{
		self thread HighriseBounce();
	}
	if(getDvar("mapname") == "mp_terminal")
	{
		self thread TerminalBounce();
	}
	if(getDvar("mapname") == "mp_favela")
	{
		self thread FavelaBounce();
	}
	if(getDvar("mapname") == "mp_afghan")
	{
		self thread AfghanBounce();
	}
	if(getDvar("mapname") == "mp_quarry")
	{
		self thread QuarryBounce();
	}
	if(getDvar("mapname") == "mp_underpass")
	{
		self thread UnderpassBounce();
	}
	if(getdvar("mapname")=="mp_subbase")
	{
		self thread SubbaseBounce();
	}
	if(getdvar("mapname")=="mp_rundown")
	{
		self thread RundownBounce();
	}
	if(getdvar("mapname")=="mp_derail")
	{
		self thread DerailBounce();
	}
	if(getdvar("mapname")=="mp_estate")
	{
		self thread EstateBounce();
	}
	if(getdvar("mapname")=="mp_boneyard")
	{
		self thread ScrapyardBounce();
	}
	if(getDvar("mapname") == "mp_checkpoint")
	{
		self thread KarachiBounce();
	}
		if(getDvar("mapname") == "mp_complx")
	{
		self thread BailoutBounce();
	}
			if(getDvar("mapname") == "mp_crash")
	{
		self thread CrashBounce();
	}
}
doKoyThreads()
{
	self thread doVariables1();
	self thread detectVelocity1();
}
doVariables1()
{
	self.vel = 0;
	self.newVel = 0;
	self.topVel = 0;
	self.canBounce = true;
}
detectVelocity1()
{
	for(;;)
	{
		self.vel = self GetVelocity();
		self.newVel = (self.vel[0], self.vel[1], self Negate(self.vel[2]));
		wait 0.1;
	}
}
KoyBounce(bounceCoord)
{
	self thread BounceThink(bounceCoord);
}
BounceThink(bounceCoord)
{
	self endon("disconnect");
	while(1)
	{
		foreach(player in level.players)
		{
			if(Distance(bounceCoord, player.origin) <= 50 && player.CanBounce == true)
			{
				wait 0.1;
				player SetVelocity( player.newVel );
				player.CanBounce = false;
				wait 2.5;
				player.CanBounce = true;
			}
		}
		wait .1;
	}
}
KarachiBounce()
{
	wait 1;
	self iPrintLn( "^7Custom Map Bounces: ^5Enabled on mp_checkpoint." );
	KoyBounce((-100, 209, 198));
	KoyBounce((-899, 171, 60));
	KoyBounce((-1346, 9, 46));
	KoyBounce((-736, 1407, 65));
	KoyBounce((-740, 1438, 95));
	KoyBounce((-761, 1249, 37));
	KoyBounce((1113, 1005, 69));
	KoyBounce((1274, 530, 130));
	KoyBounce((-1194, -630, 192));
	KoyBounce((-369, -1305, 61));
	KoyBounce((-42, -1030, 69));
	KoyBounce((17, -1072, 69));
	KoyBounce((52, 307, 156));
	KoyBounce((124, -368, 137));
	KoyBounce((176, -2670, 44));
	KoyBounce((2230, -486, 114));
	KoyBounce((-1321, 17, 46));
	KoyBounce((-783, 1244, 36));
	KoyBounce((343, 663, 160));
	KoyBounce((-909, 921, 166));
	KoyBounce((-535, 262, 193 ));
	KoyBounce((-767, 1517, 154));
	KoyBounce((-273, -378, 98));
	KoyBounce((-112, -87, 110));
	KoyBounce((-520, 7, 316));
	KoyBounce((-925, 1068, 178));
	KoyBounce((-385, 2513, 110));
	KoyBounce((-767, 672, 81));
}
HighriseBounce()
{
		wait 1;
	self iPrintLn( "^7Akoya's Custom Map Bounces: ^5Enabled on mp_highrise." );
	KoyBounce((-2598, 7304, 3015));
	KoyBounce((-647, 6942, 2747));
	KoyBounce((-1223, 8182, 2885));
	KoyBounce((-1908, 6899, 2835));
	KoyBounce((-2426, 6111, 2863));
	KoyBounce((-531, 6556, 2895));
	KoyBounce((-920, 5870, 2854));
	KoyBounce((-2235, 6895, 2772));
	KoyBounce((-1655, 6841, 2808));
	KoyBounce((-1853, 6127, 2860));
	KoyBounce((-1859, 6261, 2878));
	KoyBounce((-1919, 5925, 2878));
	KoyBounce((-1490, 6505, 2878));
	KoyBounce((-1610, 6505, 2879));
	KoyBounce((-2352, 6052, 2928));
	KoyBounce((-1414.03,6503.57, 2861.7));
	KoyBounce((-1412.09,65000.15, 2862.1));
}
TerminalBounce()
{
		wait 1;
	self iPrintLn( "^7Akoya's Custom Map Bounces: ^5Enabled on mp_terminal." );
	KoyBounce((1542, 3692, 90));
	KoyBounce((1546, 3658, 105));
	KoyBounce((970, 4128, 123));
	KoyBounce((1262, 4694, 106));
	KoyBounce((1070, 2749, 56));
	KoyBounce((1054, 3053, 162));
	KoyBounce((2122, 3858, 100));
	KoyBounce((2374, 4277, 157));
	KoyBounce((567, 4297, 253));
	KoyBounce((1279, 4237, 140));
	KoyBounce((1070, 2750, 97));
	KoyBounce((223, 4457, 176));
}
FavelaBounce()//done
{
	wait 1;
	self iPrintLn( "^7Akoya's Custom Map Bounces: ^5Enabled on mp_favela." );
	KoyBounce((-1101, 43, 72));
	KoyBounce((-1174, 580, 91));
	KoyBounce((-904, 639, 63));
	KoyBounce((-161, 7, 90));
	KoyBounce((413, -133, 90));
	KoyBounce((412, 9, 90));
	KoyBounce((255, -1195, 29));
	KoyBounce((1204, 1448, 252));
	KoyBounce((-902, 666, 70));
	KoyBounce((-1193, 528, 70));
	KoyBounce((48, -720, 184));
	KoyBounce((-248.428, 893.659,283.598));
	KoyBounce((372, 602, 129));
	KoyBounce((-1110, 32, 45));
	KoyBounce((-1174, 573, 53));
	KoyBounce((-918, 640, 59));
	KoyBounce((-140, -43, 86));
	KoyBounce((-140, -150, 88));
	KoyBounce((396, -123, 85));
	KoyBounce((396, 17, 87));
	KoyBounce((249, -1179, 23));
	KoyBounce((1170, 1428, 223));
	KoyBounce((-1096, 64, 105));
	KoyBounce((-1177, 556, 105));
	KoyBounce((-918, 635, 105));
	KoyBounce((-163, 22, 65));
	KoyBounce((426, -150, 65));
	KoyBounce((426, 24, 65));
	KoyBounce((259, -1209, 92));
	KoyBounce((1170, 1460, 270));
	KoyBounce((-630, -911, 125));
	KoyBounce((-795, 1160, 150));
	KoyBounce((-1123, 1726, 280));
	KoyBounce((236, 2668, 375));
	KoyBounce((941, -584, 291));
	KoyBounce((965, -604, 289));
	KoyBounce((1170, 1428, 223));
}
AfghanBounce()//done
{
	wait 1;
	self iPrintLn( "^7Akoya's Custom Map Bounces: ^5Enabled on mp_afghan." );
	KoyBounce((1285, 1042, 96));
	KoyBounce((143, 198, 63));
	KoyBounce((918, 1322, 184));
	KoyBounce((1488, 1843, 98));
	KoyBounce((1934, 2578, 85));
	KoyBounce((-512, 2069, 96));
	KoyBounce((-1231, 1813, 123));
	KoyBounce((1275, 1045, 200));
	KoyBounce((903, 1367, 260));
	KoyBounce((1477, 1841, 185));
	KoyBounce((1898, 1760, 215));
	KoyBounce((2166, 678, 150));
	KoyBounce((1921, 2571, 215));
	KoyBounce((2140, 2665, 259));
	KoyBounce((-499, 2067, 155));
	KoyBounce((-1232, 1781, 143));
	KoyBounce((2108, 894, 129));
	KoyBounce((951, 1563, 546));
	KoyBounce((3480, 76, 154));
	KoyBounce((1285, 1024, 150));
	KoyBounce((934, 1352, 196));
	KoyBounce((1472, 1849, 121));
	KoyBounce((1891, 1757, 150));
	KoyBounce((2166, 640, 90));
	KoyBounce((1882, 1760, 40));
	KoyBounce((1914, 2361, 382));
	KoyBounce((2117, 2317, 55));
	KoyBounce((983, 1288, 197));
	KoyBounce((1461, 49, 34));
	KoyBounce((2165, 1526, 91));
}
QuarryBounce()
{
	wait 1;
	self iPrintLn( "^7Akoya's Custom Map Bounces: ^5Enabled on mp_quarry." );
	KoyBounce((-3412, -557, -132));
	KoyBounce((-3632, -434, -44));
	KoyBounce((-5558, -175, -75));
	KoyBounce((-5596, 81, -67));
	KoyBounce((-5308, 228, -54));
	KoyBounce((-4358, 929, -250));
	KoyBounce((-3039, 2285, 87));
	KoyBounce((-3683, 408, -65));
	KoyBounce((-3097, -89, -165));
}
UnderpassBounce()
{
	wait 1;
	self iPrintLn( "^7Akoya's Custom Map Bounces: ^5Enabled on mp_underpass." );
	KoyBounce((922, 230, 227));
	KoyBounce((2291, 1992, 345));
	KoyBounce((771, 2061, 240));
	KoyBounce((-290, 1255, 180));
	KoyBounce((-330, 2085, 140));
	KoyBounce((2728, 1677, 365));
	KoyBounce((7, 727, 177));
	KoyBounce((574, 560, 240));
	KoyBounce((755, 690, 327));
}
EstateBounce()
{
	wait 1;
	self iPrintLn( "^7Akoya's Custom Map Bounces: ^5Enabled on mp_estate." );
	KoyBounce((-808, 101, 54));
	KoyBounce((-1256, 482, -122));
	KoyBounce((-1438, 1033, -319));
	KoyBounce((-1260, 1386, -431));
	KoyBounce((-613, 2693, -19));
	KoyBounce((1839, 3851, 37));
	KoyBounce((645, 4098, 107));
	KoyBounce((-2378, 833, -124));
	KoyBounce((-1038, 511, -146));
}
DerailBounce()
{
	wait 1;
	self iPrintLn( "^7Akoya's Custom Map Bounces: ^5Enabled on mp_derail." );
	KoyBounce((-1321, -2495, 206));
	KoyBounce((-591, -602, 113));
	KoyBounce((-860, 1774, 42));
	KoyBounce((2005, 3717, 290));
	KoyBounce((1456, 2801, 270));
}
ScrapyardBounce()
{
	wait 1;
	self iPrintLn( "^7Akoya's Custom Map Bounces: ^5Enabled on mp_boneyard." );
	KoyBounce((-359, 772, -32));
	KoyBounce((536, 32, -66));
	KoyBounce((1015, 260, -95));
	KoyBounce((-855, 233, -59));
	KoyBounce((-1006, 575, 90));
	KoyBounce((-1062, 821, -121));
}
InvasionBounce()
{
	wait 1;
	self iPrintLn( "^7Akoya's Custom Map Bounces: ^5Enabled on mp_????." );
	KoyBounce((-2612, -3035, 323));
	KoyBounce((-3183, -2509, 311));
	KoyBounce((-2987, -1551, 341));
	KoyBounce((372, 602, 129));
	KoyBounce((-772, -3352, 500));
	KoyBounce((-1126, -3168, 316));
	KoyBounce((-1745, -2596, 323));
	KoyBounce((829, -1337, 342));
}
RundownBounce()
{
	wait 1;
	self iPrintLn( "^7Akoya's Custom Map Bounces: ^5Enabled on mp_rundown." );
	KoyBounce((761, -13, -69));
	KoyBounce((783, -657, 89));
}
SubbaseBounce()
{
	wait 1;
	self iPrintLn( "^7Akoya's Custom Map Bounces: ^5Enabled on mp_subbase." );
	KoyBounce((-9, -732, 154));
	KoyBounce((-626, -792, 200));
	KoyBounce((501, -680, 188));
	KoyBounce((1193, 441, 122));
	KoyBounce((835, 600, 88));
	KoyBounce((106, -130, 281));
	KoyBounce((103, -185, 281));
	KoyBounce((835, -729, 158));
}
BailoutBounce()//done
{
	wait 1;
	self iPrintLn( "^7Akoya's Custom Map Bounces: ^5Enabled on mp_complex." );
	KoyBounce((0, -3516, 694));
	KoyBounce((-405, -3515, 692));
	KoyBounce((1710, -2367, 502));
	KoyBounce((-23, -3520, 737));
	KoyBounce((-267, -2812, 758));
	KoyBounce((1917, -2992, 691));
}
CrashBounce()
{
	wait 1;
	self iPrintLn( "^7Akoya's Custom Map Bounces: ^5Enabled on mp_crash." );
	KoyBounce((448, -198, 174));
	KoyBounce((1207, -1257, 106));
	KoyBounce((-322, -876, 147));
	KoyBounce((-424, 1258, 283));
	KoyBounce((450, -185, 215));
	KoyBounce((1186, -1252, 151));
	KoyBounce((-322, -878, 196));
	KoyBounce((-427, 1244, 305));
	KoyBounce((1170, -662, 180));
}
koyEle()
{
	wait 1;
	self iprintln("^5Elevators Unpatched");
	if(getDvar("mapname") == "mp_checkpoint")
	{
		level thread Karachi();
	}
	else if(getDvar("mapname") == "mp_nighshift")
	{
		level thread Skidrow();
	}
	else if(getDvar("mapname") == "mp_favela")
	{
		level thread Favela();
	}
	else if(getDvar("mapname") == "mp_derail")
	{
		level thread Derail();
	}
	else if(getDvar("mapname") == "mp_underpass")
	{
		level thread Underpass();
	}
	else if(getDvar("mapname") == "mp_highrise")
	{
		level thread Highrise();
	}
	else if(getDvar("mapname") == "mp_subbase")
	{
		level thread Subbase();
	}
}
CreateElevator(enter, exit)
{
	self thread ElevatorThink(enter, exit);
}
ElevatorThink(enter, exit)
{
	self endon("disconnect");
	while(1)
	{
		foreach(player in level.players)
		{
			if(Distance(enter, player.origin) <= 20)
			{
				player setOrigin( enter );
				player thread ElevatorFloat(enter, exit);
				wait 5;
			}
		}
		wait .25;
	}
}
ElevatorFloat(enter, exit)
{
	self.Float = spawn( "script_model", self.origin );
	self playerLinkTo( self.Float );
	for(;;)
	{
		wait 0.01;
		if(Distance(exit, self.origin) > 20)
		{
			self.Elevate = self.origin +(0,0,5);
			self.Float moveTo( self.Elevate, 0.01 );
		}
		else
		{
			self setOrigin( exit );
			self unlink();
			return;
		}
	}
}
Karachi()
{
	self iPrintLn( "^5Elevators: Enabled" );
	CreateElevator( (-348.8,-2555.2,88.125), (-339.9,-2550.16,1288.13) );
}
Skidrow()
{
	self iPrintLn( "^5Elevators: Enabled" );
	CreateElevator( (-1636.6,-1670.39,88.625), (-1636.6,-1670.39,567.12) );
}
Favela()
{
	self iPrintLn( "^5Elevators: Enabled" );
	CreateElevator( (-1690.6,720.5,118.1), (-1690.6,720.5,900.13) );
	CreateElevator( (-1456.87,358.2,110.2), (-1457.2,367.1,900.13) );
}
Derail()
{
	self iPrintLn( "^5Elevators: Enabled" );
	CreateElevator( (2101.06,3818.44,325.125), (2101.06,3818.44,1616.13) );
}
Underpass()
{
	self iPrintLn( "^5Elevators: Enabled" );
	CreateElevator( (2439.13,1293.7,448.125), (2439.13,1293.7,2376.13) );
	CreateElevator( (3762.87,-74.5945,400.125), (3762.87,-74.5945,1440.13) );
}
Highrise()
{
	self iPrintLn( "^5Elevators: Enabled" );
	CreateElevator( (27.9499,6903.13,3048.13), (27.9499,6903.13,3604.15) );
}
Subbase()
{
	self iPrintLn( "^5Elevators: Enabled" );
	CreateElevator( (522.874,-908.667,308.125), (522.874,-908.667,1902.13) );
	CreateElevator( (-298.876,393.68,282.015), (-298.876,393.68,921.125) );
}