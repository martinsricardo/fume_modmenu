#include maps\mp\gametypes\_hud_util;
#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\moss\AllMossysStuffHere;

//Rare Binds
instaglide() 
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 77;+forward;wait 11;+breath_sprint;wait 15;weapnext;wait 10;weapnext;wait 2;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 77;+forward;wait 11;+breath_sprint;wait 15;weapnext;wait 10;weapnext;wait 2;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}
instaglide2() 
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 96;+forward;wait 13;-forward;wait 2;+forward;+breath_sprint;wait 20;-forward;-breath_sprint;wait 10;-speed_throw;+frag;wait 2;weapnext;wait 7;-frag;+speed_throw;wait 20;+usereload;wait 5;-usereload;wait 53;-speed_throw;wait 5;+attack;-attack;wait 5;+usereload;-usereload;wait 24;+forward;wait 13;-forward;wait 2;+forward;+breath_sprint;wait 15;-forward;-breath_sprint;+usereload;wait 50;-usereload;weapnext;wait 5;weapnext;+usereload;-usereload;wait 2;+attack;-attack;wait 15;weapnext;wait 10;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 96;+forward;wait 13;-forward;wait 2;+forward;+breath_sprint;wait 20;-forward;-breath_sprint;wait 10;-speed_throw;+frag;wait 2;weapnext;wait 7;-frag;+speed_throw;wait 20;+usereload;wait 5;-usereload;wait 53;-speed_throw;wait 5;+attack;-attack;wait 5;+usereload;-usereload;wait 24;+forward;wait 13;-forward;wait 2;+forward;+breath_sprint;wait 15;-forward;-breath_sprint;+usereload;wait 50;-usereload;weapnext;wait 5;weapnext;+usereload;-usereload;wait 2;+attack;-attack;wait 15;weapnext;wait 10;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

stillswapleft() 
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+attack;wait 1;+forward;+breath_sprint;-attack;weapnext;wait 35;-breath_sprint;-forward");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+attack;wait 1;+forward;+breath_sprint;-attack;weapnext;wait 35;-breath_sprint;-forward");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

stillswapleftS() 
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+attack;wait 1;+forward;+breath_sprint;-attack;weapnext;wait 70;-breath_sprint;-forward");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+attack;wait 1;+forward;+breath_sprint;-attack;weapnext;wait 70;-breath_sprint;-forward");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

stillswapstreak() 
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+attack;wait 1;+forward;+breath_sprint;-attack;+actionslot 4;-actionslot 4;wait 35;-breath_sprint;-forward");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+attack;wait 1;+forward;+breath_sprint;-attack;+actionslot 4;-actionslot 4;wait 35;-breath_sprint;-forward");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

stillswapbarrett()
{
    self thread DPADCheck();
    self waittill("bindselected");
    if (self.chose == "L")
    {
        self setClientDvar( "menu2" , "+attack;-attack;wait 0.5;+forward;+breath_sprint;wait 2.5;weapnext;wait 15;-forward;-breath_sprint" );
        self.pers["LBound"] = true;
        wait .1;
        self.chose = undefined;
    }
    else if (self.chose == "U")
    {
        self setClientDvar( "menu" , "+attack;-attack;wait 0.5;+forward;+breath_sprint;wait 2.5;weapnext;wait 15;-forward;-breath_sprint" );
        self.pers["UBound"] = true;
        wait .1;
        self.chose = undefined;
    }
}

akimbotroika() 
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;wait 2;+speed_throw;wait 1;-speed_throw;-usereload;weapnext;wait 4;weapnext;+melee;wait 1;-melee");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;wait 2;+speed_throw;wait 1;-speed_throw;-usereload;weapnext;wait 4;weapnext;+melee;wait 1;-melee");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

troika() 
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;wait 2;+attack;wait 1;-attack;-usereload;weapnext;wait 4;weapnext;+melee;wait 1;-melee");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;wait 2;+attack;wait 1;-attack;-usereload;weapnext;wait 4;weapnext;+melee;wait 1;-melee");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

slowtroika() 
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;wait 4;+attack;wait 2;-attack;-usereload;weapnext;wait 8;weapnext;+melee;wait 2;-melee");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;wait 4;+attack;wait 2;-attack;-usereload;weapnext;wait 8;weapnext;+melee;wait 2;-melee");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

//Misc Binds
wildscope() 
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+frag;wait 10;weapnext;wait 5;-frag;wait 22;+usereload;-usereload;wait 10;+melee;-melee;+speed_throw;wait 40;-speed_throw");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+frag;wait 10;weapnext;wait 5;-frag;wait 22;+usereload;-usereload;wait 10;+melee;-melee;+speed_throw;wait 40;-speed_throw");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

wildscope50() 
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+frag;wait 20;weapnext;wait 10;-frag;wait 42;+usereload;-usereload;wait 18;+melee;-melee;+speed_throw;wait 100;-speed_throw");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+frag;wait 20;weapnext;wait 10;-frag;wait 42;+usereload;-usereload;wait 18;+melee;-melee;+speed_throw;wait 100;-speed_throw");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}


moninac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+attack;-attack;wait 10;weapnext;wait 10;weapnext;wait 10;+usereload;-usereload");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+attack;-attack;wait 10;weapnext;wait 10;weapnext;wait 10;+usereload;-usereload");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

ubadelia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 24;+forward;wait 13;-forward;wait 2;+forward;+breath_sprint;wait 15;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 24;+forward;wait 13;-forward;wait 2;+forward;+breath_sprint;wait 15;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

ubadelianac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 24;+forward;wait 13;-forward;wait 2;+forward;+breath_sprint;wait 15;-forward;-breath_sprint;wait 5;+usereload;-usereload;wait 24;+forward;wait 13;-forward;wait 2;weapnext;wait 1;+forward;+breath_sprint;wait 2;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 24;+forward;wait 13;-forward;wait 2;+forward;+breath_sprint;wait 15;-forward;-breath_sprint;wait 5;+usereload;-usereload;wait 24;+forward;wait 13;-forward;wait 2;weapnext;wait 1;+forward;+breath_sprint;wait 2;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

ubnacs()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 24;+forward;wait 13;-forward;wait 2;weapnext;weapnext;wait 1;+forward;+breath_sprint;wait 2;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 24;+forward;wait 13;-forward;wait 2;weapnext;weapnext;wait 1;+forward;+breath_sprint;wait 2;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

ubnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 24;+forward;wait 13;-forward;wait 2;weapnext;wait 1;+forward;+breath_sprint;wait 2;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 24;+forward;wait 13;-forward;wait 2;weapnext;wait 1;+forward;+breath_sprint;wait 2;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

instantplanttac() 
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+frag;wait 6;-frag;wait 16;+gostand;-gostand;wait 32;weapnext;wait 4;+frag;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+frag;wait 6;-frag;wait 16;+gostand;-gostand;wait 32;weapnext;wait 4;+frag;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

instantplantstun() 
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+smoke;-smoke;wait 4;+gostand;-gostand;wait 60;+frag;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+smoke;-smoke;wait 4;+gostand;-gostand;wait 60;+frag;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

instatac() 
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+frag;wait 6;-frag;wait 16;+gostand;-gostand;wait 32;weapnext;wait 4;+frag;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+frag;wait 6;-frag;wait 16;+gostand;-gostand;wait 32;weapnext;wait 4;+frag;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

tacplant33()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;wait 34;-usereload;+frag;-frag;wait 18;weapnext;wait 4.5;+frag;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;wait 34;-usereload;+frag;-frag;wait 18;weapnext;wait 4.5;+frag;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

mac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 5;weapnext;-speed_throw;wait 33;+speed_throw;wait 20;+forward;+usereload;wait 1;+breath_sprint;wait 9;weapnext;wait 6;-usereload;-attack;-speed_throw;-breath_sprint;-forward");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 5;weapnext;-speed_throw;wait 33;+speed_throw;wait 20;+forward;+usereload;wait 1;+breath_sprint;wait 9;weapnext;wait 6;-usereload;-attack;-speed_throw;-breath_sprint;-forward");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

internac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;wait 32;+weapnext;wait 5;-usereload;-weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;wait 32;+weapnext;wait 5;-usereload;-weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

INTERSNAC()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+attack;-attack;wait 1;+speed_throw;wait 75;+usereload;-usereload;wait 2;weapnext;wait 5;weapnext;-speed_throw");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+attack;-attack;wait 10;+usereload;-usereload;wait 29;-forward;wait 2;+forward;+breath_sprint;wait 10;+gostand;-gostand;wait 7;-forward;-breath_sprint;wait 53;+usereload;-usereload;wait 2;weapnext;wait 5;weapnext;-speed_throw;wait 33;+speed_throw;wait 22;+usereload;wait 1;+attack;wait 9;weapnext;wait 6;-usereload;-attack;-speed_throw");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

whiteout()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+attack;-attack;wait 10;+usereload;-usereload;wait 29;-forward;wait 2;+forward;+breath_sprint;wait 10;-forward;-breath_sprint;wait 10;+gostand;-gostand;wait 20;+speed_throw;wait 57;+usereload;-usereload;wait 2;weapnext;wait 5;weapnext;-speed_throw;wait 33;+speed_throw;wait 20;+usereload;wait 1;+attack;wait 9;weapnext;wait 6;-usereload;-attack;-speed_throw");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+attack;-attack;wait 10;+usereload;-usereload;wait 29;-forward;wait 2;+forward;+breath_sprint;wait 10;-forward;-breath_sprint;wait 10;+gostand;-gostand;wait 20;+speed_throw;wait 57;+usereload;-usereload;wait 2;weapnext;wait 5;weapnext;-speed_throw;wait 33;+speed_throw;wait 20;+usereload;wait 1;+attack;wait 9;weapnext;wait 6;-usereload;-attack;-speed_throw");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

spasnaccp()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+attack;-attack;wait 10;+usereload;-usereload;wait 31;+actionslot 4;wait 5;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+attack;-attack;wait 10;+usereload;-usereload;wait 31;+actionslot 4;wait 5;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

spasadelia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+attack;-attack;wait 10;+usereload;-usereload;wait 29;-forward;wait 2;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+attack;-attack;wait 10;+usereload;-usereload;wait 29;-forward;wait 2;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

spasadelia50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+attack;-attack;wait 20;+usereload;-usereload;wait 53;-forward;wait 4;+forward;+breath_sprint;wait 40;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+attack;-attack;wait 20;+usereload;-usereload;wait 53;-forward;wait 4;+forward;+breath_sprint;wait 40;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

snacadeliamnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 18;weapnext;+speed_throw;wait 100;+usereload;-usereload;wait 2;weapnext;wait 5;weapnext;-speed_throw");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 18;weapnext;+speed_throw;wait 100;+usereload;-usereload;wait 2;weapnext;wait 5;weapnext;-speed_throw");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

adeliamnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+attack;-attack;weapnext;wait 10;weapnext;+usereload;-usereload;wait 30;+forward;+breath_sprint;wait 20;-forward;-breath_sprint;wait 5;+attack;-attack;wait 86;+usereload;-usereload;wait 3;+attack;-attack;wait 6;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+attack;-attack;weapnext;wait 10;weapnext;+usereload;-usereload;wait 30;+forward;+breath_sprint;wait 20;-forward;-breath_sprint;wait 5;+attack;-attack;wait 86;+usereload;-usereload;wait 3;+attack;-attack;wait 6;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

apsmnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+attack;-attack;wait 10;+usereload;-usereload;wait 29;-forward;wait 2;+forward;+breath_sprint;wait 10;-forward;-breath_sprint;wait 10;+gostand;-gostand;wait 20;+speed_throw;wait 57;+usereload;-usereload;wait 2;+actionslot 4;-actionslot 4;wait 5;-speed_throw;wait 5;weapnext;wait 34;+speed_throw;wait 20;+usereload;wait 1;+attack;wait 9;weapnext;wait 6;-usereload;-attack;-speed_throw");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+attack;-attack;wait 10;+usereload;-usereload;wait 29;-forward;wait 2;+forward;+breath_sprint;wait 10;-forward;-breath_sprint;wait 10;+gostand;-gostand;wait 20;+speed_throw;wait 57;+usereload;-usereload;wait 2;+actionslot 4;-actionslot 4;wait 5;-speed_throw;wait 5;weapnext;wait 34;+speed_throw;wait 20;+usereload;wait 1;+attack;wait 9;weapnext;wait 6;-usereload;-attack;-speed_throw");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

loltest6()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+attack;-attack;wait 10;+usereload;-usereload;wait 29;-forward;wait 2;+forward;+breath_sprint;wait 20;-forward;-breath_sprint;wait 5;weapnext;wait 5;weapnext;+speed_throw;wait 52;+usereload;-usereload;wait 2;weapnext;wait 5;-speed_throw;wait 5;weapnext;+speed_throw;wait 52;+usereload;-usereload;wait 2;weapnext;wait 5;-speed_throw;wait 7.5;weapnext;+speed_throw;wait 54;+usereload;wait 1;+attack;wait 9;weapnext;wait 6;-usereload;-attack;-speed_throw;weapnext;wait 5;weapnext;+attack;-attack;+usereload;-usereload;wait 38.5;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+attack;-attack;wait 10;+usereload;-usereload;wait 29;-forward;wait 2;+forward;+breath_sprint;wait 20;-forward;-breath_sprint;wait 5;weapnext;wait 5;weapnext;+speed_throw;wait 52;+usereload;-usereload;wait 2;weapnext;wait 5;-speed_throw;wait 5;weapnext;+speed_throw;wait 52;+usereload;-usereload;wait 2;weapnext;wait 5;-speed_throw;wait 7.5;weapnext;+speed_throw;wait 54;+usereload;wait 1;+attack;wait 9;weapnext;wait 6;-usereload;-attack;-speed_throw;weapnext;wait 5;weapnext;+attack;-attack;+usereload;-usereload;wait 38.5;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

omatac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 76;+frag;wait 5;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 76;+frag;wait 5;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

revr()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;wait 20;+actionslot 4;wait 2;weapnext;-actionslot 4;-usereload");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;wait 20;+actionslot 4;wait 2;weapnext;-actionslot 4;-usereload");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

revrS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;wait 35;+actionslot 4;wait 2;weapnext;-actionslot 4;-usereload");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;wait 35;+actionslot 4;wait 2;weapnext;-actionslot 4;-usereload");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

WRISTTWIST()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;+usereload;-usereload;wait 1;+breath_sprint;wait 12;weapnext;wait 4;-breath_sprint;-forward;wait 3;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;+usereload;-usereload;wait 1;+breath_sprint;wait 12;weapnext;wait 4;-breath_sprint;-forward;wait 3;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

MNAC()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 7.5;weapnext;wait 54;+usereload;wait 1;+attack;wait 9;weapnext;wait 6;-usereload;-attack");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 7.5;weapnext;wait 54;+usereload;wait 1;+attack;wait 9;weapnext;wait 6;-usereload;-attack");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

MNAC50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 15;weapnext;wait 108;+usereload;wait 2;+attack;wait 18;weapnext;wait 12;-usereload;-attack");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 15;weapnext;wait 108;+usereload;wait 2;+attack;wait 18;weapnext;wait 12;-usereload;-attack");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

SNAC2()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 18;weapnext;+speed_throw;wait 53;+usereload;-usereload;wait 2;weapnext;wait 5;weapnext;-speed_throw");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 18;weapnext;+speed_throw;wait 53;+usereload;-usereload;wait 2;weapnext;wait 5;weapnext;-speed_throw");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

RIGHTY()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;+usereload;-usereload;wait 2;+breath_sprint;wait 2;-forward;+back;wait 2;wait 2;-breath_sprint;wait 5;-back");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;+usereload;-usereload;wait 2;+breath_sprint;wait 2;-forward;+back;wait 2;wait 2;-breath_sprint;wait 5;-back");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

FakeSH()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 2;+attack;-attack;wait 5;+frag;wait 15;weapnext;wait 5;-frag;wait 2");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 2;+attack;-attack;wait 5;+frag;wait 15;weapnext;wait 5;-frag;wait 2");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

FakeSHKS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;wait 2;+attack;-attack;wait 5;+frag;wait 35;+actionslot 4;wait 4;weapnext;wait 5;-frag;-usereload;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;wait 2;+attack;-attack;wait 5;+frag;wait 35;+actionslot 4;wait 4;weapnext;wait 5;-frag;-usereload;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

//Interventions scripts
xInterReloadNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+attack;-attack;+usereload;-usereload;wait 36;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+attack;-attack;+usereload;-usereload;wait 36;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

xInterReloadNac50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+attack;-attack;+usereload;-usereload;wait 72;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+attack;-attack;+usereload;-usereload;wait 72;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

interENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+attack;-attack;+usereload;-usereload;wait 38;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+attack;-attack;+usereload;-usereload;wait 38;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

interENac50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+attack;-attack;+usereload;-usereload;wait 75;+frag;wait 30;weapnext;wait 30;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+attack;-attack;+usereload;-usereload;wait 75;+frag;wait 30;weapnext;wait 30;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

interKSNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+attack;-attack;+usereload;-usereload;wait 36;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+attack;-attack;+usereload;-usereload;wait 36;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

internacwoerreingeht()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 108;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 108;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

internacwoerreingeht50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 216;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 216;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

interfullENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 110;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 110;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

interfullENac50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 219;+frag;wait 30;weapnext;wait 30;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 219;+frag;wait 30;weapnext;wait 30;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

interfullKSNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 108;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 108;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

interfullKSNac50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 216;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 216;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

xInterventionTittyNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+speed_throw;wait 72;weapnext;wait 10;-speed_throw");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+speed_throw;wait 72;weapnext;wait 10;-speed_throw");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

xInterventionTittyNac50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 20;weapnext;+speed_throw;wait 144;weapnext;wait 20;-speed_throw");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 20;weapnext;+speed_throw;wait 144;weapnext;wait 20;-speed_throw");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

interETN()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+speed_throw;wait 74;+frag;wait 15;weapnext;wait 15;-frag;wait 10;-speed_throw");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+speed_throw;wait 74;+frag;wait 15;weapnext;wait 15;-frag;wait 10;-speed_throw");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

interETN50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 20;weapnext;+speed_throw;wait 147;+frag;wait 30;weapnext;wait 30;-frag;wait 20;-speed_throw");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 20;weapnext;+speed_throw;wait 147;+frag;wait 30;weapnext;wait 30;-frag;wait 20;-speed_throw");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

InterTNacNoAds()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;wait 72;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;wait 72;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

InterTNacNoAds50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 20;weapnext;wait 144;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 20;weapnext;wait 144;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

interETNNA()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;wait 74;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;wait 74;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

interETNNA50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 20;weapnext;wait 147;+frag;wait 30;weapnext;wait 30;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 20;weapnext;wait 147;+frag;wait 30;weapnext;wait 30;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

xInterventionSnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 5;weapnext;+speed_throw;wait 70;+usereload;-usereload;wait 2;weapnext;wait 5;-speed_throw;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 5;weapnext;+speed_throw;wait 70;+usereload;-usereload;wait 2;weapnext;wait 5;-speed_throw;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

xInterventionSnac50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+speed_throw;wait 140;+usereload;-usereload;wait 2;weapnext;wait 10;-speed_throw;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+speed_throw;wait 140;+usereload;-usereload;wait 2;weapnext;wait 10;-speed_throw;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

xInterventionSnacnoads()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 5;weapnext;wait 70;+usereload;-usereload;wait 2;weapnext;wait 5;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 5;weapnext;wait 70;+usereload;-usereload;wait 2;weapnext;wait 5;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

xInterventionSnacnoads50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;wait 140;+usereload;-usereload;wait 4;weapnext;wait 10;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;wait 140;+usereload;-usereload;wait 4;weapnext;wait 10;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

xInterAdalia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+attack;-attack;+usereload;-usereload;wait 38.5;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+attack;-attack;+usereload;-usereload;wait 38.5;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

xInterAdalia50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+attack;-attack;+usereload;-usereload;wait 75;+forward;+breath_sprint;wait 40;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+attack;-attack;+usereload;-usereload;wait 75;+forward;+breath_sprint;wait 40;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

intergoinginadalia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 110;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 110;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

intergoinginadalia50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 219;+forward;+breath_sprint;wait 40;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 219;+forward;+breath_sprint;wait 40;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

INTERKSRN()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 36;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 36;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

INTERKSRN50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 72;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 72;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

INTERKSRNGI()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 108;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 108;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

INTERKSTN()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+speed_throw;wait 72;+actionslot 4;-actionslot 4;wait 10;-speed_throw");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+speed_throw;wait 72;+actionslot 4;-actionslot 4;wait 10;-speed_throw");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

INTERKSTN50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 20;weapnext;+speed_throw;wait 144;+actionslot 4;-actionslot 4;wait 20;-speed_throw");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 20;weapnext;+speed_throw;wait 144;+actionslot 4;-actionslot 4;wait 20;-speed_throw");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

INTERKSTNNA()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;wait 72;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;wait 72;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

INTERKSTNNA50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 20;weapnext;wait 144;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 20;weapnext;wait 144;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

INTERKSSNAC()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 5;weapnext;+speed_throw;wait 70;+usereload;-usereload;wait 2;+actionslot 4;-actionslot 4;wait 5;-speed_throw;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 5;weapnext;+speed_throw;wait 70;+usereload;-usereload;wait 2;+actionslot 4;-actionslot 4;wait 5;-speed_throw;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

INTERKSSNAC50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+speed_throw;wait 140;+usereload;-usereload;wait 4;+actionslot 4;-actionslot 4;wait 10;-speed_throw;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+speed_throw;wait 140;+usereload;-usereload;wait 4;+actionslot 4;-actionslot 4;wait 10;-speed_throw;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

INTERKSSNACNA()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 5;weapnext;wait 70;+usereload;-usereload;wait 2;+actionslot 4;-actionslot 4;wait 5;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 5;weapnext;wait 70;+usereload;-usereload;wait 2;+actionslot 4;-actionslot 4;wait 5;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

INTERKSSNACNA50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;wait 140;+usereload;-usereload;wait 4;+actionslot 4;-actionslot 4;wait 10;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;wait 140;+usereload;-usereload;wait 4;+actionslot 4;-actionslot 4;wait 10;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

// Model Nacs
xmodelnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+attack;-attack;wait 10;+usereload;-usereload;wait 52;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+attack;-attack;wait 10;+usereload;-usereload;wait 52;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

xmodelnac50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+attack;-attack;wait 10;+usereload;-usereload;wait 103;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+attack;-attack;wait 10;+usereload;-usereload;wait 103;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

fullmodelnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 88;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 88;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

xmodeltittynac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 12;weapnext;wait 2;+speed_throw;wait 100;weapnext;wait 6;-speed_throw");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 12;weapnext;wait 2;+speed_throw;wait 100;weapnext;wait 6;-speed_throw");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

modelnoadstittynac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 12;weapnext;wait 102;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 12;weapnext;wait 102;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

modelsnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+speed_throw;wait 100;+usereload;-usereload;wait 2;weapnext;wait 6;weapnext;-speed_throw");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+speed_throw;wait 100;+usereload;-usereload;wait 2;weapnext;wait 6;weapnext;-speed_throw");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

modelnoadssnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;wait 100;+usereload;-usereload;wait 2;weapnext;wait 6;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;wait 100;+usereload;-usereload;wait 2;weapnext;wait 6;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

modeladalia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 54;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 54;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

fullmodeladelia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 90;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 90;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

// Model KS Nac
ModelKSNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+attack;-attack;wait 10;+usereload;-usereload;wait 52;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+attack;-attack;wait 10;+usereload;-usereload;wait 52;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

ModelFullKsnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 88;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 88;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

ModelENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+attack;-attack;wait 10;+usereload;-usereload;wait 54;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+attack;-attack;wait 10;+usereload;-usereload;wait 54;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

ModelFullEnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 90;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 90;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

ModelKSTN()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 12;weapnext;wait 2;+speed_throw;wait 100;+actionslot 4;-actionslot 4;wait 6;-speed_throw");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 12;weapnext;wait 2;+speed_throw;wait 100;+actionslot 4;-actionslot 4;wait 6;-speed_throw");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

ModelKSTNNA()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 12;weapnext;wait 102;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 12;weapnext;wait 102;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

ModelETN()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 12;weapnext;wait 2;+speed_throw;wait 102;+frag;wait 15;weapnext;wait 15;-frag;wait 6;-speed_throw");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 12;weapnext;wait 2;+speed_throw;wait 102;+frag;wait 15;weapnext;wait 15;-frag;wait 6;-speed_throw");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

ModelETNNA()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 12;weapnext;wait 104;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 12;weapnext;wait 104;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

ModelKSSNAC()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+speed_throw;wait 100;+usereload;-usereload;wait 2;+actionslot 4;-actionslot 4;wait 6;weapnext;-speed_throw");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+speed_throw;wait 100;+usereload;-usereload;wait 2;+actionslot 4;-actionslot 4;wait 6;weapnext;-speed_throw");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

ModelKSSNACNA()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;wait 100;+usereload;-usereload;wait 2;+actionslot 4;-actionslot 4;wait 6;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;wait 100;+usereload;-usereload;wait 2;+actionslot 4;-actionslot 4;wait 6;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

//Machine Pistols

PP2ReloadNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 77;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 77;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

PP2ReloadNac50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 151.5;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 151.5;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

PP2Adalia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 79;+forward;+breath_sprint;wait 25;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 79;+forward;+breath_sprint;wait 25;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

PP2ENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 79;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 79;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

PP2KSNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 77;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 77;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

PP2RTNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 59;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 59;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

PP2RTENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 61;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 61;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

PP2RTKSNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 59;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 59;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

PP2RTAdalia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 59;+forward;+breath_sprint;-forward;-breath_sprint;+gostand;-gostand;+forward;+breath_sprint;wait 10;weapnext;wait 10;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 59;+forward;+breath_sprint;-forward;-breath_sprint;+gostand;-gostand;+forward;+breath_sprint;wait 10;weapnext;wait 10;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

G18ReloadNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 111;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 111;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

G18Adalia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 113;+forward;+breath_sprint;wait 25;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 113;+forward;+breath_sprint;wait 25;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

G18ENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 113;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 113;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

G18KSNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 111;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 111;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

G18RTNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 93;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 93;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

G18RTENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 95;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 95;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

G18RTKSNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 93;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 93;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

G18RTAdalia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 94;+forward;+breath_sprint;-forward;-breath_sprint;+gostand;-gostand;+forward;+breath_sprint;wait 10;weapnext;wait 10;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 94;+forward;+breath_sprint;-forward;-breath_sprint;+gostand;-gostand;+forward;+breath_sprint;wait 10;weapnext;wait 10;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M93ReloadNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 73;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 73;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M93Adalia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 75;+forward;+breath_sprint;wait 25;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 75;+forward;+breath_sprint;wait 25;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M93ENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 75;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 75;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M93KSNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 73;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 73;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M93RTNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 55;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 55;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M93RTENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 57;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 57;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M93RTKSNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 55;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 55;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M93RTAdalia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 55;+forward;+breath_sprint;-forward;-breath_sprint;+gostand;-gostand;+forward;+breath_sprint;wait 10;weapnext;wait 10;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 55;+forward;+breath_sprint;-forward;-breath_sprint;+gostand;-gostand;+forward;+breath_sprint;wait 10;weapnext;wait 10;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

TMPReloadNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 81;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 81;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

TMPAdalia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 82;+forward;+breath_sprint;wait 25;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 82;+forward;+breath_sprint;wait 25;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

TMPENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 83;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 83;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

TMPKSNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 81;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 81;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

TMPRTNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 63;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 63;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

TMPRTENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 65;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 65;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

TMPRTKSNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 63;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 63;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

TMPRTAdalia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 63;+forward;+breath_sprint;-forward;-breath_sprint;+gostand;-gostand;+forward;+breath_sprint;wait 10;weapnext;wait 10;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 63;+forward;+breath_sprint;-forward;-breath_sprint;+gostand;-gostand;+forward;+breath_sprint;wait 10;weapnext;wait 10;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

//Pistols

DeagleReloadNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 86;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 86;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

DeagleENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 88;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 88;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

DeagleKSNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 86;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 86;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

DeagleAdalia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 88;+forward;+breath_sprint;wait 25;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 88;+forward;+breath_sprint;wait 25;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

DeagleRTReloadNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 69;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 69;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

DeagleRTENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 71;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 71;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

DeagleRTKSNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 69;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 69;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}


DeagleRTAdalia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 70;+forward;+breath_sprint;-forward;-breath_sprint;+gostand;-gostand;+forward;+breath_sprint;wait 10;weapnext;wait 10;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 70;+forward;+breath_sprint;-forward;-breath_sprint;+gostand;-gostand;+forward;+breath_sprint;wait 10;weapnext;wait 10;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M9ReloadNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 73;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 73;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M9KSNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 73;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 73;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M9ENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 75;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 75;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M9Adalia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 75;+forward;+breath_sprint;wait 60;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 75;+forward;+breath_sprint;wait 60;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M9RTAdalia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 55;+forward;+breath_sprint;-forward;-breath_sprint;+gostand;-gostand;+forward;+breath_sprint;wait 10;weapnext;wait 10;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 55;+forward;+breath_sprint;-forward;-breath_sprint;+gostand;-gostand;+forward;+breath_sprint;wait 10;weapnext;wait 10;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M9RTReloadNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 55;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 55;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M9RTENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 57;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 57;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M9RTKSNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 55;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 55;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

ColtReloadNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 86;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 86;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

ColtENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 88;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 88;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

ColtKSNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 86;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 86;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

ColtAdalia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 88;+forward;+breath_sprint;wait 20;weapnext;wait 10;weapnext;wait 2;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 88;+forward;+breath_sprint;wait 20;weapnext;wait 10;weapnext;wait 2;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

ColtRTReloadNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 69;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 69;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

ColtRTENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 71;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 71;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

ColtRTKSNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 69;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 69;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

ColtRTAdalia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 70;+forward;+breath_sprint;-forward;-breath_sprint;+gostand;-gostand;+forward;+breath_sprint;wait 10;weapnext;wait 10;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 70;+forward;+breath_sprint;-forward;-breath_sprint;+gostand;-gostand;+forward;+breath_sprint;wait 10;weapnext;wait 10;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

USPReloadNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 73;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 73;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

USPReloadNac50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 145.5;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 145.5;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

USPKSNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 73;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 73;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

USPENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 75;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 75;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

USPAdalia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 74;+forward;+breath_sprint;wait 20;weapnext;wait 10;weapnext;wait 2;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 74;+forward;+breath_sprint;wait 20;weapnext;wait 10;weapnext;wait 2;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}


USPRTReloadNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 56;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 56;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

USPRTKSNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 56;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 56;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

USPRTENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 58;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 58;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}


USPRTAdalia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 56;+forward;+breath_sprint;-forward;-breath_sprint;+gostand;-gostand;+forward;+breath_sprint;wait 10;weapnext;wait 10;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 56;+forward;+breath_sprint;-forward;-breath_sprint;+gostand;-gostand;+forward;+breath_sprint;wait 10;weapnext;wait 10;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

//Spas12 KS
SpasKSRN()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+attack;-attack;wait 10;+usereload;-usereload;wait 28;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+attack;-attack;wait 10;+usereload;-usereload;wait 28;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

SpasKSRN50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+attack;-attack;wait 20;+usereload;-usereload;wait 55.5;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+attack;-attack;wait 20;+usereload;-usereload;wait 55.5;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

SpasENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+attack;-attack;wait 10;+usereload;-usereload;wait 30;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+attack;-attack;wait 10;+usereload;-usereload;wait 30;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

SpasENac50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+attack;-attack;wait 20;+usereload;-usereload;wait 57;+frag;wait 30;weapnext;wait 30;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+attack;-attack;wait 20;+usereload;-usereload;wait 57;+frag;wait 30;weapnext;wait 30;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

SpasKSTN()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 12;weapnext;wait 2;+speed_throw;wait 53;+actionslot 4;-actionslot 4;wait 6;-speed_throw");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 12;weapnext;wait 2;+speed_throw;wait 53;+actionslot 4;-actionslot 4;wait 6;-speed_throw");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

SpasKSTN50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 24;weapnext;wait 4;+speed_throw;wait 105.5;+actionslot 4;-actionslot 4;wait 12;-speed_throw");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 24;weapnext;wait 4;+speed_throw;wait 105.5;+actionslot 4;-actionslot 4;wait 12;-speed_throw");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

SpasKSTNNA()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;wait 54;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;wait 54;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

SpasKSTNNA50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 20;weapnext;wait 108;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 20;weapnext;wait 108;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

SpasETitty()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 12;weapnext;wait 2;+speed_throw;wait 55;+frag;wait 15;weapnext;wait 15;-frag;wait 6;-speed_throw");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 12;weapnext;wait 2;+speed_throw;wait 55;+frag;wait 15;weapnext;wait 15;-frag;wait 6;-speed_throw");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

SpasETitty50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 24;weapnext;wait 4;+speed_throw;wait 107;+frag;wait 30;weapnext;wait 30;-frag;wait 12;-speed_throw");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 24;weapnext;wait 4;+speed_throw;wait 107;+frag;wait 30;weapnext;wait 30;-frag;wait 12;-speed_throw");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

SpasETittyNA()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;wait 56;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;wait 56;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

SpasETittyNA50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 20;weapnext;wait 111;+frag;wait 30;weapnext;wait 30;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 20;weapnext;wait 111;+frag;wait 30;weapnext;wait 30;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

SpasKSSNAC()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 5;weapnext;+speed_throw;wait 52;+usereload;-usereload;wait 2;+actionslot 4;-actionslot 4;wait 5;-speed_throw;wait 5;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 5;weapnext;+speed_throw;wait 52;+usereload;-usereload;wait 2;+actionslot 4;-actionslot 4;wait 5;-speed_throw;wait 5;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

SpasKSSNAC50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+speed_throw;wait 104;+usereload;-usereload;wait 4;+actionslot 4;-actionslot 4;wait 10;-speed_throw;wait 10;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+speed_throw;wait 104;+usereload;-usereload;wait 4;+actionslot 4;-actionslot 4;wait 10;-speed_throw;wait 10;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

SpasKSSNACNA()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 5;weapnext;wait 52;+usereload;-usereload;wait 2;+actionslot 4;-actionslot 4;wait 5;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 5;weapnext;wait 52;+usereload;-usereload;wait 2;+actionslot 4;-actionslot 4;wait 5;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

SpasKSSNACNA50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;wait 104;+usereload;-usereload;wait 4;+actionslot 4;-actionslot 4;wait 10;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;wait 104;+usereload;-usereload;wait 4;+actionslot 4;-actionslot 4;wait 10;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

SpasKSMNAC()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 5;weapnext;+speed_throw;wait 54;+usereload;-usereload;wait 3;+attack;-attack;wait 6;+actionslot 4;-actionslot 4;-speed_throw");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 5;weapnext;+speed_throw;wait 54;+usereload;-usereload;wait 3;+attack;-attack;wait 6;+actionslot 4;-actionslot 4;-speed_throw");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

SpasKSMNAC50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+speed_throw;wait 108;+usereload;-usereload;wait 6;+attack;-attack;wait 12;+actionslot 4;-actionslot 4;-speed_throw");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+speed_throw;wait 108;+usereload;-usereload;wait 6;+attack;-attack;wait 12;+actionslot 4;-actionslot 4;-speed_throw");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

SpasKSMNACNA()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 5;weapnext;wait 54;+usereload;-usereload;wait 3;+attack;-attack;wait 6;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 5;weapnext;wait 54;+usereload;-usereload;wait 3;+attack;-attack;wait 6;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

SpasKSMNACNA50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;wait 108;+usereload;-usereload;wait 6;+attack;-attack;wait 12;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;wait 108;+usereload;-usereload;wait 6;+attack;-attack;wait 12;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

//Spas 12 normal
xSpasReloadNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+attack;-attack;wait 10;+usereload;-usereload;wait 28;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+attack;-attack;wait 10;+usereload;-usereload;wait 28;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

xSpasReloadNac50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+attack;-attack;wait 10;+usereload;-usereload;wait 55.5;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+attack;-attack;wait 10;+usereload;-usereload;wait 55.5;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

xSpasTittyNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 12;weapnext;wait 2;+speed_throw;wait 53;weapnext;wait 6;-speed_throw");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 12;weapnext;wait 2;+speed_throw;wait 53;weapnext;wait 6;-speed_throw");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

xSpasTittyNac50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 24;weapnext;wait 4;+speed_throw;wait 105;weapnext;wait 12;-speed_throw");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 24;weapnext;wait 4;+speed_throw;wait 105;weapnext;wait 12;-speed_throw");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

SpasTNacNoAds()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 12;weapnext;wait 54;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 12;weapnext;wait 54;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

SpasTNacNoAds50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 25;weapnext;wait 108;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 25;weapnext;wait 108;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

SpasLognac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+speed_throw;wait 5;+attack;-attack;wait 111;weapnext;wait 6;-speed_throw");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+speed_throw;wait 5;+attack;-attack;wait 111;weapnext;wait 6;-speed_throw");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

xSpasSnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 5;weapnext;+speed_throw;wait 52;+usereload;-usereload;wait 2;weapnext;wait 5;-speed_throw;wait 5;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 5;weapnext;+speed_throw;wait 52;+usereload;-usereload;wait 2;weapnext;wait 5;-speed_throw;wait 5;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

xSpasSnac50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+speed_throw;wait 104;+usereload;-usereload;wait 4;weapnext;wait 10;-speed_throw;wait 10;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+speed_throw;wait 104;+usereload;-usereload;wait 4;weapnext;wait 10;-speed_throw;wait 10;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

xSpasSnacnoads()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 5;weapnext;wait 52;+usereload;-usereload;wait 2;weapnext;wait 5;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 5;weapnext;wait 52;+usereload;-usereload;wait 2;weapnext;wait 5;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

xSpasSnacnoads50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;wait 104;+usereload;-usereload;wait 4;weapnext;wait 10;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;wait 104;+usereload;-usereload;wait 4;weapnext;wait 10;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

xmnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 7.5;weapnext;+speed_throw;wait 54;+usereload;-usereload;wait 3;+attack;-attack;wait 6;weapnext;-speed_throw");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 7.5;weapnext;+speed_throw;wait 54;+usereload;-usereload;wait 3;+attack;-attack;wait 6;weapnext;-speed_throw");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

xmnac50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 15;weapnext;+speed_throw;wait 107;+usereload;wait 2;+attack;wait 18;weapnext;wait 12;-usereload;-attack;-speed_throw");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 15;weapnext;+speed_throw;wait 107;+usereload;wait 2;+attack;wait 18;weapnext;wait 12;-usereload;-attack;-speed_throw");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

xmadelia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 7.5;weapnext;+speed_throw;wait 54;+usereload;-usereload;wait 3;+attack;-attack;;-speed_throw;wait 8;+forward;+breath_sprint;wait 25;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 7.5;weapnext;+speed_throw;wait 54;+usereload;-usereload;wait 3;+attack;-attack;;-speed_throw;wait 8;+forward;+breath_sprint;wait 25;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

xmadelia50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 15;weapnext;+speed_throw;wait 108;+usereload;-usereload;wait 6;+attack;-attack;;-speed_throw;wait 16;+forward;+breath_sprint;wait 50;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 15;weapnext;+speed_throw;wait 108;+usereload;-usereload;wait 6;+attack;-attack;;-speed_throw;wait 16;+forward;+breath_sprint;wait 50;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

madeliaNA()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 7.5;weapnext;wait 54;+usereload;-usereload;wait 3;+attack;-attack;wait 8;+forward;+breath_sprint;wait 25;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 7.5;weapnext;wait 54;+usereload;-usereload;wait 3;+attack;-attack;wait 8;+forward;+breath_sprint;wait 25;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

madeliaNA50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 15;weapnext;wait 108;+usereload;-usereload;wait 6;+attack;-attack;wait 16;+forward;+breath_sprint;wait 50;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 15;weapnext;wait 108;+usereload;-usereload;wait 6;+attack;-attack;wait 16;+forward;+breath_sprint;wait 50;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

xSpasAdalia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+attack;-attack;+usereload;-usereload;wait 38.5;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+attack;-attack;+usereload;-usereload;wait 38.5;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}


RAPIDFIRE()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 2;+attack;-attack;weapnext;wait 5;weapnext;+usereload;-usereload;wait 2;+attack;-attack;weapnext;wait 5;weapnext;+usereload;-usereload;wait 2;+attack;-attack;weapnext;wait 5;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 2;+attack;-attack;weapnext;wait 5;weapnext;+usereload;-usereload;wait 2;+attack;-attack;weapnext;wait 5;weapnext;+usereload;-usereload;wait 2;+attack;-attack;weapnext;wait 5;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

famasRnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 125;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 125;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

famasRnac50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 248;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 248;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

famasENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 127;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 127;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

famasAdelia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 126;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 126;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

famasStreak()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 125;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 125;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

TarRnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 103;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 103;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

TarENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 105;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 105;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

TarAdelia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 105;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 105;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

TarStreak()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 103;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 103;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

FALRnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 108;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 108;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

FALENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 110;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 110;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

FALAdelia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 110;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 110;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

FALStreak()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 108;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 108;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M16Rnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 67;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 67;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M16ENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 69;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 69;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M16Adelia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 69;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 69;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M16Streak()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 67;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 67;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

ACRRnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 67;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 67;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

ACRENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 69;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 69;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

ACRAdelia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 68;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 68;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

ACRStreak()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 67;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 67;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

F2KRnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 125;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 125;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

F2KENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 127;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 127;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

F2KAdelia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 126;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 126;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

F2KStreak()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 125;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 125;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

AK47Rnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 107;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 107;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

AK47ENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 109;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 109;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

AK47Adelia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 108;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 108;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

AK47Streak()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 107;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 107;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

SCARRnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 113;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 113;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

SCARENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 115;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 115;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

SCARAdelia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 114;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 114;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

SCARStreak()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 113;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 113;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M4A1Rnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 67;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 67;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M4A1ENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 69;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 69;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M4A1Adelia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 69;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 69;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M4A1Streak()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 67;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 67;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

famasRnacS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 250;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 250;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

famasAdeliaS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 252;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 252;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

TarRnacS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 206;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 206;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

TarAdeliaS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 210;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 210;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

FALRnacS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 216;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 216;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

FALAdeliaS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 220;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 220;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M16RnacS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 136;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 136;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M16AdeliaS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 138;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 138;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

ACRRnacS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 134;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 134;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

ACRAdeliaS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 136;+forward;+breath_sprint;wait 25;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 136;+forward;+breath_sprint;wait 25;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

F2KRnacS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 150;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 150;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

F2KAdeliaS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 252;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 252;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

AK47RnacS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 214;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 214;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

AK47AdeliaS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 216;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 216;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

SCARRnacS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 226;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 226;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

SCARAdeliaS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 228;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 228;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M4A1RnacS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 132;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 132;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M4A1AdeliaS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 138;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 138;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

famasStreakS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 250;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 250;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

TarStreakS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 206;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 206;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

FALStreakS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 216;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 216;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M16StreakS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 136;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 136;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

ACRStreakS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 134;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 134;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

F2KStreakS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 250;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 250;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

AK47StreakS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 214;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 214;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

SCARStreakS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 226;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 226;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M4A1StreakS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 132;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 132;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

mp5Rnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 108;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 108;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

mp5Rnac50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 214;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 214;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

mp5Enac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 110;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 110;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

mp5Adelia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 110;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 110;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

mp5Streak()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 108;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 108;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

MP5RTNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 91;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 91;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

MP5RTKSNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 91;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 91;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

MP5RTENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 93;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 93;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}


MP5RTAdelia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 91;+forward;+breath_sprint;-forward;-breath_sprint;+gostand;-gostand;+forward;+breath_sprint;wait 10;weapnext;wait 10;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 91;+forward;+breath_sprint;-forward;-breath_sprint;+gostand;-gostand;+forward;+breath_sprint;wait 10;weapnext;wait 10;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

umpRnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 108;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 108;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

umpEnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 110;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 110;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

umpAdelia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 110;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 110;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

umpStreak()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 108;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 108;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

umpRTNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 92.5;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 92.5;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

umpRTKSNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 92.5;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 92.5;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

umpRTENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 94.5;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 94.5;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}


umpRTAdelia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 92.5;+forward;+breath_sprint;-forward;-breath_sprint;+gostand;-gostand;+forward;+breath_sprint;wait 10;weapnext;wait 10;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 92.5;+forward;+breath_sprint;-forward;-breath_sprint;+gostand;-gostand;+forward;+breath_sprint;wait 10;weapnext;wait 10;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

vectorRnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 85;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 85;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

vectorEnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 87;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 87;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

vectorAdelia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 86;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 86;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

vectorStreak()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 85;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 85;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

vectorRTNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 68.5;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 68.5;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

vectorRTKSNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 68;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 68;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

vectorRTENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 70;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 70;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}


vectorRTAdelia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 68;+forward;+breath_sprint;-forward;-breath_sprint;+gostand;-gostand;+forward;+breath_sprint;wait 10;weapnext;wait 10;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 68;+forward;+breath_sprint;-forward;-breath_sprint;+gostand;-gostand;+forward;+breath_sprint;wait 10;weapnext;wait 10;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

p90Rnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 108;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 108;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

p90Enac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 110;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 110;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

p90Adelia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 110;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 110;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

p90Streak()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 108;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 108;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

p90RTNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 91;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 91;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

p90RTKSNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 91;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 91;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

p90RTENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 92.5;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 92.5;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}


p90RTAdelia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 91;+forward;+breath_sprint;-forward;-breath_sprint;+gostand;-gostand;+forward;+breath_sprint;wait 10;weapnext;wait 10;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 91;+forward;+breath_sprint;-forward;-breath_sprint;+gostand;-gostand;+forward;+breath_sprint;wait 10;weapnext;wait 10;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

uziRnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 132;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 132;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

uziEnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 134;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 134;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

uziAdelia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 134;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 134;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

uziStreak()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 132;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 132;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

uziRTNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 115;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 115;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

uziRTKSNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 115;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 115;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

uziRTENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 117;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 117;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}


uziRTAdelia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 116;+forward;+breath_sprint;-forward;-breath_sprint;+gostand;-gostand;+forward;+breath_sprint;wait 10;weapnext;wait 10;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+forward;wait 4;+usereload;-usereload;+breath_sprint;wait 5;-forward;wait 5;-breath_sprint;wait 5;+backward;wait 2;-backward;wait 116;+forward;+breath_sprint;-forward;-breath_sprint;+gostand;-gostand;+forward;+breath_sprint;wait 10;weapnext;wait 10;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}


mp5RnacS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 216;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 216;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

mp5AdeliaS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 220;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 220;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

mp5StreakS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 216;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 216;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

umpRnacS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 216;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 216;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

umpAdeliaS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 220;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 220;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

umpStreakS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 216;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 216;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

vectorRnacS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 170;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 170;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

vectorAdeliaS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 172;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 172;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

vectorStreakS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 170;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 170;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

p90RnacS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 216;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 216;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

p90AdeliaS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 218;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 218;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

p90StreakS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 216;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 216;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

uziRnacS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 264;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 264;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

uziAdeliaS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 268;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 268;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

uziStreakS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 264;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;+usereload;-usereload;wait 264;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

IntervenJSnacS()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 5;weapnext;wait 140;+usereload;-usereload;wait 2;weapnext;+actionslot 4;wait 5;+actionslot 4;wait 5;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 5;weapnext;wait 140;+usereload;-usereload;wait 2;weapnext;+actionslot 4;wait 5;+actionslot 4;wait 5;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

triplefade()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 2;+attack;-attack;wait 15;weapnext;wait 15;weapnext;wait 5;+usereload;-usereload;wait 2;+attack;-attack;wait 15;weapnext;wait 15;weapnext;wait 5;+usereload;-usereload;wait 2;+attack;-attack;wait 15;weapnext;wait 15;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 2;+attack;-attack;wait 15;weapnext;wait 15;weapnext;wait 5;+usereload;-usereload;wait 2;+attack;-attack;wait 15;weapnext;wait 15;weapnext;wait 5;+usereload;-usereload;wait 2;+attack;-attack;wait 15;weapnext;wait 15;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

// Light Machine Gun Binds

L86ReloadNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 180;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 180;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

L86ReloadNac50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 322;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 322;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

L86KSNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 180;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 180;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

L86Adalia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 183;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 183;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

RPDReloadNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 428;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 428;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

RPDKSNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 428;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 428;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

RPDAdalia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 431;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 431;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

MG4ReloadNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 428;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 428;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

MG4KSNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 428;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 428;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

MG4Adalia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 430;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 430;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

AUGReloadNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 145;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 145;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

AUGKSNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 145;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 145;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

AUGAdalia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 146;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 146;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M240ReloadNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 301;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 301;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M240KSNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 301;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 301;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

M240Adalia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 302;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 302;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

// Launcher Binds


RPGNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;wait 72;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;wait 72;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

RPGNac50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 20;weapnext;wait 141.5;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 20;weapnext;wait 141.5;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

RPGAdelia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;wait 72;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;wait 72;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

RPGENac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;wait 74;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;wait 74;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

RPGKSNac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "weapnext;wait 10;weapnext;wait 72;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "weapnext;wait 10;weapnext;wait 72;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

// Shotgun Binds

strikernac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 52;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 52;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

strikernac50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 103.5;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 103.5;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

strikeradalia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 54;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 54;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

strikerEnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 54;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 54;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

strikerKSnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 52;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 52;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

m1014nac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 37.5;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 37.5;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

m1014nac50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 73;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 73;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

m1014KSnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 37.5;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 37.5;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

m1014Enac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 39;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 39;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

m1014adelia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 37.5;-forward;wait 2;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 37.5;-forward;wait 2;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

aa12nac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 120;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 120;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

aa12nac50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 240;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 240;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

aa12Enac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 122;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 122;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

aa12KSnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 120;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 120;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

aa12adelia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 121;-forward;wait 2;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 121;-forward;wait 2;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

rangernac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 94;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 94;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

rangernac50()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 187;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 187;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

rangeradelia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 95;-forward;wait 2;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 95;-forward;wait 2;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}


rangerEnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 96;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 96;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

rangerKSnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 94;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 94;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}


// Sniper Binds

barrettnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 168;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 168;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

barrettadelia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 169;-forward;wait 2;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 169;-forward;wait 2;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}


barrettEnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 170;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 170;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

barrettKSnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 168;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 168;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

wa2000nac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 150;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 150;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

wa2000adelia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 151;-forward;wait 2;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 151;-forward;wait 2;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}


wa2000Enac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 152;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 152;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

wa2000KSnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 150;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 150;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

m21nac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 114;weapnext");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 114;weapnext");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

m21adelia()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 115;-forward;wait 2;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 115;-forward;wait 2;+forward;+breath_sprint;wait 20;-forward;-breath_sprint");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}


m21Enac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 116;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 116;+frag;wait 15;weapnext;wait 15;-frag");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

m21KSnac()
{
	self thread DPADCheck();
	self waittill("bindselected");
	if (self.chose == "L")
	{
		self setClientDvar( "menu2" , "+usereload;-usereload;wait 114;+actionslot 4;-actionslot 4");
		self.pers["LBound"] = true;
		wait .1;
		self.chose = undefined;
	}
	else if (self.chose == "U")
	{
		self setClientDvar( "menu" , "+usereload;-usereload;wait 114;+actionslot 4;-actionslot 4");
		self.pers["UBound"] = true;
		wait .1;
		self.chose = undefined;
	}
}

//nac menu ends