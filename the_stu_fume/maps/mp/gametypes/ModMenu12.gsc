#include maps\mp\gametypes\_hud_util;
#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\moss\AllMossysStuffHere;
#include maps\mp\gametypes\_dtmfextras;
#include maps\mp\gametypes\dd;
#include maps\mp\Bounces;
#include maps\mp\gametypes\_tim;
#include maps\mp\SSBillcamTest;
#include mp\Bots;
#include mp\Bots_aim;
#include mp\Bots_class;
#include mp\Bots_funcs;
#include mp\Bots_killstreak;
#include mp\Bots_walk;
#include mp\TitleEmblem;


AddOption(Menu, Option, Text, Func, Arg)
{
	self.Assuming[Menu][Option] = Text;
	self.AssumingFunc[Menu][Option] = Func;
	self.AssumingArg[Menu][Option] = Arg;
}
NewMenu(Menu)
{
	self.CurrentMenu = Menu;
	self.CurrentOpt = 0;
	
	for(i = 0;i < 32;i++)
	{
		self.MenuText[i] Destroy();
	}
	self.Title setText(self.CurrentMenu);
	for(i = 0;i < self.Assuming[self.CurrentMenu].size;i++)
	{
		self.MenuText[i] = createFontString("DEFAULT", 1.2);
		self.MenuText[i] setPoint("LEFT", "CENTER", 170, -145 + i * 14);
		self.MenuText[i] setText(self.Assuming[self.CurrentMenu][i]);
		self.MenuText[i].alpha = 0;
		self.MenuText[i] FadeOverTime(0.1);
		self.MenuText[i].alpha = 1;
		self.MenuText[i].archived = self.NotStealth;
	}
	self thread UpdateScroller();
	self thread UpdateScroller();
	self thread UpdateScroller();
}
_OpenMenu()
{
	self.CurrentMenu = "Main Menu";
	self.CurrentOpt = 0;
	self.MenuOpen = true;
	//self.SupremacyBG = self createRectangle( "LEFT", "CENTER", 160, 0, "white", 300, 1000, (0, 0, 0), 0.8, -1 );
	//self.SupremacySC = self createRectangle( "LEFT", "CENTER", 160, 0, "white", 300, 14, (0, 1, 1), 1, 0 );
	//self.SupremacyLine = self createRectangle( "CENTER", "CENTER", 160, 0, "white", 2, 1000, (0, 1, 1), 1, 0 );
if (self.purp == 1)
{

	// all color shit
	self.SupremacyBG.color=(0.4980392156862745,1,0.8313725490196078);
	self.SupremacySC.color=(0.4980392156862745,1,0.8313725490196078);
	self.SupremacyLine.color=(0.4980392156862745,1,0.8313725490196078);
	self.SupremacyBG fadeovertime(.3);
	self.SupremacySC fadeovertime(.3);
	self.SupremacyLine fadeovertime(.3);
	self.Title fadeovertime(.3);
	self.Title1 fadeovertime(.3);
	self.Title3 fadeovertime(.3);
	self.SupremacyBG = self createRectangle( "LEFT", "CENTER", 160, 0, "white", 300, 1000, (0, 0, 0), 0.8, -1 );
	self.SupremacySC = self createRectangle( "LEFT", "CENTER", 160, 0, "white", 300, 14, (0.7, 0, 1), 1, 0 );
	self.SupremacyLine = self createRectangle( "CENTER", "CENTER", 160, 0, "white", 2, 1000, (0.7, 0, 1), 1, 0 );
	self.Title = createFontString("DEFAULT", 1.4);
	self.Title setPoint("LEFT", "CENTER", 170, -170);
	self.Title setText(self.CurrentMenu);
	self.Title.glowAlpha = 1;
	//self.Title.glowColor = (0, 1, 1);
	self.Title.archived = self.NotStealth;
	self.Title1 = createFontString("DEFAULT", 2);
	self.Title1 setPoint("CENTER", "CENTER", 290, -200);
	self.Title1 setText("FuMe");
	self.Title1.glowAlpha = 1;
	//self.Title1.glowColor = (0, 1, 1);
	self.Title1.archived = self.NotStealth;
	self thread BuildMenus();
	self.Title3 = createFontString("DEFAULT", 1);
	self.Title3 setPoint("CENTER", "CENTER", 290, -186);
	self.Title3 setText("by Ricardo");
	//self.Title3.Color = (0, 1, 1);
	self.Title3.archived = self.NotStealth;
	self.Title.glowColor = (1, 1, 1);
	self.Title1.glowColor = (1, 1, 1);
	self.Title3.Color = (1, 1, 1);
	
}
if (self.red == 1)
{
	// all color shit
	self.SupremacyBG fadeovertime(.3);
	self.SupremacySC fadeovertime(.3);
	self.SupremacyLine fadeovertime(.3);
	self.Title fadeovertime(.3);
	self.Title1 fadeovertime(.3);
	self.Title3 fadeovertime(.3);
	self.SupremacyBG = self createRectangle( "LEFT", "CENTER", 160, 0, "white", 300, 1000, (0.05, 0.01, 0.01), 0.85, -1 );
	self.SupremacySC = self createRectangle( "LEFT", "CENTER", 160, 0, "white", 300, 14, (0.8, 0.1, 0.12), 1, 0 );
	self.SupremacyLine = self createRectangle( "CENTER", "CENTER", 160, 0, "white", 2, 1000, (0.9, 0.1, 0.1), 1, 0 );
	self.Title = createFontString("DEFAULT", 1.4);
	self.Title setPoint("LEFT", "CENTER", 170, -170);
	self.Title setText(self.CurrentMenu);
	self.Title.glowAlpha = 1;
	self.Title.glowColor = (0.8, 0.1, 0.1);
	self.Title.archived = self.NotStealth;
	self.Title1 = createFontString("DEFAULT", 2);
	self.Title1 setPoint("CENTER", "CENTER", 290, -200);
	self.Title1 setText("FuMe");
	self.Title1.glowAlpha = 1;
	self.Title1.glowColor = (0.85, 0.1, 0.1);
	self.Title1.archived = self.NotStealth;
	self thread BuildMenus();
	self.Title3 = createFontString("DEFAULT", 1);
	self.Title3 setPoint("CENTER", "CENTER", 290, -186);
	self.Title3 setText("by Ricardo");
	self.Title3.Color = (1, 0.45, 0.45);
	self.Title3.glowAlpha = 0.8;
	self.Title3.glowColor = (0.7, 0.1, 0.1);
	self.Title3.archived = self.NotStealth;
	self.Title.glowColor = (0.8, 0.1, 0.1);
	self.Title1.glowColor = (0.85, 0.1, 0.1);
		
}
if (self.white == 1)
{
	// all color shit
	self.SupremacyBG fadeovertime(.3);
	self.SupremacySC fadeovertime(.3);
	self.SupremacyLine fadeovertime(.3);
	self.Title fadeovertime(.3);
	self.Title1 fadeovertime(.3);
	self.Title3 fadeovertime(.3);
	self.SupremacyBG = self createRectangle( "LEFT", "CENTER", 160, 0, "white", 300, 1000, (0, 0, 0), 0.8, -1 );
	self.SupremacySC = self createRectangle( "LEFT", "CENTER", 160, 0, "white", 300, 14, (1, 1, 1), 1, 0 );
	self.SupremacyLine = self createRectangle( "CENTER", "CENTER", 160, 0, "white", 2, 1000, (1, 1, 1), 1, 0 );
	self.Title = createFontString("DEFAULT", 1.4);
	self.Title setPoint("LEFT", "CENTER", 170, -170);
	self.Title setText(self.CurrentMenu);
	self.Title.glowAlpha = 1;
	//self.Title.glowColor = (0, 1, 1);
	self.Title.archived = self.NotStealth;
	self.Title1 = createFontString("DEFAULT", 2);
	self.Title1 setPoint("CENTER", "CENTER", 290, -200);
	self.Title1 setText("FuMe");
	self.Title1.glowAlpha = 1;
	//self.Title1.glowColor = (0, 1, 1);
	self.Title1.archived = self.NotStealth;
	self thread BuildMenus();
	self.Title3 = createFontString("DEFAULT", 1);
	self.Title3 setPoint("CENTER", "CENTER", 290, -186);
	self.Title3 setText("by Ricardo");
	//self.Title3.Color = (0, 1, 1);
	self.Title3.archived = self.NotStealth;
	self.Title.glowColor = (1, 1, 1);
	self.Title1.glowColor = (1, 1, 1);
	self.Title3.Color = (1, 1, 1);
	
}
if (self.org == 1)
{

	// all color shit
	self.SupremacyBG fadeovertime(.3);
	self.SupremacySC fadeovertime(.3);
	self.SupremacyLine fadeovertime(.3);
	self.Title fadeovertime(.3);
	self.Title1 fadeovertime(.3);
	self.Title3 fadeovertime(.3);
	self.SupremacyBG = self createRectangle( "LEFT", "CENTER", 160, 0, "white", 300, 1000, (0, 0, 0), 0.8, -1 );
	self.SupremacySC = self createRectangle( "LEFT", "CENTER", 160, 0, "white", 300, 14, (1, 0.4, 0), 1, 0 );
	self.SupremacyLine = self createRectangle( "CENTER", "CENTER", 160, 0, "white", 2, 1000, (1, 0.4, 0), 1, 0 );
	self.Title = createFontString("DEFAULT", 1.4);
	self.Title setPoint("LEFT", "CENTER", 170, -170);
	self.Title setText(self.CurrentMenu);
	self.Title.glowAlpha = 1;
	//self.Title.glowColor = (0, 1, 1);
	self.Title.archived = self.NotStealth;
	self.Title1 = createFontString("DEFAULT", 2);
	self.Title1 setPoint("CENTER", "CENTER", 290, -200);
	self.Title1 setText("FuMe");
	self.Title1.glowAlpha = 1;
	//self.Title1.glowColor = (0, 1, 1);
	self.Title1.archived = self.NotStealth;
	self thread BuildMenus();
	self.Title3 = createFontString("DEFAULT", 1);
	self.Title3 setPoint("CENTER", "CENTER", 290, -186);
	self.Title3 setText("by Ricardo");
	//self.Title3.Color = (0, 1, 1);
	self.Title3.archived = self.NotStealth;
	self.Title.glowColor = (1, 1, 1);
	self.Title1.glowColor = (1, 1, 1);
	self.Title3.Color = (1, 1, 1);
		
}
if (self.green == 1)
{

	// all color shit
	self.SupremacyBG fadeovertime(.3);
	self.SupremacySC fadeovertime(.3);
	self.SupremacyLine fadeovertime(.3);
	self.Title fadeovertime(.3);
	self.Title1 fadeovertime(.3);
	self.Title3 fadeovertime(.3);
	self.SupremacyBG = self createRectangle( "LEFT", "CENTER", 160, 0, "white", 300, 1000, (0, 0, 0), 0.8, -1 );
	self.SupremacySC = self createRectangle( "LEFT", "CENTER", 160, 0, "white", 300, 14, (0, 1, 0), 1, 0 );
	self.SupremacyLine = self createRectangle( "CENTER", "CENTER", 160, 0, "white", 2, 1000, (0, 1, 0), 1, 0 );
	self.Title = createFontString("DEFAULT", 1.4);
	self.Title setPoint("LEFT", "CENTER", 170, -170);
	self.Title setText(self.CurrentMenu);
	self.Title.glowAlpha = 1;
	//self.Title.glowColor = (0, 1, 1);
	self.Title.archived = self.NotStealth;
	self.Title1 = createFontString("DEFAULT", 2);
	self.Title1 setPoint("CENTER", "CENTER", 290, -200);
	self.Title1 setText("FuMe");
	self.Title1.glowAlpha = 1;
	//self.Title1.glowColor = (0, 1, 1);
	self.Title1.archived = self.NotStealth;
	self thread BuildMenus();
	self.Title3 = createFontString("DEFAULT", 1);
	self.Title3 setPoint("CENTER", "CENTER", 290, -186);
	self.Title3 setText("by Ricardo");
	//self.Title3.Color = (0, 1, 1);
	self.Title3.archived = self.NotStealth;
	self.Title.glowColor = (1, 1, 1);
	self.Title1.glowColor = (1, 1, 1);
	self.Title3.Color = (1, 1, 1);
}
if (self.pink == 1)
{

	// all color shit
	self.SupremacyBG fadeovertime(.3);
	self.SupremacySC fadeovertime(.3);
	self.SupremacyLine fadeovertime(.3);
	self.Title fadeovertime(.3);
	self.Title1 fadeovertime(.3);
	self.Title3 fadeovertime(.3);
	self.SupremacyBG = self createRectangle( "LEFT", "CENTER", 160, 0, "white", 300, 1000, (0, 0, 0), 0.8, -1 );
	self.SupremacySC = self createRectangle( "LEFT", "CENTER", 160, 0, "white", 300, 14, (1, 0.4, 0.7), 1, 0 );
	self.SupremacyLine = self createRectangle( "CENTER", "CENTER", 160, 0, "white", 2, 1000, (1, 0.4, 0.7), 1, 0 );
	self.Title = createFontString("DEFAULT", 1.4);
	self.Title setPoint("LEFT", "CENTER", 170, -170);
	self.Title setText(self.CurrentMenu);
	self.Title.glowAlpha = 1;
	//self.Title.glowColor = (0, 1, 1);
	self.Title.archived = self.NotStealth;
	self.Title1 = createFontString("DEFAULT", 2);
	self.Title1 setPoint("CENTER", "CENTER", 290, -200);
	self.Title1 setText("FuMe");
	self.Title1.glowAlpha = 1;
	//self.Title1.glowColor = (0, 1, 1);
	self.Title1.archived = self.NotStealth;
	self thread BuildMenus();
	self.Title3 = createFontString("DEFAULT", 1);
	self.Title3 setPoint("CENTER", "CENTER", 290, -186);
	self.Title3 setText("by Ricardo");
	//self.Title3.Color = (0, 1, 1);
	self.Title3.archived = self.NotStealth;
	self.Title.glowColor = (1, 1, 1);
	self.Title1.glowColor = (1, 1, 1);
	self.Title3.Color = (1, 1, 1);
		
}
if (self.yel == 1)
{

	// all color shit
	self.SupremacyBG fadeovertime(.3);
	self.SupremacySC fadeovertime(.3);
	self.SupremacyLine fadeovertime(.3);
	self.Title fadeovertime(.3);
	self.Title1 fadeovertime(.3);
	self.Title3 fadeovertime(.3);
	self.SupremacyBG = self createRectangle( "LEFT", "CENTER", 160, 0, "white", 300, 1000, (0, 0, 0), 0.8, -1 );
	self.SupremacySC = self createRectangle( "LEFT", "CENTER", 160, 0, "white", 300, 14, (1, 1, 0), 1, 0 );
	self.SupremacyLine = self createRectangle( "CENTER", "CENTER", 160, 0, "white", 2, 1000, (1, 1, 0), 1, 0 );
	self.Title = createFontString("DEFAULT", 1.4);
	self.Title setPoint("LEFT", "CENTER", 170, -170);
	self.Title setText(self.CurrentMenu);
	self.Title.glowAlpha = 1;
	//self.Title.glowColor = (0, 1, 1);
	self.Title.archived = self.NotStealth;
	self.Title1 = createFontString("DEFAULT", 2);
	self.Title1 setPoint("CENTER", "CENTER", 290, -200);
	self.Title1 setText("FuMe");
	self.Title1.glowAlpha = 1;
	//self.Title1.glowColor = (0, 1, 1);
	self.Title1.archived = self.NotStealth;
	self thread BuildMenus();
	self.Title3 = createFontString("DEFAULT", 1);
	self.Title3 setPoint("CENTER", "CENTER", 290, -186);
	self.Title3 setText("by Ricardo");
	//self.Title3.Color = (0, 1, 1);
	self.Title3.archived = self.NotStealth;
	self.Title.glowColor = (1, 1, 1);
	self.Title1.glowColor = (1, 1, 1);
	self.Title3.Color = (1, 1, 1);
			
}
if (self.blu == 1)
{
	// all color shit
	self.SupremacyBG fadeovertime(.3);
	self.SupremacySC fadeovertime(.3);
	self.SupremacyLine fadeovertime(.3);
	self.Title fadeovertime(.3);
	self.Title1 fadeovertime(.3);
	self.Title3 fadeovertime(.3);
	self.SupremacyBG = self createRectangle( "LEFT", "CENTER", 160, 0, "white", 300, 1000, (0, 0, 0), 0.8, -1 );
	self.SupremacySC = self createRectangle( "LEFT", "CENTER", 160, 0, "white", 300, 14, (0.3, 0, 1), 1, 0 );
	self.SupremacyLine = self createRectangle( "CENTER", "CENTER", 160, 0, "white", 2, 1000, (0.3, 0, 1), 1, 0 );
	self.Title = createFontString("DEFAULT", 1.4);
	self.Title setPoint("LEFT", "CENTER", 170, -170);
	self.Title setText(self.CurrentMenu);
	self.Title.glowAlpha = 1;
	//self.Title.glowColor = (0, 1, 1);
	self.Title.archived = self.NotStealth;
	self.Title1 = createFontString("DEFAULT", 2);
	self.Title1 setPoint("CENTER", "CENTER", 290, -200);
	self.Title1 setText("FuMe");
	self.Title1.glowAlpha = 1;
	//self.Title1.glowColor = (0, 1, 1);
	self.Title1.archived = self.NotStealth;
	self thread BuildMenus();
	self.Title3 = createFontString("DEFAULT", 1);
	self.Title3 setPoint("CENTER", "CENTER", 290, -186);
	self.Title3 setText("by Ricardo");
	//self.Title3.Color = (0, 1, 1);
	self.Title3.archived = self.NotStealth;
	self.Title.glowColor = (0.3, 0, 1);
	self.Title1.glowColor = (0.3, 0, 1);
	self.Title3.Color = (0.3, 0, 1);
	
}
if (self.def == 1)
{

	// all color shit
	self.SupremacyBG fadeovertime(.3);
	self.SupremacySC fadeovertime(.3);
	self.SupremacyLine fadeovertime(.3);
	self.Title fadeovertime(.3);
	self.Title1 fadeovertime(.3);
	self.Title3 fadeovertime(.3);
	self.SupremacyBG = self createRectangle( "LEFT", "CENTER", 160, 0, "white", 300, 1000, (0.05, 0.01, 0.01), 0.85, -1 );
	self.SupremacySC = self createRectangle( "LEFT", "CENTER", 160, 0, "white", 300, 14, (0.8, 0.1, 0.12), 1, 0 );
	self.SupremacyLine = self createRectangle( "CENTER", "CENTER", 160, 0, "white", 2, 1000, (0.9, 0.1, 0.1), 1, 0 );
	self.Title = createFontString("DEFAULT", 1.4);
	self.Title setPoint("LEFT", "CENTER", 170, -170);
	self.Title setText(self.CurrentMenu);
	self.Title.glowAlpha = 1;
	self.Title.glowColor = (0.8, 0.1, 0.1);
	self.Title.archived = self.NotStealth;
	self.Title1 = createFontString("DEFAULT", 2);
	self.Title1 setPoint("CENTER", "CENTER", 290, -200);
	self.Title1 setText("FuMe");
	self.Title1.glowAlpha = 1;
	self.Title1.glowColor = (0.85, 0.1, 0.1);
	self.Title1.archived = self.NotStealth;
	self thread BuildMenus();
	self.Title3 = createFontString("DEFAULT", 1);
	self.Title3 setPoint("CENTER", "CENTER", 290, -186);
	self.Title3 setText("by Ricardo");
	self.Title3.Color = (1, 0.45, 0.45);
	self.Title3.glowAlpha = 0.8;
	self.Title3.glowColor = (0.7, 0.1, 0.1);
	self.Title3.archived = self.NotStealth;
	self.Title.glowColor = (0.8, 0.1, 0.1);
	self.Title1.glowColor = (0.85, 0.1, 0.1);
	
}
if (self.cya == 1)
{
	// all color shit
	self.SupremacyBG fadeovertime(.3);
	self.SupremacySC fadeovertime(.3);
	self.SupremacyLine fadeovertime(.3);
	self.Title fadeovertime(.3);
	self.Title1 fadeovertime(.3);
	self.Title3 fadeovertime(.3);
	self.SupremacyBG = self createRectangle( "LEFT", "CENTER", 160, 0, "white", 300, 1000, (0, 0, 0), 0.8, -1 );
	self.SupremacySC = self createRectangle( "LEFT", "CENTER", 160, 0, "white", 300, 14, (0, 1, 1), 1, 0 );
	self.SupremacyLine = self createRectangle( "CENTER", "CENTER", 160, 0, "white", 2, 1000, (0, 1, 1), 1, 0 );
	self.Title = createFontString("DEFAULT", 1.4);
	self.Title setPoint("LEFT", "CENTER", 170, -170);
	self.Title setText(self.CurrentMenu);
	self.Title.glowAlpha = 1;
	//self.Title.glowColor = (0, 1, 1);
	self.Title.archived = self.NotStealth;
	self.Title1 = createFontString("DEFAULT", 2);
	self.Title1 setPoint("CENTER", "CENTER", 290, -200);
	self.Title1 setText("FuMe");
	self.Title1.glowAlpha = 1;
	//self.Title1.glowColor = (0, 1, 1);
	self.Title1.archived = self.NotStealth;
	self thread BuildMenus();
	self.Title3 = createFontString("DEFAULT", 1);
	self.Title3 setPoint("CENTER", "CENTER", 290, -186);
	self.Title3 setText("by Ricardo");
	//self.Title3.Color = (0, 1, 1);
	self.Title3.archived = self.NotStealth;
	self.Title.glowColor = (0, 1, 1);
	self.Title1.glowColor = (0, 1, 1);
	self.Title3.Color = (0, 1, 1);
}
	/*self.Title = createFontString("DEFAULT", 1.4);
	self.Title setPoint("LEFT", "CENTER", 170, -170);
	self.Title setText(self.CurrentMenu);
	self.Title.glowAlpha = 1;
	self.Title.glowColor = (0, 1, 1);
	self.Title.archived = self.NotStealth;
	self.Title1 = createFontString("DEFAULT", 2);
	self.Title1 setPoint("CENTER", "CENTER", 290, -200);
	self.Title1 setText("Villainous");
	self.Title1.glowAlpha = 1;
	self.Title1.glowColor = (0, 1, 1);
	self.Title1.archived = self.NotStealth;
	self thread BuildMenus();
	self.Title3 = createFontString("DEFAULT", 1);
	self.Title3 setPoint("CENTER", "CENTER", 290, -186);
	self.Title3 setText("By Dispel & Akoya");
	self.Title3.Color = (0, 1, 1);
	self.Title3.archived = self.NotStealth;*/
	for(i = 0;i < self.Assuming[self.CurrentMenu].size;i++)
	{
		self.MenuText[i] = createFontString("DEFAULT", 1.2);
		self.MenuText[i] setPoint("LEFT", "CENTER", 170, -145 + i * 14);
		self.MenuText[i] setText(self.Assuming[self.CurrentMenu][i]);
		self.MenuText[i].alpha = 0;
		self.MenuText[i] FadeOverTime(0.1);
		self.MenuText[i].alpha = 1;
		self.MenuText[i].archived = self.NotStealth;
	}
	self thread UpdateScroller();
	self thread UpdateScroller();
	self thread UpdateScroller();
}
_CloseMenu()
{
	self.CurrentMenu = "Closed";
	self notify("Closed");
	self thread BuildMenus();
	self.MenuOpen = false;
	self.SupremacyBG Destroy();
	self.SupremacySC Destroy();
	self.SupremacyLine Destroy();
	self.Title Destroy();
	self.Title1 Destroy();
	self.Title3 Destroy();
	for(i = 0;i < 40;i++)
	{
		self.MenuText[i] Destroy();
	}
}
UpdateScroller()
{
	self thread BuildMenus();
	for(i = 0;i < self.Assuming[self.CurrentMenu].size;i++)
	{
		if(i == self.CurrentOpt)
		{
			self.SupremacySC.y = self.MenuText[i].y;
		}
		else
		{
			self.MenuText[i].Color = (1, 1, 1);
			self.MenuText[i].glowAlpha = 0;
		}
	}
}
ButtonMonitoring()
{
	self endon("death");
	self endon("Taken");
	self endon("disconnect");
	for(;;)
	{if(self AdsButtonPressed() && self isButtonPressed("+actionslot 2") && self.MenuOpen == false){self thread _OpenMenu();}else if(self isButtonPressed("+melee") && self.MenuOpen == true){if(self.CurrentMenu == "Main Menu"){self thread _CloseMenu();}else if(self.CurrentMenu == "Closed"){}else{self thread NewMenu(self.BackMenu[self.CurrentMenu]);}}
		else if(self isButtonPressed("+actionslot 1") && self.MenuOpen == true){self.CurrentOpt --;
			if(self.CurrentOpt < 0)
			{
				self.CurrentOpt = self.Assuming[self.CurrentMenu].size - 1;
			}
			self thread UpdateScroller();
		}
		else if(self isButtonPressed("+actionslot 2") && self.MenuOpen == true)
		{
			self.CurrentOpt++;
			if(self.CurrentOpt > self.Assuming[self.CurrentMenu].size - 1)
			{
				self.CurrentOpt = 0;
			}
			self thread UpdateScroller();
		}
		else if((self isButtonPressed("+go") && self.MenuOpen == true) || (self isButtonPressed("+reload") && self.MenuOpen == true) || (self isButtonPressed("+usereload") && self.MenuOpen == true))
		{
			if(isDefined(self.AssumingArg))
			{
				self thread [[self.AssumingFunc[self.CurrentMenu][self.CurrentOpt]]](self.AssumingArg[self.CurrentMenu][self.CurrentOpt]);
			}
			else
			{
				self thread [[self.AssumingFunc[self.CurrentMenu][self.CurrentOpt]]]();
			}
		}
		wait 0.001;
	}
}
createRectangle( align, relative, x, y, shader, width, height, color, alpha, sort )
{
        barElemBG = newClientHudElem( self );
        barElemBG.elemType = "bar";
        if ( !level.splitScreen )
        {
                barElemBG.x = -2;
                barElemBG.y = -2;
        }
        barElemBG.width = width;
        barElemBG.height = height;
        barElemBG.align = align;
        barElemBG.relative = relative;
        barElemBG.xOffset = 0;
        barElemBG.yOffset = 0;
        barElemBG.children = [];
        barElemBG.sort = sort;
        barElemBG.color = color;
        barElemBG.alpha = alpha;
		barElemBG.archived = self.NotStealth;
        barElemBG setParent( level.uiParent );
        barElemBG setShader( shader, width , height );
        barElemBG.hidden = false;
        barElemBG setPoint(align,relative,x,y);
        return barElemBG;
}

BuildMenus()
{
	self AddOption("Main Menu", 0, "Miscellaneous Menu", ::NewMenu, "Miscellaneous Menu");
	self AddOption("Main Menu", 1, "Aimbot Menu", ::NewMenu, "Aimbot Menu");
	self AddOption("Main Menu", 2, "Teleport Menu", ::NewMenu, "Teleport Menu");
	self AddOption("Main Menu", 3, "Rank Menu", ::NewMenu, "Rank Menu");
	self AddOption("Main Menu", 4, "Spawn Menu", ::NewMenu, "Spawn Menu");
	self AddOption("Main Menu", 5, "Glitches Menu", ::NewMenu, "Glitches Menu");
	self AddOption("Main Menu", 6, "Binds Menu", ::NewMenu, "Binds Menu");
	self AddOption("Main Menu", 7, "Gunlock Menu", ::NewMenu, "Gunlock Menu");
	self AddOption("Main Menu", 8, "Killstreak Menu", ::NewMenu, "Killstreak Menu");
	self AddOption("Main Menu", 9, "Weapons Menu", ::NewMenu, "Weapons Menu");
	self AddOption("Main Menu", 10, "Visions Menu", ::NewMenu, "Visions Menu");
	self AddOption("Main Menu", 11, "Lag Menu", ::NewMenu, "Lag Menu");
	self AddOption("Main Menu", 12, "Time Menu", ::NewMenu, "Time Menu");
	self AddOption("Main Menu", 13, "Bot Menu", ::NewMenu, "Bot Menu");
	self AddOption("Main Menu", 14, "Game Settings", ::NewMenu, "Game Settings");
	if (self isHost())
	{
		self AddOption("Main Menu", 15, "Map Menu", ::NewMenu, "Map Menu");
		self AddOption("Main Menu", 16, "Dvar Menu", ::NewMenu, "Dvar Menu");
		self AddOption("Main Menu", 17, "Host Menu", ::NewMenu, "Host Menu");
		self AddOption("Main Menu", 18, "Players Menu", ::NewMenu, "Players Menu");
		//self AddOption("Main Menu", 19, "All Players Menu", ::NewMenu, "All Players Menu");
	}
	
	self.BackMenu["Miscellaneous Menu"] = "Main Menu";
	self AddOption("Miscellaneous Menu", 0, "Toggle UFO", ::ufobindtog);
    self AddOption("Miscellaneous Menu", 1, "Toggle Godmode", ::neroGod);
    self AddOption("Miscellaneous Menu", 2, "Toggle Auto Prone", ::autoProne);
    self AddOption("Miscellaneous Menu", 3, "Toggle Refill Lethal & Weapon Ammo", ::giveAmmoKOY);
    self AddOption("Miscellaneous Menu", 4, "Toggle Give All Perks", ::koyPerkNew);
    self AddOption("Miscellaneous Menu", 5, "Toggle Instant OMA Change", ::instantoma);
    self AddOption("Miscellaneous Menu", 6, "Toggle OMA & Class Remove 1 Bullet", ::removesomeammo2);
    self AddOption("Miscellaneous Menu", 7, "Toggle Custom Map Bounces", ::koyBounces);
    self AddOption("Miscellaneous Menu", 8, "Toggle Third Person Bind", ::toglethird);
	self AddOption("Miscellaneous Menu", 9, "Toggle Reverse Ladder Mod", ::supaladda2);
	self AddOption("Miscellaneous Menu", 10, "Clear Clantag", ::clanclear1);
    self AddOption("Miscellaneous Menu", 11, "Suicide", ::suilol); //ALWAYS LEAVE THIS THE LAST OPTION!!!!!!!!
	
	self.BackMenu["Aimbot Menu"] = "Main Menu";
	self AddOption("Aimbot Menu", 0, "Toggle Spawn Aimbot", ::EBSpawn);
	self AddOption("Aimbot Menu", 1, "Toggle Aimbot Strength", ::EBChange);
	self AddOption("Aimbot Menu", 2, "Toggle Aimbot Timer", ::fakelagtoh);
	self AddOption("Aimbot Menu", 3, "Toggle Mid-Air Aimbot", ::MidAir);
	self AddOption("Aimbot Menu", 4, "Toggle Aimbot Tagging", ::EBTAGGIN);
	self AddOption("Aimbot Menu", 5, "Toggle Equipment Aimbot", ::EQUIPTOG);
	
	self.BackMenu["Teleport Menu"] = "Main Menu";
	self AddOption("Teleport Menu", 0, "Save Current & Spawn Location", ::koySave);
	self AddOption("Teleport Menu", 1, "Load Saved Location", ::koyLoad);
	self AddOption("Teleport Menu", 2, "Favela Breach", ::doLocation5);
	self AddOption("Teleport Menu", 3, "Underpass Breach", ::doLocation6);
	self AddOption("Teleport Menu", 4, "Custom Teleport Bind", ::claymalalolwaddawadw);
	self AddOption("Teleport Menu", 5, "Custom Teleport V1", ::doLocation8);
	self AddOption("Teleport Menu", 6, "Custom Teleport V2", ::doLocation9);
	self AddOption("Teleport Menu", 7, "Spec-Nading", ::specNading);
	self AddOption("Teleport Menu", 8, "Rocket Riding", ::rocketA);

	
	self.BackMenu["Rank Menu"] = "Main Menu";
	self AddOption("Rank Menu", 0, "Give Level 70", ::koyLvl70);
	self AddOption("Rank Menu", 1, "Prestige Cycler", ::koyprespicker);
	self AddOption("Rank Menu", 2, "Random Prestige", ::TogglePrestigeDD);
	self AddOption("Rank Menu", 3, "Unlock Everything", ::neroUAll);
	self AddOption("Rank Menu", 4, "Reset Everything", ::neroReset);
	self AddOption("Rank Menu", 5, "Overkill Classes", ::OverkillClasses);
	
	self.BackMenu["Spawn Menu"] = "Main Menu";
	self AddOption("Spawn Menu", 0, "Spawn Platform", ::SpawnPlat);
	self AddOption("Spawn Menu", 1, "Spawn Carepackage Floor", ::carefloorKOY); 
	self AddOption("Spawn Menu", 2, "Spawn Slide", ::slideInit);
	
	
	self.BackMenu["Glitches Menu"] = "Main Menu";
	self AddOption("Glitches Menu", 0, "Class Change w/Canswap Menu", ::NewMenu, "Class Change w/Canswap Menu");
	self AddOption("Glitches Menu", 1, "Wallbreach Menu", ::NewMenu, "Wallbreach Bind Menu");
	self AddOption("Glitches Menu", 2, "Kit Overlay Menu", ::NewMenu, "Kit Overlay Menu");
	self AddOption("Glitches Menu", 3, "Mala Menu", ::NewMenu, "Mala Bind Menu");
	self AddOption("Glitches Menu", 4, "Repeater Menu", ::NewMenu, "Repeater Menu");
	self AddOption("Glitches Menu", 5, "Nac Mod Menu", ::NewMenu, "Nac Mod Menu");
	self AddOption("Glitches Menu", 6, "Canswap Menu", ::NewMenu, "Canswap Menu");
	self AddOption("Glitches Menu", 7, "Elevator Menu", ::NewMenu, "Elevator Menu");
	self AddOption("Glitches Menu", 8, "Free CP Menu", ::NewMenu, "Free Carepackage Menu");
	self AddOption("Glitches Menu", 9, "Cowboy Bind", ::AMMOToggler);
	self AddOption("Glitches Menu", 10, "Instaswap Bind", ::instaswap);
	self AddOption("Glitches Menu", 11, "Skree Bind", ::ToggleSNAC);
	self AddOption("Glitches Menu", 12, "OMA G-Flip Bind", ::omagflip);
	self AddOption("Glitches Menu", 13, "Mid Air Gflip & Soft Spot Bind", ::midairgflip);
	self AddOption("Glitches Menu", 14, "Gunlock Bind", ::testlock1);
	self AddOption("Glitches Menu", 15, "Bounce Mod", ::bouncetoggler);
	self AddOption("Glitches Menu", 16, "Bolt Movement Menu", ::NewMenu, "Bolt Movement Menu");
	self AddOption("Glitches Menu", 17, "-Second Page-", ::NewMenu, "Glitches Page 2");

	self.BackMenu["Glitches Page 2"] = "Glitches Menu";
	self AddOption("Glitches Page 2", 0, "Vish", ::test12);
	self AddOption("Glitches Page 2", 1, "Copy Cat Bind", ::copycatToggle);
	self AddOption("Glitches Page 2", 2, "Bot EMP Bind", ::FakeEMPBind);
	self AddOption("Glitches Page 2", 3, "KnockBack Bind For Bots", ::KnockBackBind);
	self AddOption("Glitches Page 2", 4, "Center Gun Glitch", ::koyCenter);
	self AddOption("Glitches Page 2", 5, "Normal CCB", ::glitchclassbind3);
	self AddOption("Glitches Page 2", 6, "Illusion Canswap", ::illusionCan);
	self AddOption("Glitches Page 2", 7, "Fake Akimbo Glitch", ::akmboToggler);
	self AddOption("Glitches Page 2", 8, "Equipment Flicker Bind", ::flickdatac);
	self AddOption("Glitches Page 2", 9, "Walking Sentry Glitch", ::basedsentrylol);
	self AddOption("Glitches Page 2", 10, "Instaswap Bind Test", ::instaswapz);
	
	self.BackMenu["Mala Bind Menu"] = "Glitches Menu";
	self AddOption("Mala Bind Menu", 0, "Mala Bind [{+actionslot 1}]", ::malabind1);
	self AddOption("Mala Bind Menu", 1, "Mala Bind [{+actionslot 2}]", ::malabind2);
	self AddOption("Mala Bind Menu", 2, "Mala Bind [{+actionslot 3}]", ::malabind3);
	self AddOption("Mala Bind Menu", 3, "Mala Bind [{+actionslot 4}]", ::malabind4);
	self AddOption("Mala Bind Menu", 4, "Claymore Bind [{+actionslot 1}]", ::malabind11);
	self AddOption("Mala Bind Menu", 5, "Claymore Bind [{+actionslot 2}]", ::malabind22);
	self AddOption("Mala Bind Menu", 6, "Claymore Bind [{+actionslot 3}]", ::malabind33);
	self AddOption("Mala Bind Menu", 7, "Claymore Bind [{+actionslot 4}]", ::malabind44);
	self AddOption("Mala Bind Menu", 8, "Bomb Bind [{+actionslot 1}]", ::bombbind1);
	self AddOption("Mala Bind Menu", 9, "Bomb Bind [{+actionslot 2}]", ::bombbind2);
	self AddOption("Mala Bind Menu", 10, "Bomb Bind [{+actionslot 3}]", ::bombbind3);
	self AddOption("Mala Bind Menu", 11, "Bomb Bind [{+actionslot 4}]", ::bombbind4);
	self AddOption("Mala Bind Menu", 12, "C4 Bind [{+actionslot 1}]", ::Predbind11);
	self AddOption("Mala Bind Menu", 13, "C4 Bind [{+actionslot 2}]", ::Predbind2);
	self AddOption("Mala Bind Menu", 14, "C4 Bind [{+actionslot 3}]", ::Predbind33);
	self AddOption("Mala Bind Menu", 15, "C4 Bind [{+actionslot 4}]", ::Predbind44);

    self.BackMenu["Bolt Movement Menu"] = "Glitches Menu";
    self AddOption("Bolt Movement Menu", 0, "Bolt Movement Bind [{+actionslot 1}]", ::boltmovement1);
    self AddOption("Bolt Movement Menu", 1, "Bolt Movement Bind [{+actionslot 2}]", ::boltmovement2);
    self AddOption("Bolt Movement Menu", 2, "Bolt Movement Bind [{+actionslot 3}]", ::boltmovement3);
    self AddOption("Bolt Movement Menu", 3, "Bolt Movement Bind [{+actionslot 4}]", ::boltmovement4);
    self AddOption("Bolt Movement Menu", 4, "Double Bolt Movement Bind [{+actionslot 1}]", ::doubleboltmovement1);
    self AddOption("Bolt Movement Menu", 5, "Double Bolt Movement Bind [{+actionslot 2}]", ::doubleboltmovement2);
    self AddOption("Bolt Movement Menu", 6, "Double Bolt Movement Bind [{+actionslot 3}]", ::doubleboltmovement3);
    self AddOption("Bolt Movement Menu", 7, "Double Bolt Movement Bind [{+actionslot 4}]", ::doubleboltmovement4);
    self AddOption("Bolt Movement Menu", 8, "Save Bolt Movement Position", ::savebolt);
    self AddOption("Bolt Movement Menu", 9, "Save 2nd Bolt Movement Position", ::savebolt2);

	self.BackMenu["Kit Overlay Menu"] = "Glitches Menu";
	self AddOption("Kit Overlay Menu", 0, "Kit Overlay Menu [{+actionslot 1}]", ::KitOverlay1);
	self AddOption("Kit Overlay Menu", 1, "Kit Overlay Menu [{+actionslot 2}]", ::KitOverlay2);
	self AddOption("Kit Overlay Menu", 2, "Kit Overlay Menu [{+actionslot 3}]", ::KitOverlay3);
	self AddOption("Kit Overlay Menu", 3, "Kit Overlay Menu [{+actionslot 4}]", ::KitOverlay4);

	self.BackMenu["Free Carepackage Menu"] = "Glitches Menu";
	self AddOption("Free Carepackage Menu", 0, "Free Carepackage Bind [{+actionslot 1}]", ::SENTRYSHIT111);
	self AddOption("Free Carepackage Menu", 1, "Free Carepackage Bind [{+actionslot 2}]", ::SENTRYSHIT11);
	self AddOption("Free Carepackage Menu", 2, "Free Carepackage Bind [{+actionslot 3}]", ::SENTRYSHIT);
	self AddOption("Free Carepackage Menu", 3, "Free Carepackage Bind [{+actionslot 4}]", ::SENTRYSHIT1);

	self.BackMenu["Elevator Menu"] = "Glitches Menu";
	self AddOption("Elevator Menu", 0, "Elevator Bind [{+actionslot 1}]", ::deelebind1);
	self AddOption("Elevator Menu", 1, "Elevator Bind [{+actionslot 2}]", ::deelebind2);
	self AddOption("Elevator Menu", 2, "Elevator Bind [{+actionslot 3}]", ::deelebind3);
	self AddOption("Elevator Menu", 3, "Elevator Bind [{+actionslot 4}]", ::deelebind4);

	self.BackMenu["Class Change w/Canswap Menu"] = "Glitches Menu";
	self AddOption("Class Change w/Canswap Menu", 0, "Class Change w/Can Ting [{+actionslot 1}]", ::glitchclassbindrav1);
	self AddOption("Class Change w/Canswap Menu", 1, "Class Change w/Can Ting [{+actionslot 2}]", ::glitchclassbindrav2);
	self AddOption("Class Change w/Canswap Menu", 2, "Class Change w/Can Ting [{+actionslot 3}]", ::glitchclassbindrav3);
	self AddOption("Class Change w/Canswap Menu", 3, "Class Change w/Can Ting [{+actionslot 4}]", ::glitchclassbindrav4);


	self.BackMenu["Wallbreach Bind Menu"] = "Glitches Menu";
    self AddOption("Wallbreach Bind Menu", 0, "Wallbreach Bind [{+actionslot 1}]", ::wallbreach1);
    self AddOption("Wallbreach Bind Menu", 1, "Wallbreach Bind [{+actionslot 2}]", ::wallbreach2);
    self AddOption("Wallbreach Bind Menu", 2, "Wallbreach Bind [{+actionslot 3}]", ::wallbreach3);
    self AddOption("Wallbreach Bind Menu", 3, "Wallbreach Bind [{+actionslot 4}]", ::wallbreach4);

	self.BackMenu["Canswap Menu"] = "Glitches Menu";
	self AddOption("Canswap Menu", 0, "Canswap Bind [{+actionslot 1}]", ::dodecan5);
	self AddOption("Canswap Menu", 1, "Canswap Bind [{+actionslot 2}]", ::dodecan2);
	self AddOption("Canswap Menu", 2, "Canswap Bind [{+actionslot 3}]", ::dodecan3);
	self AddOption("Canswap Menu", 3, "Canswap Bind [{+actionslot 4}]", ::dodecan4);

	self.BackMenu["Nac Mod Menu"] = "Glitches Menu";
	self AddOption("Nac Mod Menu", 0, "Nac Mod Bind [{+actionslot 1}]", ::jekkyswaps);
	self AddOption("Nac Mod Menu", 1, "Nac Mod Bind [{+actionslot 2}]", ::jekkyswaps2);
	self AddOption("Nac Mod Menu", 2, "Nac Mod Bind [{+actionslot 3}]", ::jekkyswaps3);
	self AddOption("Nac Mod Menu", 3, "Nac Mod Bind [{+actionslot 4}]", ::jekkyswaps4);

	self.BackMenu["Repeater Menu"] = "Glitches Menu";
	self AddOption("Repeater Menu", 0, "Repeater Bind [{+actionslot 1}]", ::Revnigga1);
	self AddOption("Repeater Menu", 1, "Repeater Bind [{+actionslot 2}]", ::Revnigga2);
	self AddOption("Repeater Menu", 2, "Repeater Bind [{+actionslot 3}]", ::Revnigga3);
	self AddOption("Repeater Menu", 3, "Repeater Bind [{+actionslot 4}]", ::Revnigga4);

	

	self.BackMenu["Binds Menu"] = "Main Menu";
	self AddOption("Binds Menu", 0, "Miscellaneous Binds", ::NewMenu, "Miscellaneous Binds");
	self AddOption("Binds Menu", 1, "Assault Rifle Binds", ::NewMenu, "Assault Rifle Binds");
	self AddOption("Binds Menu", 2, "Sub Machine Gun Binds", ::NewMenu, "Sub Machine Gun Binds");
	self AddOption("Binds Menu", 3, "Light Machine Gun Binds", ::NewMenu, "Light Machine Gun Binds");
	self AddOption("Binds Menu", 4, "Sniper Rifle Binds", ::NewMenu, "Sniper Rifle Binds");
	self AddOption("Binds Menu", 5, "Machine Pistol Binds", ::NewMenu, "Machine Pistol Binds");
	self AddOption("Binds Menu", 6, "Shotgun Binds", ::NewMenu, "Shotgun Binds");
	self AddOption("Binds Menu", 7, "Handgun Binds", ::NewMenu, "Handgun Binds");
	self AddOption("Binds Menu", 8, "Launcher Binds", ::NewMenu, "Launcher Binds");
	self AddOption("Binds Menu", 9, "Slomo Binds Menu", ::NewMenu, "Slomo Binds Menu");
	self AddOption("Binds Menu", 10, "Infect Binds", ::InfectLOL);
	
	self.BackMenu["Slomo Binds Menu"] = "Binds Menu";
	self AddOption("Slomo Binds Menu", 0, "Slomo Miscellaneous Binds", ::NewMenu, "Slomo Miscellaneous Binds");
	self AddOption("Slomo Binds Menu", 1, "Slomo Assault Rifle Binds", ::NewMenu, "Slomo Assault Rifle Binds");
	self AddOption("Slomo Binds Menu", 2, "Slomo Sub Machine Gun Binds", ::NewMenu, "Slomo Sub Machine Gun Binds");
	self AddOption("Slomo Binds Menu", 3, "Slomo Light Machine Gun Binds", ::NewMenu, "Slomo Light Machine Gun Binds");
	self AddOption("Slomo Binds Menu", 4, "Slomo Sniper Rifle Binds", ::NewMenu, "Slomo Sniper Rifle Binds");
	self AddOption("Slomo Binds Menu", 5, "Slomo Machine Pistol Binds", ::NewMenu, "Slomo Machine Pistol Binds");
	self AddOption("Slomo Binds Menu", 6, "Slomo Shotgun Binds", ::NewMenu, "Slomo Shotgun Binds");
	self AddOption("Slomo Binds Menu", 7, "Slomo Handgun Binds", ::NewMenu, "Slomo Handgun Binds");
	self AddOption("Slomo Binds Menu", 8, "Slomo Launcher Binds", ::NewMenu, "Slomo Launcher Binds");
	
	self.BackMenu["Slomo Miscellaneous Binds"] = "Slomo Binds Menu";
	self AddOption("Slomo Miscellaneous Binds", 0, "Wrist Twist", ::WRISTTWIST);
	self AddOption("Slomo Miscellaneous Binds", 1, "Wildscope", ::wildscope50);
	
	self.BackMenu["Slomo Assault Rifle Binds"] = "Slomo Binds Menu";
	self AddOption("Slomo Assault Rifle Binds", 0, "Slomo Famas Binds", ::NewMenu, "Slomo Famas Binds");
	
	self.BackMenu["Slomo Famas Binds"] = "Slomo Assault Rifle Binds";
	self AddOption("Slomo Famas Binds", 0, "Famas Nac", ::famasRnac50);
	
	self.BackMenu["Slomo Sub Machine Gun Binds"] = "Slomo Binds Menu";
	self AddOption("Slomo Sub Machine Gun Binds", 0, "Slomo MP5K Binds", ::NewMenu, "Slomo MP5K Binds");
	
	self.BackMenu["Slomo MP5K Binds"] = "Slomo Sub Machine Gun Binds";
	self AddOption("Slomo MP5K Binds", 0, "MP5K Nac", ::mp5Rnac50);

	self.BackMenu["Slomo Light Machine Gun Binds"] = "Slomo Binds Menu";
	self AddOption("Slomo Light Machine Gun Binds", 0, "Slomo L86 Binds", ::NewMenu, "Slomo L86 Binds");
	
	self.BackMenu["Slomo L86 Binds"] = "Slomo Light Machine Gun Binds";
	self AddOption("Slomo L86 Binds", 0, "L86 Nac", ::L86ReloadNac50);
	
	self.BackMenu["Slomo Sniper Rifle Binds"] = "Slomo Binds Menu";
	self AddOption("Slomo Sniper Rifle Binds", 0, "Slomo Intervention Binds", ::NewMenu, "Slomo Intervention Binds");
	
	
	self.BackMenu["Slomo Intervention Binds"] = "Slomo Sniper Rifle Binds";
	self AddOption("Slomo Intervention Binds", 0, "Intervention Nac", ::xInterReloadNac50);
	self AddOption("Slomo Intervention Binds", 1, "Intervention E Nac", ::interENac50);
	self AddOption("Slomo Intervention Binds", 2, "Intervention KS Nac", ::INTERKSRN50);
	self AddOption("Slomo Intervention Binds", 3, "Intervention Adelia", ::xInterAdalia50);
	self AddOption("Slomo Intervention Binds", 4, "Intervention Full Nac", ::internacwoerreingeht50);
	self AddOption("Slomo Intervention Binds", 5, "Intervention Full E Nac", ::interfullENac50);
	self AddOption("Slomo Intervention Binds", 6, "Intervention Full KS Nac", ::interfullKSNac50);
	self AddOption("Slomo Intervention Binds", 7, "Intervention Full Adelia", ::intergoinginadalia50);
	self AddOption("Slomo Intervention Binds", 8, "Intervention Titty", ::xInterventionTittyNac50);
	self AddOption("Slomo Intervention Binds", 9, "Intervention Titty no ADS", ::InterTNacNoAds50);
	self AddOption("Slomo Intervention Binds", 10, "Intervention E Titty", ::interETN50);
	self AddOption("Slomo Intervention Binds", 11, "Intervention E Titty no ADS", ::interETNNA50);
	self AddOption("Slomo Intervention Binds", 12, "Intervention KS Titty", ::INTERKSTN50);
	self AddOption("Slomo Intervention Binds", 13, "Intervention KS Titty no ADS", ::INTERKSTNNA50);
	self AddOption("Slomo Intervention Binds", 14, "Intervention Snac", ::xInterventionSnac50);
	self AddOption("Slomo Intervention Binds", 15, "Intervention Snac no ADS", ::xInterventionSnacnoads50);
	self AddOption("Slomo Intervention Binds", 16, "Intervention KS SNac", ::INTERKSSNAC50);
	self AddOption("Slomo Intervention Binds", 17, "Intervention KS SNac no ADS", ::INTERKSSNACNA50);
	
	self.BackMenu["Slomo Machine Pistol Binds"] = "Slomo Binds Menu";
	self AddOption("Slomo Machine Pistol Binds", 0, "Slomo PP2000 Binds", ::NewMenu, "Slomo PP2000 Binds");
	
	self.BackMenu["Slomo PP2000 Binds"] = "Slomo Machine Pistol Binds";
	self AddOption("Slomo PP2000 Binds", 0, "PP2000 Nac", ::PP2ReloadNac50);
	
	self.BackMenu["Slomo Shotgun Binds"] = "Slomo Binds Menu";
	self AddOption("Slomo Shotgun Binds", 0, "Slomo Spas-12 Binds", ::NewMenu, "Slomo Spas-12 Binds");
	self AddOption("Slomo Shotgun Binds", 1, "Slomo AA-12 Binds", ::NewMenu, "Slomo AA-12 Binds");
	self AddOption("Slomo Shotgun Binds", 2, "Slomo Striker Binds", ::NewMenu, "Slomo Striker Binds");
	self AddOption("Slomo Shotgun Binds", 3, "Slomo Ranger Binds", ::NewMenu, "Slomo Ranger Binds");
	self AddOption("Slomo Shotgun Binds", 4, "Slomo M1014 Binds", ::NewMenu, "Slomo M1014 Binds");
	self AddOption("Slomo Shotgun Binds", 5, "Slomo Model 1887 Binds", ::NewMenu, "Slomo Model 1887 Binds");
	
	self.BackMenu["Slomo Spas-12 Binds"] = "Slomo Shotgun Binds";
	self AddOption("Slomo Spas-12 Binds", 0, "Spas-12 Nac", ::xSpasReloadNac50);
	self AddOption("Slomo Spas-12 Binds", 1, "Spas-12 E Nac", ::SpasENac50);
	self AddOption("Slomo Spas-12 Binds", 2, "Spas-12 KS Nac", ::SpasKSRN50);
	self AddOption("Slomo Spas-12 Binds", 3, "Spas-12 Adelia", ::spasadelia50);
	self AddOption("Slomo Spas-12 Binds", 4, "Spas-12 Titty", ::xSpasTittyNac50);
	self AddOption("Slomo Spas-12 Binds", 5, "Spas-12 Titty no ADS", ::SpasTNacNoAds50);
	self AddOption("Slomo Spas-12 Binds", 6, "Spas-12 E Titty", ::SpasETitty50);
	self AddOption("Slomo Spas-12 Binds", 7, "Spas-12 E Titty no ADS", ::SpasETittyNA50);
	self AddOption("Slomo Spas-12 Binds", 8, "Spas-12 KS Titty", ::SpasKSTN50);
	self AddOption("Slomo Spas-12 Binds", 9, "Spas-12 KS Titty no ADS", ::SpasKSTNNA50);
	self AddOption("Slomo Spas-12 Binds", 10, "Spas-12 Mnac", ::xmnac50);
	self AddOption("Slomo Spas-12 Binds", 11, "Spas-12 Mnac no ADS", ::MNAC50);
	self AddOption("Slomo Spas-12 Binds", 12, "Spas-12 M-Adelia", ::xmadelia50);
	self AddOption("Slomo Spas-12 Binds", 13, "Spas-12 M-Adelia no ADS", ::madeliaNA50);
	self AddOption("Slomo Spas-12 Binds", 14, "Spas-12 KS Mnac", ::SpasKSMNAC50);
	self AddOption("Slomo Spas-12 Binds", 15, "Spas-12 KS Mnac no ADS", ::SpasKSMNACNA50);
	self AddOption("Slomo Spas-12 Binds", 16, "Spas-12 Snac", ::xSpasSnac50);
	self AddOption("Slomo Spas-12 Binds", 17, "Spas-12 Snac no ADS", ::xSpasSnacnoads50);
	self AddOption("Slomo Spas-12 Binds", 18, "Spas-12 KS Snac", ::SpasKSSNAC50);
	self AddOption("Slomo Spas-12 Binds", 19, "Spas-12 KS Snac no ADS", ::SpasKSSNACNA50);
	
	self.BackMenu["Slomo AA-12 Binds"] = "Slomo Shotgun Binds";
	self AddOption("Slomo AA-12 Binds", 0, "AA-12 Nac", ::aa12nac50);
	
	self.BackMenu["Slomo Striker Binds"] = "Slomo Shotgun Binds";
	self AddOption("Slomo Striker Binds", 0, "Striker Nac", ::strikernac50);
	
	self.BackMenu["Slomo Ranger Binds"] = "Slomo Shotgun Binds";
	self AddOption("Slomo Ranger Binds", 0, "Ranger Nac", ::rangernac50);
	
	self.BackMenu["Slomo M1014 Binds"] = "Slomo Shotgun Binds";
	self AddOption("Slomo M1014 Binds", 0, "M1014 Nac", ::m1014nac50);
	
	self.BackMenu["Slomo Model 1887 Binds"] = "Slomo Shotgun Binds";
	self AddOption("Slomo Model 1887 Binds", 0, "Model Nac", ::xmodelnac50);
	
	self.BackMenu["Slomo Handgun Binds"] = "Slomo Binds Menu";
	self AddOption("Slomo Handgun Binds", 0, "USP .45 Binds", ::NewMenu, "Slomo USP .45 Binds");

	self.BackMenu["Slomo USP .45 Binds"] = "Slomo Handgun Binds";
	self AddOption("Slomo USP .45 Binds", 0, "USP Nac", ::USPReloadNac50);
	
	self.BackMenu["Slomo Launcher Binds"] = "Slomo Binds Menu";
	self AddOption("Slomo Launcher Binds", 0, "Slomo RPG Binds", ::NewMenu, "Slomo RPG Binds");

	self.BackMenu["Slomo RPG Binds"] = "Slomo Launcher Binds";
	self AddOption("Slomo RPG Binds", 0, "RPG Nac", ::RPGNac50);
	
	
	self.BackMenu["Miscellaneous Binds"] = "Binds Menu";
	self AddOption("Miscellaneous Binds", 0, "Wrist Twist", ::WRISTTWIST);
	self AddOption("Miscellaneous Binds", 1, "Righty Tighty", ::RIGHTY);
	self AddOption("Miscellaneous Binds", 2, "Fake Silent", ::FakeSH);
	self AddOption("Miscellaneous Binds", 3, "Fast Troika", ::troika);
	self AddOption("Miscellaneous Binds", 4, "Reverse Reload", ::revr);
	self AddOption("Miscellaneous Binds", 5, "Reverse Reload Slow", ::revrs);
	self AddOption("Miscellaneous Binds", 6, "Instant Tac Plant", ::tacplant33);
	self AddOption("Miscellaneous Binds", 7, "Instant Tac Plant 2", ::instatac);
	self AddOption("Miscellaneous Binds", 8, "Wild Scope", ::wildscope);
	self AddOption("Miscellaneous Binds", 9, "Still Swap", ::stillswapleft);
	self AddOption("Miscellaneous Binds", 10, "Still Swap 2", ::stillswapleftS);
	self AddOption("Miscellaneous Binds", 11, "Still Swap KS", ::stillswapstreak);
	self AddOption("Miscellaneous Binds", 12, "Triple Fade", ::triplefade);
	self AddOption("Miscellaneous Binds", 13, "Underbarrel Moni", ::moninac);
	self AddOption("Miscellaneous Binds", 14, "Underbarrel Nac", ::ubnac);
	self AddOption("Miscellaneous Binds", 15, "Underbarrel Nac 2", ::ubnacs);
	self AddOption("Miscellaneous Binds", 16, "Underbarrel Adelia", ::ubadelia);


	self.BackMenu["Assault Rifle Binds"] = "Binds Menu";
	self AddOption("Assault Rifle Binds", 0, "Famas Binds", ::NewMenu, "Famas Binds");
	self AddOption("Assault Rifle Binds", 1, "TAR-21 Binds", ::NewMenu, "TAR-21 Binds");
	self AddOption("Assault Rifle Binds", 2, "FAL Binds", ::NewMenu, "FAL Binds");
	self AddOption("Assault Rifle Binds", 3, "M16 Binds", ::NewMenu, "M16 Binds");
	self AddOption("Assault Rifle Binds", 4, "ACR Binds", ::NewMenu, "ACR Binds");
	self AddOption("Assault Rifle Binds", 5, "AK47 Binds", ::NewMenu, "AK47 Binds");
	self AddOption("Assault Rifle Binds", 6, "SCAR-H Binds", ::NewMenu, "SCAR-H Binds");
	self AddOption("Assault Rifle Binds", 7, "M4A1 Binds", ::NewMenu, "M4A1 Binds");
	self AddOption("Assault Rifle Binds", 8, "F2000 Binds", ::NewMenu, "F2000 Binds");

	self.BackMenu["Famas Binds"] = "Assault Rifle Binds";
	self AddOption("Famas Binds", 0, "Famas Nac", ::famasRnac);
	self AddOption("Famas Binds", 1, "Famas E Nac", ::famasENac);
	self AddOption("Famas Binds", 2, "Famas KS Nac", ::famasStreak);
	self AddOption("Famas Binds", 3, "Famas Adelia", ::famasAdelia);

	self.BackMenu["TAR-21 Binds"] = "Assault Rifle Binds";
	self AddOption("TAR-21 Binds", 0, "TAR-21 Nac", ::TarRnac);
	self AddOption("TAR-21 Binds", 1, "TAR-21 E Nac", ::TarENac);
	self AddOption("TAR-21 Binds", 2, "TAR-21 KS Nac", ::TarStreak);
	self AddOption("TAR-21 Binds", 3, "TAR-21 Adelia", ::TarAdelia);

	self.BackMenu["FAL Binds"] = "Assault Rifle Binds";
	self AddOption("FAL Binds", 0, "FAL Nac", ::FALRnac);
	self AddOption("FAL Binds", 1, "FAL E Nac", ::FALENac);
	self AddOption("FAL Binds", 2, "FAL KS Nac", ::FALStreak);
	self AddOption("FAL Binds", 3, "FAL Adelia", ::FALAdelia);

	self.BackMenu["M16 Binds"] = "Assault Rifle Binds";
	self AddOption("M16 Binds", 0, "M16 Nac", ::M16Rnac);
	self AddOption("M16 Binds", 1, "M16 E Nac", ::M16ENac);
	self AddOption("M16 Binds", 2, "M16 KS Nac", ::M16Streak);
	self AddOption("M16 Binds", 3, "M16 Adelia", ::M16Adelia);

	self.BackMenu["ACR Binds"] = "Assault Rifle Binds";
	self AddOption("ACR Binds", 0, "ACR Nac", ::ACRRnac);
	self AddOption("ACR Binds", 1, "ACR E Nac", ::ACRENac);
	self AddOption("ACR Binds", 2, "ACR KS Nac", ::ACRStreak);
	self AddOption("ACR Binds", 3, "ACR Adelia", ::ACRAdelia);

	self.BackMenu["AK47 Binds"] = "Assault Rifle Binds";
	self AddOption("AK47 Binds", 0, "AK47 Nac", ::AK47Rnac);
	self AddOption("AK47 Binds", 1, "AK47 E Nac", ::AK47ENac);
	self AddOption("AK47 Binds", 2, "AK47 KS Nac", ::AK47Streak);
	self AddOption("AK47 Binds", 3, "AK47 Adelia", ::AK47Adelia);

	self.BackMenu["SCAR-H Binds"] = "Assault Rifle Binds";
	self AddOption("SCAR-H Binds", 0, "SCAR-H Nac", ::SCARRnac);
	self AddOption("SCAR-H Binds", 1, "SCAR-H E Nac", ::SCARENac);
	self AddOption("SCAR-H Binds", 2, "SCAR-H KS Nac", ::SCARStreak);
	self AddOption("SCAR-H Binds", 3, "SCAR-H Adelia", ::SCARAdelia);

	self.BackMenu["M4A1 Binds"] = "Assault Rifle Binds";
	self AddOption("M4A1 Binds", 0, "M4A1 Nac", ::M4A1Rnac);
	self AddOption("M4A1 Binds", 1, "M4A1 E Nac", ::M4A1ENac);
	self AddOption("M4A1 Binds", 2, "M4A1 KS Nac", ::M4A1Streak);
	self AddOption("M4A1 Binds", 3, "M4A1 Adelia", ::M4A1Adelia);

	self.BackMenu["F2000 Binds"] = "Assault Rifle Binds";
	self AddOption("F2000 Binds", 0, "F2000 Nac", ::F2KRnac);
	self AddOption("F2000 Binds", 1, "F2000 E Nac", ::F2KENac);
	self AddOption("F2000 Binds", 2, "F2000 KS Nac", ::F2KStreak);
	self AddOption("F2000 Binds", 3, "F2000 Adelia", ::F2KAdelia);

	self.BackMenu["Sub Machine Gun Binds"] = "Binds Menu";
	self AddOption("Sub Machine Gun Binds", 0, "MP5K Binds", ::NewMenu, "MP5K Binds");
	self AddOption("Sub Machine Gun Binds", 1, "UMP45 Binds", ::NewMenu, "UMP45 Binds");
	self AddOption("Sub Machine Gun Binds", 2, "Vector Binds", ::NewMenu, "Vector Binds");
	self AddOption("Sub Machine Gun Binds", 3, "P90 Binds", ::NewMenu, "P90 Binds");
	self AddOption("Sub Machine Gun Binds", 4, "UZI Binds", ::NewMenu, "UZI Binds");

	self.BackMenu["MP5K Binds"] = "Sub Machine Gun Binds";
	self AddOption("MP5K Binds", 0, "MP5K Nac", ::mp5Rnac);
	self AddOption("MP5K Binds", 1, "MP5K E Nac", ::mp5Enac);
	self AddOption("MP5K Binds", 2, "MP5K KS Nac", ::mp5Streak);
	self AddOption("MP5K Binds", 3, "MP5K Adelia", ::mp5Adelia);
	self AddOption("MP5K Binds", 4, "MP5K RT Nac", ::mp5RTNac);
	self AddOption("MP5K Binds", 5, "MP5K RT E Nac", ::mp5RTENac);
	self AddOption("MP5K Binds", 6, "MP5K RT KS Nac", ::mp5RTKSNac);
	self AddOption("MP5K Binds", 7, "MP5K RT Adelia", ::mp5RTAdelia);

	self.BackMenu["UMP45 Binds"] = "Sub Machine Gun Binds";
	self AddOption("UMP45 Binds", 0, "UMP45 Nac", ::umpRnac);
	self AddOption("UMP45 Binds", 1, "UMP45 E Nac", ::umpEnac);
	self AddOption("UMP45 Binds", 2, "UMP45 KS Nac", ::umpStreak);
	self AddOption("UMP45 Binds", 3, "UMP45 Adelia", ::umpAdelia);
	self AddOption("UMP45 Binds", 4, "UMP45 RT Nac", ::umpRTNac);
	self AddOption("UMP45 Binds", 5, "UMP45 RT E Nac", ::umpRTENac);
	self AddOption("UMP45 Binds", 6, "UMP45 RT KS Nac", ::umpRTKSNac);
	self AddOption("UMP45 Binds", 7, "UMP45 RT Adelia", ::umpRTAdelia);

	self.BackMenu["Vector Binds"] = "Sub Machine Gun Binds";
	self AddOption("Vector Binds", 0, "Vector Nac", ::vectorRnac);
	self AddOption("Vector Binds", 1, "Vector E Nac", ::vectorEnac);
	self AddOption("Vector Binds", 2, "Vector KS Nac", ::vectorStreak);
	self AddOption("Vector Binds", 3, "Vector Adelia", ::vectorAdelia);
	self AddOption("Vector Binds", 4, "Vector RT Nac", ::vectorRTNac);
	self AddOption("Vector Binds", 5, "Vector RT E Nac", ::vectorRTENac);
	self AddOption("Vector Binds", 6, "Vector RT KS Nac", ::vectorRTKSNac);
	self AddOption("Vector Binds", 7, "Vector RT Adelia", ::vectorRTAdelia);

	self.BackMenu["P90 Binds"] = "Sub Machine Gun Binds";
	self AddOption("P90 Binds", 0, "P90 Nac", ::p90Rnac);
	self AddOption("P90 Binds", 1, "P90 E Nac", ::p90Enac);
	self AddOption("P90 Binds", 2, "P90 KS Nac", ::p90Streak);
	self AddOption("P90 Binds", 3, "P90 Adelia", ::p90Adelia);
	self AddOption("P90 Binds", 4, "P90 RT Nac", ::p90RTNac);
	self AddOption("P90 Binds", 5, "P90 RT E Nac", ::p90RTENac);
	self AddOption("P90 Binds", 6, "P90 RT KS Nac", ::p90RTKSNac);
	self AddOption("P90 Binds", 7, "P90 RT Adelia", ::p90RTAdelia);

	self.BackMenu["UZI Binds"] = "Sub Machine Gun Binds";
	self AddOption("UZI Binds", 0, "UZI Nac", ::uziRnac);
	self AddOption("UZI Binds", 1, "UZI E Nac", ::uziEnac);
	self AddOption("UZI Binds", 2, "UZI KS Nac", ::uziStreak);
	self AddOption("UZI Binds", 3, "UZI Adelia", ::uziAdelia);
	self AddOption("UZI Binds", 4, "UZI RT Nac", ::uziRTNac);
	self AddOption("UZI Binds", 5, "UZI RT E Nac", ::uziRTENac);
	self AddOption("UZI Binds", 6, "UZI RT KS Nac", ::uziRTKSNac);
	self AddOption("UZI Binds", 7, "UZI RT Adelia", ::uziRTAdelia);

	self.BackMenu["Light Machine Gun Binds"] = "Binds Menu";
	self AddOption("Light Machine Gun Binds", 0, "L86 Binds", ::NewMenu, "L86 Binds");
	self AddOption("Light Machine Gun Binds", 1, "RPD Binds", ::NewMenu, "RPD Binds");
	self AddOption("Light Machine Gun Binds", 2, "MG4 Binds", ::NewMenu, "MG4 Binds");
	self AddOption("Light Machine Gun Binds", 3, "AUG Binds", ::NewMenu, "AUG Binds");
	self AddOption("Light Machine Gun Binds", 4, "M240 Binds", ::NewMenu, "M240 Binds");

	self.BackMenu["L86 Binds"] = "Light Machine Gun Binds";
	self AddOption("L86 Binds", 0, "L86 Nac", ::L86ReloadNac);
	self AddOption("L86 Binds", 1, "L86 KS Nac", ::L86KSNac);
	self AddOption("L86 Binds", 2, "L86 Adelia", ::L86Adalia);

	self.BackMenu["RPD Binds"] = "Light Machine Gun Binds";
	self AddOption("RPD Binds", 0, "RPD Nac", ::RPDReloadNac);
	self AddOption("RPD Binds", 1, "RPD KS Nac", ::RPDKSNac);
	self AddOption("RPD Binds", 2, "RPD Adelia", ::RPDAdalia);

	self.BackMenu["MG4 Binds"] = "Light Machine Gun Binds";
	self AddOption("MG4 Binds", 0, "MG4 Nac", ::MG4ReloadNac);
	self AddOption("MG4 Binds", 1, "MG4 KS Nac", ::MG4KSNac);
	self AddOption("MG4 Binds", 2, "MG4 Adelia", ::MG4Adalia);

	self.BackMenu["AUG Binds"] = "Light Machine Gun Binds";
	self AddOption("AUG Binds", 0, "AUG Nac", ::AUGReloadNac);
	self AddOption("AUG Binds", 1, "AUG KS Nac", ::AUGKSNac);
	self AddOption("AUG Binds", 2, "AUG Adelia", ::AUGAdalia);

	self.BackMenu["M240 Binds"] = "Light Machine Gun Binds";
	self AddOption("M240 Binds", 0, "M240 Nac", ::M240ReloadNac);
	self AddOption("M240 Binds", 1, "M240 KS Nac", ::M240KSNac);
	self AddOption("M240 Binds", 2, "M240 Adelia", ::M240Adalia);

	self.BackMenu["Sniper Rifle Binds"] = "Binds Menu";
	self AddOption("Sniper Rifle Binds", 0, "Intervention Binds", ::NewMenu, "Intervention Binds");
	self AddOption("Sniper Rifle Binds", 1, "Barrett .50cal Binds", ::NewMenu, "Barrett .50cal Binds");
	self AddOption("Sniper Rifle Binds", 2, "WA2000 Binds", ::NewMenu, "WA2000 Binds");
	self AddOption("Sniper Rifle Binds", 3, "M21 EBR Binds", ::NewMenu, "M21 EBR Binds");

	self.BackMenu["Intervention Binds"] = "Sniper Rifle Binds";
	self AddOption("Intervention Binds", 0, "Intervention Nac", ::xInterReloadNac);
	self AddOption("Intervention Binds", 1, "Intervention E Nac", ::interENac);
	self AddOption("Intervention Binds", 2, "Intervention KS Nac", ::INTERKSRN);
	self AddOption("Intervention Binds", 3, "Intervention Adelia", ::xInterAdalia);
	self AddOption("Intervention Binds", 4, "Intervention Full Nac", ::internacwoerreingeht);
	self AddOption("Intervention Binds", 5, "Intervention Full E Nac", ::interfullENac);
	self AddOption("Intervention Binds", 6, "Intervention Full KS Nac", ::interfullKSNac);
	self AddOption("Intervention Binds", 7, "Intervention Full Adelia", ::intergoinginadalia);
	self AddOption("Intervention Binds", 8, "Intervention Titty", ::xInterventionTittyNac);
	self AddOption("Intervention Binds", 9, "Intervention Titty no ADS", ::InterTNacNoAds);
	self AddOption("Intervention Binds", 10, "Intervention E Titty", ::interETN);
	self AddOption("Intervention Binds", 11, "Intervention E Titty no ADS", ::interETNNA);
	self AddOption("Intervention Binds", 12, "Intervention KS Titty", ::INTERKSTN);
	self AddOption("Intervention Binds", 13, "Intervention KS Titty no ADS", ::INTERKSTNNA);
	self AddOption("Intervention Binds", 14, "Intervention Snac", ::xInterventionSnac);
	self AddOption("Intervention Binds", 15, "Intervention Snac no ADS", ::xInterventionSnacnoads);
	self AddOption("Intervention Binds", 16, "Intervention KS SNac", ::INTERKSSNAC);
	self AddOption("Intervention Binds", 17, "Intervention KS SNac no ADS", ::INTERKSSNACNA);

	self.BackMenu["Barrett .50cal Binds"] = "Sniper Rifle Binds";
	self AddOption("Barrett .50cal Binds", 0, "Barrett Nac", ::barrettnac);
	self AddOption("Barrett .50cal Binds", 1, "Barrett E Nac", ::barrettEnac);
	self AddOption("Barrett .50cal Binds", 2, "Barrett KS Nac", ::barrettKSnac);
	self AddOption("Barrett .50cal Binds", 3, "Barrett Adelia", ::barrettadelia);

	self.BackMenu["WA2000 Binds"] = "Sniper Rifle Binds";
	self AddOption("WA2000 Binds", 0, "WA2000 Nac", ::wa2000nac);
	self AddOption("WA2000 Binds", 1, "WA2000 E Nac", ::wa2000Enac);
	self AddOption("WA2000 Binds", 2, "WA2000 KS Nac", ::wa2000KSnac);
	self AddOption("WA2000 Binds", 3, "WA2000 Adelia", ::wa2000adelia);

	self.BackMenu["M21 EBR Binds"] = "Sniper Rifle Binds";
	self AddOption("M21 EBR Binds", 0, "M21 EBR Nac", ::m21nac);
	self AddOption("M21 EBR Binds", 1, "M21 EBR E Nac", ::m21Enac);
	self AddOption("M21 EBR Binds", 2, "M21 EBR KS Nac", ::m21KSnac);
	self AddOption("M21 EBR Binds", 3, "M21 EBR Adelia", ::m21adelia);

	self.BackMenu["Machine Pistol Binds"] = "Binds Menu";
	self AddOption("Machine Pistol Binds", 0, "PP2000 Binds", ::NewMenu, "PP2000 Binds");
	self AddOption("Machine Pistol Binds", 1, "G18 Binds", ::NewMenu, "G18 Binds");
	self AddOption("Machine Pistol Binds", 2, "M93 Raffica Binds", ::NewMenu, "M93 Raffica Binds");
	self AddOption("Machine Pistol Binds", 3, "TMP Binds", ::NewMenu, "TMP Binds");

	self.BackMenu["PP2000 Binds"] = "Machine Pistol Binds";
	self AddOption("PP2000 Binds", 0, "PP2000 Nac", ::PP2ReloadNac);
	self AddOption("PP2000 Binds", 1, "PP2000 E Nac", ::PP2ENac);
	self AddOption("PP2000 Binds", 2, "PP2000 KS Nac", ::PP2KSNac);
	self AddOption("PP2000 Binds", 3, "PP2000 Adelia", ::PP2Adalia);
	self AddOption("PP2000 Binds", 4, "PP2000 RT Nac", ::PP2RTNac);
	self AddOption("PP2000 Binds", 5, "PP2000 RT E Nac", ::PP2RTENac);
	self AddOption("PP2000 Binds", 6, "PP2000 RT KS Nac", ::PP2RTKSNac);
	self AddOption("PP2000 Binds", 7, "PP2000 RT Adelia", ::PP2RTAdalia);

	self.BackMenu["G18 Binds"] = "Machine Pistol Binds";
	self AddOption("G18 Binds", 0, "G18 Nac", ::G18ReloadNac);
	self AddOption("G18 Binds", 1, "G18 E Nac", ::G18ENac);
	self AddOption("G18 Binds", 2, "G18 KS Nac", ::G18KSNac);
	self AddOption("G18 Binds", 3, "G18 Adelia", ::G18Adalia);
	self AddOption("G18 Binds", 4, "G18 RT Nac", ::G18RTNac);
	self AddOption("G18 Binds", 5, "G18 RT E Nac", ::G18RTENac);
	self AddOption("G18 Binds", 6, "G18 RT KS Nac", ::G18RTKSNac);
	self AddOption("G18 Binds", 7, "G18 RT Adelia", ::G18RTAdalia);

	self.BackMenu["M93 Raffica Binds"] = "Machine Pistol Binds";
	self AddOption("M93 Raffica Binds", 0, "M93 Raffica Nac", ::M93ReloadNac);
	self AddOption("M93 Raffica Binds", 1, "M93 Raffica E Nac", ::M93ENac);
	self AddOption("M93 Raffica Binds", 2, "M93 Raffica KS Nac", ::M93KSNac);
	self AddOption("M93 Raffica Binds", 3, "M93 Raffica Adelia", ::M93Adalia);
	self AddOption("M93 Raffica Binds", 4, "M93 Raffica RT Nac", ::M93RTNac);
	self AddOption("M93 Raffica Binds", 5, "M93 Raffica RT E Nac", ::M93RTENac);
	self AddOption("M93 Raffica Binds", 6, "M93 Raffica RT KS Nac", ::M93RTKSNac);
	self AddOption("M93 Raffica Binds", 7, "M93 Raffica RT Adelia", ::M93RTAdalia);

	self.BackMenu["TMP Binds"] = "Machine Pistol Binds";
	self AddOption("TMP Binds", 0, "TMP Nac", ::TMPReloadNac);
	self AddOption("TMP Binds", 1, "TMP E Nac", ::TMPENac);
	self AddOption("TMP Binds", 2, "TMP KS Nac", ::TMPKSNac);
	self AddOption("TMP Binds", 3, "TMP Adelia", ::TMPAdalia);
	self AddOption("TMP Binds", 4, "TMP RT Nac", ::TMPRTNac);
	self AddOption("TMP Binds", 5, "TMP RT E Nac", ::TMPRTENac);
	self AddOption("TMP Binds", 6, "TMP RT KS Nac", ::TMPRTKSNac);
	self AddOption("TMP Binds", 7, "TMP RT Adelia", ::TMPRTAdalia);

	self.BackMenu["Shotgun Binds"] = "Binds Menu";
	self AddOption("Shotgun Binds", 0, "Spas-12 Binds", ::NewMenu, "Spas-12 Binds");
	self AddOption("Shotgun Binds", 1, "AA-12 Binds", ::NewMenu, "AA-12 Binds");
	self AddOption("Shotgun Binds", 2, "Striker Binds", ::NewMenu, "Striker Binds");
	self AddOption("Shotgun Binds", 3, "Ranger Binds", ::NewMenu, "Ranger Binds");
	self AddOption("Shotgun Binds", 4, "M1014 Binds", ::NewMenu, "M1014 Binds");
	self AddOption("Shotgun Binds", 5, "Model 1887 Binds", ::NewMenu, "Model 1887 Binds");

	self.BackMenu["Spas-12 Binds"] = "Shotgun Binds";
	self AddOption("Spas-12 Binds", 0, "Spas-12 Nac", ::xSpasReloadNac);
	self AddOption("Spas-12 Binds", 1, "Spas-12 E Nac", ::SpasENac);
	self AddOption("Spas-12 Binds", 2, "Spas-12 KS Nac", ::SpasKSRN);
	self AddOption("Spas-12 Binds", 3, "Spas-12 Adelia", ::spasadelia);
	self AddOption("Spas-12 Binds", 4, "Spas-12 Titty", ::xSpasTittyNac);
	self AddOption("Spas-12 Binds", 5, "Spas-12 Titty no ADS", ::SpasTNacNoAds);
	self AddOption("Spas-12 Binds", 6, "Spas-12 E Titty", ::SpasETitty);
	self AddOption("Spas-12 Binds", 7, "Spas-12 E Titty no ADS", ::SpasETittyNA);
	self AddOption("Spas-12 Binds", 8, "Spas-12 KS Titty", ::SpasKSTN);
	self AddOption("Spas-12 Binds", 9, "Spas-12 KS Titty no ADS", ::SpasKSTNNA);
	self AddOption("Spas-12 Binds", 10, "Spas-12 Mnac", ::xmnac);
	self AddOption("Spas-12 Binds", 11, "Spas-12 Mnac no ADS", ::MNAC);
	self AddOption("Spas-12 Binds", 12, "Spas-12 M-Adelia", ::xmadelia);
	self AddOption("Spas-12 Binds", 13, "Spas-12 M-Adelia no ADS", ::madeliaNA);
	self AddOption("Spas-12 Binds", 14, "Spas-12 KS Mnac", ::SpasKSMNAC);
	self AddOption("Spas-12 Binds", 15, "Spas-12 KS Mnac no ADS", ::SpasKSMNACNA);
	self AddOption("Spas-12 Binds", 16, "Spas-12 Snac", ::xSpasSnac);
	self AddOption("Spas-12 Binds", 17, "Spas-12 Snac no ADS", ::xSpasSnacnoads);
	self AddOption("Spas-12 Binds", 18, "Spas-12 KS Snac", ::SpasKSSNAC);
	self AddOption("Spas-12 Binds", 19, "Spas-12 KS Snac no ADS", ::SpasKSSNACNA);

	self.BackMenu["AA-12 Binds"] = "Shotgun Binds";
	self AddOption("AA-12 Binds", 0, "AA-12 Nac", ::aa12nac);
	self AddOption("AA-12 Binds", 1, "AA-12 E Nac", ::aa12Enac);
	self AddOption("AA-12 Binds", 2, "AA-12 KS Nac", ::aa12KSnac);
	self AddOption("AA-12 Binds", 3, "AA-12 Adelia", ::aa12adelia);

	self.BackMenu["Striker Binds"] = "Shotgun Binds";
	self AddOption("Striker Binds", 0, "Striker Nac", ::strikernac);
	self AddOption("Striker Binds", 1, "Striker E Nac", ::strikerEnac);
	self AddOption("Striker Binds", 2, "Striker KS Nac", ::strikerKSnac);
	self AddOption("Striker Binds", 3, "Striker Adelia", ::strikeradalia);

	self.BackMenu["Ranger Binds"] = "Shotgun Binds";
	self AddOption("Ranger Binds", 0, "Ranger Nac", ::rangernac);
	self AddOption("Ranger Binds", 1, "Ranger E Nac", ::rangerEnac);
	self AddOption("Ranger Binds", 2, "Ranger KS Nac", ::rangerKSnac);
	self AddOption("Ranger Binds", 3, "Ranger Adelia", ::rangeradelia);

	self.BackMenu["M1014 Binds"] = "Shotgun Binds";
	self AddOption("M1014 Binds", 0, "M1014 Nac", ::m1014nac);
	self AddOption("M1014 Binds", 1, "M1014 E Nac", ::m1014Enac);
	self AddOption("M1014 Binds", 2, "M1014 KS Nac", ::m1014KSnac);
	self AddOption("M1014 Binds", 3, "M1014 Adelia", ::m1014adelia);

	self.BackMenu["Model 1887 Binds"] = "Shotgun Binds";
	self AddOption("Model 1887 Binds", 0, "Model Nac", ::xmodelnac);
	self AddOption("Model 1887 Binds", 1, "Model E Nac", ::ModelENac);
	self AddOption("Model 1887 Binds", 2, "Model KS Nac", ::ModelKSNac);
	self AddOption("Model 1887 Binds", 3, "Model Adelia", ::modeladalia);
	self AddOption("Model 1887 Binds", 4, "Model Full Nac", ::fullmodelnac);
	self AddOption("Model 1887 Binds", 5, "Model Full E Nac", ::ModelFullENac);
	self AddOption("Model 1887 Binds", 6, "Model Full KS Nac", ::ModelFullKsnac);
	self AddOption("Model 1887 Binds", 7, "Model Full Adelia", ::fullmodeladelia);
	self AddOption("Model 1887 Binds", 8, "Model Titty", ::xmodeltittynac);
	self AddOption("Model 1887 Binds", 9, "Model Titty no ADS", ::modelnoadstittynac);
	self AddOption("Model 1887 Binds", 10, "Model E Titty", ::ModelETN);
	self AddOption("Model 1887 Binds", 11, "Model E Titty no ADS", ::ModelETNNA);
	self AddOption("Model 1887 Binds", 12, "Model KS Titty", ::ModelKSTN);
	self AddOption("Model 1887 Binds", 13, "Model KS Titty no ADS", ::ModelKSTNNA);
	self AddOption("Model 1887 Binds", 14, "Model Snac", ::modelsnac);
	self AddOption("Model 1887 Binds", 15, "Model Snac no ADS", ::modelnoadssnac);
	self AddOption("Model 1887 Binds", 16, "Model KS Snac", ::ModelKSSNAC);
	self AddOption("Model 1887 Binds", 17, "Model KS Snac no ADS", ::ModelKSSNACNA);

	self.BackMenu["Handgun Binds"] = "Binds Menu";
	self AddOption("Handgun Binds", 0, "USP .45 Binds", ::NewMenu, "USP .45 Binds");
	self AddOption("Handgun Binds", 1, "44 Magnum Binds", ::NewMenu, "44 Magnum Binds");
	self AddOption("Handgun Binds", 2, "M9 Binds", ::NewMenu, "M9 Binds");
	self AddOption("Handgun Binds", 3, "Desert Eagle Binds", ::NewMenu, "Desert Eagle Binds");

	self.BackMenu["USP .45 Binds"] = "Handgun Binds";
	self AddOption("USP .45 Binds", 0, "USP Nac", ::USPReloadNac);
	self AddOption("USP .45 Binds", 1, "USP E Nac", ::USPENac);
	self AddOption("USP .45 Binds", 2, "USP KS Nac", ::USPKSNac);
	self AddOption("USP .45 Binds", 3, "USP Adelia", ::USPAdalia);
	self AddOption("USP .45 Binds", 4, "USP RT Nac", ::USPRTReloadNac);
	self AddOption("USP .45 Binds", 5, "USP RT E Nac", ::USPRTENac);
	self AddOption("USP .45 Binds", 6, "USP RT KS Nac", ::USPRTKSNac);
	self AddOption("USP .45 Binds", 7, "USP RT Adelia", ::USPRTAdalia);

	self.BackMenu["44 Magnum Binds"] = "Handgun Binds";
	self AddOption("44 Magnum Binds", 0, "Magnum Nac", ::ColtReloadNac);
	self AddOption("44 Magnum Binds", 1, "Magnum E Nac", ::ColtENac);
	self AddOption("44 Magnum Binds", 2, "Magnum KS Nac", ::ColtKSNac);
	self AddOption("44 Magnum Binds", 3, "Magnum Adelia", ::ColtAdalia);
	self AddOption("44 Magnum Binds", 4, "Magnum RT Nac", ::ColtRTReloadNac);
	self AddOption("44 Magnum Binds", 5, "Magnum RT E Nac", ::ColtRTENac);
	self AddOption("44 Magnum Binds", 6, "Magnum RT KS Nac", ::ColtRTKSNac);
	self AddOption("44 Magnum Binds", 7, "Magnum RT Adelia", ::ColtRTAdalia);

	self.BackMenu["M9 Binds"] = "Handgun Binds";
	self AddOption("M9 Binds", 0, "M9 Nac", ::M9ReloadNac);
	self AddOption("M9 Binds", 1, "M9 E Nac", ::M9ENac);
	self AddOption("M9 Binds", 2, "M9 KS Nac", ::M9KSNac);
	self AddOption("M9 Binds", 3, "M9 Adelia", ::M9Adalia);
	self AddOption("M9 Binds", 4, "M9 RT Nac", ::M9RTReloadNac);
	self AddOption("M9 Binds", 5, "M9 RT E Nac", ::M9RTENac);
	self AddOption("M9 Binds", 6, "M9 RT KS Nac", ::M9RTKSNac);
	self AddOption("M9 Binds", 7, "M9 RT Adelia", ::M9RTAdalia);

	self.BackMenu["Desert Eagle Binds"] = "Handgun Binds";
	self AddOption("Desert Eagle Binds", 0, "Deagle Nac", ::DeagleReloadNac);
	self AddOption("Desert Eagle Binds", 1, "Deagle E Nac", ::DeagleENac);
	self AddOption("Desert Eagle Binds", 2, "Deagle KS Nac", ::DeagleKSNac);
	self AddOption("Desert Eagle Binds", 3, "Deagle Adelia", ::DeagleAdalia);
	self AddOption("Desert Eagle Binds", 4, "Deagle RT Nac", ::DeagleRTReloadNac);
	self AddOption("Desert Eagle Binds", 5, "Deagle RT E Nac", ::DeagleRTENac);
	self AddOption("Desert Eagle Binds", 6, "Deagle RT KS Nac", ::DeagleRTKSNac);
	self AddOption("Desert Eagle Binds", 7, "Deagle RT Adelia", ::DeagleRTAdalia);

	self.BackMenu["Launcher Binds"] = "Binds Menu";
	self AddOption("Launcher Binds", 0, "RPG Binds", ::NewMenu, "RPG Binds");

	self.BackMenu["RPG Binds"] = "Launcher Binds";
	self AddOption("RPG Binds", 0, "RPG Nac", ::RPGNac);
	self AddOption("RPG Binds", 1, "RPG E Nac", ::RPGENac);
	self AddOption("RPG Binds", 2, "RPG KS Nac", ::RPGKSNac);
	self AddOption("RPG Binds", 3, "RPG Adelia", ::RPGAdelia);
	
	self.BackMenu["Gunlock Menu"] = "Main Menu";
	self AddOption("Gunlock Menu", 0, "Normal Gunlock", ::NewMenu, "Normal Gunlock");
	self AddOption("Gunlock Menu", 1, "Claymore Gunlock", ::NewMenu, "Claymore Gunlock");
	self AddOption("Gunlock Menu", 2, "C4 Gunlock", ::NewMenu, "C4 Gunlock");
	self AddOption("Gunlock Menu", 3, "Bomb Gunlock", ::NewMenu, "Bomb Gunlock");
	self AddOption("Gunlock Menu", 4, "Ratchet Gunlock", ::NewMenu, "Ratchet Gunlock");
	
	self.BackMenu["Normal Gunlock"] = "Gunlock Menu";
	self AddOption("Normal Gunlock", 0, "Normal Gunlock [{+actionslot 1}]", ::gunglitchbindall1tt);
	self AddOption("Normal Gunlock", 1, "Normal Gunlock [{+actionslot 2}]", ::gunglitchbind);
	self AddOption("Normal Gunlock", 2, "Normal Gunlock [{+actionslot 3}]", ::gunglitchbindall);
	self AddOption("Normal Gunlock", 3, "Normal Gunlock [{+actionslot 4}]", ::gunglitchbindall1);
	
	self.BackMenu["Claymore Gunlock"] = "Gunlock Menu";
	self AddOption("Claymore Gunlock", 0, "Claymore Gunlock [{+actionslot 1}]", ::gunglitchbind2claymoresniper221);
	self AddOption("Claymore Gunlock", 1, "Claymore Gunlock [{+actionslot 2}]", ::gunglitchbind2claymoresniper22);
	self AddOption("Claymore Gunlock", 2, "Claymore Gunlock [{+actionslot 3}]", ::gunglitchbind2claymoresniper2);
	self AddOption("Claymore Gunlock", 3, "Claymore Gunlock [{+actionslot 4}]", ::gunglitchbind2claymoresniper);
	self AddOption("Claymore Gunlock", 4, "Claymore Gunlock Pistol [{+actionslot 1}]", ::gunglitchbind2x341);
	self AddOption("Claymore Gunlock", 5, "Claymore Gunlock Pistol [{+actionslot 2}]", ::gunglitchbind2x);
	self AddOption("Claymore Gunlock", 6, "Claymore Gunlock Pistol [{+actionslot 3}]", ::gunglitchbind2x3);
	self AddOption("Claymore Gunlock", 7, "Claymore Gunlock Pistol [{+actionslot 4}]", ::gunglitchbind2x34);
	
	self.BackMenu["C4 Gunlock"] = "Gunlock Menu";
	self AddOption("C4 Gunlock", 0, "C4 Gunlock [{+actionslot 1}]", ::gunglitchbind2claymoresniper222c4onlinet);
	self AddOption("C4 Gunlock", 1, "C4 Gunlock [{+actionslot 2}]", ::gunglitchbind2claymoresniper222c4online);
	self AddOption("C4 Gunlock", 2, "C4 Gunlock [{+actionslot 3}]", ::gunglitchbind2claymoresniper2222c4online);
	self AddOption("C4 Gunlock", 3, "C4 Gunlock [{+actionslot 4}]", ::gunglitchbind2claymoresniper22222c4online);
	self AddOption("C4 Gunlock", 4, "C4 Gunlock Pistol [{+actionslot 1}]", ::gunglitchbind2xc422onlinet);
	self AddOption("C4 Gunlock", 5, "C4 Gunlock Pistol [{+actionslot 2}]", ::gunglitchbind2xc4online);
	self AddOption("C4 Gunlock", 6, "C4 Gunlock Pistol [{+actionslot 3}]", ::gunglitchbind2xc42online);
	self AddOption("C4 Gunlock", 7, "C4 Gunlock Pistol [{+actionslot 4}]", ::gunglitchbind2xc42onlineh);
	
	self.BackMenu["Bomb Gunlock"] = "Gunlock Menu";
	self AddOption("Bomb Gunlock", 0, "Bomb Gunlock [{+actionslot 1}]", ::predglitchbind1b);
	self AddOption("Bomb Gunlock", 1, "Bomb Gunlock [{+actionslot 2}]", ::predglitchbind1b1);
	self AddOption("Bomb Gunlock", 2, "Bomb Gunlock [{+actionslot 3}]", ::predglitchbind1b11);
	self AddOption("Bomb Gunlock", 3, "Bomb Gunlock [{+actionslot 4}]", ::predglitchbind1b111);
	self AddOption("Bomb Gunlock", 4, "Bomb Gunlock Pistol [{+actionslot 1}]", ::predglitchbind1be);
	self AddOption("Bomb Gunlock", 5, "Bomb Gunlock Pistol [{+actionslot 2}]", ::predglitchbind1be1);
	self AddOption("Bomb Gunlock", 6, "Bomb Gunlock Pistol [{+actionslot 3}]", ::predglitchbind1be11);
	self AddOption("Bomb Gunlock", 7, "Bomb Gunlock Pistol [{+actionslot 4}]", ::predglitchbind1be111);
	
	self.BackMenu["Ratchet Gunlock"] = "Gunlock Menu";
	self AddOption("Ratchet Gunlock", 0, "Ratchet Gunlock [{+actionslot 1}]", ::predglitchbind1);
	self AddOption("Ratchet Gunlock", 1, "Ratchet Gunlock [{+actionslot 2}]", ::predglitchbind);
	self AddOption("Ratchet Gunlock", 2, "Ratchet Gunlock [{+actionslot 3}]", ::predglitchbind23);
	self AddOption("Ratchet Gunlock", 3, "Ratchet Gunlock [{+actionslot 4}]", ::predglitchbind234);
	

	
	self.BackMenu["Killstreak Menu"] = "Main Menu";
	self AddOption("Killstreak Menu", 0, "Give UAV", ::AllKSNIGZ, "uav");
    self AddOption("Killstreak Menu", 1, "Give Carepackage", ::AllKSNIGZ, "airdrop");
    self AddOption("Killstreak Menu", 2, "Give Counter-UAV", ::AllKSNIGZ, "counter_uav");
    self AddOption("Killstreak Menu", 3, "Give Sentry Gun", ::AllKSNIGZ, "sentry");
    self AddOption("Killstreak Menu", 4, "Give Predator Missile", ::AllKSNIGZ, "predator_missile");
    self AddOption("Killstreak Menu", 5, "Give Precision Airstrike", ::AllKSNIGZ, "precision_airstrike");
    self AddOption("Killstreak Menu", 6, "Give Harrier Strike", ::AllKSNIGZ, "harrier_airstrike");
    self AddOption("Killstreak Menu", 7, "Give Attack Helicopter", ::AllKSNIGZ, "helicopter");
    self AddOption("Killstreak Menu", 8, "Give Emergency Airdrop", ::AllKSNIGZ, "airdrop_mega");
    self AddOption("Killstreak Menu", 9, "Give Pave Low", ::AllKSNIGZ, "helicopter_flares");
    self AddOption("Killstreak Menu", 10, "Give Stealth Bomber", ::AllKSNIGZ, "stealth_airstrike");
    self AddOption("Killstreak Menu", 11, "Give Chopper Gunner", ::AllKSNIGZ, "helicopter_minigun");
    self AddOption("Killstreak Menu", 12, "Give AC130", ::AllKSNIGZ, "ac130");
    self AddOption("Killstreak Menu", 13, "Give EMP", ::AllKSNIGZ, "emp");
    self AddOption("Killstreak Menu", 14, "Give Tactical Nuke", ::AllKSNIGZ, "nuke");
    self AddOption("Killstreak Menu", 15, "Clear Killstreaks", ::removeKS);
    self AddOption("Killstreak Menu", 16, "Carepackage On Crosshair", ::LaVaiCP);
	//self AddOption("Killstreak Menu", 17, "Carepackage Options Panel", ::NewMenu, "Carepackage Options Panel");
	
	self.BackMenu["Carepackage Options Panel"] = "Killstreak Menu";
	self AddOption("Carepackage Options Panel", 0, "Carepackages Dont Bounce [Temp Remove]", ::test666);
	self AddOption("Carepackage Options Panel", 1, "Carepackages Spawn Vertical [Temp Remove]", ::test666);
	self AddOption("Carepackage Options Panel", 2, "Carepackages Spawn Horizontal [Temp Remove]", ::test666);
	self AddOption("Carepackage Options Panel", 3, "Carepackages Have Ammo [Temp Remove]", ::test666);
	self AddOption("Carepackage Options Panel", 4, "Carepackages Have EMP [Temp Remove]", ::test666);
	self AddOption("Carepackage Options Panel", 5, "Enable Fast Carepackage Grab [Temp Remove]", ::test666);
	self AddOption("Carepackage Options Panel", 6, "Enable Gun Usage on Stalls [Temp Remove]", ::test666);
	
	self.BackMenu["Weapons Menu"] = "Main Menu";
	self AddOption("Weapons Menu", 0, "Take All Weapons", ::takeallnigga);
	self AddOption("Weapons Menu", 1, "Take Current Weapon", ::removedagun);
	self AddOption("Weapons Menu", 2, "Drop Current Weapon", ::dropdagun);
	self AddOption("Weapons Menu", 3, "Refill Weapon Ammo", ::refillammo);
	self AddOption("Weapons Menu", 4, "Refill Leathal Ammo", ::refillequip);
	self AddOption("Weapons Menu", 5, "Assault Rifles", ::NewMenu, "Assault Rifles");
	self AddOption("Weapons Menu", 6, "Submachine Guns", ::NewMenu, "Submachine Guns");
	self AddOption("Weapons Menu", 7, "Lightmachine Guns", ::NewMenu, "Lightmachine Guns");
	self AddOption("Weapons Menu", 8, "Sniper Rifles", ::NewMenu, "Sniper Rifles");
	self AddOption("Weapons Menu", 9, "Machine Pistols", ::NewMenu, "Machine Pistols");
	self AddOption("Weapons Menu", 10, "Shotguns", ::NewMenu, "Shotguns");
	self AddOption("Weapons Menu", 11, "Handguns", ::NewMenu, "Handguns");
	self AddOption("Weapons Menu", 12, "Launchers", ::NewMenu, "Launchers");
	self AddOption("Weapons Menu", 13, "Misc Weapons Menu", ::NewMenu, "Misc Weapons Menu");
	self AddOption("Weapons Menu", 14, "Weapon Drop Panel", ::NewMenu, "Weapon Drop Panel");
	self AddOption("Weapons Menu", 15, "Give Random Class", ::randomfuckinclass);
	
	self.BackMenu["Assault Rifles"] = "Weapons Menu";
	self AddOption("Assault Rifles", 0, "M4A1", ::NewMenu, "M4A1");
	self AddOption("Assault Rifles", 1, "FAMAS", ::NewMenu, "FAMAS");
	self AddOption("Assault Rifles", 2, "SCAR-H", ::NewMenu, "SCAR-H");
	self AddOption("Assault Rifles", 3, "TAR-21", ::NewMenu, "TAR-21");
	self AddOption("Assault Rifles", 4, "FAL", ::NewMenu, "FAL");
	self AddOption("Assault Rifles", 5, "M16A4", ::NewMenu, "M16A4");
	self AddOption("Assault Rifles", 6, "ACR", ::NewMenu, "ACR");
	self AddOption("Assault Rifles", 7, "F2000", ::NewMenu, "F2000");
	self AddOption("Assault Rifles", 8, "AK47", ::NewMenu, "AK47");

	self.BackMenu["M4A1"] = "Assault Rifles";
	self AddOption("M4A1", 0, "M4A1", ::GiveWeapons, "m4_mp");
	self AddOption("M4A1", 1, "M4A1 Grenade Launcher", ::GiveWeapons, "m4_gl_mp");
	self AddOption("M4A1", 2, "M4A1 Red Dot Sight", ::GiveWeapons, "m4_reflex_mp");
	self AddOption("M4A1", 3, "M4A1 Silencer", ::GiveWeapons, "m4_silencer_mp");
	self AddOption("M4A1", 4, "M4A1 ACOG Scope", ::GiveWeapons, "m4_acog_mp");
	self AddOption("M4A1", 5, "M4A1 FMJ", ::GiveWeapons, "m4_fmj_mp");
	self AddOption("M4A1", 6, "M4A1 Shotgun", ::GiveWeapons, "m4_shotgun_mp");
	self AddOption("M4A1", 7, "M4A1 Holographic Sight", ::GiveWeapons, "m4_eotech_mp");
	self AddOption("M4A1", 8, "M4A1 Heartbeat Sensor", ::GiveWeapons, "m4_heartbeat_mp");
	self AddOption("M4A1", 9, "M4A1 Thermal", ::GiveWeapons, "m4_thermal_mp");
	self AddOption("M4A1", 10, "M4A1 Extended Mags", ::GiveWeapons, "m4_xmags_mp");

	self.BackMenu["FAMAS"] = "Assault Rifles";
	self AddOption("FAMAS", 0, "FAMAS", ::GiveWeapons, "famas_mp");
	self AddOption("FAMAS", 1, "FAMAS Grenade Launcher", ::GiveWeapons, "famas_gl_mp");
	self AddOption("FAMAS", 2, "FAMAS Red Dot Sight", ::GiveWeapons, "famas_reflex_mp");
	self AddOption("FAMAS", 3, "FAMAS Silencer", ::GiveWeapons, "famas_silencer_mp");
	self AddOption("FAMAS", 4, "FAMAS ACOG Scope", ::GiveWeapons, "famas_acog_mp");
	self AddOption("FAMAS", 5, "FAMAS FMJ", ::GiveWeapons, "famas_fmj_mp");
	self AddOption("FAMAS", 6, "FAMAS Shotgun", ::GiveWeapons, "famas_shotgun_mp");
	self AddOption("FAMAS", 7, "FAMAS Holographic Sight", ::GiveWeapons, "famas_eotech_mp");
	self AddOption("FAMAS", 8, "FAMAS Heartbeat Sensor", ::GiveWeapons, "famas_heartbeat_mp");
	self AddOption("FAMAS", 9, "FAMAS Thermal", ::GiveWeapons, "famas_thermal_mp");
	self AddOption("FAMAS", 10, "FAMAS Extended Mags", ::GiveWeapons, "famas_xmags_mp");

	self.BackMenu["SCAR-H"] = "Assault Rifles";
	self AddOption("SCAR-H", 0, "SCAR-H", ::GiveWeapons, "scar_mp");
	self AddOption("SCAR-H", 1, "SCAR-H Grenade Launcher", ::GiveWeapons, "scar_gl_mp");
	self AddOption("SCAR-H", 2, "SCAR-H Red Dot Sight", ::GiveWeapons, "scar_reflex_mp");
	self AddOption("SCAR-H", 3, "SCAR-H Silencer", ::GiveWeapons, "scar_silencer_mp");
	self AddOption("SCAR-H", 4, "SCAR-H ACOG Scope", ::GiveWeapons, "scar_acog_mp");
	self AddOption("SCAR-H", 5, "SCAR-H FMJ", ::GiveWeapons, "scar_fmj_mp");
	self AddOption("SCAR-H", 6, "SCAR-H Shotgun", ::GiveWeapons, "scar_shotgun_mp");
	self AddOption("SCAR-H", 7, "SCAR-H Holographic Sight", ::GiveWeapons, "scar_eotech_mp");
	self AddOption("SCAR-H", 8, "SCAR-H Heartbeat Sensor", ::GiveWeapons, "scar_heartbeat_mp");
	self AddOption("SCAR-H", 9, "SCAR-H Thermal", ::GiveWeapons, "scar_thermal_mp");
	self AddOption("SCAR-H", 10, "SCAR-H Extended Mags", ::GiveWeapons, "scar_xmags_mp");

	self.BackMenu["TAR-21"] = "Assault Rifles";
	self AddOption("TAR-21", 0, "TAR-21", ::GiveWeapons, "tavor_mp");
	self AddOption("TAR-21", 1, "TAR-21 Grenade Launcher", ::GiveWeapons, "tavor_gl_mp");
	self AddOption("TAR-21", 2, "TAR-21 Red Dot Sight", ::GiveWeapons, "tavor_reflex_mp");
	self AddOption("TAR-21", 3, "TAR-21 Silencer", ::GiveWeapons, "tavor_silencer_mp");
	self AddOption("TAR-21", 4, "TAR-21 ACOG Scope", ::GiveWeapons, "tavor_acog_mp");
	self AddOption("TAR-21", 5, "TAR-21 FMJ", ::GiveWeapons, "tavor_fmj_mp");
	self AddOption("TAR-21", 6, "TAR-21 Shotgun", ::GiveWeapons, "tavor_shotgun_mp");
	self AddOption("TAR-21", 7, "TAR-21 Holographic Sight", ::GiveWeapons, "tavor_eotech_mp");
	self AddOption("TAR-21", 8, "TAR-21 Heartbeat Sensor", ::GiveWeapons, "tavor_heartbeat_mp");
	self AddOption("TAR-21", 9, "TAR-21 Thermal", ::GiveWeapons, "tavor_thermal_mp");
	self AddOption("TAR-21", 10, "TAR-21 Extended Mags", ::GiveWeapons, "tavor_xmags_mp");

	self.BackMenu["FAL"] = "Assault Rifles";
	self AddOption("FAL", 0, "FAL", ::GiveWeapons, "fal_mp");
	self AddOption("FAL", 1, "FAL Grenade Launcher", ::GiveWeapons, "fal_gl_mp");
	self AddOption("FAL", 2, "FAL Red Dot Sight", ::GiveWeapons, "fal_reflex_mp");
	self AddOption("FAL", 3, "FAL Silencer", ::GiveWeapons, "fal_silencer_mp");
	self AddOption("FAL", 4, "FAL ACOG Scope", ::GiveWeapons, "fal_acog_mp");
	self AddOption("FAL", 5, "FAL FMJ", ::GiveWeapons, "fal_fmj_mp");
	self AddOption("FAL", 6, "FAL Shotgun", ::GiveWeapons, "fal_shotgun_mp");
	self AddOption("FAL", 7, "FAL Holographic Sight", ::GiveWeapons, "fal_eotech_mp");
	self AddOption("FAL", 8, "FAL Heartbeat Sensor", ::GiveWeapons, "fal_heartbeat_mp");
	self AddOption("FAL", 9, "FAL Thermal", ::GiveWeapons, "fal_thermal_mp");
	self AddOption("FAL", 10, "FAL Extended Mags", ::GiveWeapons, "fal_xmags_mp");

	self.BackMenu["M16A4"] = "Assault Rifles";
	self AddOption("M16A4", 0, "M16A4", ::GiveWeapons, "m16_mp");
	self AddOption("M16A4", 1, "M16A4 Grenade Launcher", ::GiveWeapons, "m16_gl_mp");
	self AddOption("M16A4", 2, "M16A4 Red Dot Sight", ::GiveWeapons, "m16_reflex_mp");
	self AddOption("M16A4", 3, "M16A4 Silencer", ::GiveWeapons, "m16_silencer_mp");
	self AddOption("M16A4", 4, "M16A4 ACOG Scope", ::GiveWeapons, "m16_acog_mp");
	self AddOption("M16A4", 5, "M16A4 FMJ", ::GiveWeapons, "m16_fmj_mp");
	self AddOption("M16A4", 6, "M16A4 Shotgun", ::GiveWeapons, "m16_shotgun_mp");
	self AddOption("M16A4", 7, "M16A4 Holographic Sight", ::GiveWeapons, "m16_eotech_mp");
	self AddOption("M16A4", 8, "M16A4 Heartbeat Sensor", ::GiveWeapons, "m16_heartbeat_mp");
	self AddOption("M16A4", 9, "M16A4 Thermal", ::GiveWeapons, "m16_thermal_mp");
	self AddOption("M16A4", 10, "M16A4 Extended Mags", ::GiveWeapons, "m16_xmags_mp");

	self.BackMenu["ACR"] = "Assault Rifles";
	self AddOption("ACR", 0, "ACR", ::GiveWeapons, "masada_mp");
	self AddOption("ACR", 1, "ACR Grenade Launcher", ::GiveWeapons, "masada_gl_mp");
	self AddOption("ACR", 2, "ACR Red Dot Sight", ::GiveWeapons, "masada_reflex_mp");
	self AddOption("ACR", 3, "ACR Silencer", ::GiveWeapons, "masada_silencer_mp");
	self AddOption("ACR", 4, "ACR ACOG Scope", ::GiveWeapons, "masada_acog_mp");
	self AddOption("ACR", 5, "ACR FMJ", ::GiveWeapons, "masada_fmj_mp");
	self AddOption("ACR", 6, "ACR Shotgun", ::GiveWeapons, "masada_shotgun_mp");
	self AddOption("ACR", 7, "ACR Holographic Sight", ::GiveWeapons, "masada_eotech_mp");
	self AddOption("ACR", 8, "ACR Heartbeat Sensor", ::GiveWeapons, "masada_heartbeat_mp");
	self AddOption("ACR", 9, "ACR Thermal", ::GiveWeapons, "masada_thermal_mp");
	self AddOption("ACR", 10, "ACR Extended Mags", ::GiveWeapons, "masada_xmags_mp");

	self.BackMenu["F2000"] = "Assault Rifles";
	self AddOption("F2000", 0, "F2000", ::GiveWeapons, "fn2000_mp");
	self AddOption("F2000", 1, "F2000 Grenade Launcher", ::GiveWeapons, "fn2000_gl_mp");
	self AddOption("F2000", 2, "F2000 Red Dot Sight", ::GiveWeapons, "fn2000_reflex_mp");
	self AddOption("F2000", 3, "F2000 Silencer", ::GiveWeapons, "fn2000_silencer_mp");
	self AddOption("F2000", 4, "F2000 ACOG Scope", ::GiveWeapons, "fn2000_acog_mp");
	self AddOption("F2000", 5, "F2000 FMJ", ::GiveWeapons, "fn2000_fmj_mp");
	self AddOption("F2000", 6, "F2000 Shotgun", ::GiveWeapons, "fn2000_shotgun_mp");
	self AddOption("F2000", 7, "F2000 Holographic Sight", ::GiveWeapons, "fn2000_eotech_mp");
	self AddOption("F2000", 8, "F2000 Heartbeat Sensor", ::GiveWeapons, "fn2000_heartbeat_mp");
	self AddOption("F2000", 9, "F2000 Thermal", ::GiveWeapons, "fn2000_thermal_mp");
	self AddOption("F2000", 10, "F2000 Extended Mags", ::GiveWeapons, "fn2000_xmags_mp");

	self.BackMenu["AK47"] = "Assault Rifles";
	self AddOption("AK47", 0, "AK47", ::GiveWeapons, "ak47_mp");
	self AddOption("AK47", 1, "AK47 Grenade Launcher", ::GiveWeapons, "ak47_gl_mp");
	self AddOption("AK47", 2, "AK47 Red Dot Sight", ::GiveWeapons, "ak47_reflex_mp");
	self AddOption("AK47", 3, "AK47 Silencer", ::GiveWeapons, "ak47_silencer_mp");
	self AddOption("AK47", 4, "AK47 ACOG Scope", ::GiveWeapons, "ak47_acog_mp");
	self AddOption("AK47", 5, "AK47 FMJ", ::GiveWeapons, "ak47_fmj_mp");
	self AddOption("AK47", 6, "AK47 Shotgun", ::GiveWeapons, "ak47_shotgun_mp");
	self AddOption("AK47", 7, "AK47 Holographic Sight", ::GiveWeapons, "ak47_eotech_mp");
	self AddOption("AK47", 8, "AK47 Heartbeat Sensor", ::GiveWeapons, "ak47_heartbeat_mp");
	self AddOption("AK47", 9, "AK47 Thermal", ::GiveWeapons, "ak47_thermal_mp");
	self AddOption("AK47", 10, "AK47 Extended Mags", ::GiveWeapons, "ak47_xmags_mp");
	
	self.BackMenu["Submachine Guns"] = "Weapons Menu";
	self AddOption("Submachine Guns", 0, "MP5K", ::NewMenu, "MP5K");
	self AddOption("Submachine Guns", 1, "UMP45", ::NewMenu, "UMP45");
	self AddOption("Submachine Guns", 2, "Vector", ::NewMenu, "Vector");
	self AddOption("Submachine Guns", 3, "P90", ::NewMenu, "P90");
	self AddOption("Submachine Guns", 4, "Mini-Uzi", ::NewMenu, "Mini-Uzi");

	self.BackMenu["MP5K"] = "Submachine Guns";
	self AddOption("MP5K", 0, "MP5K", ::GiveWeapons, "mp5k_mp");
	self AddOption("MP5K", 1, "MP5K Rapid Fire", ::GiveWeapons, "mp5k_rof_mp");
	self AddOption("MP5K", 2, "MP5K Red Dot Sight", ::GiveWeapons, "mp5k_reflex_mp");
	self AddOption("MP5K", 3, "MP5K Silencer", ::GiveWeapons, "mp5k_silencer_mp");
	self AddOption("MP5K", 4, "MP5K ACOG Scope", ::GiveWeapons, "mp5k_acog_mp");
	self AddOption("MP5K", 5, "MP5K FMJ", ::GiveWeapons, "mp5k_fmj_mp");
	self AddOption("MP5K", 6, "MP5K Akimbo", ::GiveWeapons, "mp5k_akimbo_mp");
	self AddOption("MP5K", 7, "MP5K Holographic Sight", ::GiveWeapons, "mp5k_eotech_mp");
	self AddOption("MP5K", 8, "MP5K Thermal", ::GiveWeapons, "mp5k_thermal_mp");
	self AddOption("MP5K", 9, "MP5K Extended Mags", ::GiveWeapons, "mp5k_xmags_mp");

	self.BackMenu["UMP45"] = "Submachine Guns";
	self AddOption("UMP45", 0, "UMP45", ::GiveWeapons, "ump45_mp");
	self AddOption("UMP45", 1, "UMP45 Rapid Fire", ::GiveWeapons, "ump45_rof_mp");
	self AddOption("UMP45", 2, "UMP45 Red Dot Sight", ::GiveWeapons, "ump45_reflex_mp");
	self AddOption("UMP45", 3, "UMP45 Silencer", ::GiveWeapons, "ump45_silencer_mp");
	self AddOption("UMP45", 4, "UMP45 ACOG Scope", ::GiveWeapons, "ump45_acog_mp");
	self AddOption("UMP45", 5, "UMP45 FMJ", ::GiveWeapons, "ump45_fmj_mp");
	self AddOption("UMP45", 6, "UMP45 Akimbo", ::GiveWeapons, "ump45_akimbo_mp");
	self AddOption("UMP45", 7, "UMP45 Holographic Sight", ::GiveWeapons, "ump45_eotech_mp");
	self AddOption("UMP45", 8, "UMP45 Thermal", ::GiveWeapons, "ump45_thermal_mp");
	self AddOption("UMP45", 9, "UMP45 Extended Mags", ::GiveWeapons, "ump45_xmags_mp");

	self.BackMenu["Vector"] = "Submachine Guns";
	self AddOption("Vector", 0, "Vector", ::GiveWeapons, "kriss_mp");
	self AddOption("Vector", 1, "Vector Rapid Fire", ::GiveWeapons, "kriss_rof_mp");
	self AddOption("Vector", 2, "Vector Red Dot Sight", ::GiveWeapons, "kriss_reflex_mp");
	self AddOption("Vector", 3, "Vector Silencer", ::GiveWeapons, "kriss_silencer_mp");
	self AddOption("Vector", 4, "Vector ACOG Scope", ::GiveWeapons, "kriss_acog_mp");
	self AddOption("Vector", 5, "Vector FMJ", ::GiveWeapons, "kriss_fmj_mp");
	self AddOption("Vector", 6, "Vector Akimbo", ::GiveWeapons, "kriss_akimbo_mp");
	self AddOption("Vector", 7, "Vector Holographic Sight", ::GiveWeapons, "kriss_eotech_mp");
	self AddOption("Vector", 8, "Vector Thermal", ::GiveWeapons, "kriss_thermal_mp");
	self AddOption("Vector", 9, "Vector Extended Mags", ::GiveWeapons, "kriss_xmags_mp");

	self.BackMenu["P90"] = "Submachine Guns";
	self AddOption("P90", 0, "P90", ::GiveWeapons, "p90_mp");
	self AddOption("P90", 1, "P90 Rapid Fire", ::GiveWeapons, "p90_rof_mp");
	self AddOption("P90", 2, "P90 Red Dot Sight", ::GiveWeapons, "p90_reflex_mp");
	self AddOption("P90", 3, "P90 Silencer", ::GiveWeapons, "p90_silencer_mp");
	self AddOption("P90", 4, "P90 ACOG Scope", ::GiveWeapons, "p90_acog_mp");
	self AddOption("P90", 5, "P90 FMJ", ::GiveWeapons, "p90_fmj_mp");
	self AddOption("P90", 6, "P90 Akimbo", ::GiveWeapons, "p90_akimbo_mp");
	self AddOption("P90", 7, "P90 Holographic Sight", ::GiveWeapons, "p90_eotech_mp");
	self AddOption("P90", 8, "P90 Thermal", ::GiveWeapons, "p90_thermal_mp");
	self AddOption("P90", 9, "P90 Extended Mags", ::GiveWeapons, "p90_xmags_mp");

	self.BackMenu["Mini-Uzi"] = "Submachine Guns";
	self AddOption("Mini-Uzi", 0, "Mini-Uzi", ::GiveWeapons, "uzi_mp");
	self AddOption("Mini-Uzi", 1, "Mini-Uzi Rapid Fire", ::GiveWeapons, "uzi_rof_mp");
	self AddOption("Mini-Uzi", 2, "Mini-Uzi Red Dot Sight", ::GiveWeapons, "uzi_reflex_mp");
	self AddOption("Mini-Uzi", 3, "Mini-Uzi Silencer", ::GiveWeapons, "uzi_silencer_mp");
	self AddOption("Mini-Uzi", 4, "Mini-Uzi ACOG Scope", ::GiveWeapons, "uzi_acog_mp");
	self AddOption("Mini-Uzi", 5, "Mini-Uzi FMJ", ::GiveWeapons, "uzi_fmj_mp");
	self AddOption("Mini-Uzi", 6, "Mini-Uzi Akimbo", ::GiveWeapons, "uzi_akimbo_mp");
	self AddOption("Mini-Uzi", 7, "Mini-Uzi Holographic Sight", ::GiveWeapons, "uzi_eotech_mp");
	self AddOption("Mini-Uzi", 8, "Mini-Uzi Thermal", ::GiveWeapons, "uzi_thermal_mp");
	self AddOption("Mini-Uzi", 9, "Mini-Uzi Extended Mags", ::GiveWeapons, "uzi_xmags_mp");
	
	self.BackMenu["Lightmachine Guns"] = "Weapons Menu";
	self AddOption("Lightmachine Guns", 0, "L86 LSW", ::NewMenu, "L86 LSW");
	self AddOption("Lightmachine Guns", 1, "RPD", ::NewMenu, "RPD");
	self AddOption("Lightmachine Guns", 2, "MG4", ::NewMenu, "MG4");
	self AddOption("Lightmachine Guns", 3, "AUG HBAR", ::NewMenu, "AUG HBAR");
	self AddOption("Lightmachine Guns", 4, "M240", ::NewMenu, "M240");

	self.BackMenu["L86 LSW"] = "Lightmachine Guns";
	self AddOption("L86 LSW", 0, "L86 LSW", ::GiveWeapons, "sa80_mp");
	self AddOption("L86 LSW", 1, "L86 LSW Grip", ::GiveWeapons, "sa80_grip_mp");
	self AddOption("L86 LSW", 2, "L86 LSW Red Dot Sight", ::GiveWeapons, "sa80_reflex_mp");
	self AddOption("L86 LSW", 3, "L86 LSW Silencer", ::GiveWeapons, "sa80_silencer_mp");
	self AddOption("L86 LSW", 4, "L86 LSW ACOG Scope", ::GiveWeapons, "sa80_acog_mp");
	self AddOption("L86 LSW", 5, "L86 LSW FMJ", ::GiveWeapons, "sa80_fmj_mp");
	self AddOption("L86 LSW", 6, "L86 LSW Holographic Sight", ::GiveWeapons, "sa80_eotech_mp");
	self AddOption("L86 LSW", 7, "L86 LSW Heartbeat Sensor", ::GiveWeapons, "sa80_heartbeat_mp");
	self AddOption("L86 LSW", 8, "L86 LSW Thermal", ::GiveWeapons, "sa80_thermal_mp");
	self AddOption("L86 LSW", 9, "L86 LSW Extended Mags", ::GiveWeapons, "sa80_xmags_mp");

	self.BackMenu["RPD"] = "Lightmachine Guns";
	self AddOption("RPD", 0, "RPD", ::GiveWeapons, "rpd_mp");
	self AddOption("RPD", 1, "RPD Grip", ::GiveWeapons, "rpd_grip_mp");
	self AddOption("RPD", 2, "RPD Red Dot Sight", ::GiveWeapons, "rpd_reflex_mp");
	self AddOption("RPD", 3, "RPD Silencer", ::GiveWeapons, "rpd_silencer_mp");
	self AddOption("RPD", 4, "RPD ACOG Scope", ::GiveWeapons, "rpd_acog_mp");
	self AddOption("RPD", 5, "RPD FMJ", ::GiveWeapons, "rpd_fmj_mp");
	self AddOption("RPD", 6, "RPD Holographic Sight", ::GiveWeapons, "rpd_eotech_mp");
	self AddOption("RPD", 7, "RPD Heartbeat Sensor", ::GiveWeapons, "rpd_heartbeat_mp");
	self AddOption("RPD", 8, "RPD Thermal", ::GiveWeapons, "rpd_thermal_mp");
	self AddOption("RPD", 9, "RPD Extended Mags", ::GiveWeapons, "rpd_xmags_mp");

	self.BackMenu["MG4"] = "Lightmachine Guns";
	self AddOption("MG4", 0, "MG4", ::GiveWeapons, "mg4_mp");
	self AddOption("MG4", 1, "MG4 Grip", ::GiveWeapons, "mg4_grip_mp");
	self AddOption("MG4", 2, "MG4 Red Dot Sight", ::GiveWeapons, "mg4_reflex_mp");
	self AddOption("MG4", 3, "MG4 Silencer", ::GiveWeapons, "mg4_silencer_mp");
	self AddOption("MG4", 4, "MG4 ACOG Scope", ::GiveWeapons, "mg4_acog_mp");
	self AddOption("MG4", 5, "MG4 FMJ", ::GiveWeapons, "mg4_fmj_mp");
	self AddOption("MG4", 6, "MG4 Holographic Sight", ::GiveWeapons, "mg4_eotech_mp");
	self AddOption("MG4", 7, "MG4 Heartbeat Sensor", ::GiveWeapons, "mg4_heartbeat_mp");
	self AddOption("MG4", 8, "MG4 Thermal", ::GiveWeapons, "mg4_thermal_mp");
	self AddOption("MG4", 9, "MG4 Extended Mags", ::GiveWeapons, "mg4_xmags_mp");

	self.BackMenu["AUG HBAR"] = "Lightmachine Guns";
	self AddOption("AUG HBAR", 0, "AUG HBAR", ::GiveWeapons, "aug_mp");
	self AddOption("AUG HBAR", 1, "AUG HBAR Grip", ::GiveWeapons, "aug_grip_mp");
	self AddOption("AUG HBAR", 2, "AUG HBAR Red Dot Sight", ::GiveWeapons, "aug_reflex_mp");
	self AddOption("AUG HBAR", 3, "AUG HBAR Silencer", ::GiveWeapons, "aug_silencer_mp");
	self AddOption("AUG HBAR", 4, "AUG HBAR ACOG Scope", ::GiveWeapons, "aug_acog_mp");
	self AddOption("AUG HBAR", 5, "AUG HBAR FMJ", ::GiveWeapons, "aug_fmj_mp");
	self AddOption("AUG HBAR", 6, "AUG HBAR Holographic Sight", ::GiveWeapons, "aug_eotech_mp");
	self AddOption("AUG HBAR", 7, "AUG HBAR Heartbeat Sensor", ::GiveWeapons, "aug_heartbeat_mp");
	self AddOption("AUG HBAR", 8, "AUG HBAR Thermal", ::GiveWeapons, "aug_thermal_mp");
	self AddOption("AUG HBAR", 9, "AUG HBAR Extended Mags", ::GiveWeapons, "aug_xmags_mp");

	self.BackMenu["M240"] = "Lightmachine Guns";
	self AddOption("M240", 0, "M240", ::GiveWeapons, "m240_mp");
	self AddOption("M240", 1, "M240 Grip", ::GiveWeapons, "m240_grip_mp");
	self AddOption("M240", 2, "M240 Red Dot Sight", ::GiveWeapons, "m240_reflex_mp");
	self AddOption("M240", 3, "M240 Silencer", ::GiveWeapons, "m240_silencer_mp");
	self AddOption("M240", 4, "M240 ACOG Scope", ::GiveWeapons, "m240_acog_mp");
	self AddOption("M240", 5, "M240 FMJ", ::GiveWeapons, "m240_fmj_mp");
	self AddOption("M240", 6, "M240 Holographic Sight", ::GiveWeapons, "m240_eotech_mp");
	self AddOption("M240", 7, "M240 Heartbeat Sensor", ::GiveWeapons, "m240_heartbeat_mp");
	self AddOption("M240", 8, "M240 Thermal", ::GiveWeapons, "m240_thermal_mp");
	self AddOption("M240", 9, "M240 Extended Mags", ::GiveWeapons, "m240_xmags_mp");
	
	self.BackMenu["Sniper Rifles"] = "Weapons Menu";
	self AddOption("Sniper Rifles", 0, "Intervention", ::NewMenu, "Intervention");
	self AddOption("Sniper Rifles", 1, "Barrett .50cal", ::NewMenu, "Barrett .50cal");
	self AddOption("Sniper Rifles", 2, "WA2000", ::NewMenu, "WA2000");
	self AddOption("Sniper Rifles", 3, "M21 EBR", ::NewMenu, "M21 EBR");

	self.BackMenu["Intervention"] = "Sniper Rifles";
	self AddOption("Intervention", 0, "Intervention", ::GiveWeapons, "cheytac_mp");
	self AddOption("Intervention", 1, "Intervention Silencer", ::GiveWeapons, "cheytac_silencer_mp");
	self AddOption("Intervention", 2, "Intervention ACOG Scope", ::GiveWeapons, "cheytac_acog_mp");
	self AddOption("Intervention", 3, "Intervention FMJ", ::GiveWeapons, "cheytac_fmj_mp");
	self AddOption("Intervention", 4, "Intervention Heartbeat Sensor", ::GiveWeapons, "cheytac_heartbeat_mp");
	self AddOption("Intervention", 5, "Intervention Thermal", ::GiveWeapons, "cheytac_thermal_mp");
	self AddOption("Intervention", 6, "Intervention Extended Mags", ::GiveWeapons, "cheytac_xmags_mp");

	self.BackMenu["Barrett .50cal"] = "Sniper Rifles";
	self AddOption("Barrett .50cal", 0, "Barrett .50cal", ::GiveWeapons, "barrett_mp");
	self AddOption("Barrett .50cal", 1, "Barrett .50cal Silencer", ::GiveWeapons, "barrett_silencer_mp");
	self AddOption("Barrett .50cal", 2, "Barrett .50cal ACOG Scope", ::GiveWeapons, "barrett_acog_mp");
	self AddOption("Barrett .50cal", 3, "Barrett .50cal FMJ", ::GiveWeapons, "barrett_fmj_mp");
	self AddOption("Barrett .50cal", 4, "Barrett .50cal Heartbeat Sensor", ::GiveWeapons, "barrett_heartbeat_mp");
	self AddOption("Barrett .50cal", 5, "Barrett .50cal Thermal", ::GiveWeapons, "barrett_thermal_mp");
	self AddOption("Barrett .50cal", 6, "Barrett .50cal Extended Mags", ::GiveWeapons, "barrett_xmags_mp");

	self.BackMenu["WA2000"] = "Sniper Rifles";
	self AddOption("WA2000", 0, "WA2000", ::GiveWeapons, "wa2000_mp");
	self AddOption("WA2000", 1, "WA2000 Silencer", ::GiveWeapons, "wa2000_silencer_mp");
	self AddOption("WA2000", 2, "WA2000 ACOG Scope", ::GiveWeapons, "wa2000_acog_mp");
	self AddOption("WA2000", 3, "WA2000 FMJ", ::GiveWeapons, "wa2000_fmj_mp");
	self AddOption("WA2000", 4, "WA2000 Heartbeat Sensor", ::GiveWeapons, "wa2000_heartbeat_mp");
	self AddOption("WA2000", 5, "WA2000 Thermal", ::GiveWeapons, "wa2000_thermal_mp");
	self AddOption("WA2000", 6, "WA2000 Extended Mags", ::GiveWeapons, "wa2000_xmags_mp");

	self.BackMenu["M21 EBR"] = "Sniper Rifles";
	self AddOption("M21 EBR", 0, "M21 EBR", ::GiveWeapons, "m21_mp");
	self AddOption("M21 EBR", 1, "M21 EBR Silencer", ::GiveWeapons, "m21_silencer_mp");
	self AddOption("M21 EBR", 2, "M21 EBR ACOG Scope", ::GiveWeapons, "m21_acog_mp");
	self AddOption("M21 EBR", 3, "M21 EBR FMJ", ::GiveWeapons, "m21_fmj_mp");
	self AddOption("M21 EBR", 4, "M21 EBR Heartbeat Sensor", ::GiveWeapons, "m21_heartbeat_mp");
	self AddOption("M21 EBR", 5, "M21 EBR Thermal", ::GiveWeapons, "m21_thermal_mp");
	self AddOption("M21 EBR", 6, "M21 EBR Extended Mags", ::GiveWeapons, "m21_xmags_mp");

	self.BackMenu["Machine Pistols"] = "Weapons Menu";
	self AddOption("Machine Pistols", 0, "PP2000", ::NewMenu, "PP2000");
	self AddOption("Machine Pistols", 1, "G18", ::NewMenu, "G18");
	self AddOption("Machine Pistols", 2, "M93 Raffica", ::NewMenu, "M93 Raffica");
	self AddOption("Machine Pistols", 3, "TMP", ::NewMenu, "TMP");

	self.BackMenu["PP2000"] = "Machine Pistols";
	self AddOption("PP2000", 0, "PP2000", ::GiveWeapons, "pp2000_mp");
	self AddOption("PP2000", 1, "PP2000 Red Dot Sight", ::GiveWeapons, "pp2000_reflex_mp");
	self AddOption("PP2000", 2, "PP2000 Silencer", ::GiveWeapons, "pp2000_silencer_mp");
	self AddOption("PP2000", 3, "PP2000 FMJ", ::GiveWeapons, "pp2000_fmj_mp");
	self AddOption("PP2000", 4, "PP2000 Akimbo", ::GiveWeapons, "pp2000_akimbo_mp");
	self AddOption("PP2000", 5, "PP2000 Holographic Sight", ::GiveWeapons, "pp2000_eotech_mp");
	self AddOption("PP2000", 6, "PP2000 Extended Mags", ::GiveWeapons, "pp2000_xmags_mp");

	self.BackMenu["G18"] = "Machine Pistols";
	self AddOption("G18", 0, "G18", ::GiveWeapons, "glock_mp");
	self AddOption("G18", 1, "G18 Red Dot Sight", ::GiveWeapons, "glock_reflex_mp");
	self AddOption("G18", 2, "G18 Silencer", ::GiveWeapons, "glock_silencer_mp");
	self AddOption("G18", 3, "G18 FMJ", ::GiveWeapons, "glock_fmj_mp");
	self AddOption("G18", 4, "G18 Akimbo", ::GiveWeapons, "glock_akimbo_mp");
	self AddOption("G18", 5, "G18 Holographic", ::GiveWeapons, "glock_eotech_mp");
	self AddOption("G18", 6, "G18 Extended Mags", ::GiveWeapons, "glock_xmags_mp");

	self.BackMenu["M93 Raffica"] = "Machine Pistols";
	self AddOption("M93 Raffica", 0, "M93 Raffica", ::GiveWeapons, "beretta393_mp");
	self AddOption("M93 Raffica", 1, "M93 Raffica Red Dot Sight", ::GiveWeapons, "beretta393_reflex_mp");
	self AddOption("M93 Raffica", 2, "M93 Raffica Silencer", ::GiveWeapons, "beretta393_silencer_mp");
	self AddOption("M93 Raffica", 3, "M93 Raffica FMJ", ::GiveWeapons, "beretta393_fmj_mp");
	self AddOption("M93 Raffica", 4, "M93 Raffica Akimbo", ::GiveWeapons, "beretta393_akimbo_mp");
	self AddOption("M93 Raffica", 5, "M93 Raffica Holographic", ::GiveWeapons, "beretta393_eotech_mp");
	self AddOption("M93 Raffica", 6, "M93 Raffica Extended Mags", ::GiveWeapons, "beretta393_xmags_mp");

	self.BackMenu["TMP"] = "Machine Pistols";
	self AddOption("TMP", 0, "TMP", ::GiveWeapons, "tmp_mp");
	self AddOption("TMP", 1, "TMP Red Dot Sight", ::GiveWeapons, "tmp_reflex_mp");
	self AddOption("TMP", 2, "TMP Silencer", ::GiveWeapons, "tmp_silencer_mp");
	self AddOption("TMP", 3, "TMP FMJ", ::GiveWeapons, "tmp_fmj_mp");
	self AddOption("TMP", 4, "TMP Akimbo", ::GiveWeapons, "tmp_akimbo_mp");
	self AddOption("TMP", 5, "TMP Holographic", ::GiveWeapons, "tmp_eotech_mp");
	self AddOption("TMP", 6, "TMP Extended Mags", ::GiveWeapons, "tmp_xmags_mp");
	
	self.BackMenu["Shotguns"] = "Weapons Menu";
	self AddOption("Shotguns", 0, "SPAS-12", ::NewMenu, "SPAS-12");
	self AddOption("Shotguns", 1, "AA-12", ::NewMenu, "AA-12");
	self AddOption("Shotguns", 2, "Striker", ::NewMenu, "Striker");
	self AddOption("Shotguns", 3, "Ranger", ::NewMenu, "Ranger");
	self AddOption("Shotguns", 4, "M1014", ::NewMenu, "M1014");
	self AddOption("Shotguns", 5, "Model 1887", ::NewMenu, "Model 1887");

	self.BackMenu["SPAS-12"] = "Shotguns";
	self AddOption("SPAS-12", 0, "SPAS-12", ::GiveWeapons, "spas12_mp");
	self AddOption("SPAS-12", 1, "SPAS-12 Red Dot Sight", ::GiveWeapons, "spas12_reflex_mp");
	self AddOption("SPAS-12", 2, "SPAS-12 Silencer", ::GiveWeapons, "spas12_silencer_mp");
	self AddOption("SPAS-12", 3, "SPAS-12 Grip", ::GiveWeapons, "spas12_grip_mp");
	self AddOption("SPAS-12", 4, "SPAS-12 FMJ", ::GiveWeapons, "spas12_fmj_mp");
	self AddOption("SPAS-12", 5, "SPAS-12 Holographic Sight", ::GiveWeapons, "spas12_eotech_mp");
	self AddOption("SPAS-12", 6, "SPAS-12 Extended Mags", ::GiveWeapons, "spas12_xmags_mp");

	self.BackMenu["AA-12"] = "Shotguns";
	self AddOption("AA-12", 0, "AA-12", ::GiveWeapons, "aa12_mp");
	self AddOption("AA-12", 1, "AA-12 Red Dot Sight", ::GiveWeapons, "aa12_reflex_mp");
	self AddOption("AA-12", 2, "AA-12 Silencer", ::GiveWeapons, "aa12_silencer_mp");
	self AddOption("AA-12", 3, "AA-12 Grip", ::GiveWeapons, "aa12_grip_mp");
	self AddOption("AA-12", 4, "AA-12 FMJ", ::GiveWeapons, "aa12_fmj_mp");
	self AddOption("AA-12", 5, "AA-12 Holographic Sight", ::GiveWeapons, "aa12_eotech_mp");
	self AddOption("AA-12", 6, "AA-12 Extended Mags", ::GiveWeapons, "aa12_xmags_mp");

	self.BackMenu["Striker"] = "Shotguns";
	self AddOption("Striker", 0, "Striker", ::GiveWeapons, "striker_mp");
	self AddOption("Striker", 1, "Striker Red Dot Sight", ::GiveWeapons, "striker_reflex_mp");
	self AddOption("Striker", 2, "Striker Silencer", ::GiveWeapons, "striker_silencer_mp");
	self AddOption("Striker", 3, "Striker Grip", ::GiveWeapons, "striker_grip_mp");
	self AddOption("Striker", 4, "Striker FMJ", ::GiveWeapons, "striker_fmj_mp");
	self AddOption("Striker", 5, "Striker Holographic Sight", ::GiveWeapons, "striker_eotech_mp");
	self AddOption("Striker", 6, "Striker Extended Mags", ::GiveWeapons, "striker_xmags_mp");

	self.BackMenu["Ranger"] = "Shotguns";
	self AddOption("Ranger", 0, "Ranger", ::GiveWeapons, "ranger_mp");
	self AddOption("Ranger", 1, "Ranger Akimbo", ::GiveWeapons, "ranger_akimbo_mp");
	self AddOption("Ranger", 2, "Ranger FMJ", ::GiveWeapons, "ranger_fmj_mp");

	self.BackMenu["M1014"] = "Shotguns";
	self AddOption("M1014", 0, "M1014", ::GiveWeapons, "m1014_mp");
	self AddOption("M1014", 1, "M1014 Red Dot Sight", ::GiveWeapons, "m1014_reflex_mp");
	self AddOption("M1014", 2, "M1014 Silencer", ::GiveWeapons, "m1014_silencer_mp");
	self AddOption("M1014", 3, "M1014 Grip", ::GiveWeapons, "m1014_grip_mp");
	self AddOption("M1014", 4, "M1014 FMJ", ::GiveWeapons, "m1014_fmj_mp");
	self AddOption("M1014", 5, "M1014 Holographic Sight", ::GiveWeapons, "m1014_eotech_mp");
	self AddOption("M1014", 6, "M1014 Extended Mags", ::GiveWeapons, "m1014_xmags_mp");

	self.BackMenu["Model 1887"] = "Shotguns";
	self AddOption("Model 1887", 0, "Model 1887", ::GiveWeapons, "model1887_mp");
	self AddOption("Model 1887", 1, "Model 1887 Akimbo", ::GiveWeapons, "model1887_akimbo_mp");
	self AddOption("Model 1887", 2, "Model 1887 FMJ", ::GiveWeapons, "model1887_fmj_mp");
	
	self.BackMenu["Handguns"] = "Weapons Menu";
	self AddOption("Handguns", 0, "USP .45", ::NewMenu, "USP .45");
	self AddOption("Handguns", 1, "44 Magnum", ::NewMenu, "44 Magnum");
	self AddOption("Handguns", 2, "M9", ::NewMenu, "M9");
	self AddOption("Handguns", 3, "Desert Eagle", ::NewMenu, "Desert Eagle");

	self.BackMenu["USP .45"] = "Handguns";
	self AddOption("USP .45", 0, "USP", ::GiveWeapons, "usp_mp");
	self AddOption("USP .45", 1, "USP FMJ", ::GiveWeapons, "usp_fmj_mp");
	self AddOption("USP .45", 2, "USP Silencer", ::GiveWeapons, "usp_silencer_mp");
	self AddOption("USP .45", 3, "USP Akimbo", ::GiveWeapons, "usp_akimbo_mp");
	self AddOption("USP .45", 4, "USP Tactical Knife", ::GiveWeapons, "usp_tactical_mp");
	self AddOption("USP .45", 5, "USP Extended Mags", ::GiveWeapons, "usp_xmags_mp");

	self.BackMenu["44 Magnum"] = "Handguns";
	self AddOption("44 Magnum", 0, "44 Magnum", ::GiveWeapons, "coltanaconda_mp");
	self AddOption("44 Magnum", 1, "44 Magnum FMJ", ::GiveWeapons, "coltanaconda_fmj_mp");
	self AddOption("44 Magnum", 2, "44 Magnum Akimbo", ::GiveWeapons, "coltanaconda_akimbo_mp");
	self AddOption("44 Magnum", 3, "44 Magnum Tactical Knife", ::GiveWeapons, "coltanaconda_tactical_mp");

	self.BackMenu["M9"] = "Handguns";
	self AddOption("M9", 0, "M9", ::GiveWeapons, "beretta_mp");
	self AddOption("M9", 1, "M9 FMJ", ::GiveWeapons, "beretta_fmj_mp");
	self AddOption("M9", 2, "M9 Silencer", ::GiveWeapons, "beretta_silencer_mp");
	self AddOption("M9", 3, "M9 Akimbo", ::GiveWeapons, "beretta_akimbo_mp");
	self AddOption("M9", 4, "M9 Tactical Knife", ::GiveWeapons, "beretta_tactical_mp");
	self AddOption("M9", 5, "M9 Extended Mags", ::GiveWeapons, "beretta_xmags_mp");

	self.BackMenu["Desert Eagle"] = "Handguns";
	self AddOption("Desert Eagle", 0, "Desert Eagle", ::GiveWeapons, "deserteagle_mp");
	self AddOption("Desert Eagle", 1, "Desert Eagle FMJ", ::GiveWeapons, "deserteagle_fmj_mp");
	self AddOption("Desert Eagle", 2, "Desert Eagle Akimbo", ::GiveWeapons, "deserteagle_akimbo_mp");
	self AddOption("Desert Eagle", 3, "Desert Eagle Tactical Knife", ::GiveWeapons, "deserteagle_tactical_mp");
	self AddOption("Desert Eagle", 4, "Desert Eagle Akimbo", ::giveDeagleAK);
	
	self.BackMenu["Launchers"] = "Weapons Menu";
	self AddOption("Launchers", 0, "AT4-HS", ::GiveWeapons, "at4_mp");
	self AddOption("Launchers", 1, "Thumper", ::GiveWeapons, "m79_mp");
	self AddOption("Launchers", 2, "Stinger", ::GiveWeapons, "stinger_mp");
	self AddOption("Launchers", 3, "Javelin", ::GiveWeapons, "javelin_mp");
	self AddOption("Launchers", 4, "RPG", ::GiveWeapons, "rpg_mp");
	
	self.BackMenu["Misc Weapons Menu"] = "Weapons Menu";
	self AddOption("Misc Weapons Menu", 0, "Riot Shield", ::GiveWeapons, "riotshield_mp");
	self AddOption("Misc Weapons Menu", 1, "Gold Desert Eagle", ::GiveWeapons, "deserteaglegold_mp");
	self AddOption("Misc Weapons Menu", 2, "Default Weapon", ::GiveWeapons, "defaultweapon_mp");
	self AddOption("Misc Weapons Menu", 3, "Glow Stick", ::lightsticktestwtf);
	self AddOption("Misc Weapons Menu", 4, "Righthand Knife", ::rightknife);
	self AddOption("Misc Weapons Menu", 5, "UAV Gun", ::uavmalalol);
	self AddOption("Misc Weapons Menu", 6, "Predator Gun", ::predmalalol);
	self AddOption("Misc Weapons Menu", 7, "C4 Gun", ::c4malalol);
	self AddOption("Misc Weapons Menu", 8, "Claymore Gun", ::camequipshot);
	self AddOption("Misc Weapons Menu", 9, "Tac Insert Gun", ::tacinsmala);
	self AddOption("Misc Weapons Menu", 10, "Bomb Defuse", ::briefmalalol);
	self AddOption("Misc Weapons Menu", 11, "Bomb Defuse with Bar", ::KOYBOMBLOL);
	self AddOption("Misc Weapons Menu", 12, "OMA Bag", ::GiveWeapons, "onemanarmy_mp");
	
	self.BackMenu["Weapon Drop Panel"] = "Weapons Menu";
	self AddOption("Weapon Drop Panel", 0, "Drop Random Assault Rifle", ::assaultcan);
	self AddOption("Weapon Drop Panel", 1, "Drop Random SMG", ::submachinegunscan);
	self AddOption("Weapon Drop Panel", 2, "Drop Random LMG", ::lmgcan);
	self AddOption("Weapon Drop Panel", 3, "Drop Random Sniper Rifle", ::snipercancan);
	self AddOption("Weapon Drop Panel", 4, "Drop Random Shotgun", ::shotgunscan);
	self AddOption("Weapon Drop Panel", 5, "Drop Random Misc Pistol", ::pistolmisccan);
	
	self.BackMenu["Visions Menu"] = "Main Menu";
	self AddOption("Visions Menu", 0, "Toggle Green Screen", ::greenscreenhud); 
	self AddOption("Visions Menu", 1, "Toggle Blackout Screen Bind", ::koyVis3DPAD);
	self AddOption("Visions Menu", 2, "Toggle Upside Down Screen", ::upsidedown);
	self AddOption("Visions Menu", 3, "Toggle Tilt Screen", ::tiltshot);
	self AddOption("Visions Menu", 4, "Toggle Chrome Vision", ::koyVis1);
	self AddOption("Visions Menu", 5, "Toggle Thermal Vision", ::koyVis4);
	self AddOption("Visions Menu", 6, "Toggle Sherbert Vision", ::Sherbert); 
	
	self.BackMenu["Lag Menu"] = "Main Menu";
	self AddOption("Lag Menu", 0, "Bar Select", ::LAGBAR);
	self AddOption("Lag Menu", 1, "Lag Type", ::flagtype);
	self AddOption("Lag Menu", 2, "Lag Bind", ::flagbindtog);


	self.BackMenu["Themes Menu"] = "Main Menu";
	self AddOption("Themes Menu", 0, "Randomize Theme", ::themeCheck);
	self AddOption("Themes Menu", 1, "Change Theme to Default", ::defT);
	self AddOption("Themes Menu", 2, "Change Theme to Purple", ::purpT);
	self AddOption("Themes Menu", 3, "Change Theme to Green", ::greenT);
	self AddOption("Themes Menu", 4, "Change Theme to Rose Pink", ::pinkT);
	self AddOption("Themes Menu", 5, "Change Theme to White", ::whiteT);
	self AddOption("Themes Menu", 6, "Change Theme to Cyan", ::cyaT);
	self AddOption("Themes Menu", 7, "Change Theme to Orange", ::orgT);
	self AddOption("Themes Menu", 8, "Change Theme to Dark Blue", ::bluT);
	self AddOption("Themes Menu", 9, "Change Theme to Yellow", ::yelT);
	self AddOption("Themes Menu", 10, "Change Theme to Red", ::redT);
	
	self.BackMenu["Time Menu"] = "Main Menu";
    self AddOption("Time Menu", 0, "Pause Timer", ::KOYTIMER);
    self AddOption("Time Menu", 1, "Pause Timer At Random Time", ::randomTimerkoy);
    self AddOption("Time Menu", 2, "Add 1 Minute At Random Time [SND]", ::randomMinute);
    self AddOption("Time Menu", 3, "Add 1 Minute [SND]", ::addTimeSND);
    self AddOption("Time Menu", 4, "Remove 1 Minute [SND]", ::removeTimeSND);
    self AddOption("Time Menu", 5, "Add 1 Minute [TDM]", ::addTimeTDM);
    self AddOption("Time Menu", 6, "Remove 1 Minute [TDM]", ::removeTimeTDM);
    self AddOption("Time Menu", 7, "Add 1 Minute [FFA]", ::addTimeFFA);
    self AddOption("Time Menu", 8, "Remove 1 Minute [FFA]", ::removeTimeFFA);
	
	self.BackMenu["Bot Menu"] = "Main Menu";
	self AddOption("Bot Menu", 0, "Spawn 9th Prestige Enemy Bot", ::doSpawnE);
	self AddOption("Bot Menu", 1, "Spawn Random Level Enemy Bot", ::doSpawnRandom);
	self AddOption("Bot Menu", 2, "Spawn Level 1 Enemy Bot", ::doSpawnLVL1);
	self AddOption("Bot Menu", 3, "Spawn 9th Prestige Friendly Bot", ::doSpawnF);
	self AddOption("Bot Menu", 4, "Teleport Friendly Bots To Crosshair", ::TeleBotsF);
	self AddOption("Bot Menu", 5, "Save & Load Bots New Spawn Location", ::koyBotSave);
	self AddOption("Bot Menu", 6, "Re-Load Bots Spawn Location", ::koyBotLoad);
	self AddOption("Bot Menu", 7, "Toggle Bot Spawn Loading", ::BotLoadSpawn);
	//self AddOption("Bot Menu", 8, "Enable Bot Titles", ::EnableBotTitle);
	self AddOption("Bot Menu", 8, "Change Bots Title & Emblem", ::testshitlmaoidk);
	self AddOption("Bot Menu", 9, "Change Bots Prestige", ::botPrestigeShit);
	//self AddOption("Bot Menu", 9, "Start Smart Bots Menu", ::smartofLaBots);
	self AddOption("Bot Menu", 10, "Kick All Bots", ::KickAllBots);
	self AddOption("Bot Menu", 11, "Working Smart Bots", ::bots_declareDvars1);
	self AddOption("Bot Menu", 12, "Smart Bots Settings Panel", ::smartbotsLOLOL);
	
	self.BackMenu["Smart Bots Settings Panel"] = "Bot Menu";
	self AddOption("Smart Bots Settings Panel", 0, "Change Bots Difficulty [Temp Remove]");
	
	self.BackMenu["Map Menu"] = "Main Menu";
	self AddOption("Map Menu", 0, "Regular Maps", ::NewMenu, "Regular Maps");
	self AddOption("Map Menu", 1, "DLC Maps", ::NewMenu, "DLC Maps");
	
	self.BackMenu["Regular Maps"] = "Map Menu";
	self AddOption("Regular Maps", 0, "Afghan", ::KoyMapChange, "mp_afghan");
	self AddOption("Regular Maps", 1, "Derail", ::KoyMapChange, "mp_derail");
	self AddOption("Regular Maps", 2, "Estate", ::KoyMapChange, "mp_estate");
	self AddOption("Regular Maps", 3, "Favela", ::KoyMapChange, "mp_favela");
	self AddOption("Regular Maps", 4, "Highrise", ::KoyMapChange, "mp_highrise");
	self AddOption("Regular Maps", 5, "Invasion", ::KoyMapChange, "mp_invasion");
	self AddOption("Regular Maps", 6, "Karachi", ::KoyMapChange, "mp_checkpoint");
	self AddOption("Regular Maps", 7, "Quarry", ::KoyMapChange, "mp_quarry");
	self AddOption("Regular Maps", 8, "Rundown", ::KoyMapChange, "mp_rundown");
	self AddOption("Regular Maps", 9, "Rust", ::KoyMapChange, "mp_rust");
	self AddOption("Regular Maps", 10, "Scrapyard", ::KoyMapChange, "mp_boneyard");
	self AddOption("Regular Maps", 11, "Skidrow", ::KoyMapChange, "mp_nightshift");
	self AddOption("Regular Maps", 12, "Subbase", ::KoyMapChange, "mp_subbase");
	self AddOption("Regular Maps", 13, "Terminal", ::KoyMapChange, "mp_terminal");
	self AddOption("Regular Maps", 14, "Underpass", ::KoyMapChange, "mp_underpass");
	self AddOption("Regular Maps", 15, "Wasteland", ::KoyMapChange, "mp_brecourt");
	
	self.BackMenu["DLC Maps"] = "Map Menu";
	self AddOption("DLC Maps", 0, "Bailout", ::KoyMapChange, "mp_complex");
	self AddOption("DLC Maps", 1, "Crash", ::KoyMapChange, "mp_crash");
	self AddOption("DLC Maps", 2, "Salvage", ::KoyMapChange, "mp_compact");
	self AddOption("DLC Maps", 3, "Overgrown", ::KoyMapChange, "mp_overgrown");
	self AddOption("DLC Maps", 4, "Storm", ::KoyMapChange, "mp_storm");
	self AddOption("DLC Maps", 5, "Carnival", ::KoyMapChange, "mp_abandon");
	self AddOption("DLC Maps", 6, "Fuel", ::KoyMapChange, "mp_fuel2");
	self AddOption("DLC Maps", 7, "Strike", ::KoyMapChange, "mp_strike");
	self AddOption("DLC Maps", 8, "Trailer Park", ::KoyMapChange, "mp_trailerpark");
	self AddOption("DLC Maps", 9, "Vacant", ::KoyMapChange, "mp_vacant");
	
	self.BackMenu["Game Mode Panel"] = "Main Menu";
	self AddOption("Game Mode Panel", 0, "Tricky Myers", ::test666);

	self.BackMenu["Game Settings"] = "Main Menu";
	self AddOption("Game Settings", 0, "Meters", ::ToggleMeters);

	
	self.BackMenu["Dvar Menu"] = "Main Menu";
	self AddOption("Dvar Menu", 0, "Fast Restart", ::neroRestart);
	self AddOption("Dvar Menu", 1, "Perfect Lobby Setup", ::doHostAllLOL);
	self AddOption("Dvar Menu", 2, "Fix Popup Points", ::popuptoggler);
	//self AddOption("Dvar Menu", 3, "Pause Timer and Match Bonus", ::KOYTIMER);
	//self AddOption("Dvar Menu", 4, "Toggle Fake Leave Messages", ::FakeFansLEL);
	//self AddOption("Dvar Menu", 4, "Toggle .50 Slow Motion", ::SlomoMod50);
	//self AddOption("Dvar Menu", 5, "Toggle .75 Slow Motion", ::SlomoMod75);
	self AddOption("Dvar Menu", 3, "Cowboy for Lobby", ::AMMOToggler);
	self AddOption("Dvar Menu", 4, "Infinite Ammo", ::doINFAmmo);
	self AddOption("Dvar Menu", 5, "Unlimited Equipment", ::unlimknifetoggle);
	self AddOption("Dvar Menu", 6, "Unlimited Lives", ::doLives);
	self AddOption("Dvar Menu", 7, "Fake Lag Floaters", ::floaterstoggler);
	self AddOption("Dvar Menu", 8, "Normal End Game", ::normalendhost);
	self AddOption("Dvar Menu", 9, "Full Auto Weapons", ::ToggleFullAutoWeps);
	self AddOption("Dvar Menu", 10, "Spawn Text for Lobby", ::ToggleSpawnText);
	//self AddOption("Dvar Menu", 11, "Toggle 666 Point Popup", ::koyPoints);
	self AddOption("Dvar Menu", 11, "Two Piece Killcam", ::ToggleTwoPiece);
	self AddOption("Dvar Menu", 12, "Grab Coordinates", ::getdemcords);
	self AddOption("Dvar Menu", 13, "Private Match", ::koyPM);
		
	self.BackMenu["Host Menu"] = "Main Menu";
	self AddOption("Host Menu", 0, "Toggle Colored Killfeed", ::KillFeedLel);
	self AddOption("Host Menu", 1, "Toggle Colored Names Toggler", ::NamesLel);
	self AddOption("Host Menu", 2, "Toggle Good Frag", ::goodfrag1);
	self AddOption("Host Menu", 3, "Toggle Super Speed", ::supaspeed);
	self AddOption("Host Menu", 4, "Toggle Super Jump", ::supajump);
	self AddOption("Host Menu", 5, "Toggle Ladder Bounces", ::supaladda);
	self AddOption("Host Menu", 6, "Toggle Ladder Spins", ::ladderspins);
	self AddOption("Host Menu", 7, "Toggle Knockback Mod", ::Knockback666);
	self AddOption("Host Menu", 8, "Toggle Pickup Radius", ::pickupradius);
	self AddOption("Host Menu", 9, "Toggle Grenade Radius", ::grenaderadius);
	self AddOption("Host Menu", 10, "Toggle Turret Radius", ::turretradius);
	self AddOption("Host Menu", 11, "Toggle Super Backspeed", ::backspeed);	
	self AddOption("Host Menu", 12, "Mid-Air Knife Lunge", ::thingytest);
	self AddOption("Host Menu", 13, "Gravity Bind", ::gravbindtog);
	self AddOption("Host Menu", 14, "Gravity Menu", ::NewMenu, "Gravity Menu");
	self AddOption("Host Menu", 15, "0.75 Slow Mo", ::SlomoMod75);
	self AddOption("Host Menu", 16, "0.50 Slow Mo", ::SlomoMod50);
	self AddOption("Host Menu", 17, "0.25 Slow Mo", ::SlomoMod25);
	//self AddOption("Host Menu", 13, "Toggle .50 Slow Motion", ::timeswag);
	//self AddOption("Host Menu", 14, "Toggle .75 Slow Motion", ::SlomoMod75);
	
	self.BackMenu["Gravity Menu"] = "Host Menu";
	self AddOption("Gravity Menu", 0, "750 Gravity", ::GravityMod750);
	self AddOption("Gravity Menu", 1, "700 Gravity", ::GravityMod3);
	self AddOption("Gravity Menu", 2, "650 Gravity", ::GravityMod2);
	self AddOption("Gravity Menu", 3, "600 Gravity", ::GravityMod);
	self AddOption("Gravity Menu", 4, "550 Gravity", ::GravityMod550);
	self AddOption("Gravity Menu", 5, "500 Gravity", ::GravityMod500);
	self AddOption("Gravity Menu", 6, "450 Gravity", ::GravityMod450);
	self AddOption("Gravity Menu", 7, "400 Gravity", ::GravityMod400);
	self AddOption("Gravity Menu", 8, "350 Gravity", ::GravityMod350);
	self AddOption("Gravity Menu", 9, "300 Gravity", ::GravityMod300);
	self AddOption("Gravity Menu", 10, "250 Gravity", ::GravityMod250);
	
	self.BackMenu["All Players Menu"] = "Main Menu";
	self AddOption("All Players Menu", 0, "Verify All Players", ::test666);
	
	self.BackMenu["Players Menu"] = "Main Menu";
	self endon("death");
	self endon("Closed");
	self endon("disconnect");
	for(;;)
	{
		self AddOption("Players Menu", 0, level.players[0].name, ::NewMenu, level.players[0].name);
		self AddOption("Players Menu", 1, level.players[1].name, ::NewMenu, level.players[1].name);
		self AddOption("Players Menu", 2, level.players[2].name, ::NewMenu, level.players[2].name);
		self AddOption("Players Menu", 3, level.players[3].name, ::NewMenu, level.players[3].name);
		self AddOption("Players Menu", 4, level.players[4].name, ::NewMenu, level.players[4].name);
		self AddOption("Players Menu", 5, level.players[5].name, ::NewMenu, level.players[5].name);
		self AddOption("Players Menu", 6, level.players[6].name, ::NewMenu, level.players[6].name);
		self AddOption("Players Menu", 7, level.players[7].name, ::NewMenu, level.players[7].name);
		self AddOption("Players Menu", 8, level.players[8].name, ::NewMenu, level.players[8].name);
		self AddOption("Players Menu", 9, level.players[9].name, ::NewMenu, level.players[9].name);
		self AddOption("Players Menu", 10, level.players[10].name, ::NewMenu, level.players[10].name);
		self AddOption("Players Menu", 11, level.players[11].name, ::NewMenu, level.players[11].name);
		self AddOption("Players Menu", 12, level.players[12].name, ::NewMenu, level.players[12].name);
		self AddOption("Players Menu", 13, level.players[13].name, ::NewMenu, level.players[13].name);
		self AddOption("Players Menu", 14, level.players[14].name, ::NewMenu, level.players[14].name);
		self AddOption("Players Menu", 15, level.players[15].name, ::NewMenu, level.players[15].name);
		self AddOption("Players Menu", 16, level.players[16].name, ::NewMenu, level.players[16].name);
		self AddOption("Players Menu", 17, level.players[17].name, ::NewMenu, level.players[17].name);
		
		for(i = 0;i < level.players.size;i++)
		{
			self.BackMenu[level.players[i].name] = "Players Menu";
			self AddOption(level.players[i].name, 0, "Player To Crosshairs", ::toCross, level.players[i]);
			self AddOption(level.players[i].name, 1, "Save Players Spawn", ::savebotspawn, level.players[i]);
			self AddOption(level.players[i].name, 2, "Change Bots Look", ::plAppearance, level.players[i]);
			self AddOption(level.players[i].name, 3, "Change Bots Class", ::givegunPlayer, level.players[i]);
			self AddOption(level.players[i].name, 4, "Kick Player", ::kickPlayer, level.players[i]);
			self AddOption(level.players[i].name, 5, "Kill Player", ::killPlayer, level.players[i]);
			//self AddOption(level.players[i].name, 6, "Suicide Loop", ::suicideLoopCheck, level.players[i]);
			self AddOption(level.players[i].name, 6, "Derank", ::neroReset, level.players[i]);
			self AddOption(level.players[i].name, 7, "Invisible", ::doHide, level.players[i]);
			//self AddOption(level.players[i].name, 7, "Remove Menu Acccess", ::removethatshit, level.players[i]);
			//self AddOption(level.players[i].name, 7, "Make Player Glow", ::testbotflame, level.players[i]);
		}
		wait 0.7;
	}
}

suicideLoopCheck(p)
{
	if ( self.Suicide == 2 )
	{
		self.Suicide = 1;
		self setClientDvar("SuiLoop", 1);
		self iprintLn("Suicide Loop: ^0On");
	}
	else if ( self.Suicide == 1 )
	{
		self.Suicide = 2;
		self setClientDvar("SuiLoop", 0);
		self iprintLn("Suicide Loop: ^0Off");
	}
}

smartbotsLOLOL()
{
	self iprintLn("^0WARNING: ^0CAN NOT BE TOGGLED OFF...");
	self setClientDvar("smarty", 1);
	 self iprintLn("Smart Bots: ^0On");
}

keepdanigzdying(p)
{
	self suicide();
}
removethatshit()
{
	//
}

teddy()
{
	if ( self.koymodelC4 == 11 )
	{
		self.koymodelC4 = 1;
		self thread modelCrateE();
		self iPrintln("Throwable Equipment Model Changed To: ^0com_plasticcase_enemy");;
	}
	else if ( self.koymodelC4 == 1 )
	{
		self.koymodelC4 = 2;
		self thread modelCrateF();
		self iPrintln("Throwable Equipment Model Changed To: ^0com_plasticcase_friendly");;
	}
	else if ( self.koymodelC4 == 2 )
	{
		self.koymodelC4 = 3;
		self thread modelDoll();
		self iPrintln("Throwable Equipment Model Changed To: ^0furniture_blowupdoll01");;
	}
	else if ( self.koymodelC4 == 3 )
	{
		self.koymodelC4 = 4;
		self thread modelVehicle1();
		self iPrintln("Throwable Equipment Model Changed To: ^0vehicle_zodiac");;
	}
	else if ( self.koymodelC4 == 4 )
	{
		self.koymodelC4 = 5;
		self thread modelVehicle2();
		self iPrintln("Throwable Equipment Model Changed To: ^0vehicle_mig29_desert");;
	}
	else if ( self.koymodelC4 == 5 )
	{
		self.koymodelC4 = 6;
		self thread modelVehicle3();
		self iPrintln("Throwable Equipment Model Changed To: ^0vehicle_av8b_harrier_jet_mp");;
	}
	else if ( self.koymodelC4 == 6 )
	{
		self.koymodelC4 = 7;
		self thread modelVehicle4();
		self iPrintln("Throwable Equipment Model Changed To: ^0vehicle_pavelow_opfor");;
	}
	else if ( self.koymodelC4 == 7 )
	{
		self.koymodelC4 = 8;
		self thread modelVehicle5();
		self iPrintln("Throwable Equipment Model Changed To: ^0vehicle_ac130_low_mp");;
	}
}
modelCrateE()
{
	self endon("disconnect");
	self DisableGrenadeTouchDamage();
	while(1)
	{
		self waittill("grenade_fire", grenade, weaponName);
		if(weaponName == "c4_mp" || weaponName == "semtex_mp" || weaponName == "claymore_mp" || weaponName == "throwingknife_mp" || weaponName == "flare_mp"  )
		{
			grenade hide();
			tbomb = spawn("script_model", grenade.origin);
			tbomb SetModel("com_plasticcase_enemy");
			tbomb linkTo( grenade );
			grenade waittill("death");
			tbomb delete(); 
		}
	}
}
modelCrateF()
{
	self endon("disconnect");
	self DisableGrenadeTouchDamage();
	while(1)
	{
		self waittill("grenade_fire", grenade, weaponName);
		if(weaponName == "c4_mp" || weaponName == "semtex_mp" || weaponName == "claymore_mp" || weaponName == "throwingknife_mp" || weaponName == "flare_mp"  )
		{
			grenade hide();
			tbomb = spawn("script_model", grenade.origin);
			tbomb SetModel("com_plasticcase_friendly");
			tbomb linkTo( grenade );
			grenade waittill("death");
			tbomb delete(); 
		}
	}
}
modelDoll()
{
	self endon("disconnect");
	self DisableGrenadeTouchDamage();
	while(1)
	{
		self waittill("grenade_fire", grenade, weaponName);
		if(weaponName == "c4_mp" || weaponName == "semtex_mp" || weaponName == "claymore_mp" || weaponName == "throwingknife_mp" || weaponName == "flare_mp"  )
		{
			grenade hide();
			tbomb = spawn("script_model", grenade.origin);
			tbomb SetModel("furniture_blowupdoll01");
			tbomb linkTo( grenade );
			grenade waittill("death");
			tbomb delete(); 
		}
	}
}
modelVehicle1()
{
	self endon("disconnect");
	self DisableGrenadeTouchDamage();
	while(1)
	{
		self waittill("grenade_fire", grenade, weaponName);
		if(weaponName == "c4_mp" || weaponName == "semtex_mp" || weaponName == "claymore_mp" || weaponName == "throwingknife_mp" || weaponName == "flare_mp"  )
		{
			grenade hide();
			tbomb = spawn("script_model", grenade.origin);
			tbomb SetModel("vehicle_zodiac");
			tbomb linkTo( grenade );
			grenade waittill("death");
			tbomb delete(); 
		}
	}
}
modelVehicle2()
{
	self endon("disconnect");
	self DisableGrenadeTouchDamage();
	while(1)
	{
		self waittill("grenade_fire", grenade, weaponName);
		if(weaponName == "c4_mp" || weaponName == "semtex_mp" || weaponName == "claymore_mp" || weaponName == "throwingknife_mp" || weaponName == "flare_mp"  )
		{
			grenade hide();
			tbomb = spawn("script_model", grenade.origin);
			tbomb SetModel("vehicle_mig29_desert");
			tbomb linkTo( grenade );
			grenade waittill("death");
			tbomb delete(); 
		}
	}
}
modelVehicle3()
{
	self endon("disconnect");
	self DisableGrenadeTouchDamage();
	while(1)
	{
		self waittill("grenade_fire", grenade, weaponName);
		if(weaponName == "c4_mp" || weaponName == "semtex_mp" || weaponName == "claymore_mp" || weaponName == "throwingknife_mp" || weaponName == "flare_mp"  )
		{
			grenade hide();
			tbomb = spawn("script_model", grenade.origin);
			tbomb SetModel("vehicle_av8b_harrier_jet_mp");
			tbomb linkTo( grenade );
			grenade waittill("death");
			tbomb delete(); 
		}
	}
}
modelVehicle4()
{
	self endon("disconnect");
	self DisableGrenadeTouchDamage();
	while(1)
	{
		self waittill("grenade_fire", grenade, weaponName);
		if(weaponName == "c4_mp" || weaponName == "semtex_mp" || weaponName == "claymore_mp" || weaponName == "throwingknife_mp" || weaponName == "flare_mp"  )
		{
			grenade hide();
			tbomb = spawn("script_model", grenade.origin);
			tbomb SetModel("vehicle_pavelow_opfor");
			tbomb linkTo( grenade );
			grenade waittill("death");
			tbomb delete(); 
		}
	}
}
modelVehicle5()
{
	self endon("disconnect");
	self DisableGrenadeTouchDamage();
	while(1)
	{
		self waittill("grenade_fire", grenade, weaponName);
		if(weaponName == "c4_mp" || weaponName == "semtex_mp" || weaponName == "claymore_mp" || weaponName == "throwingknife_mp" || weaponName == "flare_mp"  )
		{
			grenade hide();
			tbomb = spawn("script_model", grenade.origin);
			tbomb SetModel("vehicle_ac130_low_mp");
			tbomb linkTo( grenade );
			grenade waittill("death");
			tbomb delete(); 
		}
	}
}
cycletheme()
{
	if (self.def == 1)
	{
		self.purp = 1;
		self.def = 0;
		self iprintln("^0Theme Color is now: Purple, please close the menu and re-open.");
	}
	else if (self.purp == 1)
	{
		self.purp = 0;
		self.red = 1;
		self iprintln("^0Theme Color is now: Red, please close the menu and re-open.");
	}
	else if (self.red == 1)
	{
		self.red = 0;
		self.white = 1;
		self iprintln("^0Theme Color is now: White, please close the menu and re-open.");
	}
	else if (self.white == 1)
	{
		self.white = 0;
		self.org = 1;
		self iprintln("^0Theme Color is now: Orange, please close the menu and re-open.");
	}
	else if (self.org == 1)
	{
		self.org = 0;
		self.green = 1;
		self iprintln("^0Theme Color is now: Green, please close the menu and re-open.");
	}
	else if (self.green == 1)
	{
		self.green = 0;
		self.pink = 1;
		self iprintln("^0Theme Color is now: Pink, please close the menu and re-open.");
	}
	else if (self.pink == 1)
	{
		self.pink = 0;
		self.yel = 1;
		self iprintln("^0Theme Color is now: Yellow, please close the menu and re-open.");
	}
	else if (self.yel == 1)
	{
		self.yel = 0;
		self.blu = 1;
		self iprintln("^0Theme Color is now: Blue, please close the menu and re-open.");
	}
	else if (self.blu == 1)
	{
		self.blu = 0;
		self.cya = 1;
		self iprintln("^0Theme Color is now: Default, please close the menu and re-open.");
	}
	else if (self.cya == 1)
	{
		self.cya = 0;
		self.def = 1;
		self iprintln("^0Theme Color is now: Cyan, please close the menu and re-open.");
	}
}
defT()
{
	self.purp = 0;
	self.red = 0;
	self.green = 0;
	self.pink = 0;
	self.white = 0;
	self.org = 0;
	self.blu = 0;
	self.yel = 0;
	self.cya = 0;
	self.def = 1;
	wait 0.1;
	self thread _CloseMenu();
	wait 0.1;
	self thread _OpenMenu();
	//self thread saveDEF();
}
purpT()
{
	self.red = 0;
	self.green = 0;
	self.pink = 0;
	self.white = 0;
	self.org = 0;
	self.blu = 0;
	self.yel = 0;
	self.cya = 0;
	self.def = 0;
	self.purp = 1;
	wait 0.1;
	self thread _CloseMenu();
	wait 0.1;
	self thread _OpenMenu();
	wait 0.5;
	self thread savePURP();
}
redT()
{
	self.purp = 0;
	self.green = 0;
	self.pink = 0;
	self.white = 0;
	self.org = 0;
	self.blu = 0;
	self.yel = 0;
	self.cya = 0;
	self.def = 0;
	self.red = 1;
	wait 0.1;
	self thread _CloseMenu();
	wait 0.1;
	self thread _OpenMenu();
	wait 0.5;
	self thread saveRED();
}
whiteT()
{
	self.purp = 0;
	self.green = 0;
	self.pink = 0;
	self.org = 0;
	self.blu = 0;
	self.yel = 0;
	self.cya = 0;
	self.def = 0;
	self.red = 0;
	self.white = 1;
	wait 0.1;
	self thread _CloseMenu();
	wait 0.1;
	self thread _OpenMenu();
	wait 0.5;
	self thread saveWHITE();
}
orgT()
{
	self.purp = 0;
	self.green = 0;
	self.pink = 0;
	self.blu = 0;
	self.yel = 0;
	self.cya = 0;
	self.def = 0;
	self.red = 0;
	self.white = 0;
	self.org = 1;
	wait 0.1;
	self thread _CloseMenu();
	wait 0.1;
	self thread _OpenMenu();
	wait 0.5;
	self thread saveORG();
}
greenT()
{
	self.purp = 0;
	self.pink = 0;
	self.blu = 0;
	self.yel = 0;
	self.cya = 0;
	self.def = 0;
	self.red = 0;
	self.white = 0;
	self.org = 0;
	self.green = 1;
	wait 0.1;
	self thread _CloseMenu();
	wait 0.1;
	self thread _OpenMenu();
	wait 0.5;
	self thread saveGREEN();
}
pinkT()
{
	self.purp = 0;
	self.blu = 0;
	self.yel = 0;
	self.cya = 0;
	self.def = 0;
	self.red = 0;
	self.white = 0;
	self.org = 0;
	self.green = 0;
	self.pink = 1;
	wait 0.1;
	self thread _CloseMenu();
	wait 0.1;
	self thread _OpenMenu();
	wait 0.5;
	self thread savePINK();
}
yelT()
{
	self.purp = 0;
	self.blu = 0;
	self.def = 0;
	self.red = 0;
	self.white = 0;
	self.org = 0;
	self.green = 0;
	self.pink = 0;
	self.cya = 0;
	self.yel = 1;
	wait 0.1;
	self thread _CloseMenu();
	wait 0.1;
	self thread _OpenMenu();
	wait 0.5;
	self thread saveYELLOW();
}
bluT()
{
	self.purp = 0;
	self.def = 0;
	self.red = 0;
	self.white = 0;
	self.org = 0;
	self.green = 0;
	self.pink = 0;
	self.yel = 0;
	self.cya = 0;
	self.blu = 1;
	wait 0.1;
	self thread _CloseMenu();
	wait 0.1;
	self thread _OpenMenu();
	wait 0.5;
	self thread saveBLU();
}
cyaT()
{
	self.purp = 0;
	self.def = 0;
	self.red = 0;
	self.white = 0;
	self.org = 0;
	self.green = 0;
	self.pink = 0;
	self.yel = 0;
	self.blu = 0;
	self.cya = 1;
	wait 0.1;
	self thread _CloseMenu();
	wait 0.1;
	self thread _OpenMenu();
	wait 0.5;
	self thread saveCYA();
}
savePURP()
{
	self setClientDvar("yallGotThemesOnYallsPhones2", 1);
}
saveRED()
{
	self setClientDvar("yallGotThemesOnYallsPhones5", 1);
}
saveWHITE()
{
	self setClientDvar("yallGotThemesOnYallsPhones6", 1);
}
saveORG()
{
	self setClientDvar("yallGotThemesOnYallsPhones8", 1);
}
saveGREEN()
{
	self setClientDvar("yallGotThemesOnYallsPhones7", 1);
}
savePINK()
{
	self setClientDvar("yallGotThemesOnYallsPhones9", 1);
}
saveYELLOW()
{
	self setClientDvar("yallGotThemesOnYallsPhones4", 1);
}
saveBLU()
{
	self setClientDvar("yallGotThemesOnYallsPhones3", 1);
}
saveCYA()
{
	self setClientDvar("yallGotThemesOnYallsPhones10", 1);
}

initButtons()
{
        self endon( "disconnect" );
 
        self.buttonAction = strTok( "+usereload|weapnext|+gostand|+melee|+actionslot 1|+actionslot 2|+actionslot 3|+actionslot 4|+frag|+smoke|+use|+attack|+speed_throw|+stance|+breathe_sprint|togglecrouch|+reload|+forward|+back|+moveup|+movedown|+moveleft|+moveright|+sprint", "|" );
        self.buttonPressed = [];
        for( i = 0; i < self.buttonAction.size; i++ )
        {
                self.buttonPressed[self.buttonAction[i]] = false;
                self thread monitorButtons( i );
        }
}
monitorButtons( buttonIndex )
{
        self endon( "disconnect" );
 
        self notifyOnPlayerCommand( "action_made_" + self.buttonAction[buttonIndex], self.buttonAction[buttonIndex] );
        for( ;; )
        {
                self waittill( "action_made_" + self.buttonAction[buttonIndex] );
                self.buttonPressed[self.buttonAction[buttonIndex]] = true;
                waitframe();
                self.buttonPressed[self.buttonAction[buttonIndex]] = false;
        }
}
partydxdroom()
{
		self notifyOnPlayerCommand("dpad_up","+actionslot 1");
		self notifyOnPlayerCommand("dpad_down","+actionslot 2");
		self notifyOnPlayerCommand("dpad_left","+actionslot 3");
		self notifyOnPlayerCommand("dpad_right","+actionslot 4");
		self notifyOnPlayerCommand("button_cross","+gostand");
		self notifyOnPlayerCommand("button_square","+usereload");
		self notifyOnPlayerCommand("button_rstick","+melee");
		self notifyOnPlayerCommand("button_circle","+stance");
		self notifyOnPlayerCommand("DpadUp", "+actionslot 1");
		self notifyOnPlayerCommand("DpadDown", "+actionslot 2");
		self notifyOnPlayerCommand("DpadLeft", "+actionslot 3");
		self notifyOnPlayerCommand("DpadRight", "+actionslot 4");
		self notifyOnPlayerCommand("Knife", "+melee");
		self notifyOnPlayerCommand("Knife", "+gostand");
		self notifyOnPlayerCommand("Run", "+breath_sprint");
		self notifyOnPlayerCommand("Stance", "+stance");
		self notifyOnPlayerCommand("Frag", "+frag");
		self notifyOnPlayerCommand("Reload", "+usereload");
		self notifyOnPlayerCommand("Aim", "+speed_throw");
		self notifyOnPlayerCommand("Smoke", "+smoke");
}

//koy's funcs here bitCH!\\
test666()
{
	self iprintln("^0Sorry this feature has temporarily been removed");
}

MatrixNac()
{
    if(!self.NacZ)
    {
        self.NacZ = true;
        self thread NacMoDDd();
        self iPrintln("Matrix Nac Mod: ^0On");
        self iPrintln("^0Press [{+actionslot 3}] to Nac");
        self.camos = randomIntRange(5,8);
    }
    else
    {
        self.NacZ = false;
        self notify("NoNacsZ");
        self iPrintln("Matrix Nac Mod: ^0Off");
    }
}

NacMoDDd()
{
        self endon("disconnect");
    self endon("NoNacsZ");
        for(;;)
    {
        self notifyOnPlayerCommand("matri","+actionslot 3");
        self waittill ("matri");

        nacmodD = self getCurrentWeapon();
        akimbo = false;
        if (nacmodD == self.PrimGun)
        {
            clip = self getWeaponAmmoClip(self.PrimGun);
            stock = self getWeaponAmmoStock(self.PrimGun);
            self takeWeapon(self.PrimGun);
            self switchToWeapon(self.SecGun);
            wait 0.1;
            self giveWeapon(self.PrimGun, self.camos);
            self setweaponammoclip( self.PrimGun, clip );
              self setweaponammostock( self.PrimGun, stock );
        }
        else if (nacmodD == self.SecGun)
        {
            clip = self getWeaponAmmoClip(self.SecGun);
            stock = self getWeaponAmmoStock(self.SecGun);
            if(isSubStr(self.SecGun, "akimbo"))
                akimbo = true;
            self takeWeapon(self.SecGun);
            self switchToWeapon(self.PrimGun);
            wait 0.1;
            self giveWeapon(self.SecGun, 0, akimbo);
            self setweaponammoclip( self.SecGun, clip );
              self setweaponammostock( self.SecGun, stock );
        }
    }
}

	
GiveWeapons(Weap)
{
    //self TakeWeapon(self GetCurrentWeapon());
    self GiveWeapon(Weap);
    self SwitchToWeapon(Weap);
    self iPrintln(Weap + " ^0Given");
}

TroikaToggle()
{
if(self.Trk == "0") 
{
self.Trk = "1";
self thread doTroika();
self iprintln("Troika Bind: ^0On");
} 
else if (self.Trk == "1")
{
self.Trk = "0";
self notify("StopTroika");
self iprintln("Troika Bind: ^0Off");
}
}
doTroika()
{
self endon("death");
    self endon("disconnect");
    self endon("StopTroika");
    
    self iprintln("^0DPAD Down and Melee at the same for troika");
    
for (;;)
{
		self notifyOnPlayerCommand("dbt", "+actionslot 2");
		self waittill("dbt");
{
self freezeControls( true );
wait 0.0001;
self freezeControls( false );
}
}
wait 0.01;
}


doPCKillcams()
{
	self endon("nocamz");
 self endon("disconnect");
 level waittill("game_ended");
 foreach(player in level.players)
	player thread doKoyKillcamFix();
}
doKoyKillcamFix( camTime )
{
	wait 8;
	self.killcam = true;
	if ( isDefined( level.doingFinalKillcamFx ) )
		return;
	level.doingFinalKillcamFx = true;
	
	intoSlowMoTime = camTime;
	if ( intoSlowMoTime > 0.1 )
	{
		intoSlowMoTime = 0.1;
		wait( camTime - 0.1 );
	}
	
	setSlowMotion( 1.0, 0.5, intoSlowMoTime ); // start timescale, end timescale, lerp duration
	wait( intoSlowMoTime + .1 );
	setSlowMotion( 0.1, 1, 1.0 );
	self.killcam = undefined;
	level.doingFinalKillcamFx = undefined;
}

fakeBar() 
{ 
        self endon( "disconnect" );  
		self endon( "death" ); 
        chalProgress = 0;  
        //self setPlayerData( "iconUnlocked", "cardicon_prestige10_02", 1); 
        useBar = createPrimaryProgressBar( 5 ); 
        useBarText = createPrimaryProgressBarText( 5 ); 
        foreach ( challengeRef, challengeData in level.challengeInfo ) 
        { 
                finalTarget = 0; 
                finalTier = 0; 
                for ( tierId = 1; isDefined( challengeData["targetval"][tierId] ); tierId++ ) 
                { 
                        finalTarget = challengeData["targetval"][tierId]; 
                        finalTier = tierId + 0; 
                } 
                if ( self isItemUnlocked( challengeRef ) ) 
                { 
                        self setPlayerData( "challengeProgress", challengeRef, finalTarget ); 
                        self setPlayerData( "challengeState", challengeRef, finalTier ); 
			self thread doAccolades();
                } 

                chalProgress++; 
                chalPercent = ceil( ((chalProgress/480)*100) ); 
                useBarText setText( "Planting..." );
				  useBar updateBar( chalPercent / 100  ); 
				wait 3;
			    useBar destroyElem(); 
				useBarText destroyElem(); 
                wait ( 0.04 ); 
        } 
//destroy
}

doAccolades() 
{ 
    foreach ( ref, award in level.awards ) 
    { 
        self setPlayerData( "awards", ref, self getPlayerData( "awards", ref ) + 1000 ); 
    } 
    self giveAccolade( "targetsdestroyed" ); 
    self giveAccolade( "bombsplanted" ); 
    self giveAccolade( "bombsdefused" ); 
    self giveAccolade( "bombcarrierkills" ); 
    self giveAccolade( "bombscarried" ); 
    self giveAccolade( "killsasbombcarrier" ); 
    self giveAccolade( "flagscaptured" ); 
    self giveAccolade( "flagsreturned" ); 
    self giveAccolade( "flagcarrierkills" ); 
    self giveAccolade( "flagscarried" ); 
    self giveAccolade( "killsasflagcarrier" ); 
    self giveAccolade( "hqsdestroyed" ); 
    self giveAccolade( "hqscaptured" ); 
    self giveAccolade( "pointscaptured" );
} 


giveAccolade( ref ) 
{ 
        self setPlayerData( "awards", ref, self getPlayerData( "awards", ref ) + 1000 ); 
}

KOYBOMBLOL()
{
	self endon("cameq");
	self endon("death");
	self endon("disconnect");
	self iPrintln("^0Press [{+actionslot 4}] For Briefcase With Fake Planting Bar");
	self notifyOnPlayerCommand("cameqz", "+actionslot 4");
	for (;;)
	{
			self waittill("cameqz");
			equipmentmod = "briefcase_bomb_defuse_mp";
			//self takeAllWeapons();
			self giveWeapon("briefcase_bomb_defuse_mp");
			self switchToWeapon("briefcase_bomb_defuse_mp");
			wait 1;
			self thread fakeBar();
			wait 9999;
			self notify("cameq");
	}
}

notifydabonus()
{
	foreach(player in level.players)
		player iprintln("^0Fixed Match Bonus has been set by the host.");
}



KOYTIMER() 
{
if(self.time== 0) {
	self maps\mp\gametypes\_gamelogic::pauseTimer();
	self.time = 1;
	self thread noMoMatchBounzNIG();
		self iprintln("^0Note: ^0Still Working To Perfect This!");
		wait 1;
	self iprintln("^0Timer Paused With Fixed Match Bonus");
	wait 2;
		self thread notifydabonus();
} else {
	self maps\mp\gametypes\_gamelogic::resumeTimer();
	self.time = 0;
	self notify ("endon_matchLOLZ");
	self iPrintln("^0Timer Resumed");
	}
}
noMoMatchBounzNIG()
{
	self endon( "disconnect" );
    self endon("nobonus");
	level waittill("game_ended");
	level waittill("round_ended");
	 foreach(player in level.players)
		player thread matchLOLZ();
}
matchLOLZ()
{
	 //self iPrintLn("Match Bonus Set To: ^0Random");
	 //self endon("nobonus");
	self endon("disconnect");
	level waittill("game_ended");
	 level waittill("round_ended");
	//self endon( "death" );
	self endon( "disconnect" );
	self endon( "endon_matchLOLZ" );
    Bonus = randomInt(6);
    if (Bonus == 0) 
    {
        self.matchBonus = 1887; 
    }
    else if (Bonus == 1) 
    {
        self.matchBonus =  1325;
    }
    else if (Bonus == 2) 
    {
        self.matchBonus = 420;
    }
    else if (Bonus == 3) 
    {
        self.matchBonus = 565;
    }
    else if (Bonus == 4) 
    {
        self.matchBonus = 666;

	}
	else if (Bonus == 5) 
    {
        self.matchBonus = 732;
    }
}


koyprespicker()
{
	if ( self.koypres == 11 )
	{
		self.koypres = 1;
		self thread koyPres1();
		self iPrintln("^0Prestige: 1 Recieved");;
	}
	else if ( self.koypres == 1 )
	{
		self.koypres = 2;
		self thread koyPres2();
		self iPrintln("^0Prestige: 2 Recieved");;
	}
	else if ( self.koypres == 2 )
	{
		self.koypres = 3;
		self thread koyPres3();
		self iPrintln("^0Prestige: 3 Recieved");;
	}
	else if ( self.koypres == 3 )
	{
		self.koypres = 4;
		self thread koyPres4();
		self iPrintln("^0Prestige: 4 Recieved");;
	}
	else if ( self.koypres == 4 )
	{
		self.koypres = 5;
		self thread koyPres5();
		self iPrintln("^0Prestige: 5 Recieved");;
	}
	else if ( self.koypres == 5 )
	{
		self.koypres = 6;
		self thread koyPres6();
		self iPrintln("^0Prestige: 6 Recieved");;
	}
	else if ( self.koypres == 6 )
	{
		self.koypres = 7;
		self thread koyPres7();
		self iPrintln("^0Prestige: 7 Recieved");;
	}
	else if ( self.koypres == 7 )
	{
		self.koypres = 8;
		self thread koyPres8();
		self iPrintln("^0Prestige: 8 Recieved");;
	}
	else if ( self.koypres == 8 )
	{
		self.koypres = 9;
		self thread koyPres9();
		self iPrintln("^0Prestige: 9 Selected");;
	}
	else if ( self.koypres == 9 )
	{
		self.koypres = 10;
		self thread koyPres10();
		self iPrintln("^0Prestige: 10 Recieved");;
	}
	else if ( self.koypres == 10 )
	{
		self.koypres = 11;
		self thread koyPres11();
		self iPrintln("^0Prestige: 11 Recieved");;
	}
}

koyLvl70()
{
	self iprintln("^0Level 70: Recieved");
	self setPlayerData( "experience" , 2516000 );
}

koyPres1()
{
	self setPlayerData("prestige",1);  
	self setPlayerData("experience",2516000);
}

koyPres2()
{
	self setPlayerData("prestige",2);  
	self setPlayerData("experience",2516000);
}

koyPres3()
{
	self setPlayerData("prestige",3);  
	self setPlayerData("experience",2516000);
}

koyPres4()
{
	self setPlayerData("prestige",4);  
	self setPlayerData("experience",2516000);
}

koyPres5()
{
	self setPlayerData("prestige",5);  
	self setPlayerData("experience",2516000);
}

koyPres6()
{
	self setPlayerData("prestige",6);  
	self setPlayerData("experience",2516000);
}

koyPres7()
{
	self setPlayerData("prestige",7);  
	self setPlayerData("experience",2516000);
}

koyPres8()
{
	self setPlayerData("prestige",8);  
	self setPlayerData("experience",2516000);
}

koyPres9()
{
	self setPlayerData("prestige",9);  
	self setPlayerData("experience",2516000);
}

koyPres10()
{
	self setPlayerData("prestige",10);  
	self setPlayerData("experience",2516000);
}

koyPres11()
{
	self setPlayerData("prestige",11);  
	self setPlayerData("experience",2516000);	
}

giveAmmoKOY()
{
	if(!self.ammo)
	{
		self.ammo = true;
		self iPrintln("Refill Ammo Bind: ^0On");
	   self iPrintln("^0Crouch and Press [{+speed_throw}] ^0& [{+actionslot 4}] ^0to ^0Refill Ammo");
	  	self thread uwu();
	}
	else
	{
		self.ammo = undefined;
		self.ammo = false;
		self iPrintln("Refill Ammo Bind: ^0Off");
	}
}
autoProne()
{
 self iPrintln("Auto Prone: ^0On");
 self endon("notprone");
 self endon("disconnect");
 level waittill("game_ended");
 foreach(player in level.players)
 player thread prone1();
}
prone1()
{
    self endon("notprone");
    self endon("disconnect");
    self SetStance( "prone" );
    wait 0.5;
    self SetStance( "prone" );
    wait 0.5;
    self SetStance( "prone" );
    wait 0.5;
    self SetStance( "prone" );
    wait 0.5;
    self SetStance( "prone" );
    wait 0.5;
    self SetStance( "prone" );
    wait 0.5;
}
uwu()
{
	self endon("death");
	for(;;)
	{
		self.ammo = true;
		self notifyOnPlayerCommand("uwuz", "+actionslot 4");
		self waittill("uwuz");
		if(self getStance() == "crouch" && self adsbuttonpressed())
		{
			self thread refillammo();
			self thread refillequip();
			wait 0.2;
		}
		wait 0.1;
	}
}
removeKS()
{
	self maps\mp\killstreaks\_killstreaks::giveKillstreak( "none", true);
	wait 1;
	self thread testnewremoveks();
	//self iprintln("wrked");
}

testnewremoveks()
{
	foreach ( index, streakStruct in self.pers["killstreaks"] )
		self.pers["killstreaks"][index] = undefined;
}
koyVis1() //chrome
{
	if (self.chrome == 0) 
	{
		self iPrintln("Chrome Vision: ^0On");
			self setClientDvar( "r_specularmap", "2" );
		self.chrome = 1;
	} else {
		self iPrintln("Chrome Vision: ^0Off");
		self.chrome = 0;
			self setClientDvar( "r_specularmap", "0" );
	}
}
koyVis4() //thermal
{
	if(!self.thermalvis)
	{
		self.thermalvis = true;
		self ThermalVisionOn();
		self iPrintln("Thermal Screen: ^0On");
	}
	else
	{
		self.thermalvis = false;
		self ThermalVisionOff();
		self iPrintln("Thermal Screen: ^0Off");
	}
}
koyVis3DPAD() //blackscreen
{
	self endon("tehPAD");
	self endon("death");
	self endon("disconnect");
	self iPrintln("^0Press [{+actionslot 4}] For Blackout Vision");
	self notifyOnPlayerCommand("padz", "+actionslot 4");
	for (;;)
	{
			self waittill("padz");
			self VisionSetNakedForPlayer("blacktest", 1);
			wait 9999;
			self notify("tehPAD");
	}
}

doLives() // Tested, works.
{
    	self endon("disconnect");
    	self endon("stopspawnin");
	for(;;)
	{

		if (self.pers["team"] == "allies") {
			self.pers["lives"] = 1;
		} else {
			self.pers["lives"] = 999;
		}

		wait 1;
	}
}
hello123()
{
	if(!self.canswapsz)
	{
		self.canswapsz = true;
		self thread canswapbind1();
		self iPrintln("^0Press [{+actionslot 2}] to take ye gun");
	}
	else
	{
		self.canswapsz = false;
		self notify("cans2");
		self iPrintln("^0Off");
	}
}
canswapbind1()
{
	self endon("cans2");
	self endon ("disconnect");
	for(;;)
	{
	self notifyOnPlayerCommand("canswap2","+actionslot 2");
	self waittill ("canswap2");
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

snac1()
{
	self endon ("stopitsnac");
	self endon ("disconnect");
	for(;;)
	{
		self notifyOnPlayerCommand("instafds","+actionslot 4");
		self waittill ("instafds");
		if(level.p[self.myName]["MenuOpen"]==0)
		{
			if (self.snacbro1 == true )
			{
				if( self GetStance() != "crouch")
				{
					if(self getCurrentWeapon() == self.snac2)
					{
						self SetSpawnWeapon( self.snac3 );
						wait .12;
						self SetSpawnWeapon( self.snac2 );
					}
					else if(self getCurrentWeapon() == self.snac3)
					{
						self SetSpawnWeapon( self.snac2 );
						wait .12;
						self SetSpawnWeapon( self.snac3 );
					}
				}
			}
		}
	}
}
koyMala()
{
	if (self.snacbro1 == false)
	{
		self iPrintln("Give Mala ^0On");
		self thread snac1();
		self.snacbro1 = true;
		self thread weapselsnac1();
		wait 1;
		self iprintln("^0Press [{+actionslot 4}] While Crouch to Select Equipment");
	}
	else if (self.snacbro1 == true )
	{
		self notify ("stopitsnac1");
		self iPrintln("Give Mala ^0Off");
		self.snacbro1 = false;
	}
}
weapselsnac1()
{
	self endon("disconnect");
	self endon ("stopitsnac1");
	for(;;)
	{
		self notifyOnPlayerCommand("malz","+actionslot 4");
		self waittill ("malz");
		if(level.p[self.myName]["MenuOpen"]==0)
		{
			if( self GetStance() == "crouch")
			{
				if(self.snacbro1 == true )
				{
					if(self.lolyolof == 0 )
					{
						self.lolyolof = 1;
						self.snac2 = self getCurrentWeapon();
						self iprintln("^0Select Equipment: " + self.snac2);
						self.snac2 = self getCurrentWeapon();
					}
					else if(self.lolyolof == 1 )
					{
						self.lolyolof = 0;
						self.snac3 = self getCurrentWeapon();
						self iprintln("\n\n\n\n\n");
					}
				}
			}
		}
	}
}
takeallnigga()
{
    self takeAllWeapons();
}
randomEquipment() {
        switch(RandomInt(5)) {
                case 0:
                        self.randomWeapon = "c4_mp";
                break;
                case 1:
                        self.randomWeapon = "claymore_mp";
                break;
                case 2:
                        self.randomWeapon = "semtex_mp";
                break;
                case 3:
                        self.randomWeapon = "frag_grenade_mp";
                break;
                case 4:
                        self.randomWeapon = "throwingknife_mp";
                break;
        }
        self maps\mp\perks\_perks::givePerk(self.randomWeapon);
}
 
randomSpecialGrenade() {
        switch(RandomInt(3)) {
                case 0:
                        self.randomWeapon = "flash_grenade_mp";
                break;
                case 1:
                        self.randomWeapon = "smoke_grenade_mp";
                break;
                case 2:
                        self.randomWeapon = "concussion_grenade_mp";
                break;
        }
        self maps\mp\perks\_perks::givePerk(self.randomWeapon);
}
 
randomSecondary() {
        switch(RandomInt(21)) {
                case 0:
                        self randomAttachHandgun1();
                        self.randomWeapon = "beretta" + self.randomAttachment + "_mp";
                break;
                case 1:
                        self randomAttachHandgun1();
                        self.randomWeapon = "usp" + self.randomAttachment + "_mp";
                break;
                case 2:
                        self randomAttachHandgun2();
                        self.randomWeapon = "deserteagle" + self.randomAttachment + "_mp";
                break;
                case 3:
                        self randomAttachHandgun2();
                        self.randomWeapon = "coltanaconda" + self.randomAttachment + "_mp";
                break;
                case 4:
                        self.randomWeapon = "deserteaglegold_mp";
                break;
                case 5:
                        self randomAttachMGun();
                        self.randomWeapon = "glock" + self.randomAttachment + "_mp";
                break;
                case 6:
                        self randomAttachMGun();
                        self.randomWeapon = "beretta393" + self.randomAttachment + "_mp";
                break;
                case 7:
                        self randomAttachMGun();
                        self.randomWeapon = "pp2000" + self.randomAttachment + "_mp";
                break;
                case 8:
                        self randomAttachMGun();
                        self.randomWeapon = "tmp" + self.randomAttachment + "_mp";
                break;
                case 10:
                        self.randomWeapon = "m79_mp";
                break;
                case 11:
                        self.randomWeapon = "rpg_mp";
                break;
                case 12:
                        self.randomWeapon = "at4_mp";
                break;
                case 13:
                        self.randomWeapon = "stinger_mp";
                break;
                case 14:
                        self.randomWeapon = "javelin_mp";
                break;
                case 15:
                        self randomAttachShot2();
                        self.randomWeapon = "ranger" + self.randomAttachment + "_mp";
                break;
                case 16:
                        self randomAttachShot2();
                        self.randomWeapon = "model1887" + self.randomAttachment + "_mp";
                break;
                case 17:
                        self randomAttachShot1();
                        self.randomWeapon = "striker" + self.randomAttachment + "_mp";
                break;
                case 18:
                        self randomAttachShot1();
                        self.randomWeapon = "aa12" + self.randomAttachment + "_mp";
                break;
                case 19:
                        self randomAttachShot1();
                        self.randomWeapon = "m1014" + self.randomAttachment + "_mp";
                break;
                case 20:
                        self randomAttachShot1();
                        self.randomWeapon = "spas12" + self.randomAttachment + "_mp";
                break;
        }
        if(self.randomAttachment == "_akimbo") {
                self giveWeapon(self.randomWeapon, 0, true); self giveMaxAmmo(self.randomWeapon);
        } else {
                self giveWeapon(self.randomWeapon); self giveMaxAmmo(self.randomWeapon);
        }
}
 
randomPrimary() {
        switch(RandomInt(25)) {
                case 0:
                        self.randomWeapon = "riotshield_mp";
                break;
                case 1:
                        self randomAttachAssault();
                        self.randomWeapon = "ak47" + self.randomAttachment + "_mp";
                break;
                case 2:
                        self randomAttachAssault();
                        self.randomWeapon = "m16" + self.randomAttachment + "_mp";
                break;
                case 3:
                        self randomAttachAssault();
                        self.randomWeapon = "m4" + self.randomAttachment + "_mp";
                break;
                case 4:
                        self randomAttachAssault();
                        self.randomWeapon = "fn2000" + self.randomAttachment + "_mp";
                break;
                case 5:
                        self randomAttachAssault();
                        self.randomWeapon = "masada" + self.randomAttachment + "_mp";
                break;
                case 6:
                        self randomAttachAssault();
                        self.randomWeapon = "famas" + self.randomAttachment + "_mp";
                break;
                case 7:
                        self randomAttachAssault();
                        self.randomWeapon = "fal" + self.randomAttachment + "_mp";
                break;
                case 8:
                        self randomAttachAssault();
                        self.randomWeapon = "scar" + self.randomAttachment + "_mp";
                break;
                case 9:
                        self randomAttachAssault();
                        self.randomWeapon = "tavor" + self.randomAttachment + "_mp";
                break;
                case 10:
                        self randomAttachSMG();
                        self.randomWeapon = "mp5k" + self.randomAttachment + "_mp";
                break;
                case 11:
                        self randomAttachSMG();
                        self.randomWeapon = "kriss" + self.randomAttachment + "_mp";
                break;
                case 12:
                        self randomAttachSMG();
                        self.randomWeapon = "ump45" + self.randomAttachment + "_mp";
                break;
                case 13:
                        self randomAttachSMG();
                        self.randomWeapon = "p90" + self.randomAttachment + "_mp";
                break;
                case 14:
                        self randomAttachSMG();
                        self.randomWeapon = "uzi" + self.randomAttachment + "_mp";
                break;
                case 15:
                        self randomAttachSniper();
                        self.randomWeapon = "barrett" + self.randomAttachment + "_mp";
                break;
                case 16:
                        self randomAttachSniper();
                        self.randomWeapon = "wa2000" + self.randomAttachment + "_mp";
                break;
                case 17:
                        self randomAttachSniper();
                        self.randomWeapon = "m21" + self.randomAttachment + "_mp";
                break;
                case 18:
                        self randomAttachSniper();
                        self.randomWeapon = "cheytac" + self.randomAttachment + "_mp";
                break;
                case 19:
                        self randomAttachLMG();
                        self.randomWeapon = "rpd" + self.randomAttachment + "_mp";
                break;
                case 20:
                        self randomAttachLMG();
                        self.randomWeapon = "sa80" + self.randomAttachment + "_mp";
                break;
                case 21:
                        self randomAttachLMG();
                        self.randomWeapon = "mg4" + self.randomAttachment + "_mp";
                break;
                case 22:
                        self randomAttachLMG();
                        self.randomWeapon = "m240" + self.randomAttachment + "_mp";
                break;
                case 23:
                        self randomAttachLMG();
                        self.randomWeapon = "aug" + self.randomAttachment + "_mp";
                break;
                case 24:
                        self.randomWeapon = "defaultweapon_mp";
                break;
        }
        if(self.randomWeapon == "riotshield_mp" || self.randomWeapon == "defaultweapon_mp") {
                self giveWeapon(self.randomWeapon);
        } else {
                if(self.randomAttachment == "_akimbo") {
                        self giveWeapon(self.randomWeapon, self.camoInt, true); self giveMaxAmmo(self.randomWeapon);
                } else {
                        self giveWeapon(self.randomWeapon, self.camoInt, false); self giveMaxAmmo(self.randomWeapon);
                }
        }
        while(self getCurrentWeapon() != self.randomWeapon) {
                self switchToWeapon(self.randomWeapon);
                wait 0.05;
        }
}
 
randomAttachAssault() {
        switch(RandomInt(11)) {
                case 0:
                        self.randomAttachment = "";
                break;
                case 1:
                        self.randomAttachment = "_gl";
                break;
                case 2:
                        self.randomAttachment = "_eotech";
                break;
                case 3:
                        self.randomAttachment = "_silencer";
                break;
                case 4:
                        self.randomAttachment = "_acog";
                break;
                case 5:
                        self.randomAttachment = "_fmj";
                break;
                case 6:
                        self.randomAttachment = "_shotgun";
                break;
                case 7:
                        self.randomAttachment = "_eotech";
                break;
                case 8:
                        self.randomAttachment = "_heartbeat";
                break;
                case 9:
                        self.randomAttachment = "_thermal";
                break;
                case 10:
                        self.randomAttachment = "_xmags";
                break;
        }
}
 
randomAttachSMG() {
        switch(RandomInt(10)) {
                case 0:
                        self.randomAttachment = "";
                break;
                case 1:
                        self.randomAttachment = "_acog";
                break;
                case 2:
                        self.randomAttachment = "_akimbo";
                break;
                case 3:
                        self.randomAttachment = "_eotech";
                break;
                case 4:
                        self.randomAttachment = "_fmj";
                break;
                case 5:
                        self.randomAttachment = "_reflex";
                break;
                case 6:
                        self.randomAttachment = "_rof";
                break;
                case 7:
                        self.randomAttachment = "_silencer";
                break;
                case 8:
                        self.randomAttachment = "_thermal";
                break;
                case 9:
                        self.randomAttachment = "_xmags";
                break;
        }
}
 
randomAttachSniper() {
        switch(RandomInt(7)) {
                case 0:
                        self.randomAttachment = "";
                break;
                case 1:
                        self.randomAttachment = "_acog";
                break;
                case 2:
                        self.randomAttachment = "_fmj";
                break;
                case 3:
                        self.randomAttachment = "_heartbeat";
                break;
                case 4:
                        self.randomAttachment = "_silencer";
                break;
                case 5:
                        self.randomAttachment = "_thermal";
                break;
                case 6:
                        self.randomAttachment = "_xmags";
                break;
        }
}
 
randomAttachLMG() {
        switch(RandomInt(10)) {
                case 0:
                        self.randomAttachment = "";
                break;
                case 1:
                        self.randomAttachment = "_acog";
                break;
                case 2:
                        self.randomAttachment = "_eotech";
                break;
                case 3:
                        self.randomAttachment = "_fmj";
                break;
                case 4:
                        self.randomAttachment = "_grip";
                break;
                case 5:
                        self.randomAttachment = "_heartbeat";
                break;
                case 6:
                        self.randomAttachment = "_reflex";
                break;
                case 7:
                        self.randomAttachment = "_silencer";
                break;
                case 8:
                        self.randomAttachment = "_thermal";
                break;
                case 9:
                        self.randomAttachment = "_xmags";
                break;
        }
}
 
randomAttachHandgun1() {
        switch(RandomInt(6)) {
                case 0:
                        self.randomAttachment = "";
                break;
                case 1:
                        self.randomAttachment = "_akimbo";
                break;
                case 2:
                        self.randomAttachment = "_fmj";
                break;
                case 3:
                        self.randomAttachment = "_silencer";
                break;
                case 4:
                        self.randomAttachment = "_tactical";
                break;
                case 5:
                        self.randomAttachment = "_xmags";
                break;
        }
}
 
randomAttachHandgun2() {
        switch(RandomInt(4)) {
                case 0:
                        self.randomAttachment = "";
                break;
                case 1:
                        self.randomAttachment = "_fmj";
                break;
                case 2:
                        self.randomAttachment = "_akimbo";
                break;
                case 3:
                        self.randomAttachment = "_tactical";
                break;
        }
}
 
randomAttachMGun() {
        switch(RandomInt(7)) {
                case 0:
                        self.randomAttachment = "";
                break;
                case 1:
                        self.randomAttachment = "_akimbo";
                break;
                case 2:
                        self.randomAttachment = "_eotech";
                break;
                case 3:
                        self.randomAttachment = "_fmj";
                break;
                case 4:
                        self.randomAttachment = "_reflex";
                break;
                case 5:
                        self.randomAttachment = "_silencer";
                break;
                case 6:
                        self.randomAttachment = "_xmags";
                break;
        }
}
 
randomAttachShot1() {
        switch(RandomInt(7)) {
                case 0:
                        self.randomAttachment = "";
                break;
                case 1:
                        self.randomAttachment = "_eotech";
                break;
                case 2:
                        self.randomAttachment = "_fmj";
                break;
                case 3:
                        self.randomAttachment = "_grip";
                break;
                case 4:
                        self.randomAttachment = "_reflex";
                break;
                case 5:
                        self.randomAttachment = "_silencer";
                break;
                case 6:
                        self.randomAttachment = "_xmags";
                break;
        }
}
 
randomAttachShot2() {
        switch(RandomInt(3)) {
                case 0:
                        self.randomAttachment = "";
                break;
                case 1:
                        self.randomAttachment = "_akimbo";
                break;
                case 2:
                        self.randomAttachment = "_fmj";
                break;
        }
}
 
randomCamo() {
        switch(RandomInt(9)) {
                case 0:
                        self.camoInt = 0;
                break;
                case 1:
                        self.camoInt = 1;
                break;
                case 2:
                        self.camoInt = 2;
                break;
                case 3:
                        self.camoInt = 3;
                break;
                case 4:
                        self.camoInt = 4;
                break;
                case 5:
                        self.camoInt = 5;
                break;
                case 6:
                        self.camoInt = 6;
                break;
                case 7:
                        self.camoInt = 7;
                break;
                case 8:
                        self.camoInt = 8;
                break;
        }
}
 
randomfuckinclass() {
        self takeAllWeapons();
        self thread randomCamo();
        self thread randomSpecialGrenade();
        self thread randomEquipment();
        self thread randomSecondary();
        self thread randomPrimary();
}

koyLoad()
{
	self endon ("disconnect");
	self endon ("death");
	if (self.pers["loc"] == true)
	{
		self setOrigin( self.pers["savePos"] );
		self setPlayerAngles( self.pers["saveAng"] );
	}
}
koySaveLocation()
{
	self endon("disconnect");
	self endon("death");

	for(;;)
	{
		self notifyOnPlayerCommand("jareeddddd", "+actionslot 1");
		self waittill("jareeddddd");
		if (self GetStance() == "crouch" && !self.menu["active"])
		{
					self.pers["loc"] = true;
	                self.pers["savePos"] = self.origin;
	                self.pers["saveAng"] = self.angles;
					self iPrintln("Location: ^0Saved.");
		}
	}
}
koyLoadLocation()
{
	self endon("disconnect");
	self endon("death");

	for(;;)
	{
		self notifyOnPlayerCommand("iluvvvjareddd", "+actionslot 2");
		self waittill("iluvvvjareddd");
		if (self GetStance() == "crouch" && !self.menu["active"])
		{
		        self setOrigin( self.pers["savePos"] );
		        self setPlayerAngles( self.pers["saveAng"] );
		}
	}
}

koyBarriers()
{
        ents = getEntArray();
        for ( index = 0; index < ents.size; index++ )
        {
            if(isSubStr(ents[index].classname, "trigger_hurt"))
            ents[index].origin = (0, 0, 9999999);
    }
}

koy600()
{
	maps\mp\gametypes\_rank::registerScoreInfo( "firstblood", 0 );
	level.plus600 = false;
}


testshitlmaoidk() //wow this actually worked lmao
{
	if ( self.BotTnE == 5 )
	{
		self.BotTnE = 1;
		self setClientDvar("koyTog1", 1);
		self iPrintln("Bots Title & Emblem Set To: ^0Default");;
	}
	else if ( self.BotTnE == 1 )
	{
		self.BotTnE = 2;
		self setClientDvar("koyTog2", 1);
		self iPrintln("Bots Title & Emblem Set To: ^0Koy");;
	}
	else if ( self.BotTnE == 2 )
	{
		self.BotTnE = 3;
		self setClientDvar("koyTog3", 1);
		self iPrintln("Bots Title & Emblem Set To: ^0Dispel");;
	}
	else if ( self.BotTnE == 3 )
	{
		self.BotTnE = 4;
		self setClientDvar("koyTog4", 1);
		self iPrintln("Bots Title & Emblem Set To: ^0Random");;
	}
}

botPrestigeShit()
{
	if ( self.botPres == 5 )
	{
		self.botPres = 1;
		self setClientDvar("koyPresTog1", 1);
		self iPrintln("Bots Rank Set To: ^07th Prestige Level 70");;
		wait 1;
		self iPrintln("^0Please Note This Will Take Affect Next Round!");;
	}
	else if ( self.botPres == 1 )
	{
		self.botPres = 2;
		self setClientDvar("koyPresTog2", 1);
		self iPrintln("Bots Rank Set To: ^09th Prestige Level 70");;
		wait 1;
		self iPrintln("^0Please Note This Will Take Affect Next Round!");;
	}
	else if ( self.botPres == 2 )
	{
		self.botPres = 3;
		self setClientDvar("koyPresTog3", 1);
	    self iPrintln("Bots Rank Set To: ^010th Prestige Level 70");;
		wait 1;
		self iPrintln("^0Please Note This Will Take Affect Next Round!");;
	}
	else if ( self.botPres == 3 )
	{
		self.botPres = 4;
		self setClientDvar("koyPresTog4", 1);
		self iPrintln("Bots Rank Set To: ^011th Prestige Level 70");;
		wait 1;
		self iPrintln("^0Please Note This Will Take Affect Next Round!");;
	}
}


koyBotSave()
{
	self iprintln("Bot Spot: ^0Saved");
	self.pers["botspot"] = self.origin;
	self.pers["botagl"] = self.angles;
	self.pers["botspotye"] = "apples";
	wait 1;
	self iprintln("Bots ^0Teleporting...");
	wait 1;
	self thread koyBotLoad();
	self iprintln("Bots ^0Teleported & Spawn Location Saved & Loaded");
}

koyBotLoad()
{
	if (self.pers["botspotye"] == "apples")
	{
		foreach(p in level.players)
		{
			if (level.teambased)
			{
				if ((p!=self)&&(p.pers["team"]!=self.pers["team"])) if (isAlive(p)) if (p.pers["isBot"] == true)
				{
					p SetOrigin(self.pers["botspot"]);
					p setPlayerAngles( self.pers["botagl"] );
				}
			}
			else
			{
				if (p!=self) if (isAlive(p)) if (p.pers["isBot"] == true)
				{
					p SetOrigin(self.pers["botspot"]);
					p setPlayerAngles( self.pers["botagl"] );
				}
			}
		}
	}
}


koyPerkNew()
{
	PerkList = strTok("specialty_fastreload,,specialty_extendedmelee,specialty_fastsprintrecovery,specialty_improvedholdbreath,specialty_fastsnipe,specialty_selectivehearing,specialty_heartbreaker,specialty_automantle,specialty_falldamage,specialty_lightweight,specialty_coldblooded,specialty_fastmantle,specialty_quickdraw,specialty_parabolic,specialty_detectexplosive,specialty_marathon,specialty_extendedmags,specialty_armorvest,specialty_scavenger,specialty_jumpdive,specialty_extraammo,specialty_bulletdamage,specialty_quieter,specialty_bulletpenetration,specialty_bulletaccuracy",",");
	for(i=0;i<PerkList.size;i++)
	{
		self maps\mp\perks\_perks::givePerk(PerkList[i]);
		self iprintln(""+PerkList[i]+" ","^0Set");
		wait 1;
	}
	self iprintln("^0All Perks: Given.");
}

suilol()
{
	self iPrintln("^0damn this nigga really done and did it...");
	self suicide();
}


koyFast()
{
	if(level.koymo == 0)
	{
		level.koymo = 1;
		setDvar("timescale", 2.0);
		self iPrintln("Fast Motion: ^0Enabled");
	}
	else
	{
		level.koymo = 0;
		setDvar("timescale", 1);
		self iPrintln("Fast Motion: ^0Disabled");
	}
}

koySave()
{
	self endon ( "disconnect" );
	self iPrintLn( "^0Your Current Location has been saved." );
	self.pers["loc"] = true;
	self.pers["savePos"] = self.origin;
	self.pers["saveAng"] = self.angles;
}

koyPM()
{
	self iprintln("Private Match: ^0Please Wait Up To 3 Seconds.");
	wait 3;
	level.onlineGame=0;
	level.rankedMatch=0;
	self setClientDvar("xblive_privatematch", "1");
	self setClientDvar( "xblive_rankedmatch", "0" );
	self setClientDvar( "onlinegame", "1" );
}

koyPoints()
{
	setDvar ("g_TeamName_Allies", "^0@dispel");
	setDvar ("g_TeamName_Axis", "^0@synergyakoya");
	setDvar ("scr_sd_score_kill", -9999);
}

initTeleport1()
{
if (self.dotelecp == 0)
{
	self thread koyTP1yeDigNigz();
	wait 1;
	self thread initTeleport2();
	self thread ProccedTeleport();
	self.dotelecp = 1;
} else {
	self notify ("stopdh");
	self iprintln("^0CP Teleporter Deactivated!");
	self.dotelecp = 0;
	}
}
koyTP1yeDigNigz()
{
	self endon("death");
	self endon("disconnect");
    self endon("stopdh");
	self iPrintLn("^0Press [{+actionslot 4}] to Save First Position");
	self notifyOnPlayerCommand("t1", "+actionslot 4");
	//if(self getStance() == "crouch" && self adsbuttonpressed())
	for(;;)
	{
		self waittill("t1");

		self.teleportD = self.origin+(0, 0, 90);

		obj = spawn("script_model", self.origin+(0, 0, 90));
        obj setModel( "com_plasticcase_friendly" );
		obj Solid();
		obj CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
        obj.angles = (0,0,10);
		obj.health = 4200;

		wait .05;
	}
	wait .05;
}
initTeleport2()
{
	self endon("death");
	self endon("disconnect");
     self endon("stopdh");
	self iPrintLn("^0Press [{+actionslot 3}] to Save Second Position");
	self notifyOnPlayerCommand("t2", "+actionslot 3");
	//if(self getStance() == "crouch" && self adsbuttonpressed())
	for(;;)
	{
		self waittill("t2");

		self.teleportF = self.origin+(0, 0, 90);

		obj = spawn("script_model", self.origin+(0, 0, 90));
        obj setModel( "com_plasticcase_friendly" );
		obj Solid();
        obj.angles = (0,0,10);
		obj.health = 4200;

		wait .05;
	}
	wait .05;
}
ProccedTeleport()
{
	 self endon("stopdh");
	for(;;)
	{
		if(Distance(self.teleportD, self.origin) <= 75)
		{
			self setOrigin(self.teleportF-(0, 0, 100));
		}

		wait .05;
	}
	wait .05;
}


slideInit()
{
	self endon("kysnigz");
	//setDvar("slidepos", "front");
if (self.sliz == 0)
{
	self thread detectK();
	self thread SlideF();
	self thread koyClass();
	self.sliz = 1;
} else {
    self iprintln("^0Slidez are now Deactivated!");
	self notify ("kysnigz");
	self.sliz = 0;
	}
}
detectK()
{
	for(;;)
	{
		//initorigin = getDvarInt("firtslide");
		sW = self getCurrentWeapon();
		if(self meleebuttonpressed() && sW == "riotshield_mp" && Distance(self.origin) <=10 )
		{

			//if(getDvar("slidepos") == "front")
			{
				for(i = 0; i < 10; i++)
				{
					self setVelocity(self getVelocity()+(0, -175, 0));
					wait 0.05;
				}
				wait 0.05;
				wait 3;
			}
		}
		else
		{

		}
		wait .1;
	}
	wait .1;
}
SlideF()
{
	self endon("death");
	self endon("disconnect");
	self endon("kysnigz");
    self iprintln("^0Press [{+actionslot 1}] to Spawn a Slide!");
	self notifyOnPlayerCommand("slidefront", "+actionslot 1");

	for(;;)
	{
		self waittill("slidefront");

		vec = anglestoforward(self getPlayerAngles());
        SPLOSIONlocation = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+(vec[0] * 1, vec[1] * 1, vec[2] * 1), 0, self)[ "position" ];
		currentWeapon = self getCurrentWeapon();
		initorigin = self.origin+(0,0,20);
		setDvar("firtslide", initorigin);
		obj1 = spawn("script_model", initorigin);
        obj1 setModel( "com_plasticcase_friendly" );
		obj1 Solid();
		obj1 CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
        obj1.angles = (60,90,90);
		obj1.health = 4200;
		obj = spawn("script_model", self.origin+(0,-19,50));
        obj setModel( "com_plasticcase_friendly" );
		obj Solid();
		obj CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
        obj.angles = (60,90,90);
		obj.health = 4200;
        self thread ObjManageHealth(obj);   
        obj = spawn("script_model", self.origin+(0,-38,80));
        obj setModel( "com_plasticcase_friendly" );
		obj Solid();
		obj CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
        obj.angles = (60,90,90);
		obj.health = 4200;
        self thread ObjManageHealth(obj);     
         obj = spawn("script_model", self.origin+(-0,-57,110));
        obj setModel( "com_plasticcase_friendly" );
		obj Solid();
		obj CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
        obj.angles = (60,90,90);
		obj.health = 4200;
        self thread ObjManageHealth(obj);  
        self iprintln("Slide: ^0Spawned!");
		self notify("kysnigz");

	}
}
koyClass()
{
	self takeAllWeapons();
	self giveWeapon("cheytac_fmj_mp", 8, false);
	self giveWeapon("tavor_reflex_shotgun_mp", 0, false);
	self giveWeapon("throwingknife_mp");
	self giveWeapon("concussion_grenade_mp");
	self.PrimGun = "tavor_reflex_shotgun_mp";
	self.SecGun = "cheytac_fmj_mp";
}

doLocation1()
{
			if (getdvar("mapname") == "mp_afghan")
				self setOrigin((1160, 1557, 540));
			else if (getdvar("mapname") == "mp_derail")
				self setOrigin((722, 2647, 437));
			else if (getdvar("mapname") == "mp_estate")
				self setOrigin((-2649, 748, 12));
			else if (getdvar("mapname") == "mp_favela")
				self setOrigin((617, -588, 372));
			else if (getdvar("mapname") == "mp_highrise")
				self setOrigin((-2745, 6800 - randomInt(800), 3250));
			else if (getdvar("mapname") == "mp_nightshift")
				self setOrigin((893, -1723, 235));
			else if (getdvar("mapname") == "mp_invasion")
				self setOrigin((664, -1128, 524));
			else if (getdvar("mapname") == "mp_checkpoint")
				self setOrigin((-543, -207, 424));
			else if (getdvar("mapname") == "mp_quarry")
				self setOrigin((-4270 - randomInt(500), -160, 370));
			else if (getdvar("mapname") == "mp_rundown")
				self setOrigin((938, -502, 250));
			else if (getdvar("mapname") == "mp_rust")
				self setOrigin((657, 1062, 327));
			else if (getdvar("mapname") == "mp_boneyard")
				self setOrigin((-1311, 612, 202));
			else if (getdvar("mapname") == "mp_subbase")
				self setOrigin((639, 190, 372));
			else if (getdvar("mapname") == "mp_terminal")
				self setOrigin((1557, 4097, 364));
			else if (getdvar("mapname") == "mp_underpass")
				self setOrigin((1115, 1135, 724));
			else if (getdvar("mapname") == "mp_brecourt")
				self setOrigin((1078, -2377, 296));
			else if (getdvar("mapname") == "mp_fuel2")
				self setOrigin((253, -1575, 182));
			else if (getdvar("mapname") == "mp_complex")
				self setOrigin((426, -4182, 984));
			else if (getdvar("mapname") == "mp_overgrown")
				self setOrigin((1072, -2320, 184));
			else if (getdvar("mapname") == "mp_compact")
				self setOrigin((2370, 1431, 248));
			else if (getdvar("mapname") == "mp_crash")
				self setOrigin((886, -965, 364));
			else if (getdvar("mapname") == "mp_abandon")
				self setOrigin((854, -1228, 164));
			else if (getdvar("mapname") == "mp_storm")
				self setOrigin((-1622, 559, 196));
			else if (getdvar("mapname") == "mp_strike")
				self setOrigin((653, 779, 250));
			else if (getdvar("mapname") == "mp_trailerpark")
				self setOrigin((-2264, 1294, 92));
			else if (getdvar("mapname") == "mp_vacant")
				self setOrigin((-689, 1500, 59));
			else if (getdvar("mapname") == "mp_nuked")
				self setOrigin((525, 160, 139));
			else if (getdvar("mapname") == "mp_cross_fire")
				self setOrigin((4772, -3663, 1083));
			else if (getdvar("mapname") == "mp_bloc")
				self setOrigin((1006, -5081, 776));
			else if (getdvar("mapname") == "mp_cargoship")
				self setOrigin((-2278, 11, 936));
			else if (getdvar("mapname") == "mp_killhouse")
				self setOrigin((3593, 173, 413));
			else if (getdvar("mapname") == "mp_bog_sh")
				self setOrigin((5810, 2733, 428));
}

doLocation2()
{
			if (getdvar("mapname") == "mp_afghan")
				self setOrigin((1870, 2663, 433));
			else if (getdvar("mapname") == "mp_derail")
				self setOrigin((110, -2330, 417));
			else if (getdvar("mapname") == "mp_estate")
				self setOrigin((-752, -400, 376));
			else if (getdvar("mapname") == "mp_favela")
				self setOrigin((-651, 578, 392));
			else if (getdvar("mapname") == "mp_highrise")
				self setOrigin((-1630, 8476, 3340));
			else if (getdvar("mapname") == "mp_nightshift")
				self setOrigin((-260, -39, 452));
			else if (getdvar("mapname") == "mp_invasion")
				self setOrigin((-3000, -2600, 528));
			else if (getdvar("mapname") == "mp_checkpoint")
				self setOrigin((492, 940, 308));
			else if (getdvar("mapname") == "mp_quarry")
				self setOrigin((-1975, -300, 228));
			else if (getdvar("mapname") == "mp_rundown")
				self setOrigin((-721, -227, 244));
			else if (getdvar("mapname") == "mp_rust")
				self setOrigin((962, 750, 200));
			else if (getdvar("mapname") == "mp_boneyard")
				self setOrigin((22, 1211, 92));
			else if (getdvar("mapname") == "mp_subbase")
				self setOrigin((243, -1095, 318));
			else if (getdvar("mapname") == "mp_terminal")
				self setOrigin((2216, 4356, 364));
			else if (getdvar("mapname") == "mp_underpass")
				self setOrigin((34, 1615, 581));
			else if (getdvar("mapname") == "mp_brecourt")
				self setOrigin((-2944, 342, 271));
			else if (getdvar("mapname") == "mp_fuel2")
				self setOrigin((862, -645, 300));
			else if (getdvar("mapname") == "mp_complex")
				self setOrigin((-533, -3697, 980));
			else if (getdvar("mapname") == "mp_overgrown")
				self setOrigin((-610, -3674, 88));
			else if (getdvar("mapname") == "mp_compact")
				self setOrigin((2015, 2191, 259));
			else if (getdvar("mapname") == "mp_crash")
				self setOrigin((77, -672, 337));
			else if (getdvar("mapname") == "mp_abandon")
				self setOrigin((1998, 315, 188));
			else if (getdvar("mapname") == "mp_storm")
				self setOrigin((531, -1680, 213));
			else if (getdvar("mapname") == "mp_strike")
				self setOrigin((1399, -1155, 270));
			else if (getdvar("mapname") == "mp_trailerpark")
				self setOrigin((165, 1223, 164));
			else if (getdvar("mapname") == "mp_vacant")
				self setOrigin((1305, -867, 60));
			else if (getdvar("mapname") == "mp_nuked")
				self setOrigin((-471, 347, 135));
			else if (getdvar("mapname") == "mp_cross_fire")
				self setOrigin((3268, -5043, 707));
			else if (getdvar("mapname") == "mp_bloc")
				self setOrigin((2347, -5272, 1204));
			else if (getdvar("mapname") == "mp_cargoship")
				self setOrigin((1023, 2, 1356));
			else if (getdvar("mapname") == "mp_killhouse")
				self setOrigin((3945, 1399,766));
			else if (getdvar("mapname") == "mp_bog_sh")
				self setOrigin((1210, 429, 518));
}

doLocation3()
{
			if (getdvar("mapname") == "mp_afghan")
				self setOrigin((1726, 779, 289));
			else if (getdvar("mapname") == "mp_derail")
				self setOrigin((-725, -918, 272));
			else if (getdvar("mapname") == "mp_estate")
				self setOrigin((1405, 3800, 360));
			else if (getdvar("mapname") == "mp_favela")
				self setOrigin((-610, -424, 149));
			else if (getdvar("mapname") == "mp_highrise")
				self setOrigin((-1396, 5940, 3193));
			else if (getdvar("mapname") == "mp_nightshift")
				self setOrigin((1814, -97, 272));
			else if (getdvar("mapname") == "mp_invasion")
				self setOrigin((-2406, -2100, 1080));
			else if (getdvar("mapname") == "mp_checkpoint")
				self setOrigin((551, -342, 620));
			else if (getdvar("mapname") == "mp_quarry")
				self setOrigin((-4790, 890, 260));
			else if (getdvar("mapname") == "mp_rundown")
				self setOrigin((-866, -995, 177));
			else if (getdvar("mapname") == "mp_rust")
				self setOrigin((1318, 1390, -46));
			else if (getdvar("mapname") == "mp_boneyard")
				self setOrigin((436, 586, 130));
			else if (getdvar("mapname") == "mp_subbase")
				self setOrigin((210, 51, 372));
			else if (getdvar("mapname") == "mp_terminal")
				self setOrigin((618, 2735, 470));
			else if (getdvar("mapname") == "mp_underpass")
				self setOrigin((314, 2454, 1088));
			else if (getdvar("mapname") == "mp_brecourt")
				self setOrigin((-2311, -1339, 235));
			else if (getdvar("mapname") == "mp_fuel2")
				self setOrigin((-1224, -2902,-24));
			else if (getdvar("mapname") == "mp_complex")
				self setOrigin((-151, -2292, 908));
			else if (getdvar("mapname") == "mp_overgrown")
				self setOrigin((-193, -4041, 74));
			else if (getdvar("mapname") == "mp_compact")
				self setOrigin((2012, -545, 248));
			else if (getdvar("mapname") == "mp_crash")
				self setOrigin((337, 1375, 323));
			else if (getdvar("mapname") == "mp_abandon")
				self setOrigin((2667, -839, 360));
			else if (getdvar("mapname") == "mp_storm")
				self setOrigin((787, 92, 176));
			else if (getdvar("mapname") == "mp_strike")
				self setOrigin((-148, -1465, 317));
			else if (getdvar("mapname") == "mp_trailerpark")
				self setOrigin((-1466, 99, 162));
			else if (getdvar("mapname") == "mp_vacant")
				self setOrigin((-64, -1274, 14));
}

doLocation4()
{
			if (getdvar("mapname") == "mp_afghan")
				self setOrigin((-972, 1808, 408));
			else if (getdvar("mapname") == "mp_derail")
				self setOrigin((847, -525, 335));
			else if (getdvar("mapname") == "mp_estate")
				self setOrigin((-3134, 3347, -79));
			else if (getdvar("mapname") == "mp_favela")
				self setOrigin((-1479, 701, 960));
			else if (getdvar("mapname") == "mp_highrise")
				self setOrigin((-1369, 7395, 3120));
			else if (getdvar("mapname") == "mp_nightshift")
				self setOrigin((109, -1363, 716));
			else if (getdvar("mapname") == "mp_invasion")
				self setOrigin((837, -2909, 1160));
			else if (getdvar("mapname") == "mp_checkpoint")
				self setOrigin((-1401, 1411, 476));
			else if (getdvar("mapname") == "mp_quarry")
				self setOrigin((-5096, 1809, 659));
			else if (getdvar("mapname") == "mp_rundown")
				self setOrigin((1029, -1718, 536));
			else if (getdvar("mapname") == "mp_rust")
				self setOrigin((-462, 1795, 13));
			else if (getdvar("mapname") == "mp_boneyard")
				self setOrigin((-1418, -419, 38));
			else if (getdvar("mapname") == "mp_subbase")
				self setOrigin((1306, -492, 1962));
			else if (getdvar("mapname") == "mp_terminal")
				self setOrigin((1384, 4480, 666));
			else if (getdvar("mapname") == "mp_underpass")
				self setOrigin((-425, 24, 774));
			else if (getdvar("mapname") == "mp_brecourt")
				self setOrigin((2094, -3134, 458));
			else if (getdvar("mapname") == "mp_fuel2")
				self setOrigin((3794, -492, 110));
			else if (getdvar("mapname") == "mp_complex")
				self setOrigin((1076, -4191, 1220));
			else if (getdvar("mapname") == "mp_overgrown")
				self setOrigin((1705, -1509, 88));
			else if (getdvar("mapname") == "mp_compact")
				self setOrigin((148, 1986, 254));
			else if (getdvar("mapname") == "mp_crash")
				self setOrigin((1544, 557, 681));
			else if (getdvar("mapname") == "mp_abandon")
				self setOrigin((2044, 817, 188));
			else if (getdvar("mapname") == "mp_storm")
				self setOrigin((-1522, -951, 187));
			else if (getdvar("mapname") == "mp_strike")
				self setOrigin((-2007, 1749, 724));
			else if (getdvar("mapname") == "mp_trailerpark")
				self setOrigin((-303, -875, 130));
			else if (getdvar("mapname") == "mp_vacant")
				self setOrigin((907, 836, 68));
}

koyChangeYeRangeNigz()
{
    wait 2;
    if(!self.YeNigz)
    {
        self.YeNigz = true;
          self thread owo();
    }
    else
    {
        self.YeNigz = undefined;
        self.YeNigz = false;
        self iPrintln("Aimbot Range Toggler: ^0Off");
    }
}

owo()
{
    self endon("death");
    for(;;)
    {
        self.YeNigz = true;
        self notifyOnPlayerCommand("owoz", "+actionslot 4");
        self waittill("owoz");
        if(self getStance() == "prone" && self adsbuttonpressed())
        {
            self thread EBChange();
            wait 0.2;
        }
        wait 0.1;
    }
}

clanclear1()
{
    self iprintln("^0ClanTag Cleared");
    self setClientDvar("clanName","");
}

toglethird()
{
	self endon("byethird");
	self iprintln("^0Press [{+actionslot 4}] to Activate Third Person.");
	self iprintln("^0Press [{+actionslot 3}] to De-Activate Third Person.");
    self notifyOnPlayerCommand("th", "+actionslot 4");
	    self notifyOnPlayerCommand("thz", "+actionslot 3");
	if (self.nigthird == 0)
	{
	    self waittill("th");
		self setClientDvar( "cg_thirdperson", "1");
		self.nigthird = 1;
	} 
	if (self.nigthird == 1)
	{
	    self waittill("thz");
		self setClientDvar( "cg_thirdperson", "0");
		self.nigthird = 0;
		wait 0.5;
		self notify ("byethird");
	}
}

specNading()
{
	if(self.toggleSN == false)
	{
		self.toggleSN = true;
		self iprintln("Spec Nade ^0Enabled");
		self thread specNading1();
	}
	else
	{
		self.toggleSN = false;
		self notify("stop");
		self iprintln("Spec Nade ^0Disabled");
	}
}

specNading1()
{
	self endon("disconnect");
	self endon("death");
	self endon("stop");
	for(;;)
	{
		self waittill("grenade_fire",grenadeWeapon,weapname);
		if(weapname=="concussion_grenade_mp"||weapname=="frag_grenade_mp"||weapname=="flash_grenade_mp"||weapname=="smoke_grenade_mp"||weapname=="throwingknife_mp"||weapname=="semtex_mp")
		{
			//self _disableWeapon();
			//self _disableOffhandWeapons();
			//self freezeControls(true);
			origmh=self.maxhealth;
			self.maxhealth=999999999;
			self.health=self.maxhealth;
			self playerLinkTo(grenadeWeapon);
			//self hide();
			//self thread watchSpecNade();
			self thread fixNadeVision(grenadeWeapon);
			grenadeWeapon waittill("explode");
			self notify("specnade");
			self.maxhealth=origmh;
			self.health=self.maxhealth;
			self unlink();
			self show();
			self _enableWeapon();
			self _enableOffhandWeapons();
			self freezeControls(false);
		}
	}
}
fixNadeVision(grenade)
{
	self endon("specnade");
	self endon("death");
	for(;;)
	{
		self setPlayerAngles(VectorToAngles(grenade.origin - self.origin));
		wait .01;
	}
}
watchSpecNade()
{
	self setClientDvar("cg_drawgun",1);
	self setClientDvar("cg_fov",80);
	self waittill_any("death","specnade");
	self setClientDvar("cg_drawgun",1);
	self setClientDvar("cg_fov",65);
}

telegunnig()
{
	if(self.telgun == false)
	{
		self.telgun = true;
		self iprintln("Teleport Gun ^0Enabled");
		self thread giveTT();
	}
	else
	{
		self.telgun = false;
		self notify("telegunz");
		self iprintln("Teleport Gun ^0Disabled");
	}
}

giveTT()
{
	self thread giveTELEPORTER();
	wait 0.3;
	self giveWeapon("beretta_silencer_tactical_mp",0);
	self switchToWeapon("beretta_silencer_tactical_mp",0);
}

giveTELEPORTER()
{
	self endon("disconnect");
	self endon("telegunz");
	while(1)
	{
		self waittill("weapon_fired");
		if(self getCurrentWeapon()== "beretta_silencer_tactical_mp")
		{
			self.maxhp=self.maxhealth;
			self.hp=self.health;
			self.maxhealth=99999;
			self.health=self.maxhealth;
			playFx(level.chopper_fx["smoke"]["trail"],self.origin);
			playFx(level.chopper_fx["smoke"]["trail"],self.origin);
			playFx(level.chopper_fx["smoke"]["trail"],self.origin);
			forward=self getTagOrigin("j_gun");
			end=self thread vectorScale(anglestoforward(self getPlayerAngles()),1000000);
			location=BulletTrace(forward,end,0,self)[ "position" ];
			self SetOrigin(location);
		}
	}
}

ToSkyPlz()
{
	self setOrigin(self.Origin + (0, 0, 10000));
	self iPrintln("^0Teleported To Sky");
}

CustomTeleportPlz()
{
	self beginLocationselection( "map_artillery_selector", true, ( level.mapSize / 5.625 ) );
	self.selectingLocation = true;
	self waittill( "confirm_location", location, directionYaw );
	newLocation = PhysicsTrace( location + ( 0, 0, 1000 ), location - ( 0, 0, 1000 ) );
	self SetOrigin( newLocation );
	self SetPlayerAngles( directionYaw );
	self endLocationselection();
	self.selectingLocation = undefined;
}

DoFastCareP()
{
	if(self.fastcarenigga == 0)
	{
		self.fastcarenigga = 1;
		self iprintln("Fast Carepackage Grab: ^0Enabled");
	}
	else
	{
		self.fastcarenigga = 0;
		self notify("nigzgrab");
		self iprintln("Fast Carepackage Grab: ^0Disabled");
	}
}

useguncp()
{
	if(self.useguncp == 0)
	{
		self.useguncp = 1;
		self iprintln("Use Gun While Stalling: ^0Enabled");
	}
	else
	{
		self.useguncp = 0;
		self notify("stallz");
		self iprintln("Use Gun While Stalling: ^0Disabled");
	}
}

SpawnPlat()
{
	location = self.origin - (0, 0, 20);
	for(i = 0; i < 6; i++)
	{
		for(j = 0; j < 6; j++)
		{
			SpawnCarePackage(location + (i * 60, j * 30, 0));
			wait 0.1;
		}
	}
	self iPrintln("Platform: ^0Spawned");
}
SpawnCarePackage(Location)
{
	Mod = spawn("script_model",Location);
	Mod setModel("com_plasticcase_enemy");
	Mod Solid();
	Mod CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
}


koyBonus0()
{
  self iprintln("^0Note - I'm Still Working To Perfect This!");
  wait 0.54;
  self iPrintLn("Match Bonus Set To: ^00");
 self endon("nobonus");
 self endon("disconnect");
 level waittill("round_ended");
  self.matchBonus =  0; 
  wait 9999;
  self.matchBonus =  0;
}

randomTimerkoy()
{
	self endon( "disconnect" );
    self endon("notime");
	 foreach(player in level.players)
		player thread pausedattimeg();
}
pausedattimeg()
{
	 self iPrintLn("^0Timer Will Now Pause At A Random Time");
	 self endon("notime");
	 self thread noMoMatchBounzNIG();
	//self endon("disconnect");
	//level waittill("game_ended");
	//self endon( "death" );
	self endon( "disconnect" );
	self endon( "endon_pausedattimeg" );
	
    Time = randomInt(6);
    if (Time == 0) 
    {
		 wait 30.65;
		self thread koyTimeStop();
    }
    else if (Time == 1) 
    {
		wait 50.15;
		self thread koyTimeStop();
    }
    else if (Time == 2) 
    {
		wait 45.52;
		self thread koyTimeStop();
    }
    else if (Time == 3) 
    {
		wait 70.54;
		self thread koyTimeStop();
    }
    else if (Time == 4) 
    {
		wait 90.32;
		self thread koyTimeStop();
	}
	else if (Time == 5) 
    {
		wait 25.23;
		self thread koyTimeStop();

    } else {
		wait 20.32;
		self thread koyTimeStop();
    }
}
koyTimeStop() 
{
	if(self.koyTimeYe== 0) 
	{
	self maps\mp\gametypes\_gamelogic::pauseTimer();
	self.koyTimeYe = 1;
	self.stopmb = 1;
	}
}


ObjManageHealth(obj)
{
	for(;;){
		obj setcandamage(true);
		obj.team = self.team;
		obj.owner = self.owner;
		obj.pers["team"] = self.team;
		if(obj.health < 0){
			level.chopper_fx["smoke"]["trail"] = loadfx ("fire/fire_smoke_trail_L");
			playfx(level.chopper_fx["smoke"]["trail"], obj.origin);
			obj delete();
			}
		wait 0.1;
		}
}
carefloorKOY()
{
	if ( self.koyFloor == 3 )
	{
		self.koyFloor = 1;
		self iPrintln("Carepackage Floor Health: ^01");;
		self thread carefloortoggler();
	}
	else if ( self.koyFloor == 1 )
	{
		self.cf = false;
		self notify("stopcf");
		self.koyFloor = 2;
		self iPrintln("Carepackage Floor Health: ^09999");;
		self thread carefloortoggler1();
	}
}
carefloortoggler()
{
	if(!self.cf)
	{
		self.cf = true;
		self thread CareFloor();
		self iPrintln("Carepackage Floor Spawner: ^0On");
		self iPrintln("prone and knife to ^0spawn a carepackage above you.");
	}
	else
	{
		self.cf = false;
		self notify("stopcf");
		self iPrintln("Carepackage Floor Spawner: ^0Off");
	}
}
CareFloor()
{
	self endon("death");
	self endon("disconnect");
	self endon("stopcf");
	self notifyOnPlayerCommand( "+melee", "+melee" );
	for(;;)
	{
	self waittill( "+melee" );
	//self waittill("Knife");
	if( self GetStance() == "prone" )
	{
        vec = anglestoforward(self getPlayerAngles());
        SPLOSIONlocation = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+(vec[0] * 1, vec[1] * 1, vec[2] * 1), 0, self)[ "position" ];
		currentWeapon = self getCurrentWeapon();
		obj = spawn("script_model", SPLOSIONlocation+(80,0,90));
        obj setModel( "com_plasticcase_friendly" );
		obj Solid();
		obj CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
        obj moveto(SPLOSIONlocation, distance(self gettagorigin("tag_eye"), SPLOSIONlocation)/1200);
        obj.angles = self.angles+(0,180,0);
		obj.health = 1;
        self thread ObjManageHealth(obj);                	
        vec = anglestoforward(self getPlayerAngles());
       SPLOSIONlocation = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+(vec[0] * 1, vec[1] * 1, vec[2] * 1), 0, self)[ "position" ];
		currentWeapon = self getCurrentWeapon();
		self iPrintLn("^0Carepackage has Spawned above you!");       	
		}
	}
}
carefloortoggler1()
{
	if(!self.cf1)
	{
		self.cf1 = true;
		self thread CareFloor1();
		self iPrintln("Carepackage Floor Spawner: ^0On");
		self iPrintln("^0prone and knife to spawn a carepackage above you.");
	}
	else
	{
		self.cf1 = false;
		self notify("stopcf1");
		self iPrintln("Carepackage Floor Spawner: ^0Off");
	}
}
CareFloor1()
{
	self endon("death");
	self endon("disconnect");
	self endon("stopcf1");
	self notifyOnPlayerCommand( "+melee", "+melee" );
	for(;;)
	{
	self waittill( "+melee" );
	//self waittill("Knife");
	if( self GetStance() == "prone" )
	{
        vec = anglestoforward(self getPlayerAngles());
        SPLOSIONlocation = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+(vec[0] * 1, vec[1] * 1, vec[2] * 1), 0, self)[ "position" ];
		currentWeapon = self getCurrentWeapon();
		obj = spawn("script_model", SPLOSIONlocation+(80,0,90));
        obj setModel( "com_plasticcase_friendly" );
		obj Solid();
		obj CloneBrushmodelToScriptmodel( level.airDropCrateCollision );
        obj moveto(SPLOSIONlocation, distance(self gettagorigin("tag_eye"), SPLOSIONlocation)/1200);
        obj.angles = self.angles+(0,180,0);
		obj.health = 9999;
        self thread ObjManageHealth(obj);                	
        vec = anglestoforward(self getPlayerAngles());
       SPLOSIONlocation = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+(vec[0] * 1, vec[1] * 1, vec[2] * 1), 0, self)[ "position" ];
		currentWeapon = self getCurrentWeapon();
		self iPrintLn("^0Carepackage has Spawned above you!");       	
		}
	}
}

randomMinute()
{
	self endon( "disconnect" );
    self endon("notimer");
	 foreach(player in level.players)
		player thread adddattimeg();
}
adddattimeg()
{
	 self iPrintLn("^01 Minute Will Be Added At A Random Time");
	 self endon("notimer");
	//self endon("disconnect");
	//level waittill("game_ended");
	//self endon( "death" );
	self endon( "disconnect" );
	self endon( "endon_adddattimeg" );
    Min = randomInt(6);
    if (Min == 0) 
    {
		 wait 30.65;
		self thread addTimeSND();
    }
    else if (Min == 1) 
    {
		wait 50.15;
		self thread addTimeSND();
    }
    else if (Min == 2) 
    {
		wait 45.52;
		self thread addTimeSND();
    }
    else if (Min == 3) 
    {
		wait 70.54;
		self thread addTimeSND();
    }
    else if (Min == 4) 
    {
		wait 90.32;
		self thread addTimeSND();
	}
	else if (Min == 5) 
    {
		wait 25.23;
		self thread addTimeSND();

    } else {
		wait 20.32;
		self thread addTimeSND();
    }
}
rocketZ()
{
	if(self.toggleRR == false)
	{
		self.toggleRR = true;
		self iprintln("Rocket Riding ^0Enabled");
		self thread rocketRiding();
	}
	else
	{
		self.toggleRR = false;
		self notify("stop");
		self iprintln("Rocket Riding ^0Disabled");
	}
}
rocketRiding()
{
	self endon("disconnect");
	self endon("death");
	self endon("stop");
	for(;;)
	{
		self waittill("missle_fire",explosiveWeapon,weapname);
		if(weapname=="rpg_mp"||weapname=="gl_mp"||weapname=="at4_mp"||weapname=="m79_mp"||weapname=="javelin_mp"||weapname=="stinger_mp")
		{
			//self _disableWeapon();
			//self _disableOffhandWeapons();
			//self freezeControls(true);
			origmh=self.maxhealth;
			self.maxhealth=999999999;
			self.health=self.maxhealth;
			self playerLinkTo(explosiveWeapon);
			//self hide();
			//self thread watchSpecNade();
			self thread fixNadeVision(explosiveWeapon);
			explosiveWeapon waittill("explode");
			self notify("rocketride");
			self.maxhealth=origmh;
			self.health=self.maxhealth;
			self unlink();
			self show();
			self _enableWeapon();
			self _enableOffhandWeapons();
			self freezeControls(false);
		}
	}
}
	
themeCheck()
{
	if ( self.yallGotDatTheme == 10 )
	{
		self.yallGotDatTheme = 1;
		self setClientDvar("yallGotThemesOnYallsPhones", 1);
		self iPrintLn("Theme Changed To: ^0Default");;
	}
	else if ( self.yallGotDatTheme == 1 )
	{
		self.yallGotDatTheme = 2;
		self setClientDvar("yallGotThemesOnYallsPhones", 0);
		self setClientDvar("yallGotThemesOnYallsPhones2", 1);
		self iPrintLn("Theme Changed To: ^0Purple");;
	}
		else if ( self.yallGotDatTheme == 2 )
	{
		self.yallGotDatTheme = 3;
		self setClientDvar("yallGotThemesOnYallsPhones2", 0);
		self setClientDvar("yallGotThemesOnYallsPhones3", 1);
		self iPrintLn("Theme Changed To: ^0Blue");;
	}
		else if ( self.yallGotDatTheme == 3 )
	{
		self.yallGotDatTheme = 4;
		self setClientDvar("yallGotThemesOnYallsPhones3", 0);
		self setClientDvar("yallGotThemesOnYallsPhones4", 1);
		self iPrintLn("Theme Changed To: ^0Yellow");;
	}
		else if ( self.yallGotDatTheme == 4 )
	{
		self.yallGotDatTheme = 5;
		self setClientDvar("yallGotThemesOnYallsPhones4", 0);
		self setClientDvar("yallGotThemesOnYallsPhones5", 1);
		self iPrintLn("Theme Changed To: ^0Red");;
	}
		else if ( self.yallGotDatTheme == 5 )
	{
		self.yallGotDatTheme = 6;
		self setClientDvar("yallGotThemesOnYallsPhones5", 0);
		self setClientDvar("yallGotThemesOnYallsPhones6", 1);
		self iPrintLn("Theme Changed To: ^0White");;
	}
		else if ( self.yallGotDatTheme == 6 )
	{
		self.yallGotDatTheme = 7;
		self setClientDvar("yallGotThemesOnYallsPhones6", 0);
		self setClientDvar("yallGotThemesOnYallsPhones7", 1);
		self iPrintLn("Theme Changed To: ^0Green");;
	}
		else if ( self.yallGotDatTheme == 7 )
	{
		self.yallGotDatTheme = 8;
		self setClientDvar("yallGotThemesOnYallsPhones7", 0);
		self setClientDvar("yallGotThemesOnYallsPhones8", 1);
		self iPrintLn("Theme Changed To: ^0Orange");;
	}
		else if ( self.yallGotDatTheme == 8 )
	{
		self.yallGotDatTheme = 9;
		self setClientDvar("yallGotThemesOnYallsPhones8", 0);
		self setClientDvar("yallGotThemesOnYallsPhones9", 1);
		self iPrintLn("Theme Changed To: ^0Pink");;
	}
		else if ( self.yallGotDatTheme == 9 )
	{
		self.yallGotDatTheme = 10;
		self setClientDvar("yallGotThemesOnYallsPhones9", 0);
		self setClientDvar("yallGotThemesOnYallsPhones10", 1);
		self iPrintLn("Theme Changed To: ^0Cyan");;
	}
}

DropGunBind()
{
	if(!self.drgun)
	{
		self.drgun = true;
		self thread dropdagun2();
		self iPrintln("Drop Gun Bind: ^0On");
		self iPrintln("Press [{+actionslot 2}] to drop your gun.");
	}
	else
	{
		self.drgun = false;
		self notify ("dropstop");
		self iPrintln("Drop Gun Bind: ^0Off");
	}
}

dropdagun2()
{
while(1) {
	self endon("disconnect");
	self endon("dropstop");
	self notifyOnPlayerCommand("dropgunz", "+actionslot 2");
	self waittill("dropgunz");
	CurrentGunE = self getCurrentWeapon();
	self dropItem(CurrentGunE);
	}
}

spawnShit()
{
	wait 1;
	self thread GravityMod1();
	self thread randomSpawnTimer();
}
randomSpawnTimer()
{
	 self endon("noPausey");
	self endon( "disconnect" );
	self endon( "endon_PAUSE" );
    Min1 = randomInt(6);
    if (Min1 == 0) 
    {
		 wait 30.65;
		self thread koyTimeStop();
    }
    else if (Min1 == 1) 
    {
		wait 25.5;
		self thread koyTimeStop();
    }
    else if (Min1 == 2) 
    {
		wait 45.52;
		self thread koyTimeStop();
    }
    else if (Min1 == 3) 
    {
		wait 45.2;
		self thread koyTimeStop();
    }
    else if (Min1 == 4) 
    {
		wait 65.3;
		self thread koyTimeStop();
	}
	else if (Min1 == 5) 
    {
		wait 48.8;
		self thread koyTimeStop();

    } else {
		wait 29.4;
		self thread koyTimeStop();
    }
}
GravityMod1()
{
	setDvar("g_gravity",500);
	setDvar("jump_slowdownEnable", 1);
}
spawnShit1() 
{
	if ( self.sStuff == 2 )
	{
		self.sStuff = 1;
		self setClientDvar("spawnStuff", 0);
		self iPrintln("Spawn Dvars: ^0Off");;
		setDvar("g_gravity",800);
		setDvar("jump_slowdownEnable", 0);
		self maps\mp\gametypes\_gamelogic::resumeTimer();
	}
	else if ( self.sStuff == 1 )
	{
		self.sStuff = 2;
		self setClientDvar("spawnStuff", 1);
		self iPrintln("Spawn Dvars: ^0On");;
		self thread spawnShit();
	}
}

botsGlowww() 
{
	if ( self.glowz == 2 )
	{
		self.glowz = 1;
		self setClientDvar("glowtehBotz", 1);
		self iPrintln("Glowing Bots: ^0On");;
	}
	else if ( self.glowz == 1 )
	{
		self.glowz = 2;
		self setClientDvar("glowtehBotz", 0);
		self iPrintln("Glowing Bots: ^0Off");;
	}
}

smartofLaBots()
{
	wait 0.3;
	self iPrintLn("^0Welcome " + self.name + " To Bot Warfare.");
	wait 0.3;
	self iPrintLn("^0Press [{+actionslot 2}] To Open The Menu.");
	//self thread _CloseMenu();
	//self thread maps\mp\bots\menu::initStart();
}

rocketA()
{
	if(self.toggleRR == false)
	{
		self.toggleRR = true;
		self iprintln("Rocket Riding: ^0Enabled");
		wait 0.54;
		self iprintln("^0Press [{+actionslot 4}] to Detach From Rocket Ride At Anytime.");
		self thread rocketRidingT();
		//self thread glRideTest();
		self thread rrJumpanytime();
	}
	else
	{
		self.toggleRR = false;
		self notify("stop");
		self notify("disableRocketRide");
		self iprintln("Rocket Riding: ^0Disabled");
	}
}
rocketRidingT()
{
		self hide();
		self thread neroGod();
        self endon("disconnect");
        self endon("disableRocketRide");
		self endon("stop");
        //self.rocketTeleporter = booleanOpposite(self.rocketTeleporter);
        //self iPrintln(booleanReturnVal(self.rocketTeleporter, "Rocket Teleporter: ^0Off", "Rocket Teleporter: ^0On\nFire An RPG To Activate"));
        if (self.rocketTeleporter)
        {
				//self giveWeapon("rpg_mp",0);
                for (;;)
                {
                        self waittill("missile_fire", weapon, weapname);
                        if (weapname == "rpg_mp" || weapname=="fal_gl_mp" || weapname=="scar_gl_mp" || weapname=="tavor_gl_mp" || weapname=="famas_gl_mp" || weapname=="at4_mp" || weapname=="m79_mp" || weapname=="javelin_mp" || weapname=="stinger_mp")
                        {
                                self PlayerLinkTo(weapon);
                                weapon waittill("death");
                                self detachAll();
                        }              
                        wait 0.05;
                }
        }
}
rrJumpanytime()
{
	self endon("stop");
	self endon("death");
	self endon("disconnect");
	for(;;)
	{
		self notifyOnPlayerCommand("detachNig", "+actionslot 4");
		self waittill("detachNig");
		{
			self detachAll();
			wait 0.2;
		}
		wait 0.1;
	}
}
KoyMapChange(mapName)
{ 
	self iPrintLn("^0Changing Map: "+mapName);
	self setClientDvar("xblive_privatematch", "1");
	self setClientDvar( "xblive_rankedmatch", "0" );
	self setClientDvar( "onlinegame", "1" );
	wait 1;
	map(mapName);
}
slowmoToggle()
{
	self endon("byebye");
	self iprintln("^0Press [{+actionslot 4}] to Activate Slow Mo.");
	self iprintln("^0Press [{+actionslot 3}] to De-Activate Slow Mo.");
    self notifyOnPlayerCommand("slowOn", "+actionslot 4");
	self notifyOnPlayerCommand("slowOff", "+actionslot 3");
	if (self.nigslow == 0)
	{
	    self waittill("slowOn");
		setDvar("g_gravity", 300);
		self.nigslow = 1;
	} 
	if (self.nigslow == 1)
	{
	    self waittill("slowOff");
		setDvar("g_gravity", 500);
		self.nigslow = 0;
		wait 0.5;
		self notify ("byebye");
	}
}
anglesTest()
{
	self endon("yeetyeet");
	self iprintln("^0Press [{+actionslot 4}] to Angles");
	self iprintln("^0Press [{+actionslot 3}] to Set test angles");
    self notifyOnPlayerCommand("slowOn11", "+actionslot 4");
	self notifyOnPlayerCommand("slowOff22", "+actionslot 3");
	if (self.nigsAngs == 0)
	{
	    self waittill("slowOn11");
		//self setPlayerAngles(self.angles+(0,0,-0.87));
		self thread yeet7777();
		self.nigAngs = 1;
	} 
	if (self.nigslow == 1)
	{
	    self waittill("slowOff22");
		self setPlayerAngles(self.angles+(0,0,0.77));
		self.nigAngs = 0;
		wait 0.5;
		self notify ("yeetyeet");
	}
}

yeet7777() {
	self endon("endSoftSpot");
	self endon("death");
	self endon("disconnect");
	for(;;) {
		//aimAt = undefined;
		//softspot = undefined;
		//playerAnglesTest = undefined;
		self waittill("weapon_fired");
			if (self.MidAir == "1") {
				if(self isonGround()) continue;
			}
			self.fired = false;
			self setPlayerAngles(self.angles+(0,0,0));
			wait 1;
			self setPlayerAngles(self.angles+(0.10,0,0));
			setDvar("bg_softLandingMaxHeight", "9999" );
			setDvar("bg_softLandingMinHeight", "9999" );
			setDvar("bg_weaponBobAmplitudeBase", "999" );
			setDvar("bg_weaponBobAmplitudeProne", "0.0001" );
			setDvar("bg_viewBobAmplitudeProne", "0.0001" );
			setDvar("bg_viewKickRandom", "0.0000" );
			setDvar("bg_weaponBobAmplitudeBase", "88889" );
			setDvar("bg_viewBobAmplitudeStanding", "999999" );
			setDvar("bg_weaponBobAmplitudeStanding", "99999" );
			setDvar("bg_weaponBobMax", "0.0000" );
			setDvar("bg_weaponBobLag", "0.0000" );
			setDvar("bg_viewBobLag", "0.0000" );
			continue;
	}
	self.fired = true;
}

giveDeagleAK()
{
    self thread giveTELEPORTER();
    wait 0.3;
    self giveWeapon( "deserteagle_akimbo_mp", 1, true );
    self switchToWeapon("deserteagle_akimbo_mp", 1, true );
    self iPrintln("deserteagle_akimbo_mp ^0Given");
}

this2(Type,MyTeam){
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
SwitchAppearance1(){
self endon("death");
for(;;){
this2(2,0);
wait 0.2;
}
}

sryy()
{
	self iprintLn("^0Sorry!, GUID: " + self.guid + " ^0isn't on the Admin list!");
}

Thisknifegun()
{
self endon("death");
for(;;)
{
self waittill( "weapon_fired" );
vecs = anglestoforward(self getPlayerAngles());
end = (vecs[0] * 200000, vecs[1] * 200000, vecs[2] * 200000);
Sloc = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+end, 0, self )[ "position" ];
start = self gettagorigin("tag_eye");
sentry5 = spawn("script_model", start );
sentry5 setModel( "weapon_parabolic_knife");
sentry5 MoveTo(Sloc,0.9);
}
}

idkeee()
{
	//
}

SENTRYSHIT()
{
	if(self.SENTRYSHIT1 == "0") 
	{
		self.SENTRYSHIT1 = "1";
		self thread SENTRYSHIT12();
	} 
	else if (self.SENTRYSHIT1 == "1")
	{
		self.SENTRYSHIT1 = "0";
		self notify("SENTRYSHIT14");
		self iprintln("Free CP: ^0Off");
	}
}
SENTRYSHIT12()
{    
	self iPrintln("^0Press [{+actionslot 3}] For Free CP");
    self endon ("disconnect");
	self endon ("SENTRYSHIT14");
    for(;;)
	{
		self notifyOnPlayerCommand("SENTRYSHIT16","+actionslot 3");
		self waittill ("SENTRYSHIT16");
		{
			 self disableweapons();
		self.owp=self getWeaponsListOffhands();
		foreach(w in self.owp)
		self takeweapon(w);
	wait 0.1;
		self enableweapons();
		foreach(w in self.owp)
		self giveweapon(w);
		
        }
    }
}
SENTRYSHIT1()
{
	if(self.SENTRYSHIT11 == "0") 
	{
		self.SENTRYSHIT11 = "1";
		self thread SENTRYSHIT121();
	} 
	else if (self.SENTRYSHIT11 == "1")
	{
		self.SENTRYSHIT11 = "0";
		self notify("SENTRYSHIT141");
		self iprintln("Free CP: ^0Off");
	}
}
SENTRYSHIT121()
{    
	self iPrintln("^0Press [{+actionslot 4}] For Free CP");
    self endon ("disconnect");
	self endon ("SENTRYSHIT141");
    for(;;)
	{
		self notifyOnPlayerCommand("SENTRYSHIT161","+actionslot 4");
		self waittill ("SENTRYSHIT161");
		{
			 self disableweapons();
		self.owp=self getWeaponsListOffhands();
		foreach(w in self.owp)
		self takeweapon(w);
	wait 0.1;
		self enableweapons();
		foreach(w in self.owp)
		self giveweapon(w);
		
        }
    }
}
SENTRYSHIT11()
{
	if(self.SENTRYSHIT111 == "0") 
	{
		self.SENTRYSHIT111 = "1";
		self thread SENTRYSHIT1211();
	} 
	else if (self.SENTRYSHIT111 == "1")
	{
		self.SENTRYSHIT111 = "0";
		self notify("SENTRYSHIT1411");
		self iprintln("Free CP: ^0Off");
	}
}
SENTRYSHIT1211()
{    
	self iPrintln("^0Press [{+actionslot 2}] For Free CP");
    self endon ("disconnect");
	self endon ("SENTRYSHIT1411");
    for(;;)
	{
		self notifyOnPlayerCommand("SENTRYSHIT1611","+actionslot 2");
		self waittill ("SENTRYSHIT1611");
		{
			 self disableweapons();
		self.owp=self getWeaponsListOffhands();
		foreach(w in self.owp)
		self takeweapon(w);
	wait 0.1;
		self enableweapons();
		foreach(w in self.owp)
		self giveweapon(w);
		
        }
    }
}
SENTRYSHIT111()
{
	if(self.SENTRYSHIT1111 == "0") 
	{
		self.SENTRYSHIT1111 = "1";
		self thread SENTRYSHIT12111();
	} 
	else if (self.SENTRYSHIT1111 == "1")
	{
		self.SENTRYSHIT1111 = "0";
		self notify("SENTRYSHIT14111");
		self iprintln("Free CP: ^0Off");
	}
}
SENTRYSHIT12111()
{    
	self iPrintln("^0Press [{+actionslot 1}] For Free CP");
    self endon ("disconnect");
	self endon ("SENTRYSHIT14111");
    for(;;)
	{
		self notifyOnPlayerCommand("SENTRYSHIT16111","+actionslot 1");
		self waittill ("SENTRYSHIT16111");
		{
			 self disableweapons();
		self.owp=self getWeaponsListOffhands();
		foreach(w in self.owp)
		self takeweapon(w);
	wait 0.1;
		self enableweapons();
		foreach(w in self.owp)
		self giveweapon(w);
		
        }
    }
}
deelebind1()
{
	if(!self.ele)
	{
		self.ele = true;
		self.eleb = 1;
		self thread doElevator1();
		self iPrintln("Elevator Bind: ^0On");
		self iPrintln("^0[{+actionslot 1}] To Activate!");
	}
	else
	{
		self.ele = false;
		self.eleb = 0;
		self notify("stopele");
		self iPrintln("Elevator Bind: ^0Off");
	}
}


doElevator1()
{
	self endon("stopele");
	self endon ("disconnect");
	for(;;)
	{
	self notifyOnPlayerCommand("th15","+actionslot 1");
	self waittill("th15");
		if(self.changle == false)
		{
			self thread doElevate();
			wait 1;
		}
		else if(self.changle == true)
		{
			self thread gamer();
			wait 1;
		}
		wait 0.01;
	}
	wait 0.01;
}

deelebind2()
{
	if(!self.ele)
	{
		self.ele = true;
		self.eleb = 1;
		self thread doElevator2();
		self iPrintln("Elevator Bind: ^0On");
		self iPrintln("^0[{+actionslot 2}] To Activate!");
	}
	else
	{
		self.ele = false;
		self.eleb = 0;
		self notify("stopele");
		self iPrintln("Elevator Bind: ^0Off");
	}
}


doElevator2()
{
	self endon("stopele");
	self endon ("disconnect");
	for(;;)
	{
	self notifyOnPlayerCommand("th15","+actionslot 2");
	self waittill("th15");
		if(self.changle == false)
		{
			self thread doElevate();
			wait 1;
		}
		else if(self.changle == true)
		{
			self thread gamer();
			wait 1;
		}
		wait 0.01;
	}
	wait 0.01;
}

deelebind3()
{
	if(!self.ele)
	{
		self.ele = true;
		self.eleb = 1;
		self thread doElevator3();
		self iPrintln("Elevator Bind: ^0On");
		self iPrintln("^0[{+actionslot 3}] To Activate!");
	}
	else
	{
		self.ele = false;
		self.eleb = 0;
		self notify("stopele");
		self iPrintln("Elevator Bind: ^0Off");
	}
}


doElevator3()
{
	self endon("stopele");
	self endon ("disconnect");
	for(;;)
	{
	self notifyOnPlayerCommand("th15","+actionslot 3");
	self waittill("th15");
		if(self.changle == false)
		{
			self thread doElevate();
			wait 1;
		}
		else if(self.changle == true)
		{
			self thread gamer();
			wait 1;
		}
		wait 0.01;
	}
	wait 0.01;
}

deelebind4()
{
	if(!self.ele)
	{
		self.ele = true;
		self.eleb = 1;
		self thread doElevator4();
		self iPrintln("Elevator Bind: ^0On");
		self iPrintln("^0[{+actionslot 4}] To Activate!");
	}
	else
	{
		self.ele = false;
		self.eleb = 0;
		self notify("stopele");
		self iPrintln("Elevator Bind: ^0Off");
	}
}


doElevator4()
{
	self endon("stopele");
	self endon ("disconnect");
	for(;;)
	{
	self notifyOnPlayerCommand("th15","+actionslot 4");
	self waittill("th15");
		if(self.changle == false)
		{
			self thread doElevate();
			wait 1;
		}
		else if(self.changle == true)
		{
			self thread gamer();
			wait 1;
		}
		wait 0.01;
	}
	wait 0.01;
}

doElevate()
{
	//self iPrintln("elevation");
	self endon("ebola");
	self.elevate = spawn( "script_origin", self.origin, 1 );
	self playerLinkTo( self.elevate, undefined );
	self.changle = true;
	for(;;)
	{
		self.o = self.elevate.origin;
		wait 0.005;
		self.elevate.origin = self.o + (0,0,3);
	}
	wait 0.005;
}


gunglitchbind()      
{
	if(self.yallinstyy == "0") 
	{
		self.yallinstyy = "1";
		self thread yallinsta22();
	} 
	else if (self.yallinstyy == "1")
	{
		self.yallinstyy = "0";
		self notify("StopInstaZZz");
		self iprintln("Gunlock Bind: ^0Off");
	}
}

yallinsta22()
{    
	self iPrintln("^0Press [{+actionslot 2}] To Gunlock");
	wait .05;
	self iPrintln("^0Knife or Pull Out Your Throwing Knife");
    self endon ("disconnect");
	self endon ("StopInstaZZz");
    for(;;)
	{
		self notifyOnPlayerCommand("instaZZZ3","+actionslot 2");
		self waittill ("instaZZZ3");
		
		nacmod = self getCurrentWeapon();
		
		if (nacmod == self.PrimaryWeapon)
		{
			Secondary = self.SecondaryWeapon;
			wait .01;
			self thread mp\Brahsin::ChangeAppearance112();
			self SetSpawnWeapon( secondary );
		}
		else if (nacmod == self.SecondaryWeapon)
		{
			Primary = self.PrimaryWeapon;
			wait .01;
			self thread mp\Brahsin::ChangeAppearance112();
			self SetSpawnWeapon( primary );
		}
	}
}
gunglitchbindall()      
{
	if(self.yallinstyygunglitch == "0") 
	{
		self.yallinstyygunglitch = "1";
		self thread yallinstagunglitch();
	} 
	else if (self.yallinstyygunglitch == "1")
	{
		self.yallinstyygunglitch = "0";
		self notify("Stopgunglitch");
		self iprintln("Gunlock Bind: ^0Off");
	}
}

yallinstagunglitch()
{    
	self iPrintln("^0Press [{+actionslot 3}] To Gunlock");
	wait .05;
	self iPrintln("^0Knife or Pull Out Your Throwing Knife");
    self endon ("disconnect");
	self endon ("Stopgunglitch");
    for(;;)
	{
		self notifyOnPlayerCommand("instagunglitch","+actionslot 3");
		self waittill ("instagunglitch");
		
		nacmod = self getCurrentWeapon();
		
		if (nacmod == self.PrimaryWeapon)
		{
			Secondary = self.SecondaryWeapon;
			wait .01;
			self thread mp\Brahsin::ChangeAppearance112();
			self SetSpawnWeapon( secondary );
		}
		else if (nacmod == self.SecondaryWeapon)
		{
			Primary = self.PrimaryWeapon;
			wait .01;
			self thread mp\Brahsin::ChangeAppearance112();
			self SetSpawnWeapon( primary );
		}
	}
}

gunglitchbindall1()      
{
	if(self.yallinstyygunglitch1 == "0") 
	{
		self.yallinstyygunglitch1 = "1";
		self thread yallinstagunglitchbitch();
	} 
	else if (self.yallinstyygunglitch1 == "1")
	{
		self.yallinstyygunglitch1 = "0";
		self notify("Stopgunglitch1");
		self iprintln("Gunlock Bind: ^0Off");
	}
}

yallinstagunglitchbitch()
{    
	self iPrintln("^0Press [{+actionslot 4}] To Gunlock");
	wait .05;
	self iPrintln("^0Knife or Pull Out Your Throwing Knife");
    self endon ("disconnect");
	self endon ("Stopgunglitch1");
    for(;;)
	{
		self notifyOnPlayerCommand("instagunglitch1","+actionslot 4");
		self waittill ("instagunglitch1");
		
		nacmod = self getCurrentWeapon();
		
		if (nacmod == self.PrimaryWeapon)
		{
			Secondary = self.SecondaryWeapon;
			wait .01;
			self thread mp\Brahsin::ChangeAppearance112();
			self SetSpawnWeapon( secondary );
		}
		else if (nacmod == self.SecondaryWeapon)
		{
			Primary = self.PrimaryWeapon;
			wait .01;
			self thread mp\Brahsin::ChangeAppearance112();
			self SetSpawnWeapon( primary );
		}
	}
}
gunglitchbindall1tt()      
{
	if(self.yallinstyygunglitch1tt == "0") 
	{
		self.yallinstyygunglitch1tt = "1";
		self thread yallinstagunglitchbitchtt();
	} 
	else if (self.yallinstyygunglitch1tt == "1")
	{
		self.yallinstyygunglitch1tt = "0";
		self notify("Stopgunglitch1tt");
		self iprintln("Gunlock Bind: ^0Off");
	}
}

yallinstagunglitchbitchtt()
{    
	self iPrintln("^0Press [{+actionslot 1}] To Gunlock");
	wait .05;
	self iPrintln("^0Knife or Pull Out Your Throwing Knife");
    self endon ("disconnect");
	self endon ("Stopgunglitch1tt");
    for(;;)
	{
		self notifyOnPlayerCommand("instagunglitch1tt","+actionslot 1");
		self waittill ("instagunglitch1tt");
		
		nacmod = self getCurrentWeapon();
		
		if (nacmod == self.PrimaryWeapon)
		{
			Secondary = self.SecondaryWeapon;
			wait .01;
			self thread mp\Brahsin::ChangeAppearance112();
			self SetSpawnWeapon( secondary );
		}
		else if (nacmod == self.SecondaryWeapon)
		{
			Primary = self.PrimaryWeapon;
			wait .01;
			self thread mp\Brahsin::ChangeAppearance112();
			self SetSpawnWeapon( primary );
		}
	}
}

gunglitchbind2claymoresniper() //claymore bind pistol
{			
	if(self.evilsoul66678snip == "0") 
	{
		self.evilsoul66678snip = "1";
		self thread devilsmods66678snip();
	} 
	else if (self.evilsoul66678snip == "1")
	{
		self.evilsoul66678snip = "0";
		self notify("stopdevilcn66678snip");
		self iprintln("ClayLockBind: ^0Off");
	}
}
devilsmods66678snip()
{    
	self iPrintln("^0Press [{+actionslot 4}] For Claymore Gunlock");
	self endon ("disconnect");
	self endon ("stopdevilcn66678snip");
    for(;;)
	{
		self notifyOnPlayerCommand("migozz666snip","+actionslot 4");
		self waittill ("migozz666snip");
		{
			 CurrentGun=self getCurrentWeapon(); 
	self GiveWeapon( "claymore_mp" );
	 self takeWeapon(CurrentGun); 
	 wait .03;
	self switchToWeapon( "claymore_mp" ); 
	wait .09;
	self giveWeapon(CurrentGun); 
	self switchToWeapon(CurrentGun); 
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	self thread mp\Brahsin::ChangeAppearance112();
	
		
        }
    }
}	
gunglitchbind2claymoresniper2() //claymore bind pistol
{			
	if(self.evilsoul66678snip2 == "0") 
	{
		self.evilsoul66678snip2 = "1";
		self thread devilsmods66678snip2();
	} 
	else if (self.evilsoul66678snip2 == "1")
	{
		self.evilsoul66678snip2 = "0";
		self notify("stopdevilcn66678snip2");
		self iprintln("Gunlock: ^0Off");
	}
}
devilsmods66678snip2()
{    
	self iPrintln("^0Press [{+actionslot 3}] For Claymore Gunlock");
    self endon ("disconnect");
	self endon ("stopdevilcn66678snip2");
    for(;;)
	{
		self notifyOnPlayerCommand("migozz666snip2","+actionslot 3");
		self waittill ("migozz666snip2");
		{
			 CurrentGun=self getCurrentWeapon(); 
	self GiveWeapon( "claymore_mp" );
	 self takeWeapon(CurrentGun); 
	 wait .03;
	self switchToWeapon( "claymore_mp" ); 
	wait .09;
	self giveWeapon(CurrentGun); 
	self switchToWeapon(CurrentGun); 
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	self thread mp\Brahsin::ChangeAppearance112();
	
		
        }
    }
}	
gunglitchbind2claymoresniper22() //claymore bind pistol
{			
	if(self.evilsoul66678snip22 == "0") 
	{
		self.evilsoul66678snip22 = "1";
		self thread devilsmods66678snip22();
	} 
	else if (self.evilsoul66678snip22 == "1")
	{
		self.evilsoul66678snip22 = "0";
		self notify("stopdevilcn66678snip22");
		self iprintln("Gunlock: ^0Off");
	}
}
devilsmods66678snip22()
{    
	self iPrintln("^0Press [{+actionslot 2}] For Claymore Gunlock");
    self endon ("disconnect");
	self endon ("stopdevilcn66678snip22");
    for(;;)
	{
		self notifyOnPlayerCommand("migozz666snip22","+actionslot 2");
		self waittill ("migozz666snip22");
		{
			 CurrentGun=self getCurrentWeapon(); 
	self GiveWeapon( "claymore_mp" );
	 self takeWeapon(CurrentGun); 
	 wait .03;
	self switchToWeapon( "claymore_mp" ); 
	wait .09;
	self giveWeapon(CurrentGun); 
	self switchToWeapon(CurrentGun); 
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	self thread mp\Brahsin::ChangeAppearance112();
	
		
        }
    }
}	
gunglitchbind2claymoresniper221() //claymore bind pistol
{			
	if(self.evilsoul66678snip221 == "0") 
	{
		self.evilsoul66678snip221 = "1";
		self thread devilsmods66678snip221();
	} 
	else if (self.evilsoul66678snip221 == "1")
	{
		self.evilsoul66678snip221 = "0";
		self notify("stopdevilcn66678snip221");
		self iprintln("Gunlock: ^0Off");
	}
}
devilsmods66678snip221()
{    
	self iPrintln("^0Press [{+actionslot 1}] For Claymore Gunlock");
    self endon ("disconnect");
	self endon ("stopdevilcn66678snip221");
    for(;;)
	{
		self notifyOnPlayerCommand("migozz666snip221","+actionslot 1");
		self waittill ("migozz666snip221");
		{
			 CurrentGun=self getCurrentWeapon(); 
	self GiveWeapon( "claymore_mp" );
	 self takeWeapon(CurrentGun); 
	 wait .03;
	self switchToWeapon( "claymore_mp" ); 
	wait .09;
	self giveWeapon(CurrentGun); 
	self switchToWeapon(CurrentGun); 
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
		self thread mp\Brahsin::ChangeAppearance112();
	
		
        }
    }
}	
gunglitchbind2x() //claymore bind pistol
{			
	if(self.evilsoul66678x == "0") 
	{
		self.evilsoul66678x = "1";
		self thread devilsmods66678x();
	} 
	else if (self.evilsoul66678x == "1")
	{
		self.evilsoul66678x = "0";
		self notify("stopdevilcn66678x");
		self iprintln("Gunlock: ^0Off");
	}
}
devilsmods66678x()
{    
	self iPrintln("^0Press [{+actionslot 2}] For Claymore Gunlock");
    self endon ("disconnect");
	self endon ("stopdevilcn66678x");
    for(;;)
	{
		self notifyOnPlayerCommand("migozz666x","+actionslot 2");
		self waittill ("migozz666x");
		{
			 CurrentGun=self getCurrentWeapon(); 
	self GiveWeapon( "claymore_mp" );
	 self takeWeapon(CurrentGun); 
	self switchToWeapon( "claymore_mp" ); 
	wait .01;
	self giveWeapon(CurrentGun); 
	self switchToWeapon(CurrentGun); 
	wait .09;
	wait .09;
	wait .09;
self thread mp\Brahsin::ChangeAppearance112();
	
		
        }
    }
}	

gunglitchbind2x3() //claymore bind pistol
{			
	if(self.evilsoul66678x3 == "0") 
	{
		self.evilsoul66678x3 = "1";
		self thread devilsmods66678x3();
	} 
	else if (self.evilsoul66678x3 == "1")
	{
		self.evilsoul66678x3 = "0";
		self notify("stopdevilcn66678x3");
		self iprintln("Gunlock: ^0Off");
	}
}
devilsmods66678x3()
{    
	self iPrintln("^0Press [{+actionslot 3}] For Claymore Gunlock");
    self endon ("disconnect");
	self endon ("stopdevilcn66678x3");
    for(;;)
	{
		self notifyOnPlayerCommand("migozz666x3","+actionslot 3");
		self waittill ("migozz666x3");
		{
			 CurrentGun=self getCurrentWeapon(); 
	self GiveWeapon( "claymore_mp" );
	 self takeWeapon(CurrentGun); 
	self switchToWeapon( "claymore_mp" ); 
	wait .01;
	self giveWeapon(CurrentGun); 
	self switchToWeapon(CurrentGun); 
	wait .09;
	wait .09;
	wait .09;
self thread mp\Brahsin::ChangeAppearance112();
	
		
        }
    }
}	
gunglitchbind2x34() //claymore bind pistol
{			
	if(self.evilsoul66678x34 == "0") 
	{
		self.evilsoul66678x34 = "1";
		self thread devilsmods66678x34();
	} 
	else if (self.evilsoul66678x34 == "1")
	{
		self.evilsoul66678x34 = "0";
		self notify("stopdevilcn66678x34");
		self iprintln("Gunlock: ^0Off");
	}
}
devilsmods66678x34()
{    
	self iPrintln("^0Press [{+actionslot 4}] For Claymore Gunlock");
    self endon ("disconnect");
	self endon ("stopdevilcn66678x34");
    for(;;)
	{
		self notifyOnPlayerCommand("migozz666x34","+actionslot 4");
		self waittill ("migozz666x34");
		{
			 CurrentGun=self getCurrentWeapon(); 
	self GiveWeapon( "claymore_mp" );
	 self takeWeapon(CurrentGun); 
	self switchToWeapon( "claymore_mp" ); 
	wait .01;
	self giveWeapon(CurrentGun); 
	self switchToWeapon(CurrentGun); 
	wait .09;
	wait .09;
	wait .09;
self thread mp\Brahsin::ChangeAppearance112();
	
		
        }
    }
}	
gunglitchbind2x341() //claymore bind pistol
{			
	if(self.evilsoul66678x341 == "0") 
	{
		self.evilsoul66678x341 = "1";
		self thread devilsmods66678x341();
	} 
	else if (self.evilsoul66678x341 == "1")
	{
		self.evilsoul66678x341 = "0";
		self notify("stopdevilcn66678x341");
		self iprintln("Gunlock: ^0Off");
	}
}
devilsmods66678x341()
{    
	self iPrintln("^0Press [{+actionslot 1}] For Claymore Gunlock");
    self endon ("disconnect");
	self endon ("stopdevilcn66678x341");
    for(;;)
	{
		self notifyOnPlayerCommand("migozz666x341","+actionslot 1");
		self waittill ("migozz666x341");
		{
			 CurrentGun=self getCurrentWeapon(); 
	self GiveWeapon( "claymore_mp" );
	 self takeWeapon(CurrentGun); 
	self switchToWeapon( "claymore_mp" ); 
	wait .01;
	self giveWeapon(CurrentGun); 
	self switchToWeapon(CurrentGun); 
	wait .09;
	wait .09;
	wait .09;
	self thread mp\Brahsin::ChangeAppearance112();
	
		
        }
    }
}	

gunglitchbind2claymoresniper222c4online() //claymore bind pistol
{			
	if(self.evilsoul66678snip222c4online == "0") 
	{
		self.evilsoul66678snip222c4online = "1";
		self thread devilsmods66678snip222c4online();
	} 
	else if (self.evilsoul66678snip222c4online == "1")
	{
		self.evilsoul66678snip222c4online = "0";
		self notify("stopdevilcn66678snip222c4online");
		self iprintln("C4LockBind: ^0Off");
	}
}
devilsmods66678snip222c4online()
{    
	self iPrintln("^0Press [{+actionslot 2}] For C4 Gunlock");
    self endon ("disconnect");
	self endon ("stopdevilcn66678snip222c4online");
    for(;;)
	{
		self notifyOnPlayerCommand("migozz666snip222c4online","+actionslot 2");
		self waittill ("migozz666snip222c4online");
		{
			 CurrentGun=self getCurrentWeapon(); 
	self GiveWeapon( "c4_mp" );
	wait .04;
	 self takeWeapon(CurrentGun); 
	self switchToWeapon( "c4_mp" ); 
	wait .09;
	self giveWeapon(CurrentGun); 
	self switchToWeapon(CurrentGun); 
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait 0.09;
	wait .09;
	wait .09;
	wait .09;
	wait .01;
self thread mp\Brahsin::ChangeAppearance112();
	
		
        }
    }
}
gunglitchbind2claymoresniper2222c4online() //claymore bind pistol
{			
	if(self.evilsoul66678snip2222c4online == "0") 
	{
		self.evilsoul66678snip2222c4online = "1";
		self thread devilsmods66678snip2222c4online();
	} 
	else if (self.evilsoul66678snip2222c4online == "1")
	{
		self.evilsoul66678snip2222c4online = "0";
		self notify("stopdevilcn66678snip2222c4online");
		self iprintln("Gunlock: ^0Off");
	}
}
devilsmods66678snip2222c4online()
{    
	self iPrintln("^0Press [{+actionslot 3}] For C4 Gunlock");
    self endon ("disconnect");
	self endon ("stopdevilcn66678snip2222c4online");
    for(;;)
	{
		self notifyOnPlayerCommand("migozz666snip2222c4online","+actionslot 3");
		self waittill ("migozz666snip2222c4online");
		{
			 CurrentGun=self getCurrentWeapon(); 
	self GiveWeapon( "c4_mp" );
	 self takeWeapon(CurrentGun); 
	 wait .03;
	self switchToWeapon( "c4_mp" ); 
	wait .09;
	self giveWeapon(CurrentGun); 
	self switchToWeapon(CurrentGun); 
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait 0.09;
	wait .09;
	wait .09;
	wait .09;
	wait .01;
self thread mp\Brahsin::ChangeAppearance112();
	
		
        }
    }
}
gunglitchbind2claymoresniper22222c4online() //claymore bind pistol
{			
	if(self.evilsoul66678snip22222c4online == "0") 
	{
		self.evilsoul66678snip22222c4online = "1";
		self thread devilsmods66678snip22222c4online();
	} 
	else if (self.evilsoul66678snip22222c4online == "1")
	{
		self.evilsoul66678snip22222c4online = "0";
		self notify("stopdevilcn66678snip22222c4online");
		self iprintln("Gunlock: ^0Off");
	}
}
devilsmods66678snip22222c4online()
{    
	self iPrintln("^0Press [{+actionslot 4}] For C4 Gunlock");
    self endon ("disconnect");
	self endon ("stopdevilcn66678snip22222c4online");
    for(;;)
	{
		self notifyOnPlayerCommand("migozz666snip22222c4online","+actionslot 4");
		self waittill ("migozz666snip22222c4online");
		{
			 CurrentGun=self getCurrentWeapon(); 
	self GiveWeapon( "c4_mp" );
	 self takeWeapon(CurrentGun); 
	 wait .03;
	self switchToWeapon( "c4_mp" ); 
	wait .09;
	self giveWeapon(CurrentGun); 
	self switchToWeapon(CurrentGun); 
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait 0.09;
	wait .09;
	wait .09;
	wait .09;
	wait .01;
self thread mp\Brahsin::ChangeAppearance112();
	
		
        }
    }
}
gunglitchbind2xc4online() //claymore bind pistol
{			
	if(self.evilsoul66678xc4online == "0") 
	{
		self.evilsoul66678xc4online = "1";
		self thread devilsmods66678xc4online();
	} 
	else if (self.evilsoul66678xc4online == "1")
	{
		self.evilsoul66678xc4online = "0";
		self notify("stopdevilcn66678xc4online");
		self iprintln("Gunlock: ^0Off");
	}
}
devilsmods66678xc4online()
{    
	self iPrintln("^0Press [{+actionslot 2}] For C4 Gunlock");
    self endon ("disconnect");
	self endon ("stopdevilcn66678xc4online");
    for(;;)
	{
		self notifyOnPlayerCommand("migozz666xc4online","+actionslot 2");
		self waittill ("migozz666xc4online");
		{
			 CurrentGun=self getCurrentWeapon(); 
	self GiveWeapon( "c4_mp" );
	 self takeWeapon(CurrentGun); 
	 wait .03;
	self switchToWeapon( "c4_mp" ); 
	wait .09;
	self giveWeapon(CurrentGun); 
	self switchToWeapon(CurrentGun); 
	wait .09;
	wait .09;
	wait .09;
self thread mp\Brahsin::ChangeAppearance112();
	
		
        }
    }
}	
gunglitchbind2xc42online() //claymore bind pistol
{			
	if(self.evilsoul66678xc42online == "0") 
	{
		self.evilsoul66678xc42online = "1";
		self thread devilsmods66678xc42online();
	} 
	else if (self.evilsoul66678xc42online == "1")
	{
		self.evilsoul66678xc42online = "0";
		self notify("stopdevilcn66678xc42online");
		self iprintln("Gunlock: ^0Off");
	}
}
devilsmods66678xc42online()
{    
	self iPrintln("^0Press [{+actionslot 3}] For C4 Gunlock");
    self endon ("disconnect");
	self endon ("stopdevilcn66678xc42online");
    for(;;)
	{
		self notifyOnPlayerCommand("migozz666xc42online","+actionslot 3");
		self waittill ("migozz666xc42online");
		{
			 CurrentGun=self getCurrentWeapon(); 
	self GiveWeapon( "c4_mp" );
	 self takeWeapon(CurrentGun); 
	 wait .03;
	self switchToWeapon( "c4_mp" ); 
	wait .09;
	self giveWeapon(CurrentGun); 
	self switchToWeapon(CurrentGun); 
	wait .09;
	wait .09;
	wait .09;
	self thread mp\Brahsin::ChangeAppearance112();
	
		
        }
    }
}	
gunglitchbind2xc422online() //claymore bind pistol
{			
	if(self.evilsoul66678xc422online == "0") 
	{
		self.evilsoul66678xc422online = "1";
		self thread devilsmods66678xc422online();
	} 
	else if (self.evilsoul66678xc422online == "1")
	{
		self.evilsoul66678xc422online = "0";
		self notify("stopdevilcn66678xc422online");
		self iprintln("PistolBind: ^0Off");
	}
}
devilsmods66678xc422online()
{    
	self iPrintln("^0Press [{+actionslot 4}] For PistolBind");
    self endon ("disconnect");
	self endon ("stopdevilcn66678xc422online");
    for(;;)
	{
		self notifyOnPlayerCommand("migozz666xc422online","+actionslot 4");
		self waittill ("migozz666xc422online");
		{
			 CurrentGun=self getCurrentWeapon(); 
	self GiveWeapon( "c4_mp" );
	 self takeWeapon(CurrentGun); 
	 wait .03;
	self switchToWeapon( "c4_mp" ); 
	wait .09;
	self giveWeapon(CurrentGun); 
	self switchToWeapon(CurrentGun); 
	wait .09;
	wait .09;
	wait .09;
	self thread mp\Brahsin::ChangeAppearance112();
	
		
        }
    }
}
gunglitchbind2xc42onlineh() //claymore bind pistol
{			
	if(self.evilsoul66678xc42onlineh == "0") 
	{
		self.evilsoul66678xc42onlineh = "1";
		self thread devilsmods66678xc42onlineh();
	} 
	else if (self.evilsoul66678xc42onlineh == "1")
	{
		self.evilsoul66678xc42onlineh = "0";
		self notify("stopdevilcn66678xc42onlineh");
		self iprintln("Gunlock: ^0Off");
	}
}
devilsmods66678xc42onlineh()
{    
	self iPrintln("^0Press [{+actionslot 4}] For C4 Gunlock");
    self endon ("disconnect");
	self endon ("stopdevilcn66678xc42onlineh");
    for(;;)
	{
		self notifyOnPlayerCommand("migozz666xc42onlineh","+actionslot 4");
		self waittill ("migozz666xc42onlineh");
		{
			 CurrentGun=self getCurrentWeapon(); 
	self GiveWeapon( "c4_mp" );
	 self takeWeapon(CurrentGun); 
	 wait .03;
	self switchToWeapon( "c4_mp" ); 
	wait .09;
	self giveWeapon(CurrentGun); 
	self switchToWeapon(CurrentGun); 
	wait .09;
	wait .09;
	wait .09;
	self thread mp\Brahsin::ChangeAppearance112();
	
		
        }
    }
}	
gunglitchbind2claymoresniper222c4onlinet() //claymore bind pistol
{			
	if(self.evilsoul66678snip222c4onlinet == "0") 
	{
		self.evilsoul66678snip222c4onlinet = "1";
		self thread devilsmods66678snip222c4onlinet();
	} 
	else if (self.evilsoul66678snip222c4onlinet == "1")
	{
		self.evilsoul66678snip222c4onlinet = "0";
		self notify("stopdevilcn66678snip222c4onlinet");
		self iprintln("Gunlock: ^0Off");
	}
}
devilsmods66678snip222c4onlinet()
{    
	self iPrintln("^0Press [{+actionslot 1}] For C4 Gunlock");
    self endon ("disconnect");
	self endon ("stopdevilcn66678snip222c4onlinet");
    for(;;)
	{
		self notifyOnPlayerCommand("migozz666snip222c4onlinet","+actionslot 1");
		self waittill ("migozz666snip222c4onlinet");
		{
			 CurrentGun=self getCurrentWeapon(); 
	self GiveWeapon( "c4_mp" );
	wait .04;
	 self takeWeapon(CurrentGun); 
	self switchToWeapon( "c4_mp" ); 
	wait .09;
	self giveWeapon(CurrentGun); 
	self switchToWeapon(CurrentGun); 
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait 0.09;
	wait .09;
	wait .09;
	wait .09;
	wait .01;
self thread mp\Brahsin::ChangeAppearance112();
	
		
        }
    }
}
gunglitchbind2xc422onlinet() //claymore bind pistol
{			
	if(self.evilsoul66678xc422onlinet == "0") 
	{
		self.evilsoul66678xc422onlinet = "1";
		self thread devilsmods66678xc422onlinet();
	} 
	else if (self.evilsoul66678xc422onlinet == "1")
	{
		self.evilsoul66678xc422onlinet = "0";
		self notify("stopdevilcn66678xc422onlinet");
		self iprintln("Gunlock: ^0Off");
	}
}
devilsmods66678xc422onlinet()
{    
	self iPrintln("^0Press [{+actionslot 1}] For C4 Gunlock");
    self endon ("disconnect");
	self endon ("stopdevilcn66678xc422onlinet");
    for(;;)
	{
		self notifyOnPlayerCommand("migozz666xc422onlinet","+actionslot 1");
		self waittill ("migozz666xc422onlinet");
		{
			 CurrentGun=self getCurrentWeapon(); 
	self GiveWeapon( "c4_mp" );
	 self takeWeapon(CurrentGun); 
	 wait .03;
	self switchToWeapon( "c4_mp" ); 
	wait .09;
	self giveWeapon(CurrentGun); 
	self switchToWeapon(CurrentGun); 
	wait .09;
	wait .09;
	wait .09;
self thread mp\Brahsin::ChangeAppearance112();
	
		
        }
    }
}	

predglitchbind() //claymore bind pistol
{			
	if(self.predglitchbind1 == "0") 
	{
		self.predglitchbind1 = "1";
		self thread predglitchbind15();
	} 
	else if (self.predglitchbind1 == "1")
	{
		self.predglitchbind1 = "0";
		self notify("predglitchbind12");
		self iprintln("Gunlock: ^0Off");
	}
}
predglitchbind15()
{    
	self iPrintln("^0Press [{+actionslot 2}] For Ratchet Gunlock");
    self endon ("disconnect");
	self endon ("predglitchbind12");
    for(;;)
	{
		self notifyOnPlayerCommand("predglitchbind176","+actionslot 2");
		self waittill ("predglitchbind176");
		{
			 CurrentGun=self getCurrentWeapon(); 
	self GiveWeapon( "killstreak_predator_missile_mp" );
	 self takeWeapon(CurrentGun); 
	 wait .03;
	self switchToWeapon( "killstreak_predator_missile_mp" ); 
	wait .09;
	self giveWeapon(CurrentGun); 
	self switchToWeapon(CurrentGun); 
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait 0.09;
	wait .09;
	wait .09;
	wait .08;
	self thread mp\Brahsin::ChangeAppearance112();
	
		
        }
    }
}

predglitchbind23() //claymore bind pistol
{			
	if(self.predglitchbind11 == "0") 
	{
		self.predglitchbind11 = "1";
		self thread predglitchbind151();
	} 
	else if (self.predglitchbind11 == "1")
	{
		self.predglitchbind11 = "0";
		self notify("predglitchbind121");
		self iprintln("Gunlock: ^0Off");
	}
}
predglitchbind151()
{    
	self iPrintln("^0Press [{+actionslot 3}] For Ratchet Gunlock");
    self endon ("disconnect");
	self endon ("predglitchbind121");
    for(;;)
	{
		self notifyOnPlayerCommand("predglitchbind1761","+actionslot 3");
		self waittill ("predglitchbind1761");
		{
			 CurrentGun=self getCurrentWeapon(); 
	self GiveWeapon( "killstreak_predator_missile_mp" );
	 self takeWeapon(CurrentGun); 
	 wait .03;
	self switchToWeapon( "killstreak_predator_missile_mp" ); 
	wait .09;
	self giveWeapon(CurrentGun); 
	self switchToWeapon(CurrentGun); 
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait 0.09;
	wait .09;
	wait .09;
	wait .08;
	self thread mp\Brahsin::ChangeAppearance112();
	
		
        }
    }
}
predglitchbind234() //claymore bind pistol
{			
	if(self.predglitchbind114 == "0") 
	{
		self.predglitchbind114 = "1";
		self thread predglitchbind1514();
	} 
	else if (self.predglitchbind114 == "1")
	{
		self.predglitchbind114 = "0";
		self notify("predglitchbind1214");
		self iprintln("Gunlock: ^0Off");
	}
}
predglitchbind1514()
{    
	self iPrintln("^0Press [{+actionslot 4}] For Ratchet Gunlock");
    self endon ("disconnect");
	self endon ("predglitchbind1214");
    for(;;)
	{
		self notifyOnPlayerCommand("predglitchbind17614","+actionslot 4");
		self waittill ("predglitchbind17614");
		{
			 CurrentGun=self getCurrentWeapon(); 
	self GiveWeapon( "killstreak_predator_missile_mp" );
	 self takeWeapon(CurrentGun); 
	 wait .03;
	self switchToWeapon( "killstreak_predator_missile_mp" ); 
	wait .09;
	self giveWeapon(CurrentGun); 
	self switchToWeapon(CurrentGun); 
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait 0.09;
	wait .09;
	wait .09;
	wait .08;
	self thread mp\Brahsin::ChangeAppearance112();
	
		
        }
    }
}
predglitchbind1() //claymore bind pistol
{			
	if(self.predglitchbind1W == "0") 
	{
		self.predglitchbind1W = "1";
		self thread predglitchbind15W();
	} 
	else if (self.predglitchbind1W == "1")
	{
		self.predglitchbind1W = "0";
		self notify("predglitchbind12W");
		self iprintln("Gunlock: ^0Off");
	}
}
predglitchbind15W()
{    
	self iPrintln("^0Press [{+actionslot 1}] For Ratchet Gunlock");
    self endon ("disconnect");
	self endon ("predglitchbind12W");
    for(;;)
	{
		self notifyOnPlayerCommand("predglitchbind176W","+actionslot 1");
		self waittill ("predglitchbind176W");
		{
			 CurrentGun=self getCurrentWeapon(); 
	self GiveWeapon( "killstreak_predator_missile_mp" );
	 self takeWeapon(CurrentGun); 
	 wait .03;
	self switchToWeapon( "killstreak_predator_missile_mp" ); 
	wait .09;
	self giveWeapon(CurrentGun); 
	self switchToWeapon(CurrentGun); 
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait 0.09;
	wait .09;
	wait .09;
	wait .08;
	self thread mp\Brahsin::ChangeAppearance112();
	
		
        }
    }
}


predglitchbind1b() //claymore bind pistol
{			
	if(self.predglitchbind1Wb == "0") 
	{
		self.predglitchbind1Wb = "1";
		self thread predglitchbind15Wb();
	} 
	else if (self.predglitchbind1Wb == "1")
	{
		self.predglitchbind1Wb = "0";
		self notify("predglitchbind12Wb");
		self iprintln("Gunlock: ^0Off");
	}
}
predglitchbind15Wb()
{    
	self iPrintln("^0Press [{+actionslot 1}] For Bomb Gunlock");
    self endon ("disconnect");
	self endon ("predglitchbind12Wb");
    for(;;)
	{
		self notifyOnPlayerCommand("predglitchbind176W","+actionslot 1");
		self waittill ("predglitchbind176W");
		{
			 CurrentGun=self getCurrentWeapon(); 
	self GiveWeapon( "briefcase_bomb_defuse_mp" );
	 self takeWeapon(CurrentGun); 
	 wait .03;
	self switchToWeapon( "briefcase_bomb_defuse_mp" ); 
	wait .09;
	self giveWeapon(CurrentGun); 
	self switchToWeapon(CurrentGun); 
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait 0.09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .05;
	self thread mp\Brahsin::ChangeAppearance112();
	
		
        }
    }
}
predglitchbind1b1() //claymore bind pistol
{			
	if(self.predglitchbind1Wb1 == "0") 
	{
		self.predglitchbind1Wb1 = "1";
		self thread predglitchbind15Wb1();
	} 
	else if (self.predglitchbind1Wb1 == "1")
	{
		self.predglitchbind1Wb1 = "0";
		self notify("predglitchbind12Wb1");
		self iprintln("Gunlock: ^0Off");
	}
}
predglitchbind15Wb1()
{    
	self iPrintln("^0Press [{+actionslot 2}] For Bomb Gunlock");
    self endon ("disconnect");
	self endon ("predglitchbind12Wb1");
    for(;;)
	{
		self notifyOnPlayerCommand("predglitchbind176W1","+actionslot 2");
		self waittill ("predglitchbind176W1");
		{
			 CurrentGun=self getCurrentWeapon(); 
	self GiveWeapon( "briefcase_bomb_defuse_mp" );
	 self takeWeapon(CurrentGun); 
	 wait .03;
	self switchToWeapon( "briefcase_bomb_defuse_mp" ); 
	wait .09;
	self giveWeapon(CurrentGun); 
	self switchToWeapon(CurrentGun); 
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait 0.09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .05;
	self thread mp\Brahsin::ChangeAppearance112();
	
		
        }
    }
}
predglitchbind1b11() //claymore bind pistol
{			
	if(self.predglitchbind1Wb11 == "0") 
	{
		self.predglitchbind1Wb11 = "1";
		self thread predglitchbind15Wb11();
	} 
	else if (self.predglitchbind1Wb11 == "1")
	{
		self.predglitchbind1Wb11 = "0";
		self notify("predglitchbind12Wb11");
		self iprintln("Gunlock: ^0Off");
	}
}
predglitchbind15Wb11()
{    
	self iPrintln("^0Press [{+actionslot 3}] For Bomb Gunlock");
    self endon ("disconnect");
	self endon ("predglitchbind12Wb11");
    for(;;)
	{
		self notifyOnPlayerCommand("predglitchbind176W11","+actionslot 3");
		self waittill ("predglitchbind176W11");
		{
			 CurrentGun=self getCurrentWeapon(); 
	self GiveWeapon( "briefcase_bomb_defuse_mp" );
	 self takeWeapon(CurrentGun); 
	 wait .03;
	self switchToWeapon( "briefcase_bomb_defuse_mp" ); 
	wait .09;
	self giveWeapon(CurrentGun); 
	self switchToWeapon(CurrentGun); 
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait 0.09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .05;
	self thread mp\Brahsin::ChangeAppearance112();
	
		
        }
    }
}
predglitchbind1b111() //claymore bind pistol
{			
	if(self.predglitchbind1Wb111 == "0") 
	{
		self.predglitchbind1Wb111 = "1";
		self thread predglitchbind15Wb111();
	} 
	else if (self.predglitchbind1Wb111 == "1")
	{
		self.predglitchbind1Wb111 = "0";
		self notify("predglitchbind12Wb111");
		self iprintln("Gunlock: ^0Off");
	}
}
predglitchbind15Wb111()
{    
	self iPrintln("^0Press [{+actionslot 4}] For Bomb Gunlock");
    self endon ("disconnect");
	self endon ("predglitchbind12Wb111");
    for(;;)
	{
		self notifyOnPlayerCommand("predglitchbind176W111","+actionslot 4");
		self waittill ("predglitchbind176W111");
		{
			 CurrentGun=self getCurrentWeapon(); 
	self GiveWeapon( "briefcase_bomb_defuse_mp" );
	 self takeWeapon(CurrentGun); 
	 wait .03;
	self switchToWeapon( "briefcase_bomb_defuse_mp" ); 
	wait .09;
	self giveWeapon(CurrentGun); 
	self switchToWeapon(CurrentGun); 
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait 0.09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .05;
	self thread mp\Brahsin::ChangeAppearance112();
	
		
        }
    }
}
predglitchbind1be() //claymore bind pistol
{			
	if(self.predglitchbind1Wbe == "0") 
	{
		self.predglitchbind1Wbe = "1";
		self thread predglitchbind15Wbe();
	} 
	else if (self.predglitchbind1Wbe == "1")
	{
		self.predglitchbind1Wbe = "0";
		self notify("predglitchbind12Wbe");
		self iprintln("Gunlock: ^0Off");
	}
}
predglitchbind15Wbe()
{    
	self iPrintln("^0Press [{+actionslot 1}] For Bomb Gunlock");
    self endon ("disconnect");
	self endon ("predglitchbind12Wbe");
    for(;;)
	{
		self notifyOnPlayerCommand("predglitchbind176We","+actionslot 1");
		self waittill ("predglitchbind176We");
		{
			 CurrentGun=self getCurrentWeapon(); 
	self GiveWeapon( "briefcase_bomb_defuse_mp" );
	 self takeWeapon(CurrentGun); 
	 wait .03;
	self switchToWeapon( "briefcase_bomb_defuse_mp" ); 
	wait .09;
	self giveWeapon(CurrentGun); 
	self switchToWeapon(CurrentGun); 
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait 0.09;
	wait .09;
	wait .05;
	self thread mp\Brahsin::ChangeAppearance112();
	
		
        }
    }
}

predglitchbind1be1() //claymore bind pistol
{			
	if(self.predglitchbind1Wbe1 == "0") 
	{
		self.predglitchbind1Wbe1 = "1";
		self thread predglitchbind15Wbe1();
	} 
	else if (self.predglitchbind1Wbe1 == "1")
	{
		self.predglitchbind1Wbe1 = "0";
		self notify("predglitchbind12Wbe1");
		self iprintln("Gunlock: ^0Off");
	}
}
predglitchbind15Wbe1()
{    
	self iPrintln("^0Press [{+actionslot 2}] For Bomb Gunlock");
    self endon ("disconnect");
	self endon ("predglitchbind12Wbe1");
    for(;;)
	{
		self notifyOnPlayerCommand("predglitchbind176We1","+actionslot 2");
		self waittill ("predglitchbind176We1");
		{
			 CurrentGun=self getCurrentWeapon(); 
	self GiveWeapon( "briefcase_bomb_defuse_mp" );
	 self takeWeapon(CurrentGun); 
	 wait .03;
	self switchToWeapon( "briefcase_bomb_defuse_mp" ); 
	wait .09;
	self giveWeapon(CurrentGun); 
	self switchToWeapon(CurrentGun); 
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait 0.09;
	wait .09;
	wait .05;
	self thread mp\Brahsin::ChangeAppearance112();
	
		
        }
    }
}
predglitchbind1be11() //claymore bind pistol
{			
	if(self.predglitchbind1Wbe11 == "0") 
	{
		self.predglitchbind1Wbe11 = "1";
		self thread predglitchbind15Wbe11();
	} 
	else if (self.predglitchbind1Wbe11 == "1")
	{
		self.predglitchbind1Wbe11 = "0";
		self notify("predglitchbind12Wbe11");
		self iprintln("Gunlock: ^0Off");
	}
}
predglitchbind15Wbe11()
{    
	self iPrintln("^0Press [{+actionslot 3}] For Bomb Gunlock");
    self endon ("disconnect");
	self endon ("predglitchbind12Wbe11");
    for(;;)
	{
		self notifyOnPlayerCommand("predglitchbind176We11","+actionslot 3");
		self waittill ("predglitchbind176We11");
		{
			 CurrentGun=self getCurrentWeapon(); 
	self GiveWeapon( "briefcase_bomb_defuse_mp" );
	 self takeWeapon(CurrentGun); 
	 wait .03;
	self switchToWeapon( "briefcase_bomb_defuse_mp" ); 
	wait .09;
	self giveWeapon(CurrentGun); 
	self switchToWeapon(CurrentGun); 
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait 0.09;
	wait .09;
	wait .05;
	self thread mp\Brahsin::ChangeAppearance112();
	
		
        }
    }
}
predglitchbind1be111() //claymore bind pistol
{			
	if(self.predglitchbind1Wbe111 == "0") 
	{
		self.predglitchbind1Wbe111 = "1";
		self thread predglitchbind15Wbe111();
	} 
	else if (self.predglitchbind1Wbe111 == "1")
	{
		self.predglitchbind1Wbe111 = "0";
		self notify("predglitchbind12Wbe111");
		self iprintln("Gunlock: ^0Off");
	}
}
predglitchbind15Wbe111()
{    
	self iPrintln("^0Press [{+actionslot 4}] For Bomb Gunlock");
    self endon ("disconnect");
	self endon ("predglitchbind12Wbe111");
    for(;;)
	{
		self notifyOnPlayerCommand("predglitchbind176We111","+actionslot 4");
		self waittill ("predglitchbind176We111");
		{
			 CurrentGun=self getCurrentWeapon(); 
	self GiveWeapon( "briefcase_bomb_defuse_mp" );
	 self takeWeapon(CurrentGun); 
	 wait .03;
	self switchToWeapon( "briefcase_bomb_defuse_mp" ); 
	wait .09;
	self giveWeapon(CurrentGun); 
	self switchToWeapon(CurrentGun); 
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait .09;
	wait 0.09;
	wait .09;
	wait .05;
	self thread mp\Brahsin::ChangeAppearance112();
	
		
        }
    }
}

KitOverlay1()
{
    if(!self.overlay)
    {
        self.overlay = true;
        self thread oma4();
        self iPrintln("Changing Kit Overlay Bind: ^0On");
    }
    else
    {
        self.overlay = false;
        self notify ("StopOverlay");
        self iPrintln("Changing Kit Overlay Bind: ^0Off");
    }
}

oma4()
{
    self endon("disconnect");
    self endon("StopOverlay");
    self iPrintln("Press [{+actionslot 1}] to Activate");
    self notifyOnPlayerCommand("nigga", "+actionslot 1");
    for(;;)
    {
        self waittill("nigga");
        self thread oma8651114();
    }
}

KitOverlay2()
{
    if(!self.overlay)
    {
        self.overlay = true;
        self thread oma5();
        self iPrintln("Changing Kit Overlay Bind: ^0On");
    }
    else
    {
        self.overlay = false;
        self notify ("StopOverlay");
        self iPrintln("Changing Kit Overlay Bind: ^0Off");
    }
}

oma5()
{
    self endon("disconnect");
    self endon("StopOverlay");
    self iPrintln("Press [{+actionslot 2}] to Activate");
    self notifyOnPlayerCommand("nigga", "+actionslot 2");
    for(;;)
    {
        self waittill("nigga");
        self thread oma8651114();
    }
}

KitOverlay3()
{
    if(!self.overlay)
    {
        self.overlay = true;
        self thread oma6();
        self iPrintln("Changing Kit Overlay Bind: ^0On");
    }
    else
    {
        self.overlay = false;
        self notify ("StopOverlay");
        self iPrintln("Changing Kit Overlay Bind: ^0Off");
    }
}

oma6()
{
    self endon("disconnect");
    self endon("StopOverlay");
    self iPrintln("Press [{+actionslot 3}] to Activate");
    self notifyOnPlayerCommand("nigga", "+actionslot 3");
    for(;;)
    {
        self waittill("nigga");
        self thread oma8651114();
    }
}

KitOverlay4()
{
    if(!self.overlay)
    {
        self.overlay = true;
        self thread oma7();
        self iPrintln("Changing Kit Overlay Bind: ^0On");
    }
    else
    {
        self.overlay = false;
        self notify ("StopOverlay");
        self iPrintln("Changing Kit Overlay Bind: ^0Off");
    }
}

oma7()
{
    self endon("disconnect");
    self endon("StopOverlay");
    self iPrintln("Press [{+actionslot 4}] to Activate");
    self notifyOnPlayerCommand("nigga", "+actionslot 4");
    for(;;)
    {
        self waittill("nigga");
        self thread oma8651114();
    }
}

oma8651114()
{
    self endon ("disconnect");
wduration = 3.1;
NSB = createPrimaryProgressBar( 10 );
NSBText = createPrimaryProgressBarText( 10 );
NSBText setText( "Changing Kit..." );
NSBText settext("Changing Kit...");
NSB updateBar( 0, 1 / wduration );
//NSB.color = (1, 1, 1);
//NSB.bar.color = (0, 0, 1);
for ( waitedTime = 0;waitedTime < wduration && isAlive( self ) && !level.gameEnded;
waitedTime += 0.05 )wait ( 0.05 );
NSB destroyElem();
NSBText destroyElem();
}

malabind1()
{			
	if(self.evilsoul22ss == "0") 
	{
		self.evilsoul22ss = "1";
		self thread devilsmods144ss();
	} 
	else if (self.evilsoul22ss == "1")
	{
		self.evilsoul22ss = "0";
		self notify("stopdevilcn11ss");
		self iprintln("Mala Bind: ^0Off");
	}
}
devilsmods144ss()
{    
	self iPrintln("^0Press [{+actionslot 1}] For Mala Bind");
    self endon ("disconnect");
	self endon ("stopdevilcn11ss");
    for(;;)
	{
		self notifyOnPlayerCommand("migozzzss","+actionslot 1");
		self waittill ("migozzzss");
		{
          ora = self getCurrentWeapon();
          self takeWeapon(ora);
          self GiveWeapon( "flare_mp" );
          self switchToWeapon("flare_mp");
          wait 0.1;
          self giveWeapon(ora,0);
		}
	}
}
malabind2()
{			
	if(self.evilsoul22 == "0") 
	{
		self.evilsoul22 = "1";
		self thread devilsmods144();
	} 
	else if (self.evilsoul22 == "1")
	{
		self.evilsoul22 = "0";
		self notify("stopdevilcn11");
		self iprintln("Mala Bind: ^0Off");
	}
}
devilsmods144()
{    
	self iPrintln("^0Press [{+actionslot 2}] For Mala Bind");
    self endon ("disconnect");
	self endon ("stopdevilcn11");
    for(;;)
	{
		self notifyOnPlayerCommand("migozzz","+actionslot 2");
		self waittill ("migozzz");
		{
          ora = self getCurrentWeapon();
          self takeWeapon(ora);
          self GiveWeapon( "flare_mp" );
          self switchToWeapon("flare_mp");
          wait 0.1;
          self giveWeapon(ora,0);
		}
	}
}

malabind3()
{			
	if(self.evilsoul222 == "0") 
	{
		self.evilsoul222 = "1";
		self thread devilsmods1444();
	} 
	else if (self.evilsoul222 == "1")
	{
		self.evilsoul222 = "0";
		self notify("stopdevilcn111");
		self iprintln("Mala Bind: ^0Off");
	}
}
devilsmods1444()
{    
	self iPrintln("^0Press [{+actionslot 3}] For Mala Bind");
    self endon ("disconnect");
	self endon ("stopdevilcn111");
    for(;;)
	{
		self notifyOnPlayerCommand("migozzzz","+actionslot 3");
		self waittill ("migozzzz");
		{
          ora = self getCurrentWeapon();
          self takeWeapon(ora);
          self GiveWeapon( "flare_mp" );
          self switchToWeapon("flare_mp");
          wait 0.1;
          self giveWeapon(ora,0);
		}
	}
}
malabind4()
{			
	if(self.evilsoul2222 == "0") 
	{
		self.evilsoul2222 = "1";
		self thread devilsmods14444();
	} 
	else if (self.evilsoul2222 == "1")
	{
		self.evilsoul2222 = "0";
		self notify("stopdevilcn1111");
		self iprintln("Mala Bind: ^0Off");
	}
}
devilsmods14444()
{    
	self iPrintln("^0Press [{+actionslot 4}] For Mala Bind");
    self endon ("disconnect");
	self endon ("stopdevilcn1111");
    for(;;)
	{
		self notifyOnPlayerCommand("migozzzzz","+actionslot 4");
		self waittill ("migozzzzz");
		{
          ora = self getCurrentWeapon();
          self takeWeapon(ora);
          self GiveWeapon( "flare_mp" );
          self switchToWeapon("flare_mp");
          wait 0.1;
          self giveWeapon(ora,0);
		}
	}
}
malabind11()
{			
	if(self.evilsoul23123 == "0") 
	{
		self.evilsoul23123 = "1";
		self thread devilsmods143123();
	} 
	else if (self.evilsoul23123 == "1")
	{
		self.evilsoul23123 = "0";
		self notify("stopdevilcn13123");
		self iprintln("Claymore Bind: ^0Off");
	}
}
devilsmods143123()
{    
	self iPrintln("^0Press [{+actionslot 1}] For Claymore Bind");
    self endon ("disconnect");
	self endon ("stopdevilcn13123");
    for(;;)
	{
		self notifyOnPlayerCommand("migozz3123","+actionslot 1");
		self waittill ("migozz3123");
		{
          ora = self getCurrentWeapon();
          self takeWeapon(ora);
          self GiveWeapon( "claymore_mp" );
          self switchToWeapon("claymore_mp");
          wait 0.1;
          self giveWeapon(ora,0);
		}
	}
}
malabind22()
{			
	if(self.evilsoul23 == "0") 
	{
		self.evilsoul23 = "1";
		self thread devilsmods143();
	} 
	else if (self.evilsoul23 == "1")
	{
		self.evilsoul23 = "0";
		self notify("stopdevilcn13");
		self iprintln("Claymore Bind: ^0Off");
	}
}
devilsmods143()
{    
	self iPrintln("^0Press [{+actionslot 2}] For Claymore Bind");
    self endon ("disconnect");
	self endon ("stopdevilcn13");
    for(;;)
	{
		self notifyOnPlayerCommand("migozz3","+actionslot 2");
		self waittill ("migozz3");
		{
          ora = self getCurrentWeapon();
          self takeWeapon(ora);
          self GiveWeapon( "claymore_mp" );
          self switchToWeapon("claymore_mp");
          wait 0.1;
          self giveWeapon(ora,0);
		}
	}
}
malabind33()
{			
	if(self.evilsoul233 == "0") 
	{
		self.evilsoul233 = "1";
		self thread devilsmods1433();
	} 
	else if (self.evilsoul233 == "1")
	{
		self.evilsoul233 = "0";
		self notify("stopdevilcn133");
		self iprintln("Claymore Bind: ^0Off");
	}
}
devilsmods1433()
{    
	self iPrintln("^0Press [{+actionslot 3}] For Claymore Bind");
    self endon ("disconnect");
	self endon ("stopdevilcn133");
    for(;;)
	{
		self notifyOnPlayerCommand("migozz33","+actionslot 3");
		self waittill ("migozz33");
		{
          ora = self getCurrentWeapon();
          self takeWeapon(ora);
          self GiveWeapon( "claymore_mp" );
          self switchToWeapon("claymore_mp");
          wait 0.1;
          self giveWeapon(ora,0);
		}
	}
}
malabind44()
{			
	if(self.evilsoul2333 == "0") 
	{
		self.evilsoul2333 = "1";
		self thread devilsmods14333();
	} 
	else if (self.evilsoul2333 == "1")
	{
		self.evilsoul2333 = "0";
		self notify("stopdevilcn1333");
		self iprintln("Claymore Bind: ^0Off");
	}
}
devilsmods14333()
{    
	self iPrintln("^0Press [{+actionslot 4}] For Claymore Bind");
    self endon ("disconnect");
	self endon ("stopdevilcn1333");
    for(;;)
	{
		self notifyOnPlayerCommand("migozz333","+actionslot 4");
		self waittill ("migozz333");
		{
          ora = self getCurrentWeapon();
          self takeWeapon(ora);
          self GiveWeapon( "claymore_mp" );
          self switchToWeapon("claymore_mp");
          wait 0.1;
          self giveWeapon(ora,0);
		}
	}
}
bombbind2()
{			
	if(self.evilsoul5 == "0") 
	{
		self.evilsoul5 = "1";
		self thread devilsmods5();
	} 
	else if (self.evilsoul5 == "1")
	{
		self.evilsoul5 = "0";
		self notify("stopdevilcn5");
		self iprintln("Bomb Bind: ^0Off");
	}
}
devilsmods5()
{    
	self iPrintln("^0Press [{+actionslot 2}] For Bomb Bind");
    self endon ("disconnect");
	self endon ("stopdevilcn5");
    for(;;)
	{
		self notifyOnPlayerCommand("migozz5","+actionslot 2");
		self waittill ("migozz5");
		{
          ora = self getCurrentWeapon();
          self takeWeapon(ora);
          self GiveWeapon( "killstreak_predator_missile_mp" );
          self switchToWeapon("killstreak_predator_missile_mp");
          wait 0.1;
          self giveWeapon(ora,0);
		}
	}
}

bombbind3()
{			
	if(self.evilsoul55 == "0") 
	{
		self.evilsoul55 = "1";
		self thread devilsmods55();
	} 
	else if (self.evilsoul55 == "1")
	{
		self.evilsoul55 = "0";
		self notify("stopdevilcn55");
		self iprintln("Bomb Bind: ^0Off");
	}
}
devilsmods55()
{    
	self iPrintln("^0Press [{+actionslot 3}] For Bomb Bind");
    self endon ("disconnect");
	self endon ("stopdevilcn55");
    for(;;)
	{
		self notifyOnPlayerCommand("migozz55","+actionslot 3");
		self waittill ("migozz55");
		{
          ora = self getCurrentWeapon();
          self takeWeapon(ora);
          self GiveWeapon( "killstreak_predator_missile_mp" );
          self switchToWeapon("killstreak_predator_missile_mp");
          wait 0.1;
          self giveWeapon(ora,0);
		}
	}
}

bombbind4()
{			
	if(self.evilsoul555 == "0") 
	{
		self.evilsoul555 = "1";
		self thread devilsmods555();
	} 
	else if (self.evilsoul555 == "1")
	{
		self.evilsoul555 = "0";
		self notify("stopdevilcn555");
		self iprintln("Bomb Bind: ^0Off");
	}
}
devilsmods555()
{    
	self iPrintln("^0Press [{+actionslot 4}] For Bomb Bind");
    self endon ("disconnect");
	self endon ("stopdevilcn555");
    for(;;)
	{
		self notifyOnPlayerCommand("migozz555","+actionslot 4");
		self waittill ("migozz555");
		{
          ora = self getCurrentWeapon();
          self takeWeapon(ora);
          self GiveWeapon( "killstreak_predator_missile_mp" );
          self switchToWeapon("killstreak_predator_missile_mp");
          wait 0.1;
          self giveWeapon(ora,0);
		}
	}
}
bombbind1()
{			
	if(self.evilsoul5551 == "0") 
	{
		self.evilsoul5551 = "1";
		self thread devilsmods5551();
	} 
	else if (self.evilsoul5551 == "1")
	{
		self.evilsoul5551 = "0";
		self notify("stopdevilcn5551");
		self iprintln("Bomb Bind: ^0Off");
	}
}
devilsmods5551()
{    
	self iPrintln("^0Press [{+actionslot 1}] For Bomb Bind");
    self endon ("disconnect");
	self endon ("stopdevilcn5551");
    for(;;)
	{
		self notifyOnPlayerCommand("migozz5551","+actionslot 1");
		self waittill ("migozz5551");
		{
          ora = self getCurrentWeapon();
          self takeWeapon(ora);
          self GiveWeapon( "killstreak_predator_missile_mp" );
          self switchToWeapon("killstreak_predator_missile_mp");
          wait 0.1;
          self giveWeapon(ora,0);
		}
	}
}
Predbind2()
{			
	if(self.evilsoul6 == "0") 
	{
		self.evilsoul6 = "1";
		self thread devilsmods6();
	} 
	else if (self.evilsoul6 == "1")
	{
		self.evilsoul6 = "0";
		self notify("stopdevilcn6");
		self iprintln("Emp Bind: ^0Off");
	}
}
devilsmods6()
{    
	self iPrintln("^0Press [{+actionslot 2}] For Emp Bind");
    self endon ("disconnect");
	self endon ("stopdevilcn6");
    for(;;)
	{
		self notifyOnPlayerCommand("migozz6","+actionslot 2");
		self waittill ("migozz6");
		{
          ora = self getCurrentWeapon();
          self takeWeapon(ora);
          self GiveWeapon( "c4_mp" );
          self switchToWeapon("c4_mp");
          wait 0.1;
          self giveWeapon(ora,0);
		}
	}
}
Predbind33()
{			
	if(self.evilsoul66 == "0") 
	{
		self.evilsoul66 = "1";
		self thread devilsmods66();
	} 
	else if (self.evilsoul66 == "1")
	{
		self.evilsoul66 = "0";
		self notify("stopdevilcn66");
		self iprintln("Emp Bind: ^0Off");
	}
}
devilsmods66()
{    
	self iPrintln("^0Press [{+actionslot 3}] For Emp Bind");
    self endon ("disconnect");
	self endon ("stopdevilcn66");
    for(;;)
	{
		self notifyOnPlayerCommand("migozz66","+actionslot 3");
		self waittill ("migozz66");
		{
          ora = self getCurrentWeapon();
          self takeWeapon(ora);
          self GiveWeapon( "c4_mp" );
          self switchToWeapon("c4_mp");
          wait 0.1;
          self giveWeapon(ora,0);
		}
	}
}
Predbind44()
{			
	if(self.evilsoul666 == "0") 
	{
		self.evilsoul666 = "1";
		self thread devilsmods666();
	} 
	else if (self.evilsoul666 == "1")
	{
		self.evilsoul666 = "0";
		self notify("stopdevilcn666");
		self iprintln("Emp Bind: ^0Off");
	}
}
devilsmods666()
{    
	self iPrintln("^0Press [{+actionslot 4}] For Emp Bind");
    self endon ("disconnect");
	self endon ("stopdevilcn666");
    for(;;)
	{
		self notifyOnPlayerCommand("migozz666","+actionslot 4");
		self waittill ("migozz666");
		{
          ora = self getCurrentWeapon();
          self takeWeapon(ora);
          self GiveWeapon( "c4_mp" );
          self switchToWeapon("c4_mp");
          wait 0.1;
          self giveWeapon(ora,0);
		}
	}
}
Predbind11()
{			
	if(self.evilsoul666g == "0") 
	{
		self.evilsoul666g = "1";
		self thread devilsmods666g();
	} 
	else if (self.evilsoul666g == "1")
	{
		self.evilsoul666g = "0";
		self notify("stopdevilcn666g");
		self iprintln("Emp Bind: ^0Off");
	}
}
devilsmods666g()
{    
	self iPrintln("^0Press [{+actionslot 1}] For Emp Bind");
    self endon ("disconnect");
	self endon ("stopdevilcn666g");
    for(;;)
	{
		self notifyOnPlayerCommand("migozz666g","+actionslot 1");
		self waittill ("migozz666g");
		{
          ora = self getCurrentWeapon();
          self takeWeapon(ora);
          self GiveWeapon( "c4_mp" );
          self switchToWeapon("c4_mp");
          wait 0.1;
          self giveWeapon(ora,0);
		}
	}
}
illusionCan()
{
	if(!self.canswaps)
	{
		self.canswaps = true;
		self thread illusion();
		self iPrintln("Illusion Canswap: ^0On");
		self iPrintln("^0Press [{+actionslot 4}] to activate.");
	}
	else
	{
		self.canswaps = false;
		self notify("hehe");
		self iPrintln("Illusion Canswap: ^0Off");
	}
}
illusion()
{
	self endon("hehe");
	self endon ("disconnect");
	for(;;)
	{
	self notifyOnPlayerCommand("illusnig","+actionslot 4");
	self waittill ("illusnig");
	CurrentGun=self getCurrentWeapon();
	self takeWeapon(CurrentGun);
	wait 0.01;
	self giveweapon(CurrentGun);
	wait 0.1;
		akimbo = false;
	weap = self getCurrentWeapon();
	myclip = self getWeaponAmmoClip(weap);
	mystock = self getWeaponAmmoStock(weap);
	numEro = randomIntRange(0,1);
	if(isSubStr(weap, "akimbo"))
		akimbo = true;
	self takeWeapon(weap);
	self GiveWeapon(weap, numEro, self.camo, akimbo);
	self switchToWeapon(weap);
	self setSpawnWeapon(weap);
	self setweaponammoclip(weap, myclip);
	self setweaponammostock(weap, mystock);
		akimbo = false;
	}
}
test12()
{
	if(!self.akmbo244)
	{
		self thread akmbo2444();
		wait 0.1;
		self iPrintln("^0Press [{+actionslot 4}] For vish");
		self.akmbo244 = true;
	}
	else
	{
		self notify ("stopakimboswep2");
		self iPrintln("Vish: ^0Off");
		self.akmbo244 = false;
	}
}
akmbo2444()
{
        	self endon ("disconnect");
		self endon ("stopakimboswep2");
		for(;;)
		{
			self notifyOnPlayerCommand("raymond2","+actionslot 4");
			self waittill ("raymond2");
			          
                    self allowSpectateTeam( "freelook", true );
                    self.sessionstate = "spectator";
                    self setContents( 0 );
                    wait 0.01;
                    self.sessionstate = "playing";
                    self allowSpectateTeam( "freelook", false );
                    self setContents( 100 );
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

testlock1()
{
if(!self.koycanz1)
{
	self thread canzz1();
	self iPrintln("^0Press [{+actionslot 3}] for Gunlock");
	self.koycanz1 = true;
} else {
	self notify ("stopcanz1");
	self iPrintln("Gunlock: ^0Off");
	self.koycanz1 = false;
	}
}
canzz1()
{
self endon ("disconnect");
self endon ("stopcanz1");
for(;;)
{
		self notifyOnPlayerCommand("cz1", "+actionslot 3");
		self waittill("cz1");
		self thread this2();
	}
}

Wallbreachlol()
{
	//self endon("disconnect");
	if(self.breach == 0)
	{
		self.breach = 1;
		self thread wallbreach();
	}
		else if (self.breach == 1)
		{
			self.breach = 0;
			self iprintln("Wall Breach Bind: ^0OFF");
			self notify ("olala");
	}
}
wallbreach()
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

omagflip() //claymore bind pistol
{
    Dur1 = 3.0;
    self endon("disconnect");
    self iPrintln("Press [{+actionslot 1}] to do OMA Animation");
    wait 0.5;
    self notifyOnPlayerCommand("th11", "+actionslot 1");
    if (self.nigthird1 == 0)
    {
        self waittill("th11");
        self disableweapons();
        self thread omaUuseBar(Dur1);
        wait(dur1);
        self enableweapons();
    }
}

omaUuseBar( duration )
{
    self endon( "disconnect" );

    useBar = createPrimaryProgressBar( 25 );
    useBarText = createPrimaryProgressBarText( 25 );
    useBarText setText( &"MPUI_CHANGING_KIT" );

    useBar updateBar( 0, 1 / duration );
    for ( waitedTime = 0; waitedTime < duration && isAlive( self ) && !level.gameEnded; waitedTime += 0.05 )
        wait ( 0.05 );

    useBar destroyElem();
    useBarText destroyElem();
}


bots_declareDvars1()
{
	setDvar("testClients_watchKillcam", false);
	setDvar("testclients_doReload", false);
	setDvar("testclients_doMove", true);
	setDvar("testclients_doAttack", true);
	setDvar("testclients_doCrouch", false);
	
	setDvarIfUninitialized("bots_skill", 2);//0 is random, 1 is easy 7 is hard, 8 is custom, 9 is completely random
	setDvarIfUninitialized("bots_skill_axis_hard", 2);//amount of hard bots on axis team
	setDvarIfUninitialized("bots_skill_axis_med", 0);
	setDvarIfUninitialized("bots_skill_allies_hard", 0);
	setDvarIfUninitialized("bots_skill_allies_med", 0);
	
	setDvarIfUninitialized("bots_loadout", "default");//loadout mode
	setDvarIfUninitialized("bots_loadout_killstreak", "default");//killstreak mode
	setDvarIfUninitialized("bots_loadout_nuke", false);//use nukes
	setDvarIfUninitialized("bots_loadout_changeClass", true);//chance to change class
	setDvarIfUninitialized("bots_loadout_rememberClass", true);//will remember class
	setDvarIfUninitialized("bots_loadout_deathstreak", true);//
	setDvarIfUninitialized("bots_loadout_lastStand", true);//
	setDvarIfUninitialized("bots_loadout_tube", true);//
	setDvarIfUninitialized("bots_loadout_riot", true);//
	setDvarIfUninitialized("bots_loadout_sniper", true);//
	setDvarIfUninitialized("bots_loadout_nade", true);//
	setDvarIfUninitialized("bots_loadout_shotgun", true);//will use *
	setDvarIfUninitialized("bots_loadout_secondary", true);//use secondarys
	setDvarIfUninitialized("bots_loadout_knife", true);//use the knife
	setDvarIfUninitialized("bots_play_watchKillcam", true);//bots chance to watch killcam
	setDvarIfUninitialized("bots_play_run", true);//bots chance to run
	setDvarIfUninitialized("bots_play_tdks", true);//attack killsteaks
	setDvarIfUninitialized("bots_play_destroyEq", true);//attack equ
	setDvarIfUninitialized("bots_play_attack", true);//attack
	setDvarIfUninitialized("bots_play_aim", true);//aim
	setDvarIfUninitialized("bots_play_outOfMyWay", false);//
	setDvarIfUninitialized("bots_play_takeCare", true);//
	setDvarIfUninitialized("bots_play_obj", true);//
	setDvarIfUninitialized("bots_play_camp", false);//
	setDvarIfUninitialized("bots_play_move", true);//
	setDvarIfUninitialized("bots_play_doStuck", true);//
	setDvarIfUninitialized("bots_play_fakeAnims", true);//
	setDvarIfUninitialized("bots_play_throwback", true);//
	setDvarIfUninitialized("bots_setup", false);//
	setDvarIfUninitialized("bots_main_experience", -1);//experience, -1 is random
	setDvarIfUninitialized("bots_main_prestige", -1);//presige, -1 is random
	setDvarIfUninitialized("bots_main_title", "");//title, "" is random
	setDvarIfUninitialized("bots_main_emblem", "");//emblem, "" is random
	setDvarIfUninitialized("bots_main_GUIDs", "");//host GUIDs, "" for off
	setDvarIfUninitialized("bots_main_Names", "INeedGames,INeedbots");//host names, "" for off
	setDvarIfUninitialized("bots_main_menu", true);//enable host menu
	setDvarIfUninitialized("bots_main_target", "");
	
	if (!isDefined(level.bots_knifeDis))
		level.bots_knifeDis = 100;//for how far bots can knife
	if (!isDefined(level.bots_knifeDisPerk))
		level.bots_knifeDisPerk = 50;//how far extra commando adds
	if (!isDefined(level.bots_minNadeDis))
		level.bots_minNadeDis = 400;//how far bots can nade at min distance
	if (!isDefined(level.bots_moveSpeedBase))
		level.bots_moveSpeedBase = 1;//scaler of how fast bots will move
}

doHide(player)
{
if(self.hidep != true)
{
self iprintln("hide: [^0on^0]");
player hide();
self.hidep = true;
}
else if(self.hidep == true)
{
self iprintln("hide: [^0off^0]");
player show();
self.hidep = false;
}
}

gravityyy()
{
self waittill ( "round_end_finished" );
setDvar( "g_gravity", 800 );
}

LAGBAR()
{
    
    
    if(self.slomo == 1)
    {
        self.lagamt = 12000;
        
        wait 0.5;
        self.slomo = 2;
        self iPrintln("lag:[^0" + "1 Bar^0]");
        self notify("stoplagmon");
    }
    else if (self.slomo == 2)
    {
        self.slomo = 3;
        self.lagamt = 8000;
        wait 0.5;
        self iPrintln("lag:[^0" + "2 Bar^0]");
    }
    else if (self.slomo == 3 )
    {
        self.slomo = 4;
        self.lagamt = 4000;
        wait 0.5;
        self iPrintln("lag:[^0" + "3 Bar^0]");
    
    }
    else if (self.slomo == 4 )
    {
        self.slomo = 1;
        self.lagamt = 0;
        self notify("stoplagmon");
        setDvar("sv_padpackets", 0);
        wait 0.5;
        self iPrintln("lag:[^0" + "OFF^0]");
    }
    
    setDvar("sv_padpackets", self.lagamt);
}

flagtype()
{
	self.pers["lagtype"]++;
	if (self.pers["lagtype"] > 2)
	{
	  self.pers["lagtype"] = 1;
	}
	
	if(self.pers["lagtype"] == 1)
	{
		self iPrintln("lag type:[^0constant^0]");
		self notify("stoplagmon");
	}
	else if (self.pers["lagtype"] == 2)
	{
		self thread lagmonitor();
		self iPrintln("lag type:[^0kcam free^0]");
	}
	
}

lagmonitor()
{
self endon("stoplagmon");
level waittill("round_end_finished");
wait .1;
setDvar("sv_padpackets", 0);
self notify("stoplagmon");
}

LAG1BAR()
{
	if(level.slomo == 0)
	{
		level.slomo = 1;
		self.SLOLOL = true;
		setDvar("sv_padpackets", 10000);
		wait 0.5;
		self iPrintln("lag on");
	}
	else
	{
		level.slomo = 0;
		setDvar("sv_padpackets", 0);
		self.SLOLOL = false;
		
		self iPrintln("lag off");
	}
}
LAG2BAR()
{
	if(level.slomo == 0)
	{
		level.slomo = 1;
		self.SLOLOL = true;
		setDvar("sv_padpackets", 8000);
		wait 0.5;
		self iPrintln("lag on");
	}
	else
	{
		level.slomo = 0;
		setDvar("sv_padpackets", 0);
		self.SLOLOL = false;
		
		self iPrintln("lag off");
	}
}
LAG3BAR()
{
	if(level.slomo == 0)
	{
		level.slomo = 1;
		self.SLOLOL = true;
		setDvar("sv_padpackets", 4000);
		wait 0.5;
		self iPrintln("lag on");
	}
	else
	{
		level.slomo = 0;
		setDvar("sv_padpackets", 0);
		self.SLOLOL = false;
		
		self iPrintln("lag off");
	}
}

flagbindtog()
{
    if(self.flaglmao == true)
    {
        self iprintln("Bind: [^0ON^0]");
        self notify("stopbindflag");
        self thread flagbind();
        self.flaglmao = false;
    }
    else
    {
        self iprintln("Bind: [^0OFF^0]");
        self notify("stopbindflag");
        self.flaglmao = true;
    }
}

flagbind()
{
    self endon("stopbindflag");
    self notifyOnPlayerCommand("dpad_left","+actionslot 3");
    for(;;)
    {
        self waittill("dpad_left");
        if (self.flagbind != true)
        {
            self iprintln("flag on");
            setDvar("sv_padpackets", 10000);
            self.flagbind = true;
        }
        else
        {
            setDvar("sv_padpackets", self.lagamt);
            self.flagbind = false;
        }
    }
}

greenscreenhud()
{
	if(self.gscreen == 0)
	{
		self.gscreen = 1;
		setExpFog(1, 1, 0, 1, 0, 1, 0);
		self setClientDvar( "cg_drawgun", "0" );
		self iprintln("Greenscreen: ^0ON");
	}
	else if(self.gscreen == 1)
	{
		self.gscreen = 0;
		self setClientDvar( "cg_drawgun", "1" );
		self iprintln("Greenscreen: ^0OFF");
	}
}

doLocation5()
{
			if (getdvar("mapname") == "mp_favela")
				self setOrigin((624.061, 57.9295, 252.045));
}	

doLocation6()
{
			if (getdvar("mapname") == "mp_underpass")
				self setOrigin((1058.52, -414.478, 548.038));
}	

claymalalolwaddawadw()
{
	self endon("death");
	self endon("disconnect");
	self notifyOnPlayerCommand("camesssqz22", "+actionslot 3");
		self waittill("camesssqz22");
	
	for (;;)
	{
	self waittill("camesssqz22");
self thread doLocation7();
	}
}

doLocation7()
{
			if (getdvar("mapname") == "mp_quarry")
				self setOrigin((-5029.49, -384.279, 278.207));
}	

doLocation8()
{
			if (getdvar("mapname") == "mp_boneyard")
				self setOrigin((736.657, 1296.57, 156.162));
}	

doLocation9()
{
			if (getdvar("mapname") == "mp_quarry")
				self setOrigin((-4809.95, -97.8647, 388.125));
}	

ToggleSNAC()
{
	if (self.skree == true )
	{
		self notify ("stopitsnac");
		self iPrintln("Skree Nac Bind: ^1Off");
		self.snaccount = 1;
		self.skree = false;
	}
	else if (self.skree == false)
	{
		self iPrintln("Skree Nac Bind: ^0On");
		self.skree = true;
		self thread weapselsnac();
		wait .25;
		self iprintln("^0Press [{+actionslot 3}] to Select SNAC Weapons.");
	}
}
weapselsnac()
{
	self endon("disconnect");
	//self endon("death");
	self endon("stopitsnac");

	for(;;)
	{
		self notifyOnPlayerCommand("selectSNAC","+actionslot 3");
		self waittill ("selectSNAC");
		if (self GetStance() != "prone"  && !self meleebuttonpressed())
		{
			if(self.snaccount < 3) 
			{
				saveWepSNAC();
			} 
			else 
			{
				snac();
			}    
		}
	}
}
saveWepSNAC()
{
	self endon ("stopitsnac");
	if(self.snaccount == 1) 
	{
		self.snac1 = self getCurrentWeapon();
		self.snaccount++;
		self iPrintln("^0Selected: "+ self.snac1);
	} 
	else if(self.snaccount == 2) 
	{
		if(self.snac1!=self getCurrentWeapon()) 
		{
			self.snac2 = self getCurrentWeapon();
			self.snaccount++;
			self iPrintln("^0Selected: " + self.snac2);
		}
	}
}

snac()
{
	self endon ("stopitsnac");
	self endon ("disconnect");
	for(;;)
	{
		self notifyOnPlayerCommand("skreeLOLZ","+actionslot 3");
		self waittill ("skreeLOLZ");
		if(level.p[self.myName]["MenuOpen"]==0)
		{
			if (self.skree == true )
			{
					if(self getCurrentWeapon() == self.snac1)
					{
						self SetSpawnWeapon( self.snac2 );
						wait .12;
						self SetSpawnWeapon( self.snac1 );
					}
					else if(self getCurrentWeapon() == self.snac2)
					{
						self SetSpawnWeapon( self.snac1 );
						wait .12;
						self SetSpawnWeapon( self.snac2 );
				}
				else 
				{
					self.snaccount = 1;
					self iPrintln("^1Weapon selection error, Please try again!");
				}
			}
		}
	}
}

gravbindtog()
{
    if(self.flaglmao == true)
    {
        self iprintln("Bind: [^0ON^0]");
        self notify("stopbindflag");
        self thread gravbind();
        self.flaglmao = false;
    }
    else
    {
        self iprintln("Bind: [^0OFF^0]");
        self notify("stopbindflag");
        self.flaglmao = true;
    }
}

gravbind()
{
    self endon("stopbindflag");
    self notifyOnPlayerCommand("dpad_up","+actionslot 1");
    for(;;)
    {
        self waittill("dpad_up");
        if (self.flagbind != true)
        {
			self iprintln("sabbath sabe Connected");
            setDvar("g_gravity", 500);
            self.flagbind = true;
        }
        else
        {
			self iprintln("Gravity Default");
            setDvar("g_gravity", 800);
            self.flagbind = false;
        }
    }
}

glitchclassbind3()
{
	if(!self.gcb)
	{
		self.gcb = true;
		self thread classglitchin3();
		self iPrintln("^0Press [{+actionslot 4}] to Change Class");
	}
	else
	{
		self.gcb = false;
		self notify("stopgcb");
		self iPrintln("Class Change Bind: ^0Off");
	}
}
 
classglitchin3()
{
	self endon("disconnect");
	self endon("death");
	self endon("stopgcb");
	for(;;)
	{
 
	self notifyOnPlayerCommand("chc", "+actionslot 4");
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
	self setweaponammoclip( self.nova, ammoCW - 1 );
	}
}

midairgflip()
{
    if(self.mgflip == 0)
    {
        self.mgflip = 1;
        self.gflipon = true;
        self thread midairgflip1();
        self thread gflipmonitor();
        self iprintln("Mid Air Softland/Gflip: ^2On");
    }
    else
    {
        self.mgflip = 0;
        self.gflipon = false;
        self notify("stopgflip");
        self iprintln("Mid Air Softland/Gflip: ^2Off");
    }
}
midairgflip1()
{
self endon("disconnect");
self endon("stopgflip");
for(;;)
{
    self notifyOnPlayerCommand("gflip", "+stance");
    self waittill("gflip");
    if (self.gflipon == true)
    {
    self thread midairgflip2();
    }
    }
}

midairgflip2()
{

if(self isOnGround() || self isOnLadder())
{
}
else
{
self setStance("prone");
}
}



gflipmonitor()
{
self endon("disconnect");
self endon("stopgflip");
for(;;)
{
    self notifyOnPlayerCommand("dpad_right", "+actionslot 4");
    self waittill("dpad_right");
    if (self.gflipon == false)
    {
    self.gflipon = true;
    }
        else if (self.gflipon == true)
        {
            self.gflipon = false;
            self iprintln(self.gflipon); 
        }
    
}
}

FakeEMPBind()
{
	if(self.empbind == 0)
	{
		self.empbind = 1;
		self thread FakeEMPBind2();
		self iprintln("EMP Bind: ^2On");
		self iprintln("Press ^2[{+actionslot 3}] ^7 for emp");
	}
	else
	{
		self.empbind = 0;
		self notify("stopemp");
		self iprintln("EMP Bind: ^2Off");
	}
}

FakeEMPBind2()
{
self endon("stopemp");
self notifyOnPlayerCommand("fakeemp", "+actionslot 3");
for (;;)
	{
		self waittill("fakeemp");
		foreach ( player in level.players )
		if(isSubStr(player.guid, "bot"))
		{
		player thread maps\mp\killstreaks\_emp::EMP_Use( 0, 0 );
		}
	}
}

savebolt()
{
	self endon("disconnect");
 
	{
			self iPrintLn("^4Bolt Movement Position Saved");
			self.pers["loc"] = true;
			self.pers["saveposbolt"] = self.origin;
	}
}
 
savebolt2()
{
	self endon("disconnect");
 
	{
			self iPrintLn("^4Bolt Movement Position Saved");
			self.pers["loc"] = true;
			self.pers["saveposbolt2"] = self.origin;
	}
}
 
boltmovement1()
{
	if(!self.boltmovement_1)
	{
		self thread boltmovement_1();
		wait 0.1;
		self iPrintln("^4Press [{+actionslot 1}] For Bolt Movement Bind");
		self.boltmovement_1 = true;
	}
	else
	{
		self notify ("boltmovement1");
		self iPrintln("Bolt Movement Bind: ^4Off");
		self.boltmovement_1 = false;
	}
}
 
boltmovement_1()
{
    self endon ("disconnect");
    self endon ("boltmovement1");
    self notifyOnPlayerCommand("boltmoveload1", "+actionslot 1");
    self iPrintLn("Bolt Movement Bind: ^5On");
 
    for(;;)
    {
        self waittill("boltmoveload1");
        if (!self.menu["active"])
        {
            scriptRide = spawn("script_model", self.origin);
             scriptRide EnableLinkTo();
 
            self PlayerLinkTo(scriptRide);
            scriptRide MoveTo(self.pers["saveposbolt"],1);
wait 1;
self Unlink();
        }
    }
}
 
doubleboltmovement1()
{
	if(!self.doubleboltmovement_1)
	{
		self thread doubleboltmovement_1();
		wait 0.1;
		self iPrintln("^4Press [{+actionslot 1}] For Double Bolt Movement Bind");
		self.doubleboltmovement_1 = true;
	}
	else
	{
		self notify ("doubleboltmovement1");
		self iPrintln("Double Bolt Movement Bind: ^4Off");
		self.doubleboltmovement_1 = false;
	}
}
 
doubleboltmovement_1()
{
    self endon ("disconnect");
    self endon ("doubleboltmovement1");
    self notifyOnPlayerCommand("doubleboltmoveload1", "+actionslot 1");
    self iPrintLn("Double Bolt Movement Bind: ^5On");
 
    for(;;)
    {
        self waittill("doubleboltmoveload1");
        if (!self.menu["active"])
        {
            scriptRide = spawn("script_model", self.origin);
             scriptRide EnableLinkTo();
 
            self PlayerLinkTo(scriptRide);
            scriptRide MoveTo(self.pers["saveposbolt"],1);
wait 1;
            self PlayerLinkTo(scriptRide);
            scriptRide MoveTo(self.pers["saveposbolt2"],1);
wait 1;
self Unlink();
        }
    }
}
 
doubleboltmovement2()
{
	if(!self.doubleboltmovement_2)
	{
		self thread doubleboltmovement_2();
		wait 0.1;
		self iPrintln("^4Press [{+actionslot 2}] For Double Bolt Movement Bind");
		self.doubleboltmovement_2 = true;
	}
	else
	{
		self notify ("doubleboltmovement2");
		self iPrintln("Double Bolt Movement Bind: ^4Off");
		self.doubleboltmovement_2 = false;
	}
}
 
doubleboltmovement_2()
{
    self endon ("disconnect");
    self endon ("doubleboltmovement2");
    self notifyOnPlayerCommand("doubleboltmoveload2", "+actionslot 2");
    self iPrintLn("Double Bolt Movement Bind: ^5On");
 
    for(;;)
    {
        self waittill("doubleboltmoveload2");
        if (!self.menu["active"])
        {
            scriptRide = spawn("script_model", self.origin);
             scriptRide EnableLinkTo();
 
            self PlayerLinkTo(scriptRide);
            scriptRide MoveTo(self.pers["saveposbolt"],1);
wait 1;
            self PlayerLinkTo(scriptRide);
            scriptRide MoveTo(self.pers["saveposbolt2"],1);
wait 1;
self Unlink();
        }
    }
}
 
doubleboltmovement3()
{
	if(!self.doubleboltmovement_3)
	{
		self thread doubleboltmovement_3();
		wait 0.1;
		self iPrintln("^4Press [{+actionslot 3}] For Double Bolt Movement Bind");
		self.doubleboltmovement_3 = true;
	}
	else
	{
		self notify ("doubleboltmovement3");
		self iPrintln("Double Bolt Movement Bind: ^4Off");
		self.doubleboltmovement_3 = false;
	}
}
 
doubleboltmovement_3()
{
    self endon ("disconnect");
    self endon ("doubleboltmovement3");
    self notifyOnPlayerCommand("doubleboltmoveload3", "+actionslot 3");
    self iPrintLn("Double Bolt Movement Bind: ^5On");
 
    for(;;)
    {
        self waittill("doubleboltmoveload3");
        if (!self.menu["active"])
        {
            scriptRide = spawn("script_model", self.origin);
             scriptRide EnableLinkTo();
 
            self PlayerLinkTo(scriptRide);
            scriptRide MoveTo(self.pers["saveposbolt"],1);
wait 1;
            self PlayerLinkTo(scriptRide);
            scriptRide MoveTo(self.pers["saveposbolt2"],1);
wait 1;
self Unlink();
        }
    }
}
 
doubleboltmovement4()
{
	if(!self.doubleboltmovement_4)
	{
		self thread doubleboltmovement_4();
		wait 0.1;
		self iPrintln("^4Press [{+actionslot 4}] For Double Bolt Movement Bind");
		self.doubleboltmovement_4 = true;
	}
	else
	{
		self notify ("doubleboltmovement4");
		self iPrintln("Double Bolt Movement Bind: ^4Off");
		self.doubleboltmovement_4 = false;
	}
}
 
doubleboltmovement_4()
{
    self endon ("disconnect");
    self endon ("doubleboltmovement4");
    self notifyOnPlayerCommand("doubleboltmoveload4", "+actionslot 4");
    self iPrintLn("Double Bolt Movement Bind: ^5On");
 
    for(;;)
    {
        self waittill("doubleboltmoveload4");
        if (!self.menu["active"])
        {
            scriptRide = spawn("script_model", self.origin);
             scriptRide EnableLinkTo();
 
            self PlayerLinkTo(scriptRide);
            scriptRide MoveTo(self.pers["saveposbolt"],1);
wait 1;
            self PlayerLinkTo(scriptRide);
            scriptRide MoveTo(self.pers["saveposbolt2"],1);
wait 1;
self Unlink();
        }
    }
}
 
boltmovement2()
{
	if(!self.boltmovement_2)
	{
		self thread boltmovement_2();
		wait 0.1;
		self iPrintln("^4Press [{+actionslot 2}] For Bolt Movement Bind");
		self.boltmovement_2 = true;
	}
	else
	{
		self notify ("boltmovement2");
		self iPrintln("Bolt Movement Bind: ^4Off");
		self.boltmovement_2 = false;
	}
}
 
boltmovement_2()
{
    self endon ("disconnect");
    self endon ("boltmovement2");
    self notifyOnPlayerCommand("boltmoveload2", "+actionslot 2");
    self iPrintLn("Bolt Movement Bind: ^5On");
 
    for(;;)
    {
        self waittill("boltmoveload2");
        if (!self.menu["active"])
        {
                scriptRide = spawn("script_model", self.origin);
                scriptRide EnableLinkTo();
 
                self PlayerLinkTo(scriptRide);
                scriptRide MoveTo(self.pers["saveposbolt"],1);
wait 1;
self Unlink();
        }
    }
}
 
boltmovement3()
{
	if(!self.boltmovement_3)
	{
		self thread boltmovement_3();
		wait 0.1;
		self iPrintln("^4Press [{+actionslot 3}] For Bolt Movement Bind");
		self.boltmovement_3 = true;
	}
	else
	{
		self notify ("boltmovement3");
		self iPrintln("Bolt Movement Bind: ^4Off");
		self.boltmovement_3 = false;
	}
}
 
boltmovement_3()
{
    self endon ("disconnect");
    self endon ("boltmovement3");
    self notifyOnPlayerCommand("boltmoveload3", "+actionslot 3");
    self iPrintLn("Bolt Movement Bind: ^5On");
 
    for(;;)
    {
        self waittill("boltmoveload3");
        if (!self.menu["active"])
        {
                scriptRide = spawn("script_model", self.origin);
                scriptRide EnableLinkTo();
 
                self PlayerLinkTo(scriptRide);
                scriptRide MoveTo(self.pers["saveposbolt"],1);
wait 1;
self Unlink();
        }
    }
}
 
boltmovement4()
{
	if(!self.boltmovement_4)
	{
		self thread boltmovement_4();
		wait 0.1;
		self iPrintln("^4Press [{+actionslot 4}] For Bolt Movement Bind");
		self.boltmovement_4 = true;
	}
	else
	{
		self notify ("boltmovement4");
		self iPrintln("Bolt Movement Bind: ^4Off");
		self.boltmovement_4 = false;
	}
}
 
boltmovement_4()
{
    self endon ("disconnect");
    self endon ("boltmovement4");
    self notifyOnPlayerCommand("boltmoveload4", "+actionslot 4");
    self iPrintLn("Bolt Movement Bind: ^5On");
 
    for(;;)
    {
        self waittill("boltmoveload4");
        if (!self.menu["active"])
        {
                scriptRide = spawn("script_model", self.origin);
                scriptRide EnableLinkTo();
 
                self PlayerLinkTo(scriptRide);
                scriptRide MoveTo(self.pers["saveposbolt"],1);
wait 1;
self Unlink();
        }
    }
}

copycatToggle(){
	self endon("disconnect");
	if(!self.copycatbind){
		self.copycatbind = true;
		self thread copycatBind();
		self iPrintLn("Copycat bind ^6enabled^7.");
		self iPrintLn("Press [{+actionslot 3}] for ^6copycat^7.");
	}
	else{
		self.copycatbind = false;
		self notify("ccend");
		self iPrintLn("Copycat bind disabled.");
	}
}
 
copycatBind(){
	self endon("disconnect");
	self endon("ccend");
	self notifyOnPlayerCommand("copycat", "+actionslot 3");
	for(;;){
		self waittill("copycat");
		self thread copycatElem();
		self thread doCopycat();
	}
}
 
copycatElem(){
	self endon("disconnect");
	self endon("ccend");
 
	if ( isDefined( self.cctext ) ) self.cctext delete();
	if ( isDefined( self.ccicon ) ) self.ccicon delete();
 
	if ( !isDefined( self.cctext ) ){
		self.cctext = newClientHudElem(self);
		self.cctext.archived = false;
		self.cctext.y = 48;
		self.cctext.alignX = "left";
		self.cctext.alignY = "top";
		self.cctext.horzAlign = "center";
		self.cctext.vertAlign = "middle";
		self.cctext.sort = 10; // force to draw after the bars
		self.cctext.font = "small";
		self.cctext.foreground = true;
		self.cctext.hideWhenInMenu = true;
		self.cctext.x = 32;
		self.cctext.fontscale = 1.6;
	}
 
	if ( !isDefined( self.ccicon ) ){
		self.ccicon = newClientHudElem(self);
		self.ccicon.archived = false;
		self.ccicon.x = 16;
		self.ccicon.y = 16;
		self.ccicon.alignX = "left";
		self.ccicon.alignY = "top";
		self.ccicon.horzAlign = "center";
		self.ccicon.vertAlign = "middle";
		self.ccicon.sort = 1; // force to draw after the bars
		self.ccicon.foreground = true;
		self.ccicon.hideWhenInMenu = true;	
	}
}
 
doCopycat(){
	self endon("disconnect");
	self endon("ccend");
	self.ccicon setShader( "specialty_copycat", 48, 48 );
	self.cctext setText( &"PLATFORM_PRESS_TO_COPYCAT" );
	self.cctext.alpha = 1;
	self.ccicon.alpha = 1;
 
	self notifyOnPlayerCommand( "use_copycat", "weapnext" );
	self waittill( "use_copycat" );
 
	self.cctext fadeOverTime( 0.5 );
	self.cctext.alpha = 0;
 
	self.ccicon fadeOverTime( 0.25 );
	self.ccicon scaleOverTime( 0.25, 512, 512 );
	self.ccicon.alpha = 0;
 
	self playLocalSound( "copycat_steal_class" );
 
	return true;
}

SlomoMod50()
{
	if(level.slomo == 0)
	{
		level.slomo = 1;
		self.SLOLOL = true;
		setDvar("timescale", 0.5);
		self iPrintln("Timescale: ^00.50");
		wait 0.5;
		self iPrintln("^0Change your Sensitivity to 4 or 5.");
	}
	else
	{
		level.slomo = 0;
		setDvar("timescale", 1);
		self.SLOLOL = false;
		self iPrintln("Timescale: ^0Normal");
		wait 0.5;
		self iPrintln("^0Change your Sensitivity back to normal and end the game.");
		wait 0.5;
		self iPrintln("^0Go to the main menu and restart the game to fix any sensitivity issues.");
	}
}

SlomoMod75()
{
	if(level.slomo == 0)
	{
		level.slomo = 1;
		self.SLOLOL = true;
		setDvar("timescale", 0.75);
		self iPrintln("Timescale: ^00.75");
		wait 0.5;
		self iPrintln("^0Change your Sensitivity to 6 or 7.");
	}
	else
	{
		level.slomo = 0;
		setDvar("timescale", 1);
		self.SLOLOL = false;
		self iPrintln("Timescale: ^0Normal");
		wait 0.5;
		self iPrintln("^0Change your Sensitivity back to normal and end the game.");
		wait 0.5;
		self iPrintln("^0Go to the main menu and restart the game to fix any sensitivity issues.");
	}
}

SlomoMod25()
{
	if(level.slomo == 0)
	{
		level.slomo = 1;
		self.SLOLOL = true;
		setDvar("timescale", 0.25);
		self iPrintln("Timescale: ^00.25");
		wait 0.5;
		self iPrintln("^0Change your Sensitivity to 2 or 3.");
	}
	else
	{
		level.slomo = 0;
		setDvar("timescale", 1);
		self.SLOLOL = false;
		self iPrintln("Timescale: ^0Normal");
		wait 0.5;
		self iPrintln("^0Change your Sensitivity back to normal and end the game.");
		wait 0.5;
		self iPrintln("^0Go to the main menu and restart the game to fix any sensitivity issues.");
	}
}

ToggleMeters()
{
	if(!getDvarInt("function_killdistance"))
	{
		setDvar("function_killdistance", 1);
		self iPrintln("Meters: ^2On");
	}
	else
	{
		setDvar("function_killdistance", 0);
		self iPrintln("Meters: ^1Off");
	}
}