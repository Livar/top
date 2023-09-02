/*

Scripted by:

^^^^^^^^^^^  ^^     ^^  ^^^^^^^^^^^^ ^^^^^^^^^^^  ^^   ^^
^         ^  ^^     ^^  ^ ^^^^^^^^ ^ ^ ^^^^^^^^^  ^^  ^^
^  ^^^^^^^^  ^^     ^^  ^ ^      ^ ^ ^ ^          ^^ ^^
^         ^  ^^^^^^^^^  ^ ^      ^ ^ ^ ^          ^^^^
^^^^^^^^  ^  ^^^^^^^^^  ^ ^      ^ ^ ^ ^          ^^^^
^         ^  ^^     ^^  ^ ^^^^^^^^ ^ ^ ^^^^^^^^^  ^^ ^^
^^^^^^^^^^^  ^^     ^^  ^^^^^^^^^^^^ ^^^^^^^^^^^  ^^   ^^

Scripted by
Christian Hammer aka Alex Shock

Thanks to:
Tony Mongool
Jayden Mongool
Lewis Cat
Stony Shock (Petter Olsen)
Tyrone Shock (Joachim Iversen)
Ryder Shock (Marius Sunnset)
Cody Gonzalez
for helping with the testing!

*/

// Includes
#include <a_samp>
#include <YSI\y_ini>
#include <foreach>
#include <streamer>
#include <ZCMD>
#include <YSI/y_timers>
#include <yom_buttons>
#include <sscanf2>
#include <time>
#include <a_zones>

// Version
#define version "RP v1.0.0(b)"
//

// Defines

	// .. Misc
    #define MAX_DDOORS 1000
	#define PATH "/Users/%s.ini"
	#define	DOORLOCK (5000)
	#define MAX_BARRICADES 20
	#define MAX_SPIKESTRIPS 200
	#define MAX_CONES 30
	#define MAX_PLAYER_VEHICLES 5
	// .. Dialogs
	#define DIALOG_REGISTER 1
	#define DIALOG_LOGIN 2
	#define DIALOG_SUCCESS_1 3
	#define DIALOG_SUCCESS_2 4
	#define DIALOG_SKIN 5
	#define DIALOG_ADS 6
	#define DIALOG_NAME 7
	#define DIALOG_LSPD 8
	#define DIALOG_LSPD2 9
	#define DIALOG_LSPD3 10
	#define DIALOG_FBI 11
	#define DIALOG_FBI2 12
	#define DIALOG_FBI3 13
	#define DIALOG_CHANGENAME 14
	#define DIALOG_UNINVITESKIN 15
	#define DIALOG_QUIZ 16
	#define DIALOG_QUIZ2 17
	#define DIALOG_QUIZ3 18
	#define DIALOG_QUIZ4 19
	#define DIALOG_QUIZ5 20
	#define DIALOG_QUIZ6 21
	#define DIALOG_QUIZ7 22
	#define DIALOG_QUIZ8 23
	#define DIALOG_BUYSKIN 24
	#define DIALOG_247 25
	#define DIALOG_BUYCAR 26
	#define DIALOG_BAR 27
	// .. Shops
	#define NOT_IN_SHOP 0
	#define SHOP_BINCO 1
	#define SHOP_247 2
	// .. Colors
	#define COL_WHITE "{FFFFFF}"
	#define COL_RED "{F81414}"
	#define COL_GREEN "{00FF22}"
	#define COL_LIGHTBLUE "{00CED1}"
	#define	COLOR_GRAD1	0xB4B5B7FF
	#define	COLOR_GRAD2	0xBFC0C2FF
	#define	COLOR_GRAD3	0xCBCCCEFF
	#define	COLOR_GRAD4	0xD8D8D8FF
	#define	COLOR_GRAD5	0xE3E3E3FF
	#define	COLOR_GRAD6	0xF0F0F0FF
	#define	COLOR_GREY 0xAFAFAFAA
	#define	COLOR_RED 0xAA3333AA
	#define	COLOR_ORANGE 0xFF8000FF
	#define	COLOR_YELLOW 0xFFFF00AA
	#define	COLOR_GREEN	0x33AA33AA
	#define	COLOR_LIGHTGREEN 0x9ACD32AA
	#define	COLOR_CYAN 0x40FFFFFF
	#define	COLOR_PURPLE 0xC2A2DAAA
	#define	COLOR_BLACK	0x000000AA
	#define	COLOR_WHITE	0xFFFFFFAA
	#define	COLOR_FADE1	0xE6E6E6E6
	#define	COLOR_FADE2	0xC8C8C8C8
	#define	COLOR_FADE3	0xAAAAAAAA
	#define	COLOR_FADE4	0x8C8C8C8C
	#define	COLOR_FADE5	0x6E6E6E6E
	#define	COLOR_LIGHTRED 0xFF6347AA
	#define	COLOR_NEWS 0xFFA500AA
	#define	COLOR_TWWHITE 0xFFFFFFAA
	#define	TEAM_NEWS_COLOR	0x049C7100
	#define RADIOLSFMD 0xFFBDFAAA
	#define	COLOR_TWYELLOW 0xFFFF00AA
	#define	COLOR_TWPINK 0xE75480AA
	#define	COLOR_TWRED	0xFF0000AA
	#define	COLOR_TWBROWN 0x654321AA
	#define	COLOR_TWGRAY 0x808080AA
	#define	COLOR_TWOLIVE 0x808000AA
	#define	COLOR_TWPURPLE 0x800080AA
	#define	COLOR_TWTAN	0xD2B48CAA
	#define	COLOR_TWAQUA 0x00FFFFAA
	#define	COLOR_TWORANGE 0xFF8C00AA
	#define	COLOR_TWAZURE 0x007FFFAA
	#define	COLOR_TWGREEN 0x008000AA
	#define	COLOR_TWBLUE 0x0000FFAA
	#define	COLOR_TWBLACK 0x000000AA
	#define	COLOR_LIGHTBLUE 0x33CCFFAA
	#define	TEAM_CYAN_COLOR	0xFF8282AA
	#define	DEPTRADIO 0xFFD7004A
	#define	RADIO 0x8D8DFFFF
	#define	COLOR_NEWBIE 0x7DAEFFFF
	#define	COLOR_PINK 0xFF66FFAA
	#define	COLOR_OOC 0xE0FFFFAA
	#define	WANTED_COLOR 0xFF0000FF
	//
//

/*
	Enums
*/
	enum pInfo
	{
    pPass,
    pCash,
    pAdmin,
    pKills,
    pDeaths,
    pFaction,
    pFacRank,
    pFacLeader,
    pFacDiv,
    pSkin,
    Float:pX,
    Float:pY,
    Float:pZ,
    pLevel,
    pBank,
    pJob,
    pTruckerSkill,
    pWDealerSkill,
	pBanned,
	pHours,
	pVW,
	pInt,
	pIp[26],
	pGuns[20],
	Float:pHealth,
	Float:pArmor,
	pMaterials,
	pWanted,
	pW1[24],
	pW2[24],
	pW3[24],
	pW4[24],
	pW5[24],
	pW6[24],
	pTotWanted,
	pJail,
	pBail,
	pAName[24],
	pName[70],
	Float:pAx,
	Float:pAy,
	Float:pAz,
	pTotDel,
	pHelper,
	pPhone,
	pSpraycan,
	pNewbMute,
	Float: pVehiclePosX[5],
	Float: pVehiclePosY[5],
	Float: pVehiclePosZ[5],
	Float: pVehicleRot[5],
	pVehicleCol1[5],
	pVehicleCol2[5],
	pVehicle[5],
	pVehicleSpawned[5],
	pVehicleSpawnedID[5],
	pContracted,
	pContractReason[126],
	pContractAmount,
	pContractedBy[126],
	pSuccess,
	pFailed
	};

	enum sInfo
	{
		sCreated,
	    Float:sX,
	    Float:sY,
	    Float:sZ,
	    sObject,
	};

	enum cInfo
	{
		sCreated,
		Float:sX,
	    Float:sY,
	    Float:sZ,
	    sObject,
	};

	enum bInfo
	{
		sCreated,
	    Float:sX,
	    Float:sY,
	    Float:sZ,
	    sObject,
	};
	
	enum eInfo
	{
	eStarted,
	eLocked,
	eAnnounced,
	eBegun,
	Float:eHealth,
	Float:eArmor,
	eSkin,
	Float:eX,
	Float:eY,
	Float:eZ,
	eVW,
	eINT,
	eGun1,
	eGun2,
	eGun3,
	}

	enum ddInfo
	{
	ddName[128],
	ddPickupID,
	Text3D: ddTextID,
	ddCustomInterior,
	ddExteriorVW,
	ddExteriorInt,
	ddInteriorVW,
	ddInteriorInt,
	Float: ddExteriorX,
	Float: ddExteriorY,
	Float: ddExteriorZ,
	Float: ddExteriorA,
	Float: ddInteriorX,
	Float: ddInteriorY,
	Float: ddInteriorZ,
	Float: ddInteriorA,
	ddCustomExterior,
	ddFaction,
	ddAdmin,
	ddWanted,
	ddVehicleAble,
	ddColor,
	ddPickupModel,
	ddPass[24],
	ddLocked,
	ddNotEditable,
	};

new DoorInfo[MAX_DDOORS][ddInfo];
new PlayerInfo[MAX_PLAYERS + 1][pInfo];
new SpikeInfo[MAX_SPIKESTRIPS][sInfo];
new ConeInfo[MAX_CONES][cInfo];
new CadeInfo[MAX_BARRICADES][bInfo];
new EventInfo[eInfo];

/*
	News
*/

// Old stats
new Float:oX[MAX_PLAYERS];
new Float:oY[MAX_PLAYERS];
new Float:oZ[MAX_PLAYERS];
new oVW[MAX_PLAYERS];
new oINT[MAX_PLAYERS];
new Float:oHP[MAX_PLAYERS];
new Float:oA[MAX_PLAYERS];
new oSkin[MAX_PLAYERS];
//
new reports = 0;
new reported[MAX_PLAYERS] = 0;
new reportid[MAX_PLAYERS] = 0;
new reporttext[MAX_PLAYERS][156];
new carsentered[MAX_PLAYERS] = 0;
new dontcheck[MAX_PLAYERS] = 0;
new mute[MAX_PLAYERS] = -1;
new AntiSpam[MAX_PLAYERS] = -1;
new OnCall[MAX_PLAYERS] = -1;
new LSPDGateStatus = 0;
new LSPDBarrierStatus = 0;
new LSPDDoorStatus;
new Text:Clock;
new Text:WeekDayg;
new LSPDGate;
new LSPDBarrier;
new LSPDDoor1;
new LSPDDoor2;
new quizwrong[MAX_PLAYERS];
new pass[MAX_PLAYERS] = -1;
new spec[MAX_PLAYERS] = -1;
new medicCP[MAX_PLAYERS] = -1;
new CPT[MAX_PLAYERS];
new truckloadedon[MAX_PLAYERS];
new truckloaded[MAX_PLAYERS];
new Text:ObjectsLoadingTD[7];
new AdminDutyCash[MAX_PLAYERS];
new Float:AdminDutyHealth[MAX_PLAYERS];
new Float:AdminDutyArmor[MAX_PLAYERS];
new LSFMDVeh[40];
new LSPDVeh[40];
new DSV[40];
new level1Trucks[30];
new level2Trucks[30];
new level3Trucks[30];
new level5Trucks[30];
new rtimer[MAX_PLAYERS];
new itimer[MAX_PLAYERS];
new iitimer[MAX_PLAYERS];
new Float:iX[MAX_PLAYERS], Float:iY[MAX_PLAYERS], Float:iZ[MAX_PLAYERS];
new trailers[30];
new Connected[MAX_PLAYERS] = 0;
new AdminDuty[MAX_PLAYERS] = 0;
new togdr[MAX_PLAYERS] = 0;
new tazer[MAX_PLAYERS] = 0;
new weaponbeingoffered[MAX_PLAYERS] = 0;
new beingofferedby[MAX_PLAYERS] = -1;
new tazerreplace[MAX_PLAYERS] = 0;
new waitcheck[MAX_PLAYERS] = 0;
new badge[MAX_PLAYERS] = 0;
new cardetain[MAX_PLAYERS] = -1;
new as[MAX_PLAYERS] = 0;
new beingdragged[MAX_PLAYERS] = -1;
new togo[MAX_PLAYERS] = 0;
new skipacheck[MAX_PLAYERS] = 0;
new invitedby[MAX_PLAYERS] = -1;
new invitedto[MAX_PLAYERS] = 0;
new tognewbie[MAX_PLAYERS] = 0;
new NoNewb[MAX_PLAYERS] = 0;
new AutoTPban[MAX_PLAYERS] = 0;
new Float:Destinations[5][3] = {

    { 2401.7175,-1506.1350,23.5402 },
    { 1191.0847,-888.5489,42.7969 },
    { -69.6424,-1162.2354,1.5007 },
    { 334.1184,-1340.1366,14.2125 },
    { 481.7301,-1533.2468,19.6644 }
};
new Float:MDestinations[5][3] = {

    { 1976.59, -1234.12, 20.05 },
    { 2338.0, -1247.0, 22.50 },
    { 2530.99, -1712.53, 13.46 },
    { 2446.40, -1975.78, 13.55 },
    { 2173.0, -2265.0, 13.37 }
};



/*
 	Stocks
*/

stock AddPh(oldph, newph)
{
    new File: file2 = fopen("tmpPhone.cfg", io_write);
    new number;
    new string[32];
    new Phone[32];
    format(string, sizeof(string), "%d\r\n", newph);
    fwrite(file2, string);
    fclose(file2);
    file2 = fopen("tmpPhone.cfg", io_append);
    new File: file = fopen("Phone.cfg", io_read);
    while(fread(file, string))
	{
        strmid(Phone, string, 0, strlen(string)-1, 255);
        number = strval(Phone);
    	if(number != oldph)
		{
            format(string, sizeof(string), "%d\r\n", number);
        	fwrite(file2, string);
    	}
    }
    fclose(file);
    fclose(file2);
    file2 = fopen("phone.cfg", io_write);
    file = fopen("tmpPhone.cfg", io_read);
	while(fread(file, string))
	{
        strmid(Phone, string, 0, strlen(string)-1, 255);
        number = strval(Phone);
        if(number != oldph)
		{
            format(string, sizeof(string), "%d\r\n", number);
        	fwrite(file2, string);
    	}
    }
    fclose(file);
    fclose(file2);
	fremove("tmpPhone.cfg");
	return 1;
}

stock isNearBar(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid, 10, 499.9664,-20.6501,1000.6797)) return 1;
	return 0;
}

stock Shop(playerid)
{
    if(!IsPlayerConnected(playerid)) return NOT_IN_SHOP;
	if(IsPlayerInRangeOfPoint(playerid, 30, 207.48, -101.49, 1005.26)) return SHOP_BINCO;
	if(IsPlayerInRangeOfPoint(playerid, 50, -27.69, -89.42, 1003.55)) return SHOP_247;
	return NOT_IN_SHOP;
}

stock PreloadAnims(playerid) {
	ApplyAnimation(playerid, "AIRPORT", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "Attractors", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "BAR", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "BASEBALL", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "BD_FIRE", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "BEACH", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "benchpress", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "BF_injection", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "BIKED", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "BIKEH", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "BIKELEAP", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "BIKES", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "BIKEV", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "BIKE_DBZ", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "BMX", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "BOMBER", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "BOX", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "BSKTBALL", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "BUDDY", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "BUS", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "CAMERA", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "CAR", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "CARRY", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "CAR_CHAT", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "CASINO", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "CHAINSAW", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "CHOPPA", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "CLOTHES", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "COACH", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "COLT45", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "COP_AMBIENT", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "COP_DVBYZ", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "CRACK", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "CRIB", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "DAM_JUMP", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "DANCING", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "DEALER", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "DILDO", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "DODGE", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "DOZER", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "DRIVEBYS", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "FAT", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "FIGHT_B", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "FIGHT_C", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "FIGHT_D", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "FIGHT_E", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "FINALE", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "FINALE2", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "FLAME", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "Flowers", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "FOOD", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "Freeweights", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "GANGS", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "GHANDS", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "GHETTO_DB", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "goggles", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "GRAFFITI", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "GRAVEYARD", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "GRENADE", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "GYMNASIUM", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "HAIRCUTS", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "HEIST9", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "INT_HOUSE", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "INT_OFFICE", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "INT_SHOP", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "JST_BUISNESS", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "KART", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "KISSING", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "KNIFE", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "LAPDAN1", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "LAPDAN2", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "LAPDAN3", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "LOWRIDER", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "MD_CHASE", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "MD_END", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "MEDIC", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "MISC", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "MTB", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "MUSCULAR", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "NEVADA", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "ON_LOOKERS", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "OTB", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "PARACHUTE", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "PARK", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "PAULNMAC", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "ped", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "PLAYER_DVBYS", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "PLAYIDLES", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "POLICE", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "POOL", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "POOR", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "PYTHON", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "QUAD", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "QUAD_DBZ", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "RAPPING", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "RIFLE", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "RIOT", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "ROB_BANK", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "RUSTLER", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "RYDER", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "SCRATCHING", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "SHAMAL", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "SHOP", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "SHOTGUN", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "SILENCED", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "SKATE", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "SMOKING", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "SNIPER", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "SPRAYCAN", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "STRIP", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "SUNBATHE", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "SWAT", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "SWEET", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "SWIM", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "SWORD", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "TANK", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "TATTOOS", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "TEC", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "TRAIN", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "TRUCK", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "UZI", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "VAN", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "VENDING", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "VORTEX", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "WAYFARER", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "WEAPONS", "null", 0.0, 0, 0, 0, 0, 0);
	ApplyAnimation(playerid, "WUZI", "null", 0.0, 0, 0, 0, 0, 0);

	return 1;
}

stock AddBan(ip[])
{
	if(CheckBan(ip) == 0)
	{
		new File: file = fopen("ban.cfg", io_append);
		new string[20];
		format(string, sizeof(string), "\n%s", ip);
	 	fwrite(file, string);
	 	fclose(file);
	 	foreach(Player, playerid)
		{
		    new playerIP[16];
			GetPlayerIp(playerid, playerIP, sizeof(playerIP));
			if(strcmp(playerIP, ip) == 0)
			{
	            SendClientMessage(playerid, COLOR_NEWS, "Your IP is banned from the server.");
				Kick(playerid);
			}
		}
		return 1;
	}
	return 0;
}

stock fcreate(filename[])
{
	if(fexist(filename)) return false;
	new File:fhnd;
	fhnd=fopen(filename,io_write);
	if(fhnd) {
		fclose(fhnd);
		return true;
	}
	return false;
}

stock RemoveBan(ip[])
{
    if(CheckBan(ip) == 1)
	{
	    new string[20];
		new File: file = fopen("ban.cfg", io_read);
		fcreate("tempBan.cfg");
		new File: file2 = fopen("tempBan.cfg", io_append);
		while(fread(file, string))
		{
			if(strcmp(ip, string, true, strlen(ip)) != 0 && strcmp("\n", string) != 0)
		    {
				fwrite(file2, string);
			}
		}
		fclose(file);
		fclose(file2);
		file = fopen("ban.cfg", io_write);
		file2 = fopen("tempBan.cfg", io_read);
		while(fread(file2, string))
		{
			fwrite(file, string);
		}
		fclose(file);
		fclose(file2);
		fremove("tempBan.cfg");
		return 1;
    }
	return 0;
}

stock RemovePh(nmbr[])
{
	new string[20];
	new File: file = fopen("phone.cfg", io_read);
	fcreate("tempPh.cfg");
	new File: file2 = fopen("tempPh.cfg", io_append);
	while(fread(file, string))
	{
		if(strcmp(nmbr, string, true, strlen(nmbr)) != 0 && strcmp("\n", string) != 0)
  		{
			fwrite(file2, string);
		}
		fclose(file);
		fclose(file2);
		file = fopen("phone.cfg", io_write);
		file2 = fopen("tempPh.cfg", io_read);
		while(fread(file2, string))
		{
			fwrite(file, string);
		}
		fclose(file);
		fclose(file2);
		fremove("tempPh.cfg");
		return 1;
	}
	return 1;
}

stock CheckPh(nmbr)
{
    new string[20];
    new File: file = fopen("phone.cfg", io_read);
    if(!fexist("phone.cfg")) { print("Couldn't find phone.cfg, created file."); fcreate("phone.cfg"); return 0; }
    while(fread(file, string))
    {
        if(strval(string) == nmbr)
        {
            fclose(file);
            return 1;
        }
    }
    fclose(file);
    return 0;
}

stock CheckBan(ip[])
{
	new string[20];
    new File: file = fopen("ban.cfg", io_read);
    if(!fexist("ban.cfg")) { print("Couldn't find ban.cfg, created file."); fcreate("ban.cfg"); return 0; }
	while(fread(file, string))
	{
	    if(strcmp(ip, string, true, strlen(ip)) == 0)
	    {
	        fclose(file);
	        return 1;
	    }
	}
	fclose(file);
	return 0;
}

stock doesAccountExist(account_name[])
{
	new account[MAX_PLAYER_NAME + 12], File:f_Handle;

	format(account, sizeof(account), "users/%s.ini", account_name);
	if(fexist(account)) {

		if(!(f_Handle = fopen(account, io_read))) {
			return 1;
		}

		if(flength(f_Handle) > 0) {
			fclose(f_Handle);
			return 1;
		}
		fclose(f_Handle);
	}
	return 0;
}


stock Float:GetDistance(Float: x1, Float: y1, Float: z1, Float: x2, Float: y2, Float: z2)
{
	new Float:d;
	d += floatpower(x1-x2, 2.0);
	d += floatpower(y1-y2, 2.0);
	d += floatpower(z1-z2, 2.0);
	d = floatsqroot(d);
	return d;
}

stock CreateStrip(Float:x,Float:y,Float:z,Float:Angle)
{
    for(new i = 0; i < sizeof(SpikeInfo); i++)
  	{
  	    if(SpikeInfo[i][sCreated] == 0)
  	    {
            SpikeInfo[i][sCreated]=1;
            SpikeInfo[i][sX]=x;
            SpikeInfo[i][sY]=y;
            SpikeInfo[i][sZ]=z-0.7;
            SpikeInfo[i][sObject] = CreateObject(2899, x, y, z-0.9, 0, 0, Angle-90);
	        return 1;
  	    }
  	}
  	return 0;
}

stock CreateCone(Float:x,Float:y,Float:z,Float:Angle)
{
    for(new i = 0; i < sizeof(ConeInfo); i++)
  	{
  	    if(ConeInfo[i][sCreated] == 0)
  	    {
            ConeInfo[i][sCreated]=1;
            ConeInfo[i][sX]=x;
            ConeInfo[i][sY]=y;
            ConeInfo[i][sZ]=z-1;
            ConeInfo[i][sObject] = CreateObject(1238, x, y, z-0.7, 0, 0, Angle);
	        return 1;
  	    }
  	}
  	return 0;
}

stock CreateCade(Float:x,Float:y,Float:z,Float:Angle)
{
    for(new i = 0; i < sizeof(CadeInfo); i++)
  	{
  	    if(CadeInfo[i][sCreated] == 0)
  	    {
            CadeInfo[i][sCreated]=1;
            CadeInfo[i][sX]=x;
            CadeInfo[i][sY]=y;
            CadeInfo[i][sZ]=z;
            CadeInfo[i][sObject] = CreateObject(981, x, y, z, 0, 0, Angle);
	        return 1;
  	    }
  	}
  	return 0;
}

stock CreateCade2(Float:x,Float:y,Float:z,Float:Angle)
{
    for(new i = 0; i < sizeof(CadeInfo); i++)
  	{
  	    if(CadeInfo[i][sCreated] == 0)
  	    {
            CadeInfo[i][sCreated]=1;
            CadeInfo[i][sX]=x;
            CadeInfo[i][sY]=y;
            CadeInfo[i][sZ]=z;
            CadeInfo[i][sObject] = CreateObject(978, x, y, z, 0, 0, Angle);
	        return 1;
  	    }
  	}
  	return 0;
}

stock DeleteAllStrip()
{
    for(new i = 0; i < sizeof(SpikeInfo); i++)
  	{
  	    if(SpikeInfo[i][sCreated] == 1)
  	    {
  	        SpikeInfo[i][sCreated]=0;
            SpikeInfo[i][sX]=0.0;
            SpikeInfo[i][sY]=0.0;
            SpikeInfo[i][sZ]=0.0;
            DestroyObject(SpikeInfo[i][sObject]);
  	    }
	}
    return 0;
}

stock DeleteAllCade()
{
    for(new i = 0; i < sizeof(CadeInfo); i++)
  	{
  	    if(CadeInfo[i][sCreated] == 1)
  	    {
  	        CadeInfo[i][sCreated]=0;
            CadeInfo[i][sX]=0.0;
            CadeInfo[i][sY]=0.0;
            CadeInfo[i][sZ]=0.0;
            DestroyObject(CadeInfo[i][sObject]);
  	    }
	}
    return 0;
}

stock DeleteAllCone()
{
    for(new i = 0; i < sizeof(ConeInfo); i++)
  	{
  	    if(ConeInfo[i][sCreated] == 1)
  	    {
  	        ConeInfo[i][sCreated]=0;
            ConeInfo[i][sX]=0.0;
            ConeInfo[i][sY]=0.0;
            ConeInfo[i][sZ]=0.0;
            DestroyObject(ConeInfo[i][sObject]);
  	    }
	}
    return 0;
}

stock DeleteClosestStrip(playerid)
{
    for(new i = 0; i < sizeof(SpikeInfo); i++)
  	{
  	    if(IsPlayerInRangeOfPoint(playerid, 4.0, SpikeInfo[i][sX], SpikeInfo[i][sY], SpikeInfo[i][sZ]))
        {
  	        if(SpikeInfo[i][sCreated] == 1)
            {
                SpikeInfo[i][sCreated]=0;
                SpikeInfo[i][sX]=0.0;
                SpikeInfo[i][sY]=0.0;
                SpikeInfo[i][sZ]=0.0;
                DestroyObject(SpikeInfo[i][sObject]);
                new str[176], zone[64];
                GetPlayer3DZone(playerid, zone, sizeof(zone));
				format(str, sizeof(str), "* %s %s has picked up a spike strip at %s", GetRankName(playerid), GetName(playerid), zone);
				SendClientMessageToLSPD(RADIO, str);
				SendClientMessageToFBI(RADIO, str);
                return 1;
  	        }
  	    }
  	}
    return 0;
}

stock DeleteClosestCade(playerid)
{
    for(new i = 0; i < sizeof(CadeInfo); i++)
  	{
  	    if(IsPlayerInRangeOfPoint(playerid, 4.0, CadeInfo[i][sX], CadeInfo[i][sY], CadeInfo[i][sZ]))
        {
  	        if(CadeInfo[i][sCreated] == 1)
            {
                CadeInfo[i][sCreated]=0;
                CadeInfo[i][sX]=0.0;
                CadeInfo[i][sY]=0.0;
                CadeInfo[i][sZ]=0.0;
                DestroyObject(CadeInfo[i][sObject]);
                new str[176], zone[64];
               	GetPlayer3DZone(playerid, zone, sizeof(zone));
				format(str, sizeof(str), "* %s %s has picked up a barricade at %s", GetRankName(playerid), GetName(playerid), zone);
				SendClientMessageToLSPD(RADIO, str);
				SendClientMessageToFBI(RADIO, str);
                return 1;
  	        }
  	    }
  	}
    return 0;
}

stock DeleteClosestCone(playerid)
{
    for(new i = 0; i < sizeof(ConeInfo); i++)
  	{
  	    if(IsPlayerInRangeOfPoint(playerid, 4.0, ConeInfo[i][sX], ConeInfo[i][sY], ConeInfo[i][sZ]))
        {
  	        if(ConeInfo[i][sCreated] == 1)
            {
                ConeInfo[i][sCreated]=0;
                ConeInfo[i][sX]=0.0;
                ConeInfo[i][sY]=0.0;
                ConeInfo[i][sZ]=0.0;
                DestroyObject(ConeInfo[i][sObject]);
                return 1;
  	        }
  	    }
  	}
    return 0;
}

encode_tires(tires1, tires2, tires3, tires4) {

	return tires1 | (tires2 << 1) | (tires3 << 2) | (tires4 << 3);

}

getrem(a,b) //get remnant of division
{
	new div = a/b;
	new left = a-b*div;
	return left;
}

stock SetPlayerMoney(playerid)
{
	GivePlayerMoney(playerid, PlayerInfo[playerid][pCash]-GetPlayerMoney(playerid));
	return 1;
}

stock strreplace(string[], find, replace)
{
    for(new i=0; string[i]; i++)
    {
        if(string[i] == find)
        {
            string[i] = replace;
        }
    }
}

stock GetName(playerid)
{
    new
        name[24];
    GetPlayerName(playerid, name, sizeof(name));
    strreplace(name, '_', ' ');
    return name;
}

stock ProxDetector(Float:radi, playerid, string[],color)
{
    new Float:x,Float:y,Float:z;
    GetPlayerPos(playerid,x,y,z);
    foreach(Player,i)
    {
        if(IsPlayerInRangeOfPoint(i,radi,x,y,z))
        {
            SendClientMessage(i,color,string);
        }
    }
}

stock GetRankName(playerid)
{
	new string[56];
	new faction;
	new rank;
	faction = PlayerInfo[playerid][pFaction];
	rank = PlayerInfo[playerid][pFacRank];

	if(faction == 1 && rank == 0)
	{
	    string = "Cadet";
	}
	if(faction == 1 && rank == 1)
	{
	    string = "Officer";
	}
	if(faction == 1 && rank == 2)
	{
	    string = "Corporal";
	}
	if(faction == 1 && rank == 3)
	{
	    string = "Sergeant";
	}
	if(faction == 1 && rank == 4)
	{
	    string = "Lieutenant";
	}
	if(faction == 1 && rank == 5)
	{
	    string = "Captain";
	}
	if(faction == 1 && rank == 6)
	{
	    string = "Chief";
	}

	if(faction == 2 && rank == 0)
	{
	    string = "Intern";
	}
	if(faction == 2 && rank == 1)
	{
	    string = "Agent";
	}
	if(faction == 2 && rank == 2)
	{
	    string = "Senior Agent";
	}
	if(faction == 2 && rank == 3)
	{
	    string = "Special Agent";
	}
	if(faction == 2 && rank == 4)
	{
	    string = "Supervisory Agent";
	}
	if(faction == 2 && rank == 5)
	{
	    string = "Assistant Director";
	}
	if(faction == 2 && rank == 6)
	{
	    string = "Director";
	}

	if(faction == 3 && rank == 0)
	{
	    string = "Probationary";
	}
	if(faction == 3 && rank == 1)
	{
	    string = "EMT Intermediate";
	}
	if(faction == 3 && rank == 2)
	{
	    string = "EMT Paramedic";
	}
	if(faction == 3 && rank == 3)
	{
	    string = "Lieutenant";
	}
	if(faction == 3 && rank == 4)
	{
	    string = "Captain";
	}
	if(faction == 3 && rank == 5)
	{
	    string = "Deputy Chief";
	}
	if(faction == 3 && rank == 6)
	{
	    string = "Chief";
	}
	if(faction == 4 && rank == 0)
	{
		string = "Freelancer";
	}
	if(faction == 4 && rank == 1)
	{
		string = "Freelancer";
	}
	if(faction == 4 && rank == 2)
	{
		string = "Marksman";
	}
	if(faction == 4 && rank == 3)
	{
		string = "Agent";
	}
	if(faction == 4 && rank == 4)
	{
		string = "Special Agent";
	}
	if(faction == 4 && rank == 5)
	{
		string = "Vice Director";
	}
	if(faction == 4 && rank == 6)
	{
		string = "Director";
	}
	if(faction == 0)
	{
	    string = "None";
	}
	return string;
}

stock GetFactionNameEx(amount)
{
	new string[56];
	if(amount == 1)
	{
	    string = "Los Santos Police Department";
	}
	if(amount == 2)
	{
	    string = "Federal Bureau of Investigation";
	}
	if(amount == 3)
	{
	    string = "Los Santos Fire and Medical Department";
	}
	if(amount == 4)
	{
	    string = "Hitman Agency";
	}
	if(amount == 5)
	{
	    string = "Government";
		return string;
	}
	if(amount == 6)
	{
	    string = "SA News";
	}
	return string;
}
stock GetFactionName(playerid)
{
	new string[56];
	if(PlayerInfo[playerid][pFaction] == 1)
	{
	    string = "Los Santos Police Department";
	}
	if(PlayerInfo[playerid][pFaction] == 2)
	{
	    string = "Federal Bureau of Investigation";
	}
	if(PlayerInfo[playerid][pFaction] == 3)
	{
	    string = "Los Santos Fire and Medical Department";
	}
	if(PlayerInfo[playerid][pFaction] == 4)
	{
	    string = "Hitman";
	}
	if(PlayerInfo[playerid][pFaction] == 5)
	{
	    string = "Government";
		return string;
	}
	if(PlayerInfo[playerid][pFaction] == 6)
	{
	    string = "SA News";
	}
	return string;
}

stock GetDivisionName(playerid)
{
	new string[56];
	if(PlayerInfo[playerid][pFaction] == 1)
	{
		switch(PlayerInfo[playerid][pFacDiv])
		{
			case 1:
			string = "SWAT";
			case 2:
			string = "TE";
			case 3:
			string = "FTO";
			case 4:
			string = "IA";
			default:
			string = "None";
		}
	}

	if(PlayerInfo[playerid][pFaction] == 2)
	{
		switch(PlayerInfo[playerid][pFacDiv])
		{
			case 1:
			string = "FAN";
			case 2:
			string = "GU";
			case 3:
			string = "IA";
			default:
			string = "None";
		}
	}

	if(PlayerInfo[playerid][pFaction] == 3)
	{
		switch(PlayerInfo[playerid][pFacDiv])
		{
			case 1:
			string = "Human Resources";
			case 2:
			string = "Life Flight";
			default:
			string = "None";
		}
	}

	if(PlayerInfo[playerid][pFaction] == 4)
	{
		switch(PlayerInfo[playerid][pFacDiv])
		{
			default:
			string = "None";
		}
	}

	if(PlayerInfo[playerid][pFaction] == 5)
	{
		switch(PlayerInfo[playerid][pFacDiv])
		{
			case 1:
			string = "Legislative Branch";
			case 2:
			string = "Executive Branch";
			case 3:
			string = "Secret Service";
			case 4:
			string = "Judicial";
			default:
			string = "None";
		}
	}

	if(PlayerInfo[playerid][pFaction] == 6)
	{
		switch(PlayerInfo[playerid][pFacDiv])
		{
			default:
			string = "None";
		}
	}
	return string;
}

stock ShowStats(playerid,targetid)
{
	new string[128];
	format(string, sizeof(string), "~~Stats of %s~~", GetName(targetid));
	SendClientMessage(playerid, COLOR_RED, string);
	new hTime = PlayerInfo[targetid][pHours]/60/60;
	format(string, sizeof(string), "Level: %i - Playing Hours: %i - Job: %s - Materials: %i", PlayerInfo[targetid][pLevel], hTime, GetJobName(targetid), PlayerInfo[targetid][pMaterials]);
	SendClientMessage(playerid, COLOR_GREEN, string);
	format(string, sizeof(string), "Total Wealth: $%i - Money: $%i - Bank: $%i - Total Wanted: %i", PlayerInfo[targetid][pCash]+PlayerInfo[targetid][pBank], PlayerInfo[targetid][pCash], PlayerInfo[targetid][pBank], PlayerInfo[targetid][pTotWanted]);
	SendClientMessage(playerid, COLOR_GREEN, string);
	format(string, sizeof(string), "Spraycans: %i - Number: %i", PlayerInfo[targetid][pSpraycan], PlayerInfo[targetid][pPhone]);
	SendClientMessage(playerid, COLOR_GREEN, string);
	if(PlayerInfo[targetid][pFaction] != 0)
	{
		format(string, sizeof(string), "Faction: %s - Rank: %s - Division: %s", GetFactionName(targetid), GetRankName(targetid), GetDivisionName(targetid));
		SendClientMessage(playerid, COLOR_GREEN, string);
	}
	else
	{
		SendClientMessage(playerid, COLOR_GREEN, "Faction: None - Rank: 0 - Division: None");
	}
}

stock GetJobName(playerid)
{
	new jobname[26];
	switch(PlayerInfo[playerid][pJob])
	{
	    case 0:
	    jobname = "None";
		case 1:
		jobname = "Trucker";
		case 2:
		jobname = "Bodyguard";
 		case 3:
		jobname = "Weapon Dealer";
		default:
		jobname = "None";
	}
	return jobname;
}


stock UserPath(playerid)
{
    new string[128],playername[MAX_PLAYER_NAME];
    GetPlayerName(playerid,playername,sizeof(playername));
    format(string,sizeof(string),PATH,playername);
    return string;
}

stock udb_hash(buf[]) {
    new length=strlen(buf);
    new s1 = 1;
    new s2 = 0;
    new n;
    for (n=0; n<length; n++)
    {
       s1 = (s1 + buf[n]) % 65521;
       s2 = (s2 + s1)     % 65521;
    }
    return (s2 << 16) + s1;
}

stock IsACopCar(carid)
{
	for(new v = 0; v < sizeof(LSPDVeh); v++) {
	    if(carid == LSPDVeh[v]) return 1;
	}
	return 0;
}

stock IsAnAmbulance(carid)
{
	for(new v = 0; v < sizeof(LSFMDVeh); v++) {
	    if(carid == LSFMDVeh[v]) return 1;
	}
	return 0;
}

stock IsADSV(carid)
{
	for(new v = 0; v < sizeof(DSV); v++) {
	    if(carid == DSV[v]) return 1;
	}
	return 0;
}

stock IsA1Truck(carid)
{
	for(new v = 0; v < sizeof(level1Trucks); v++) {
	    if(carid == level1Trucks[v]) return 1;
	}
	return 0;
}

stock IsA2Truck(carid)
{
	for(new v = 0; v < sizeof(level2Trucks); v++) {
	    if(carid == level2Trucks[v]) return 1;
	}
	return 0;
}


stock IsA3Truck(carid)
{
	for(new v = 0; v < sizeof(level3Trucks); v++) {
	    if(carid == level3Trucks[v]) return 1;
	}
	return 0;
}

stock IsA5Truck(carid)
{
	for(new v = 0; v < sizeof(level5Trucks); v++) {
	    if(carid == level5Trucks[v]) return 1;
	}
	return 0;
}

stock IsATrailer(carid)
{
	for(new v = 0; v < sizeof(trailers); v++)
	{
	    if(carid == trailers[v]) return 1;
	}
	return 0;
}
stock IsATruck(carid)
{
	for(new v = 0; v < sizeof(level3Trucks); v++) {
	    if(carid == level5Trucks[v]) return 1;
	    if(carid == level3Trucks[v]) return 1;
 		if(carid == level1Trucks[v]) return 1;
 		if(carid == level2Trucks[v]) return 1;
	}
	return 0;
}

stock IsVehicleOccupied(vehicleid)
{
    for(new i; i < GetMaxPlayers(); i++)
    {
        if(IsPlayerConnected(i)) continue;
        if(GetPlayerVehicleID(i) == vehicleid) return 1;
    }
    return 0;
}

stock IsNearAGate(playerid)
{
    if(IsPlayerInRangeOfPoint(playerid, 6, 1544.79, -1627.07, 13.37)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 6, 1544.8, -1627.0, 13.38)) return 1;
    return 0;
}

stock UnloadChar(playerid)
{
	 OnCall[playerid] = -1;
     medicCP[playerid] = -1;
	 CPT[playerid] = 0;
	 truckloadedon[playerid] = -1;
	 truckloaded[playerid] = 0;
	 KillTimer(rtimer[playerid]);
	 KillTimer(itimer[playerid]);
	 KillTimer(iitimer[playerid]);
	 Connected[playerid] = 0;
	 AdminDuty[playerid] = 0;
	 togdr[playerid] = 0;
	 tazer[playerid] = 0;
	 weaponbeingoffered[playerid] = 0;
	 beingofferedby[playerid] = -1;
	 tazerreplace[playerid] = 0;
	 waitcheck[playerid] = 0;
	 badge[playerid] = 0;
	 cardetain[playerid] = -1;
	 as[playerid] = 0;
	 beingdragged[playerid] = -1;
	 togo[playerid] = 0;
	 skipacheck[playerid] = 0;
	 invitedby[playerid] = -1;
     invitedto[playerid] = 0;
	 tognewbie[playerid] = 0;
     NoNewb[playerid] = 0;
	 return 1;
}

//

forward LoadUser_data(playerid,name[],value[]);
public LoadUser_data(playerid,name[],value[])
{
    INI_Int("Password",PlayerInfo[playerid][pPass]);
    INI_Int("Cash",PlayerInfo[playerid][pCash]);
    INI_Int("Admin",PlayerInfo[playerid][pAdmin]);
    INI_Int("Kills",PlayerInfo[playerid][pKills]);
    INI_Int("Deaths",PlayerInfo[playerid][pDeaths]);
    INI_Int("Faction",PlayerInfo[playerid][pFaction]);
    INI_Int("FactionRank",PlayerInfo[playerid][pFacRank]);
    INI_Int("FactionDivision",PlayerInfo[playerid][pFacDiv]);
    INI_Int("FactionLeader",PlayerInfo[playerid][pFacLeader]);
    INI_Int("Skin",PlayerInfo[playerid][pSkin]);
    INI_Float("PosX",PlayerInfo[playerid][pX]);
    INI_Float("PosY",PlayerInfo[playerid][pY]);
    INI_Float("PosZ",PlayerInfo[playerid][pZ]);
    INI_Int("Level",PlayerInfo[playerid][pLevel]);
    INI_Int("Bank",PlayerInfo[playerid][pBank]);
    INI_Int("Job",PlayerInfo[playerid][pJob]);
	INI_Int("TruckerSkill",PlayerInfo[playerid][pTruckerSkill]);
	INI_Int("WeaponDealerSkill",PlayerInfo[playerid][pWDealerSkill]);
	INI_Int("Banned",PlayerInfo[playerid][pBanned]);
    INI_Int("PlayingHours",PlayerInfo[playerid][pHours]);
    INI_Int("Interior",PlayerInfo[playerid][pInt]);
    INI_Int("VirtualWorld",PlayerInfo[playerid][pVW]);
    INI_Int("IP",PlayerInfo[playerid][pIp]);
    INI_Float("Health",PlayerInfo[playerid][pHealth]);
    INI_Float("Armor",PlayerInfo[playerid][pArmor]);
    INI_Int("Gun1",PlayerInfo[playerid][pGuns][0]);
    INI_Int("Gun2",PlayerInfo[playerid][pGuns][1]);
    INI_Int("Gun3",PlayerInfo[playerid][pGuns][2]);
    INI_Int("Gun4",PlayerInfo[playerid][pGuns][3]);
    INI_Int("Gun5",PlayerInfo[playerid][pGuns][4]);
    INI_Int("Gun6",PlayerInfo[playerid][pGuns][5]);
    INI_Int("Gun7",PlayerInfo[playerid][pGuns][6]);
    INI_Int("Gun8",PlayerInfo[playerid][pGuns][7]);
    INI_Int("Gun9",PlayerInfo[playerid][pGuns][8]);
    INI_Int("Gun10",PlayerInfo[playerid][pGuns][9]);
    INI_Int("Gun11",PlayerInfo[playerid][pGuns][10]);
    INI_Int("Gun12",PlayerInfo[playerid][pGuns][11]);
	INI_Int("Materials",PlayerInfo[playerid][pMaterials]);
	INI_Int("Wanted",PlayerInfo[playerid][pWanted]);
	INI_String("WantedReason1",PlayerInfo[playerid][pW1], 24);
	INI_String("WantedReason2",PlayerInfo[playerid][pW2], 24);
	INI_String("WantedReason3",PlayerInfo[playerid][pW3], 24);
	INI_String("WantedReason4",PlayerInfo[playerid][pW4], 24);
	INI_String("WantedReason5",PlayerInfo[playerid][pW5], 24);
	INI_String("WantedReason6",PlayerInfo[playerid][pW6], 24);
	INI_Int("TotalWanted",PlayerInfo[playerid][pTotWanted]);
	INI_Int("Jail",PlayerInfo[playerid][pJail]);
	INI_String("AdminName",PlayerInfo[playerid][pAName], 24);
	INI_String("Name",PlayerInfo[playerid][pName], 70);
	INI_Int("Bail",PlayerInfo[playerid][pBail]);
	INI_Int("TotalDeliveries",PlayerInfo[playerid][pTotDel]);
	INI_Int("Helper",PlayerInfo[playerid][pHelper]);
	INI_Int("Phone",PlayerInfo[playerid][pPhone]);
	INI_Int("Spraycan",PlayerInfo[playerid][pSpraycan]);
	INI_Int("NewbMute",PlayerInfo[playerid][pNewbMute]);
	INI_Int("Vehicle1",PlayerInfo[playerid][pVehicle][0]);
	INI_Int("Vehicle2",PlayerInfo[playerid][pVehicle][1]);
	INI_Int("Vehicle3",PlayerInfo[playerid][pVehicle][2]);
	INI_Int("Vehicle4",PlayerInfo[playerid][pVehicle][3]);
	INI_Int("Vehicle5",PlayerInfo[playerid][pVehicle][4]);
	INI_Float("Vehicle1PosX", PlayerInfo[playerid][pVehiclePosX][0]);
	INI_Float("Vehicle1PosY", PlayerInfo[playerid][pVehiclePosY][0]);
	INI_Float("Vehicle1PosZ", PlayerInfo[playerid][pVehiclePosZ][0]);
	INI_Float("Vehicle1Rot", PlayerInfo[playerid][pVehicleRot][0]);
	INI_Int("Vehicle1Col1", PlayerInfo[playerid][pVehicleCol1][0]);
	INI_Int("Vehicle1Col2", PlayerInfo[playerid][pVehicleCol1][0]);
	INI_Float("Vehicle2PosX", PlayerInfo[playerid][pVehiclePosX][1]);
	INI_Float("Vehicle2PosY", PlayerInfo[playerid][pVehiclePosY][1]);
	INI_Float("Vehicle2PosZ", PlayerInfo[playerid][pVehiclePosZ][1]);
	INI_Float("Vehicle2Rot", PlayerInfo[playerid][pVehicleRot][1]);
	INI_Int("Vehicle2Col1", PlayerInfo[playerid][pVehicleCol2][1]);
	INI_Int("Vehicle2Col2", PlayerInfo[playerid][pVehicleCol2][1]);
	INI_Float("Vehicle3PosX", PlayerInfo[playerid][pVehiclePosX][2]);
	INI_Float("Vehicle3PosY", PlayerInfo[playerid][pVehiclePosY][2]);
	INI_Float("Vehicle3PosZ", PlayerInfo[playerid][pVehiclePosZ][2]);
	INI_Float("Vehicle3Rot", PlayerInfo[playerid][pVehicleRot][2]);
	INI_Int("Vehicle3Col1", PlayerInfo[playerid][pVehicleCol2][2]);
	INI_Int("Vehicle3Col2", PlayerInfo[playerid][pVehicleCol2][2]);
	INI_Float("Vehicle4PosX", PlayerInfo[playerid][pVehiclePosX][3]);
	INI_Float("Vehicle4PosY", PlayerInfo[playerid][pVehiclePosY][3]);
	INI_Float("Vehicle4PosZ", PlayerInfo[playerid][pVehiclePosZ][3]);
	INI_Float("Vehicle4Rot", PlayerInfo[playerid][pVehicleRot][3]);
	INI_Int("Vehicle4Col1", PlayerInfo[playerid][pVehicleCol2][3]);
	INI_Int("Vehicle4Col2", PlayerInfo[playerid][pVehicleCol2][3]);
	INI_Float("Vehicle5PosX", PlayerInfo[playerid][pVehiclePosX][4]);
	INI_Float("Vehicle5PosY", PlayerInfo[playerid][pVehiclePosY][4]);
	INI_Float("Vehicle5PosZ", PlayerInfo[playerid][pVehiclePosZ][4]);
	INI_Float("Vehicle5Rot", PlayerInfo[playerid][pVehicleRot][4]);
	INI_Int("Vehicle5Col1", PlayerInfo[playerid][pVehicleCol1][4]);
	INI_Int("Vehicle5Col2", PlayerInfo[playerid][pVehicleCol2][4]);
	INI_Int("Contracted", PlayerInfo[playerid][pContracted]);
	INI_String("ContractReason", PlayerInfo[playerid][pContractReason], 124);
	INI_Int("ContractAmount", PlayerInfo[playerid][pContractAmount]);
	INI_String("ContractedBy", PlayerInfo[playerid][pContractedBy], 124);
	INI_Int("Success", PlayerInfo[playerid][pSuccess]);
	INI_Int("Failed", PlayerInfo[playerid][pFailed]);
    return 1;
}

forward SkipACheck(playerid);
public SkipACheck(playerid)
{
    skipacheck[playerid] = 2;
	return 1;
}

forward SkipWepCheck(playerid);
public SkipWepCheck(playerid)
{
    waitcheck[playerid] = 2;
	return 1;
}

forward arrestrelease(playerid);
public arrestrelease(playerid)
{
	if(PlayerInfo[playerid][pJail] == 0)
	{
	    KillTimer(rtimer[playerid]);
		return 1;
	}
	if(PlayerInfo[playerid][pJail] > 1)
	{
		PlayerInfo[playerid][pJail] -= 1;
		return 1;
	}
	if(PlayerInfo[playerid][pJail] <= 1)
	{
		SetPlayerPos(playerid, 247.37, 67.92, 1003.64);
		SetPlayerInterior(playerid, 6);
		SetPlayerVirtualWorld(playerid, 1337);
		PlayerInfo[playerid][pJail] = 0;
		PlayerInfo[playerid][pVW] = 1337;
		PlayerInfo[playerid][pInt] = 6;
		GameTextForPlayer(playerid, "Released. Try to be good now.", 5000, 3);
		SendClientMessage(playerid, COLOR_CYAN, "You have finished your jail sentence.");
		SetPlayerColor(playerid, 0xFFFFFF00);
		KillTimer(rtimer[playerid]);
	}
	return 1;
}

forward SaveChar(playerid);
public SaveChar(playerid)
{
	if(!IsPlayerConnected(playerid)) return 1;
	if(GetPVarInt(playerid, "prelogin") == 1) return print("Did not save, not logged in.");
	if(GetPVarInt(playerid, "Quiz") == 1) return print("Did not save, in quiz.");
	if(Connected[playerid] != 1) return print("Did not save, not logged in.");
	if(AdminDuty[playerid] == 1) return print("Did not save, admin duty.");
	GetPlayerPos(playerid, PlayerInfo[playerid][pX], PlayerInfo[playerid][pY], PlayerInfo[playerid][pZ]);
	new INI:File = INI_Open(UserPath(playerid));
	new Float:hp;
	GetPlayerIp(playerid, PlayerInfo[playerid][pIp], 50);
	GetPlayerHealth(playerid, hp);
	GetPlayerName(playerid, PlayerInfo[playerid][pName], 70);
    INI_SetTag(File,"data");
    if(pass[playerid] != -1 && GetPVarInt(playerid, "RecentlyChangedName") == 1)
    {
    INI_WriteInt(File,"Password",pass[playerid]);
    }
    INI_WriteInt(File,"Cash",PlayerInfo[playerid][pCash]);
    INI_WriteInt(File,"Admin",PlayerInfo[playerid][pAdmin]);
    INI_WriteInt(File,"Kills",PlayerInfo[playerid][pKills]);
    INI_WriteInt(File,"Deaths",PlayerInfo[playerid][pDeaths]);
    INI_WriteInt(File,"Faction",PlayerInfo[playerid][pFaction]);
	INI_WriteInt(File,"FactionRank",PlayerInfo[playerid][pFacRank]);
	INI_WriteInt(File,"FactionDivision",PlayerInfo[playerid][pFacDiv]);
	INI_WriteInt(File,"FactionLeader",PlayerInfo[playerid][pFacLeader]);
	INI_WriteInt(File,"Skin",PlayerInfo[playerid][pSkin]);
	INI_WriteFloat(File,"PosX",PlayerInfo[playerid][pX]);
	INI_WriteFloat(File,"PosY",PlayerInfo[playerid][pY]);
	INI_WriteFloat(File,"PosZ",PlayerInfo[playerid][pZ]);
	INI_WriteInt(File,"Level",PlayerInfo[playerid][pLevel]);
	INI_WriteInt(File,"Bank",PlayerInfo[playerid][pBank]);
	INI_WriteInt(File,"Job",PlayerInfo[playerid][pJob]);
	INI_WriteInt(File,"TruckerSkill",PlayerInfo[playerid][pTruckerSkill]);
	INI_WriteInt(File,"WeaponDealerSkill",PlayerInfo[playerid][pWDealerSkill]);
	INI_WriteInt(File,"Banned",PlayerInfo[playerid][pBanned]);
	INI_WriteInt(File,"PlayingHours",PlayerInfo[playerid][pHours]);
	INI_WriteInt(File,"Interior",GetPlayerInterior(playerid));
	INI_WriteInt(File,"VirtualWorld",GetPlayerVirtualWorld(playerid));
	INI_WriteInt(File,"Gun1",PlayerInfo[playerid][pGuns][0]);
	INI_WriteInt(File,"Gun2",PlayerInfo[playerid][pGuns][1]);
	INI_WriteInt(File,"Gun3",PlayerInfo[playerid][pGuns][2]);
	INI_WriteInt(File,"Gun4",PlayerInfo[playerid][pGuns][3]);
	INI_WriteInt(File,"Gun5",PlayerInfo[playerid][pGuns][4]);
	INI_WriteInt(File,"Gun6",PlayerInfo[playerid][pGuns][5]);
	INI_WriteInt(File,"Gun7",PlayerInfo[playerid][pGuns][6]);
	INI_WriteInt(File,"Gun8",PlayerInfo[playerid][pGuns][7]);
	INI_WriteInt(File,"Gun9",PlayerInfo[playerid][pGuns][8]);
	INI_WriteInt(File,"Gun10",PlayerInfo[playerid][pGuns][9]);
	INI_WriteInt(File,"Gun11",PlayerInfo[playerid][pGuns][10]);
	INI_WriteInt(File,"Gun12",PlayerInfo[playerid][pGuns][11]);
	INI_WriteInt(File,"Materials",PlayerInfo[playerid][pMaterials]);
	INI_WriteInt(File,"Wanted",PlayerInfo[playerid][pWanted]);
	INI_WriteString(File,"WantedReason1",PlayerInfo[playerid][pW1]);
	INI_WriteString(File,"WantedReason2",PlayerInfo[playerid][pW2]);
	INI_WriteString(File,"WantedReason3",PlayerInfo[playerid][pW3]);
	INI_WriteString(File,"WantedReason4",PlayerInfo[playerid][pW4]);
	INI_WriteString(File,"WantedReason5",PlayerInfo[playerid][pW5]);
	INI_WriteString(File,"WantedReason6",PlayerInfo[playerid][pW6]);
	INI_WriteInt(File,"TotalWanted",PlayerInfo[playerid][pTotWanted]);
	INI_WriteInt(File,"Jail",PlayerInfo[playerid][pJail]);
	INI_WriteInt(File,"Bail",PlayerInfo[playerid][pBail]);
	INI_WriteString(File,"AdminName",PlayerInfo[playerid][pAName]);
	INI_WriteString(File,"Name",PlayerInfo[playerid][pName]);
	INI_WriteFloat(File,"Health",hp);
	if(GetPVarInt(playerid, "Injured") == 1 || GetPVarInt(playerid, "Recovering") == 1)
	{
	INI_WriteFloat(File,"Health",-1337);
	}
	INI_WriteFloat(File,"Armor",PlayerInfo[playerid][pArmor]);
	INI_WriteString(File,"IP",PlayerInfo[playerid][pIp]);
	INI_WriteInt(File,"TotalDeliveries",PlayerInfo[playerid][pTotDel]);
	INI_WriteInt(File,"Helper",PlayerInfo[playerid][pHelper]);
	INI_WriteInt(File,"Phone",PlayerInfo[playerid][pPhone]);
	INI_WriteInt(File,"Spraycan",PlayerInfo[playerid][pSpraycan]);
	INI_WriteInt(File,"NewbMute",PlayerInfo[playerid][pNewbMute]);
	INI_WriteInt(File,"Vehicle1",PlayerInfo[playerid][pVehicle][0]);
	INI_WriteInt(File,"Vehicle2",PlayerInfo[playerid][pVehicle][1]);
	INI_WriteInt(File,"Vehicle3",PlayerInfo[playerid][pVehicle][2]);
	INI_WriteInt(File,"Vehicle4",PlayerInfo[playerid][pVehicle][3]);
	INI_WriteInt(File,"Vehicle5",PlayerInfo[playerid][pVehicle][4]);
	INI_WriteFloat(File,"Vehicle1PosX",PlayerInfo[playerid][pVehiclePosX][0]);
	INI_WriteFloat(File,"Vehicle1PosY",PlayerInfo[playerid][pVehiclePosY][0]);
	INI_WriteFloat(File,"Vehicle1PosZ",PlayerInfo[playerid][pVehiclePosZ][0]);
	INI_WriteFloat(File,"Vehicle1Rot",PlayerInfo[playerid][pVehicleRot][0]);
	INI_WriteInt(File,"Vehicle1Col1",PlayerInfo[playerid][pVehicleCol1][0]);
	INI_WriteInt(File,"Vehicle1Col2",PlayerInfo[playerid][pVehicleCol2][0]);
	INI_WriteFloat(File,"Vehicle2PosX",PlayerInfo[playerid][pVehiclePosX][1]);
	INI_WriteFloat(File,"Vehicle2PosY",PlayerInfo[playerid][pVehiclePosY][1]);
	INI_WriteFloat(File,"Vehicle2PosZ",PlayerInfo[playerid][pVehiclePosZ][1]);
	INI_WriteFloat(File,"Vehicle2Rot",PlayerInfo[playerid][pVehicleRot][1]);
	INI_WriteInt(File,"Vehicle2Col1",PlayerInfo[playerid][pVehicleCol1][1]);
	INI_WriteInt(File,"Vehicle2Col2",PlayerInfo[playerid][pVehicleCol2][1]);
	INI_WriteFloat(File,"Vehicle3PosX",PlayerInfo[playerid][pVehiclePosX][2]);
	INI_WriteFloat(File,"Vehicle3PosY",PlayerInfo[playerid][pVehiclePosY][2]);
	INI_WriteFloat(File,"Vehicle3PosZ",PlayerInfo[playerid][pVehiclePosZ][2]);
	INI_WriteFloat(File,"Vehicle3Rot",PlayerInfo[playerid][pVehicleRot][2]);
	INI_WriteInt(File,"Vehicle3Col1",PlayerInfo[playerid][pVehicleCol1][2]);
	INI_WriteInt(File,"Vehicle3Col2",PlayerInfo[playerid][pVehicleCol2][2]);
	INI_WriteFloat(File,"Vehicle4PosX",PlayerInfo[playerid][pVehiclePosX][3]);
	INI_WriteFloat(File,"Vehicle4PosY",PlayerInfo[playerid][pVehiclePosY][3]);
	INI_WriteFloat(File,"Vehicle4PosZ",PlayerInfo[playerid][pVehiclePosZ][3]);
	INI_WriteFloat(File,"Vehicle4Rot",PlayerInfo[playerid][pVehicleRot][3]);
	INI_WriteInt(File,"Vehicle4Col1",PlayerInfo[playerid][pVehicleCol1][3]);
	INI_WriteInt(File,"Vehicle4Col2",PlayerInfo[playerid][pVehicleCol2][3]);
	INI_WriteFloat(File,"Vehicle5PosX",PlayerInfo[playerid][pVehiclePosX][4]);
	INI_WriteFloat(File,"Vehicle5PosY",PlayerInfo[playerid][pVehiclePosY][4]);
	INI_WriteFloat(File,"Vehicle5PosZ",PlayerInfo[playerid][pVehiclePosZ][4]);
	INI_WriteFloat(File,"Vehicle5Rot",PlayerInfo[playerid][pVehicleRot][4]);
	INI_WriteInt(File,"Vehicle5Col1",PlayerInfo[playerid][pVehicleCol1][4]);
	INI_WriteInt(File,"Vehicle5Col2",PlayerInfo[playerid][pVehicleCol2][4]);
	INI_WriteInt(File,"Contracted",PlayerInfo[playerid][pContracted]);
	INI_WriteString(File,"ContractReason", PlayerInfo[playerid][pContractReason]);
	INI_WriteInt(File,"ContractAmount",PlayerInfo[playerid][pContractAmount]);
	INI_WriteString(File,"ContractedBy", PlayerInfo[playerid][pContractedBy]);
	INI_WriteInt(File,"Success", PlayerInfo[playerid][pSuccess]);
	INI_WriteInt(File,"Failed", PlayerInfo[playerid][pFailed]);
    INI_Close(File);
    new string[100];
	format(string, 100, "%s's character has saved successfully.", GetName(playerid));
	print(string);
    return 1;
}

main()
{
	print("\n----------------------------------");
	print(" <SHOCK> Roleplay by Alex Shock");
	print("----------------------------------\n");
}

/*
C
O
M
M
A
N
D
S
*/

forward AbleNewb(playerid);
public AbleNewb(playerid)
{
    NoNewb[playerid] = 0;
	return 1;
}

CMD:gmx(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, COLOR_GREY, "You are not authorized to do this.");
	SendRconCommand("gmx");
	return 1;
}

CMD:makeleader(playerid, params[])
{
	new giveplayerid, fac, str[126];
	if(PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, COLOR_GREY, "You are not authorized to do this.");
	if(sscanf(params, "ui", giveplayerid, fac)) return SendClientMessage(playerid, -1, "USAGE: /makeleader [playerid/partofname] [faction]");
	if(fac < 1 || fac > 5) return SendClientMessage(playerid, -1, "Valid faction number is 1-5");
	PlayerInfo[playerid][pFacLeader] = fac;
	PlayerInfo[playerid][pFaction] = fac;
	PlayerInfo[playerid][pFacRank] = 6;
	format(str, sizeof(str), "You have been give leadership powers over %s by %s.", GetFactionName(giveplayerid), GetName(playerid));
	SendClientMessage(giveplayerid, COLOR_CYAN, str);
	format(str, sizeof(str), "You have give %s leadership powers over %s.", GetFactionName(giveplayerid), GetName(playerid));
	SendClientMessage(playerid, -1, str);
	return 1;
}

CMD:quitevent(playerid, params[])
{
	if(GetPVarInt(playerid, "InEvent") == 1)
	{
	    ResetPlayerWeapons(playerid);
		SkipWepCheck(playerid);
		SkipACheck(playerid);
		SetPVarInt(playerid, "InEvent", 0);
 		SetPlayerInterior(playerid, oINT[playerid]);
	   	SetPlayerVirtualWorld(playerid, oVW[playerid]);
	   	SetPlayerPos(playerid, oX[playerid], oY[playerid], oZ[playerid]);
	   	SetPlayerHealth(playerid, oHP[playerid]);
      	PlayerInfo[playerid][pArmor] = oA[playerid];
	   	SetPlayerArmour(playerid, oA[playerid]);
	   	SetPlayerSkin(playerid, oSkin[playerid]);
	   	SetPlayerWeaponsEx(playerid);
	   	SendClientMessage(playerid, -1, "You left the event.");
	}
	return 1;
}

CMD:debug(playerid, params[])
{
	new str[126];
	SendClientMessage(playerid, -1, "|________Spawned Vehicles________|");
	for(new y;y<MAX_PLAYER_VEHICLES;y++)
	{
	    if(PlayerInfo[playerid][pVehicleSpawned][y] == 1)
	    {
	    	format(str, sizeof(str), "pVehicleSpawned[%i] == %i", y, PlayerInfo[playerid][pVehicleSpawned][y]);
   		 	SendClientMessage(playerid, -1, str);
	    	format(str, sizeof(str), "pVehicleSpawnedID[%i] == %i", y, PlayerInfo[playerid][pVehicleSpawnedID][y]);
	    	SendClientMessage(playerid, -1, str);
		}
	}
	SendClientMessage(playerid, -1, "|________________________________|");
	return 1;
}

CMD:buydrink(playerid, params[])
{
	if(!isNearBar(playerid)) return SendClientMessage(playerid, -1, "You are not at a bar counter.");
	ShowPlayerDialog(playerid, DIALOG_BAR, DIALOG_STYLE_LIST, "Bar", "Beer ($2)\nWine ($5)\nCocktail ($4)\nPiñacolada ($4)\nMojito ($4)\nCider ($3)\nSprunk ($1)", "Buy", "Close");
	return 1;
}
	

CMD:hstats(playerid, params[])
{
	if(PlayerInfo[playerid][pFaction] != 4 && PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, -1, "You are not in the Hitman Agency.");
	for(new x;x<MAX_PLAYERS;x++)
	{
	    if(PlayerInfo[x][pFaction] == 4)
		{
		    new str[126];
		    format(str, sizeof(str), "%s - Successfull hits: %i - Failed hits: %i", GetName(x), PlayerInfo[x][pSuccess], PlayerInfo[x][pFailed]);
		    SendClientMessage(playerid, COLOR_GRAD1, str);
		}
	}
	return 1;
}

CMD:contract(playerid, params[])
{
	new giveplayerid, name[MAX_PLAYER_NAME], amount, reason[126], str[200];
	if(sscanf(params, "uis[126]", giveplayerid, amount, reason)) return SendClientMessage(playerid, -1, "USAGE: /contract [playerid/partofname] [amount] [reason]");
	if(giveplayerid == playerid) return SendClientMessage(playerid, -1, "You can not contract yourself.");
	if(PlayerInfo[playerid][pCash] < amount) return SendClientMessage(playerid, -1, "You don't have enough money.");
	if(AdminDuty[giveplayerid] == 1) return SendClientMessage(playerid, -1, "The specified player is on admin-duty.");
	if(amount < 2000 || amount > 100000) return SendClientMessage(playerid, -1, "Valid contract amounts are from 2000 to 100,000.");
	PlayerInfo[playerid][pCash] -= amount;
	GetPlayerName(playerid, name, sizeof(name));
	PlayerInfo[giveplayerid][pContracted] = 1;
	format(PlayerInfo[giveplayerid][pContractReason], 164, "%s", reason);
	format(PlayerInfo[giveplayerid][pContractedBy], MAX_PLAYER_NAME, "%s", name);
	PlayerInfo[giveplayerid][pContractAmount] += amount;
	format(str, sizeof(str), "%s has placed a contract on %s for $%i, reason: %s", GetName(playerid), GetName(giveplayerid), amount, reason);
	if(PlayerInfo[playerid][pFaction] != 4)
	{
	SendClientMessageToAdmins(COLOR_YELLOW, str, 4);
	}
	SendClientMessageToHA(COLOR_YELLOW, str);
	return 1;
}

CMD:contracts(playerid, params[])
{
	new str[126];
	if(PlayerInfo[playerid][pFaction] != 4 || PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, -1, "You are not in the Hitman Agency.");
	SendClientMessage(playerid, -1, "|___________________Contracts___________________|");
	for(new x;x<MAX_PLAYERS;x++)
	{
	    if(PlayerInfo[x][pContracted] == 1)
	    {
			format(str, sizeof(str), "Name: %s - Amount: %i - Reason: %s - Contracted by: %s", GetName(x), PlayerInfo[x][pContractAmount], PlayerInfo[x][pContractReason], PlayerInfo[x][pContractedBy]);
			SendClientMessage(playerid, -1, str);
		}
	}
	SendClientMessage(playerid, -1, "|_______________________________________________|");
	return 1;
}

CMD:givemehit(playerid, params[])
{
	new str[126], giveplayerid;
	if(PlayerInfo[playerid][pFaction] != 4) return SendClientMessage(playerid, -1, "You are not in the Hitman Agency.");
	if(sscanf(params, "u", giveplayerid)) return SendClientMessage(playerid, -1, "USAGE: /givemehit [playerid/partofname]");
	if(PlayerInfo[giveplayerid][pContracted] != 1) return SendClientMessage(playerid, -1, "Player does not have a contract on his head.");
	if(AdminDuty[giveplayerid] == 1) return SendClientMessage(playerid, -1, "Specified player is on admin duty.");
	SetPVarInt(playerid, "givemehit", giveplayerid);
	format(str, sizeof(str), "Hitman %s is now after the contracted %s.", GetName(playerid), GetName(giveplayerid));
	SendClientMessageToHA(COLOR_YELLOW, str);
	SendClientMessage(playerid, -1, "You have given yourself the mission to kill the contracted. To accept the hit, /accept hit.");
	SendClientMessageToAll(-1, str);
	return 1;
}


CMD:seteventpos(playerid, params[])
{
	new str[126];
	if(PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, COLOR_GREY, "You are not authorized to use this command.");
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
	EventInfo[eX] = x;
	EventInfo[eY] = y;
	EventInfo[eZ] = z;
	EventInfo[eVW] = GetPlayerVirtualWorld(playerid);
	EventInfo[eINT] = GetPlayerInterior(playerid);
	EventInfo[eSkin] = -1;
	format(str, sizeof(str), "AdmCmd: %s has started an event.", GetName(playerid));
	SendClientMessageToAdmins(COLOR_YELLOW, str, 1);
	return 1;
}

CMD:editevent(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, COLOR_GREY, "You are not authorized to use this command.");
	new choice[126], value[126], wep[67], str[126];
	if(sscanf(params, "s[126]s[126]", choice, value))
	{
		SendClientMessage(playerid, -1, "USAGE: /editevent [choice] [value]");
		SendClientMessage(playerid, -1, "Health, Amor, Skin, Gun1, Gun2, Gun3");
		return 1;
	}
	if(strcmp(choice, "health", true) == 0)
	{
 		EventInfo[eHealth] = strval(value);
 		format(str, sizeof(str), "Event health set to: %i", strval(value));
 		SendClientMessage(playerid, COLOR_GREY, str);
 		return 1;
	}
	if(strcmp(choice, "armor", true) == 0)
	{
		EventInfo[eArmor] = strval(value);
		format(str, sizeof(str), "Event armor set to: %i", strval(value));
		SendClientMessage(playerid, COLOR_GREY, str);
		return 1;
	}
	if(strcmp(choice, "skin", true) == 0)
	{
		EventInfo[eSkin] = strval(value);
		format(str, sizeof(str), "Event skin set to: %i", strval(value));
		SendClientMessage(playerid, COLOR_GREY, str);
		return 1;
	}
	if(strcmp(choice, "gun1", true) == 0)
	{
	    GetWeaponName(strval(value), wep, sizeof(wep));
		EventInfo[eGun1] = strval(value);
		format(str, sizeof(str), "Event gun1 set to: %s", wep);
		SendClientMessage(playerid, COLOR_GREY, str);
		return 1;
	}
	if(strcmp(choice, "gun2", true) == 0)
	{
	    GetWeaponName(strval(value), wep, sizeof(wep));
		EventInfo[eGun2] = strval(value);
		format(str, sizeof(str), "Event gun2 set to: %s", wep);
		SendClientMessage(playerid, COLOR_GREY, str);
		return 1;
	}
	if(strcmp(choice, "gun3", true) == 0)
	{
	    GetWeaponName(strval(value), wep, sizeof(wep));
		EventInfo[eGun3] = strval(value);
		format(str, sizeof(str), "Event gun3 set to: %s", wep);
		SendClientMessage(playerid, COLOR_GREY, str);
		return 1;
	}
	return 1;
}

CMD:startevent(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, COLOR_GREY, "You are not authorized to use this command.");
	if(EventInfo[eHealth] < 1) return SendClientMessage(playerid, -1, "Please set the health above 1.");
	if(EventInfo[eArmor] < 0) return SendClientMessage(playerid, -1, "Please don't set the armour to a negative number.");
	EventInfo[eStarted] = 1;
	SendClientMessage(playerid, COLOR_GREY, "The event is now ready. /announceevent to start it.");
	return 1;
}

CMD:announceevent(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, COLOR_GREY, "You are not authorized to use this command.");
	new str[126];
	if(EventInfo[eAnnounced] == 1) return SendClientMessage(playerid, COLOR_GREY, "The event has already been announced.");
	if(EventInfo[eStarted] != 1) return SendClientMessage(playerid, -1, "Maybe it's wise to start an event before announcing it.");
	format(str, sizeof(str), "An event has been announced by Admin %s, type /joinevent to participate.", GetName(playerid));
	SendClientMessageToAll(COLOR_CYAN, str);
	EventInfo[eAnnounced] = 1;
	return 1;
}

CMD:joinevent(playerid, params[])
{
	if(EventInfo[eAnnounced] != 1) return SendClientMessage(playerid, -1, "No events have been announced.");
	if(EventInfo[eLocked] == 1) return SendClientMessage(playerid, -1, "The event is locked.");
	GetPlayerPos(playerid, oX[playerid], oY[playerid], oZ[playerid]);
	oINT[playerid] = GetPlayerInterior(playerid);
	oVW[playerid] = GetPlayerVirtualWorld(playerid);
	GetPlayerHealth(playerid, oHP[playerid]);
	oA[playerid] = PlayerInfo[playerid][pArmor];
	SetPlayerPos(playerid, EventInfo[eX], EventInfo[eY], EventInfo[eZ]);
	SetPlayerInterior(playerid, EventInfo[eINT]);
	SetPlayerVirtualWorld(playerid, EventInfo[eVW]);
	oSkin[playerid] = GetPlayerSkin(playerid);
	SetPVarInt(playerid, "InEvent", 1);
	SendClientMessage(playerid, -1, "You have joined the event.");
	ResetPlayerWeapons(playerid);
	if(EventInfo[eSkin] != -1)
	{
	    SetPlayerSkin(playerid, EventInfo[eSkin]);
	}
	return 1;
}

CMD:lockevent(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, COLOR_GREY, "You are not authorized to use this command.");
	if(EventInfo[eAnnounced] != 1) return SendClientMessage(playerid, -1, "No events have been announced.");
	if(EventInfo[eLocked] == 1) return SendClientMessage(playerid, -1, "The event is already locked.");
	EventInfo[eLocked] = 1;
	SendClientMessageToAll(COLOR_CYAN, "The event has been locked.");
	SendClientMessage(playerid, -1, "Use /beginevent to begin it.");
	return 1;
}

CMD:beginevent(playerid, params[])
{
	if(EventInfo[eAnnounced] != 1) return SendClientMessage(playerid, -1, "No events have been announced.");
	EventInfo[eBegun] = 1;
	SendClientMessageToAll(COLOR_CYAN, "The event has now started!");
	for(new x;x<MAX_PLAYERS;x++)
	{
	    if(GetPVarInt(x, "InEvent") == 1)
	    {
	        SkipWepCheck(x);
	        SkipACheck(x);
	        PlayerInfo[x][pArmor] = EventInfo[eArmor];
	        GivePlayerWeapon(x, EventInfo[eGun1], 9999);
	        GivePlayerWeapon(x, EventInfo[eGun2], 9999);
	        GivePlayerWeapon(x, EventInfo[eGun3], 9999);
	        SetPlayerHealth(x, EventInfo[eHealth]);
	        SetPlayerArmour(x, EventInfo[eArmor]);

		}
	}
	return 1;
}

CMD:endevent(playerid, params[])
{
	EventInfo[eStarted] = 0;
	EventInfo[eLocked] = 0;
	EventInfo[eAnnounced] = 0;
	EventInfo[eBegun] = 0;
	EventInfo[eHealth] = 0;
	EventInfo[eArmor] = 0;
	EventInfo[eSkin] = 0;
	EventInfo[eX] = 0;
	EventInfo[eY] = 0;
	EventInfo[eZ] = 0;
	EventInfo[eVW] = 0;
	EventInfo[eINT] = 0;
	EventInfo[eGun1] = 0;
	EventInfo[eGun2] = 0;
	EventInfo[eGun3] = 0;
	SendClientMessageToAll(COLOR_CYAN, "The event has ended.");
	for(new x;x<MAX_PLAYERS;x++)
	{
		if(GetPVarInt(x, "InEvent") == 1)
		{
		    ResetPlayerWeapons(x);
			SkipWepCheck(x);
			SkipACheck(x);
  			SetPVarInt(x, "InEvent", 0);
	    	SetPlayerInterior(x, oINT[x]);
	    	SetPlayerVirtualWorld(x, oVW[x]);
	    	SetPlayerPos(x, oX[x], oY[x], oZ[x]);
	    	SetPlayerHealth(x, oHP[x]);
       		PlayerInfo[x][pArmor] = oA[x];
	    	SetPlayerArmour(x, oA[x]);
	    	SetPlayerSkin(x, oSkin[x]);
	    	SetPlayerWeaponsEx(x);
		}
	}
	return 1;
}


CMD:fs(playerid, params[])
{
	new say[126], c;
	if(sscanf(params, "is[126]", c, say)) return SendClientMessage(playerid, -1, "/fs color (1: yellow 2: lightred 3: cyan 4: white) say");
	if(c == 1) return SendClientMessageToAll(COLOR_YELLOW, say);
	if(c == 2) return SendClientMessageToAll(COLOR_LIGHTRED, say);
	if(c == 3) return SendClientMessageToAll(COLOR_CYAN, say);
	if(c == 4) return SendClientMessageToAll(-1, say);
	return 1;
}

CMD:report(playerid, params[])
{
	new report[168], str[168];
	if(sscanf(params, "s[168]", report)) return SendClientMessage(playerid, -1, "USAGE: /report [text]");
	if(reported[playerid] == 1) return SendClientMessage(playerid, -1, "You already have an active report.");
	if(reports > 999) reports = 0;
	reports++;
	reported[playerid] = 1;
	reportid[playerid] = reports;
	format(reporttext[playerid], sizeof(reporttext), "%s [ID: %i] [Report ID: %i]: %s", GetName(playerid), playerid, reports, report);
	format(str, sizeof(str), "Report from %s [ID: %i] [Report ID: %i]: %s", GetName(playerid), playerid, reports, report);
	Log("/logs/reports.txt", reporttext[playerid]);
	SendClientMessageToAdmins(COLOR_CYAN, str, 1);
	return 1;
}

CMD:reports(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_GREY, "You are not authorized to use this command.");
	SendClientMessage(playerid, COLOR_GREEN, "|____________________Reports________________________|");
	for(new x; x<MAX_PLAYERS; x++)
	{
	    if(reported[x] == 1)
		{
			SendClientMessage(playerid, COLOR_LIGHTRED, reporttext[x]);
		}
	}
	SendClientMessage(playerid, COLOR_GREEN, "|___________________________________________________|");
	return 1;
}
	
CMD:ar(playerid, params[])
{
	new rid, str[126];
    if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_GREY, "You are not authorized to use this command.");
   	if(AdminDuty[playerid] != 1 && PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid,COLOR_WHITE, "You are not on duty as an admin, /aduty to go on duty.");
	if(sscanf(params, "i", rid)) return SendClientMessage(playerid, -1, "USAGE: /ar [RID]");
	if(rid == 0) return SendClientMessage(playerid, -1, "Invalid Report ID. Use the report ID - Not the playerid / name.");
	new success = 0;
	for(new p;p<MAX_PLAYERS;p++)
	{
	    if(reportid[p] == rid)
	    {
    		reported[p] = 0;
			reportid[p] = 0;
			format(reporttext[p], sizeof(reporttext), "InvalidReport");
			format(str, sizeof(str), "** %s has accepted the report from %s (ID: %i) - (RID: %i)", GetName(playerid), GetName(p), p, rid);
			SendClientMessageToAdmins(COLOR_ORANGE, str, 1);
			format(str, sizeof(str), "** %s has accepted your report. Use /pm to reply to the admin if needed.", GetName(playerid));
			SendClientMessage(p, COLOR_CYAN, str);
			Log("logs/reports.txt", str);
			success = 1;
			break;
	    }
	}
	if(success == 0) SendClientMessage(playerid, -1, "Invalid Report ID. Use the report ID - Not the playerid / name.");
	return 1;
}

CMD:tr(playerid, params[])
{
	new rid, str[126];
    if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_GREY, "You are not authorized to use this command.");
   	if(AdminDuty[playerid] != 1 && PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid,COLOR_WHITE, "You are not on duty as an admin, /aduty to go on duty.");
	if(sscanf(params, "i", rid)) return SendClientMessage(playerid, -1, "USAGE: /tr [RID]");
	if(rid == 0) return SendClientMessage(playerid, -1, "Invalid Report ID. Use the report ID - Not the playerid / name.");
	new success = 0;
	for(new p;p<MAX_PLAYERS;p++)
	{
	    if(reportid[p] == rid)
	    {
    		reported[p] = 0;
			reportid[p] = 0;
			format(reporttext[p], sizeof(reporttext), "InvalidReport");
			format(str, sizeof(str), "** %s has trashed the report from %s (ID: %i) - (RID: %i)", GetName(playerid), GetName(p), p, rid);
			SendClientMessageToAdmins(COLOR_ORANGE, str, 1);
			format(str, sizeof(str), "** %s has trashed your report.", GetName(playerid));
			SendClientMessage(p, COLOR_CYAN, str);
			Log("logs/reports.txt", str);
			success = 1;
			break;
	    }
	}
	if(success == 0) SendClientMessage(playerid, -1, "Invalid Report ID. Use the report ID - Not the playerid / name.");
	return 1;
}

CMD:checkip(playerid, params[])
{
	new giveplayerid;
	if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessage(playerid, COLOR_GREY, "You are not authorized to use this commands.");
	if(sscanf(params, "u", giveplayerid)) return SendClientMessage(playerid, -1, "USAGE: /checkip [playerid/partofname]");
	new playerIP[16], str[126];
	GetPlayerIp(giveplayerid, playerIP, sizeof(playerIP));
	format(str, sizeof(str), "%s - IP: %s", GetName(giveplayerid), playerIP);
	SendClientMessage(playerid, -1, str);
	return 1;
}
	
    
CMD:nrn(playerid, params[])
{
	new giveplayerid;
	if(PlayerInfo[playerid][pHelper] < 2 && PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_GREY, "You are not authorized to use this command.");
	if(sscanf(params, "u", giveplayerid)) return SendClientMessage(playerid, -1, "USAGE: /nrn [playerid/partofname]");
	if(PlayerInfo[giveplayerid][pHelper] > 0 && PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, -1, "You can't use this command on a helper as a helper.");
	if(PlayerInfo[giveplayerid][pLevel] > 1 && PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, -1, "You can't use this command on players higher than level 1 as a helper");
	if(PlayerInfo[giveplayerid][pAdmin] > 0) return SendClientMessage(playerid, -1, "You can not use this command on an admin");
	ShowPlayerDialog(giveplayerid, DIALOG_CHANGENAME, DIALOG_STYLE_INPUT,""COL_WHITE"Name Change",""COL_WHITE"A helper or admin thinks your name is non-rp and you have to change it.","Change","No!");
	new str[126];
	format(str, sizeof(str), "AdmWarn: %s has forced %s to change his name due to it being non-rp.", GetName(playerid), GetName(giveplayerid));
	SendClientMessageToAdmins(COLOR_YELLOW, str, 1);
	format(str, sizeof(str), "HelpWarn: %s has forced %s to change his name due to it being non-rp.", GetName(playerid), GetName(giveplayerid));
	SendClientMessageToHelpers(COLOR_YELLOW, str);
	return 1;
}
	
CMD:vspawn(playerid, params[])
{
	new choice, vehicle;
	if(sscanf(params, "i", choice)) { SendClientMessage(playerid, -1, "USAGE: /vspawn [1-5]"); return cmd_vlist(playerid, params); }
    new vslot = choice-1, str[164], zone[60];
	if(choice < 1 || choice > 5 ) return SendClientMessage(playerid, -1, "Valid slot numbers are 1-5.");
	if(PlayerInfo[playerid][pVehicle][vslot] == 0) return SendClientMessage(playerid, -1, "You don't have a vehicle in that slot.");
	if(PlayerInfo[playerid][pVehicleSpawned][vslot] == 1) return SendClientMessage(playerid, -1, "You have already spawned this vehicle.");
	vehicle = CreateVehicle(PlayerInfo[playerid][pVehicle][vslot], PlayerInfo[playerid][pVehiclePosX][vslot], PlayerInfo[playerid][pVehiclePosY][vslot], PlayerInfo[playerid][pVehiclePosZ][vslot], PlayerInfo[playerid][pVehicleRot][vslot], PlayerInfo[playerid][pVehicleCol1][vslot],PlayerInfo[playerid][pVehicleCol2][vslot], 0);
	GetVehicle2DZone(vehicle, zone, sizeof(zone));
	format(str, sizeof(str), "You have spawned your vehicle at %s.", zone);
	PlayerInfo[playerid][pVehicleSpawned][vslot] = 1;
	PlayerInfo[playerid][pVehicleSpawnedID][vslot] = vehicle;
	SendClientMessage(playerid, COLOR_GRAD1, str);
	new plate[126];
	format(plate, sizeof(plate), "LS%i", vehicle);
	SetVehicleNumberPlate(vehicle, plate);
	return 1;
}

CMD:vtrack(playerid, params[])
{
	new choice, Float:vx, Float:vy, Float:vz;
	if(sscanf(params, "i", choice)) return SendClientMessage(playerid, -1, "USAGE: /vtrack [1-5]");
    new vslot = choice-1, str[164], zone[60];
    if(CPT[playerid] != 0) return SendClientMessage(playerid, -1, "You can't use this command while you have an active checkpoint, use /destroycheckpoint.");
	if(choice < 1 || choice > 5 ) return SendClientMessage(playerid, -1, "Valid slot numbers are 1-5.");
	if(PlayerInfo[playerid][pVehicle][vslot] == 0) return SendClientMessage(playerid, -1, "You don't have a vehicle in that slot.");
	if(PlayerInfo[playerid][pVehicleSpawned][vslot] == 0) return SendClientMessage(playerid, -1, "You don't have a vehicle spawned in that slot.");
	GetVehicle2DZone(PlayerInfo[playerid][pVehicleSpawnedID][vslot], zone, sizeof(zone));
	GetVehiclePos(PlayerInfo[playerid][pVehicleSpawnedID][vslot], vx, vy, vz);
	SetPlayerCheckpoint(playerid, vx, vy, vz, 10.0);
	format(str, sizeof(str), "Your vehicle is at %s.", zone);
	SendClientMessage(playerid, COLOR_GRAD1, str);
	return 1;
}

CMD:vdelete(playerid, params[])
{
    new str[126], rand;
	new car = GetPlayerVehicleID(playerid);
    if(GetPlayerState(playerid) != 2) return SendClientMessage(playerid, -1, "You need to be in the vehicle you are deleting.");
	for(new v;v<MAX_PLAYER_VEHICLES;v++)
	{
	    if(GetVehicleModel(car) == PlayerInfo[playerid][pVehicle][v])
		{
		    if(PlayerInfo[playerid][pVehicleSpawnedID][v] == car)
		    {
			    rand = random(99999999);
				format(str, sizeof(str), "Deleted vehicle %i (Model: %i) - [ID: %i]", v+1, PlayerInfo[playerid][pVehicle][v], rand);
				SendClientMessage(playerid, -1, str);
				SendClientMessage(playerid, COLOR_FADE1, "Take a note of the ID in case you would need your vehicle back.");
				format(str, sizeof(str), "%s - Deleted vehicle slot %i (Model: %i) - [ID: %i]", GetName(playerid), v+1, PlayerInfo[playerid][pVehicle][v], rand);
				Log("/logs/deletedvehicles.txt", str);
				PlayerInfo[playerid][pVehicle][v] = 0;
				PlayerInfo[playerid][pVehicleSpawnedID][v] = 0;
				PlayerInfo[playerid][pVehicleSpawned][v] = 0;
				DestroyVehicle(car);
				break;
			}
		}
	}
 	return 1;
}

CMD:vlist(playerid, params[])
{
	SendClientMessage(playerid, -1, "Your vehicles:");
	new str[126];
	format(str, sizeof(str), "Vehicle 1: Model-ID: %i", PlayerInfo[playerid][pVehicle][0]);
	SendClientMessage(playerid, -1, str);
	format(str, sizeof(str), "Vehicle 2: Model-ID: %i", PlayerInfo[playerid][pVehicle][1]);
	SendClientMessage(playerid, -1, str);
	format(str, sizeof(str), "Vehicle 3: Model-ID: %i", PlayerInfo[playerid][pVehicle][2]);
	SendClientMessage(playerid, -1, str);
	format(str, sizeof(str), "Vehicle 4: Model-ID: %i", PlayerInfo[playerid][pVehicle][3]);
	SendClientMessage(playerid, -1, str);
	format(str, sizeof(str), "Vehicle 5: Model-ID: %i", PlayerInfo[playerid][pVehicle][4]);
	SendClientMessage(playerid, -1, str);
	return 1;
}


CMD:vdespawn(playerid, params[])
{
	new choice;
	if(sscanf(params, "i", choice)) { SendClientMessage(playerid, -1, "USAGE: /vdespawn [1-5]"); return cmd_vlist(playerid, params); }
    new vslot = choice-1;
	if(choice < 1 || choice > 5 ) return SendClientMessage(playerid, -1, "Valid slot numbers are 1-5.");
	if(PlayerInfo[playerid][pVehicle][vslot] == 0) return SendClientMessage(playerid, -1, "You don't have a vehicle in that slot.");
	if(PlayerInfo[playerid][pVehicleSpawned][vslot] != 1) return SendClientMessage(playerid, -1, "This vehicle isn't spawned.");
	DestroyVehicle(PlayerInfo[playerid][pVehicleSpawned][vslot]);
	SendClientMessage(playerid, COLOR_GRAD1, "You have despawned your vehicle.");
	PlayerInfo[playerid][pVehicleSpawned][vslot] = 0;
	PlayerInfo[playerid][pVehicleSpawnedID][vslot] = 0;
	return 1;
}

CMD:p(playerid, params[])
{
	new string[128];
	if(OnCall[playerid] != -1)
	{
		SendClientMessage(playerid, COLOR_GREY, "You are already on a call.");
		return 1;
	}
	if(GetPVarInt(playerid, "Injured") != 0 || GetPVarInt(playerid, "Recovering") != 0 || GetPVarInt(playerid, "Cuffed") != 0)
	{
		SendClientMessage (playerid, COLOR_GREY, "You can't use your cellphone right now.");
		return 1;
	}
	foreach(Player, i)
	{
		if(OnCall[i] == playerid)
		{
			OnCall[playerid] = i;
			SendClientMessage(i,  COLOR_GREY, "They picked up the call.");
			format(string, sizeof(string), "* %s answers their cellphone.", GetPlayerNameEx(playerid));
			ProxDetector(30.0, playerid, string, COLOR_PURPLE);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
			SetPlayerAttachedObject(playerid, 9, 330, 6);
		}
	}
	return 1;
}

CMD:h(playerid,params[])
{
	new string[128];

	if(GetPVarInt(playerid, "Injured") != 0 || GetPVarInt(playerid, "Recovering") != 0 || GetPVarInt(playerid, "Cuffed") != 0)
	{
		SendClientMessage (playerid, COLOR_GRAD2, "You can't do this at this time.");
		return 1;
	}
	if((IsPlayerConnected(OnCall[playerid]) && OnCall[playerid] != INVALID_PLAYER_ID) || OnCall[playerid] == 911)
	{
		SendClientMessage(playerid,  COLOR_GREY, "You hung up.");
		format(string, sizeof(string), "* %s puts their cellphone in their pocket.", GetPlayerNameEx(playerid));
		ProxDetector(30.0, playerid, string, COLOR_PURPLE);
		OnCall[playerid] = -1;
		SetPlayerSpecialAction(OnCall[playerid], SPECIAL_ACTION_STOPUSECELLPHONE);
        RemovePlayerAttachedObject(OnCall[playerid], 9);
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
		RemovePlayerAttachedObject(playerid, 9);
		return 1;
	}
	return 1;
}

CMD:call(playerid, params[])
{
	new string[128], phonenumb;
	if(isnull(params)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /call [phonenumber]");
	phonenumb = strval(params);
	if(PlayerInfo[playerid][pJail] > 0) return SendClientMessage(playerid,COLOR_GREY,"You can't use your phone while in jail.");
	if(GetPVarInt(playerid, "Injured") != 0 || GetPVarInt(playerid, "Recovering") != 0 || GetPVarInt(playerid, "Cuffed") != 0) return SendClientMessage(playerid,COLOR_GREY,"You can't use your phone right now.");
	if(PlayerInfo[playerid][pPhone] == 0) return SendClientMessage(playerid, COLOR_GRAD2, "You don't have a cell phone.");
	format(string, sizeof(string), "* %s takes out a cellphone as he dials a number.", GetPlayerNameEx(playerid));
	ProxDetector(30.0, playerid, string, COLOR_PURPLE);
	if(phonenumb == 911)
	{
		new zone[126], str[126];
		GetPlayer3DZone(playerid, zone, 126);
		SendClientMessage(playerid, COLOR_YELLOW, "(cellphone) LSPD: Hello. Your call has been sent to our operators - please wait for a response.");
		format(str, sizeof(str), "* [911]: Call from number %i, %s from location %s.", PlayerInfo[playerid][pPhone], GetName(playerid), zone);
		SendClientMessageToLSPD(COLOR_TWBLUE, str);
		format(str, sizeof(str), "* /acceptcall %i to speak with the caller.", playerid);
		SendClientMessageToLSPD(COLOR_TWBLUE, str);
		OnCall[playerid] = 911;
		return 1;
	}
	if(phonenumb == PlayerInfo[playerid][pPhone])
	{
		SendClientMessage(playerid, COLOR_GRAD2, "  You can't call yourself.");
		return 1;
	}
	if(OnCall[playerid] != -1)
	{
		SendClientMessage(playerid, COLOR_GRAD2, "You're already in a call...");
		return 1;
	}
	foreach(Player, i)
	{
		if(PlayerInfo[i][pPhone] == phonenumb && phonenumb != 0)
		{
		    printf("debug - calling %s (number %i)", GetName(i), PlayerInfo[i][pPhone]);
			new giveplayerid = i;
			OnCall[playerid] = giveplayerid;
			if(IsPlayerConnected(giveplayerid))
			{
				if(giveplayerid == INVALID_PLAYER_ID) { SendClientMessage(playerid, COLOR_GREY, "* Unable to connect to the number specified."); return 1; }
				{
					format(string, sizeof(string), "Incomming call from number %i.. (Caller Name: %s) - /p to answer the call.", PlayerInfo[playerid][pPhone], GetName(playerid));
					SendClientMessage(giveplayerid, COLOR_YELLOW, string);
					format(string, sizeof(string), "* %s's phone starts ringing.", GetPlayerNameEx(i));
					ProxDetector(30.0, i, string, COLOR_PURPLE);
					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
					SetPlayerAttachedObject(playerid, 9, 330, 6);
					return 1;
				}
			}
		}
	} 	
	return 1;
}

CMD:givemoney(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, COLOR_GREY, "You are not authorized to use this commands.");
	if(AdminDuty[playerid] != 1 && PlayerInfo[playerid][pAdmin] < 6)
	{
		SendClientMessage(playerid,COLOR_WHITE, "You are not on duty as an admin, /aduty to go on duty.");
		return 1;
	}
	new giveplayerid, cash, str[126];
	if(sscanf(params, "ui", giveplayerid, cash)) return SendClientMessage(playerid, -1, "USAGE: /givemoney [playerid/partofname] [amount]");
	PlayerInfo[giveplayerid][pCash] += cash;
	format(str, sizeof(str), "You have given %s $%i", GetName(giveplayerid), cash);
	SendClientMessage(playerid, -1, str);
	format(str, sizeof(str), "You have been given $%i from Admin %s", cash, GetName(playerid));
	SendClientMessage(giveplayerid, -1, str);
	format(str, sizeof(str), "%s has given %s $%i.", GetName(playerid), GetName(giveplayerid), cash);
	Log("/logs/givemoney.txt", str);
	return 1;
}

CMD:fine(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 3) return SendClientMessage(playerid, COLOR_GREY, "You are not authorized to use this commands.");
	if(AdminDuty[playerid] != 1 && PlayerInfo[playerid][pAdmin] < 6)
	{
		SendClientMessage(playerid,COLOR_WHITE, "You are not on duty as an admin, /aduty to go on duty.");
		return 1;
	}
	new giveplayerid, cash, str[126], reason[70];
	if(sscanf(params, "uis[70]", giveplayerid, cash, reason)) return SendClientMessage(playerid, -1, "USAGE: /fine [playerid/partofname] [amount] [reason]");
	if(cash < 1) return SendClientMessage(playerid, COLOR_GREY, "Fine amount must be above 1.");
	PlayerInfo[giveplayerid][pCash] -= cash;
	format(str, sizeof(str), "AdmCmd: %s has fined %s $%i, Reason: %s", GetName(playerid), GetName(giveplayerid), cash, reason);
	SendClientMessageToAll(COLOR_LIGHTRED, str);
	format(str, sizeof(str), "AdmCmd: %s has fined %s $%i, Reason: %s", GetName(playerid), GetName(giveplayerid), cash, reason);
	Log("/logs/fine.txt", str);
	return 1;
}

CMD:buy(playerid, params[])
{
	if(Shop(playerid) == NOT_IN_SHOP) return SendClientMessage(playerid, COLOR_GREY, "You are not in any shop.");
	if(Shop(playerid) == SHOP_BINCO)
	{
		ShowPlayerDialog(playerid, DIALOG_BUYSKIN, DIALOG_STYLE_INPUT,""COL_WHITE"Buy clothes",""COL_WHITE"Select a skin to use. Valid skin IDs are 0 to 299.\nA skin change costs $300.","Buy","No");
	    ProxDetector(50.0, playerid, "Shop Clerk says: Welcome, hope you find something fitting you.", COLOR_GRAD1);
		return 1;
	}
	if(Shop(playerid) == SHOP_247)
	{
	    ShowPlayerDialog(playerid, DIALOG_247, DIALOG_STYLE_LIST, "24/7", "Cell Phone ($600)\nSpray Can ($300)\nItem 3\nItem 4\nItem 5\nItem 6", "Ok", "Close");
	}
	return 1;
}

CMD:deployspike(playerid, params[])
{
	new str[126], zone[126];
	if(PlayerInfo[playerid][pFaction] != 1 && PlayerInfo[playerid][pFaction] != 2) return SendClientMessage(playerid, -1, "You are not a Law Enforcement Officer.");
	new Float:plocx,Float:plocy,Float:plocz,Float:ploca;
 	GetPlayerPos(playerid, plocx, plocy, plocz);
  	GetPlayerFacingAngle(playerid,ploca);
   	CreateStrip(plocx,plocy,plocz,ploca);
   	GetPlayer3DZone(playerid, zone, sizeof(zone));
	format(str, sizeof(str), "* %s %s has deployed a spike strip at %s.", GetRankName(playerid), GetName(playerid), zone);
	SendClientMessageToLSPD(RADIO, str);
	SendClientMessageToFBI(RADIO, str);
    return 1;
}
CMD:destroyspike(playerid, params[])
{
	if(PlayerInfo[playerid][pFaction] != 1 && PlayerInfo[playerid][pFaction] != 2) return SendClientMessage(playerid, -1, "You are not a Law Enforcement Officer.");
	DeleteClosestStrip(playerid);
	return 1;
}
CMD:destroyspikes(playerid, params[])
{
    new str[126];
	if(PlayerInfo[playerid][pFaction] != 1 && PlayerInfo[playerid][pFaction] != 2) return SendClientMessage(playerid, -1, "You are not a Law Enforcement Officer.");
	format(str, sizeof(str), "* %s %s has picked up all spike strips.", GetRankName(playerid), GetName(playerid));
	SendClientMessageToLSPD(RADIO, str);
	SendClientMessageToFBI(RADIO, str);
 	DeleteAllStrip();
 	return 1;
}
CMD:deploycade(playerid, params[])
{
    new str[126], zone[126];
	if(PlayerInfo[playerid][pFaction] != 1 && PlayerInfo[playerid][pFaction] != 2) return SendClientMessage(playerid, -1, "You are not a Law Enforcement Officer.");
	new Float:plocx,Float:plocy,Float:plocz,Float:ploca;
 	GetPlayerPos(playerid, plocx, plocy, plocz);
  	GetPlayerFacingAngle(playerid,ploca);
   	CreateCade(plocx-0.8,plocy-0.8,plocz,ploca);
 	GetPlayer3DZone(playerid, zone, sizeof(zone));
	format(str, sizeof(str), "* %s %s has deployed a barricade at %s.", GetRankName(playerid), GetName(playerid), zone);
	SendClientMessageToLSPD(RADIO, str);
	SendClientMessageToFBI(RADIO, str);
    return 1;
}
CMD:deploycade2(playerid, params[])
{
    new str[126], zone[126];
	if(PlayerInfo[playerid][pFaction] != 1 && PlayerInfo[playerid][pFaction] != 2) return SendClientMessage(playerid, -1, "You are not a Law Enforcement Officer.");
	new Float:plocx,Float:plocy,Float:plocz,Float:ploca;
 	GetPlayerPos(playerid, plocx, plocy, plocz);
  	GetPlayerFacingAngle(playerid,ploca);
   	CreateCade2(plocx-0.8,plocy-0.8,plocz,ploca);
 	GetPlayer3DZone(playerid, zone, sizeof(zone));
	format(str, sizeof(str), "* %s %s has deployed a barricade at %s.", GetRankName(playerid), GetName(playerid), zone);
	SendClientMessageToLSPD(RADIO, str);
	SendClientMessageToFBI(RADIO, str);
    return 1;
}
CMD:deploycone(playerid, params[])
{
	if(PlayerInfo[playerid][pFaction] != 1 && PlayerInfo[playerid][pFaction] != 2) return SendClientMessage(playerid, -1, "You are not a Law Enforcement Officer.");
	new Float:plocx,Float:plocy,Float:plocz,Float:ploca;
 	GetPlayerPos(playerid, plocx, plocy, plocz);
  	GetPlayerFacingAngle(playerid,ploca);
   	CreateCone(plocx-0.8,plocy-0.8,plocz,ploca);
    return 1;
}
CMD:destroycone(playerid, params[])
{
	if(PlayerInfo[playerid][pFaction] != 1 && PlayerInfo[playerid][pFaction] != 2) return SendClientMessage(playerid, -1, "You are not a Law Enforcement Officer.");
	DeleteClosestCone(playerid);
	return 1;
}
CMD:destroycones(playerid, params[])
{
	new str[126];
	if(PlayerInfo[playerid][pFaction] != 1 && PlayerInfo[playerid][pFaction] != 2) return SendClientMessage(playerid, -1, "You are not a Law Enforcement Officer.");
	format(str, sizeof(str), "* %s %s has picked up all cones.", GetRankName(playerid), GetName(playerid));
	SendClientMessageToLSPD(RADIO, str);
	SendClientMessageToFBI(RADIO, str);
 	DeleteAllCone();
 	return 1;
}
CMD:destroycade(playerid, params[])
{
	if(PlayerInfo[playerid][pFaction] != 1 && PlayerInfo[playerid][pFaction] != 2) return SendClientMessage(playerid, -1, "You are not a Law Enforcement Officer.");
	DeleteClosestCade(playerid);
	return 1;
}
CMD:destroycades(playerid, params[])
{
	new str[126];
	if(PlayerInfo[playerid][pFaction] != 1 && PlayerInfo[playerid][pFaction] != 2) return SendClientMessage(playerid, -1, "You are not a Law Enforcement Officer.");
	format(str, sizeof(str), "* %s %s has picked up all barricades.", GetRankName(playerid), GetName(playerid));
	SendClientMessageToLSPD(RADIO, str);
	SendClientMessageToFBI(RADIO, str);
 	DeleteAllCade();
 	return 1;
}

CMD:spec(playerid, params[])
{
	new giveplayerid, Float:x, Float:y, Float:z;
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_GREY, "You are not authorized to use this command.");
	if(sscanf(params, "u", giveplayerid)) return SendClientMessage(playerid, -1, "USAGE: /spec [playerid/partofname/off]");
	if(strcmp(params, "off", true) == 0)
	{
		SetPVarInt(playerid, "SpecOff", 1);
		TogglePlayerSpectating(playerid, false);
		SetCameraBehindPlayer(playerid);
		SetPlayerPos(playerid, x, y, z);
		spec[playerid] = -1;
		return 1;
	}
	if(!IsPlayerConnected(giveplayerid)) return SendClientMessage(playerid, COLOR_GREY, "Invalid player specified.");
	if(IsPlayerInAnyVehicle(giveplayerid))
	{
		GetPlayerPos(playerid, x, y, z);
		TogglePlayerSpectating(playerid, true);
		new carid = GetPlayerVehicleID(giveplayerid);
		PlayerSpectateVehicle(playerid, carid);
		SetPlayerInterior(playerid, GetPlayerInterior(giveplayerid));
		SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(giveplayerid));
		spec[playerid] = giveplayerid;
	}
		else
	{
	    GetPlayerPos(playerid, x, y, z);
		TogglePlayerSpectating(playerid, true);
		PlayerSpectatePlayer(playerid, giveplayerid);
		SetPlayerInterior(playerid, GetPlayerInterior(giveplayerid));
		SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(giveplayerid));
		spec[playerid] = giveplayerid;
	}
	return 1;
}

CMD:sendtols(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_GREY, "You are not authorized to use this command.");
	if(AdminDuty[playerid] != 1 && PlayerInfo[playerid][pAdmin] < 6)
	{
		SendClientMessage(playerid,COLOR_WHITE, "You are not on duty as an admin, /aduty to go on duty.");
		return 1;
	}
	new giveplayerid;
	if(sscanf(params, "u", giveplayerid)) return SendClientMessage(playerid, -1, "Usage: /sendtols [playerid/partofname]");
	SetPlayerPos(giveplayerid, 1529.58, -1687, 13.37);
	SendClientMessage(giveplayerid, -1, "You have been teleported.");
	PlayerInfo[giveplayerid][pVW] = 0;
	PlayerInfo[giveplayerid][pInt] = 0;
	SetPlayerInterior(giveplayerid, 0);
	SetPlayerVirtualWorld(giveplayerid, 0);
	return 1;
}

CMD:makehelper(playerid, params[])
{
	new giveplayerid, level, str[126];
	if(PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, COLOR_GREY, "You are not authorized to use this command.");
	if(sscanf(params, "ui", giveplayerid, level)) return SendClientMessage(playerid, COLOR_GREY, "USAGE: /makehelper [playerid/partofname] [level 1-2]");
	if(PlayerInfo[giveplayerid][pAdmin] > 0 && PlayerInfo[giveplayerid][pHelper] < 1) return SendClientMessage(playerid, COLOR_GREY, "You can't make an admin helper.");
	format(str, sizeof(str), "You have been made a level %i helper by Admin %s", level, GetName(playerid));
	SendClientMessage(giveplayerid, -1, str);
    format(str, sizeof(str), "You have made %s a level %i helper.", GetName(giveplayerid), level);
	SendClientMessage(playerid, -1, str);
	PlayerInfo[giveplayerid][pHelper] = level;
	return 1;
 }

CMD:n(playerid, params[]) return cmd_newb(playerid, params);

CMD:nmute(playerid, params[])
{
	new giveplayerid, str[126];
	if(PlayerInfo[playerid][pHelper] < 2 && PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_GREY, "You are not authorized to use this command.");
	if(sscanf(params, "u", giveplayerid)) return SendClientMessage(playerid, -1, "USAGE: /nmute [playerid/partofname]");
	if(PlayerInfo[giveplayerid][pAdmin] > 0) return SendClientMessage(playerid, -1, "You can not mute an admin.");
	if(PlayerInfo[playerid][pAdmin] < 1 && PlayerInfo[giveplayerid][pHelper] > 0) return SendClientMessage(playerid, -1, "You can not mute a helper as a helper.");
	PlayerInfo[giveplayerid][pNewbMute] = 1;
	format(str, sizeof(str), "You have muted %s from the newbie channel.", GetName(giveplayerid));
	SendClientMessage(playerid, -1, str);
	format(str, sizeof(str), "AdmCmd: %s was muted from the newbie channel by %s.", GetName(giveplayerid), GetName(playerid));
	SendClientMessageToAdmins(COLOR_LIGHTRED, str, 1);
	format(str, sizeof(str), "HelpCmd: %s was muted from the newbie channel by %s.", GetName(giveplayerid), GetName(playerid));
	SendClientMessageToHelpers(COLOR_CYAN, str);
	format(str, sizeof(str), "You were muted from the newbie channel by %s.", GetName(playerid));
	SendClientMessage(giveplayerid, COLOR_LIGHTRED, str);
	return 1;
}

CMD:nunmute(playerid, params[])
{
	new giveplayerid, str[126];
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_GREY, "You are not authorized to use this command.");
	if(sscanf(params, "u", giveplayerid)) return SendClientMessage(playerid, -1, "USAGE: /nunmute [playerid/partofname]");
	PlayerInfo[giveplayerid][pNewbMute] = 0;
	format(str, sizeof(str), "You have unmuted %s from the newbie channel.", GetName(giveplayerid));
	SendClientMessage(playerid, -1, str);
	format(str, sizeof(str), "AdmCmd: %s was unmuted from the newbie channel by %s.", GetName(giveplayerid), GetName(playerid));
	SendClientMessageToAdmins(COLOR_LIGHTRED, str, 1);
	format(str, sizeof(str), "HelpCmd: %s was unmuted from the newbie channel by %s.", GetName(giveplayerid), GetName(playerid));
	SendClientMessageToHelpers(COLOR_CYAN, str);
	format(str, sizeof(str), "You were unmuted from the newbie channel by %s.", GetName(playerid));
	SendClientMessage(giveplayerid, COLOR_LIGHTRED, str);
	return 1;
}

CMD:spraycar(playerid, params[])
{
	new col1, col2, car = GetPlayerVehicleID(playerid);
	if(PlayerInfo[playerid][pSpraycan] < 1) return SendClientMessage(playerid, COLOR_GREY, "You don't have a spraycan.");
	if(GetPlayerState(playerid) != 2) return SendClientMessage(playerid, COLOR_GREY, "You need to be inside the vehicle you want to spray.");
	if(sscanf(params, "ii", col1, col2)) return SendClientMessage(playerid, -1, "USAGE: /spraycar [col1] [col2]");
	if(col1 < 0 || col1 > 256) return SendClientMessage(playerid, COLOR_GREY, "Color number can't be below 0 or above 256.");
	for(new x; x<MAX_PLAYERS; x++)
	{
	    for(new y;y<MAX_PLAYER_VEHICLES;y++)
	    {
	    	if(PlayerInfo[x][pVehicleSpawnedID][y] == car && x != playerid)
			{
			    SendClientMessage(playerid, COLOR_GREY, "You can not spray a owned car that is not yours.");
			    break;
			}
			if(PlayerInfo[playerid][pVehicleSpawnedID][y] == car)
			{
				PlayerInfo[playerid][pVehicleCol1][y] = col1;
				PlayerInfo[playerid][pVehicleCol2][y] = col2;
				break;
			}
		}
	}
	ChangeVehicleColor(GetPlayerVehicleID(playerid), col1, col2);
	PlayerInfo[playerid][pSpraycan] -= 1;
	return 1;
}

CMD:sellvest(playerid, params[])
{
	new giveplayerid, price, str[126];
	if(PlayerInfo[playerid][pJob] != 3) return SendClientMessage(playerid, COLOR_GREY, "You are not a bodyguard.");
	if(sscanf(params, "ui", giveplayerid, price)) return SendClientMessage(playerid, -1, "USAGE: /sellvest [playerid/partofname] [price]");
	if(price < 300 || price > 1000) return SendClientMessage(playerid, COLOR_GREY, "ERROR: You may only sell for $300 - $1000.");
	SetPVarInt(giveplayerid, "OfferedBy", playerid);
	SetPVarInt(giveplayerid, "VestPrice", price);
	format(str, sizeof(str), "%s has offered you a vest for $%i. Type /accept vest to accept the offer.", GetName(playerid), price);
	SendClientMessage(giveplayerid, COLOR_NEWS, str);
	format(str, sizeof(str), "You have offered %s a vest for $%i.", GetName(giveplayerid), price);
	SendClientMessage(playerid, COLOR_NEWS, str);
	return 1;
}
	
CMD:newb(playerid, params[])
{
	new say[156], str[156];
	if(PlayerInfo[playerid][pNewbMute] == 1) return SendClientMessage(playerid, COLOR_GREY, "Your are muted from newbie chat.");
	if(tognewbie[playerid] == 1) return SendClientMessage(playerid, COLOR_CYAN, "Your newbie chat is disabled, use /tognewb to enable.");
	if(isnull(params)) return SendClientMessage(playerid, -1, "USAGE: /newb [text]");
	if(sscanf(params, "s[100]", say)) return SendClientMessage(playerid, -1, "USAGE: /newb [text]");
	if(PlayerInfo[playerid][pAdmin] > 1)
	{
		format(str, 126, "Admin %s: %s", GetName(playerid), say);
		Newbie(str);
		return 1;
	}
	if(PlayerInfo[playerid][pHelper] == 2)
	{
		format(str, 126, "Super Helper %s: %s", GetName(playerid), say);
		Newbie(str);
		return 1;
	}
	if(PlayerInfo[playerid][pHelper] == 1)
	{
		format(str, 126, "Helper %s: %s", GetName(playerid), say);
		Newbie(str);
		return 1;
	}
 	if(NoNewb[playerid] == 1) return SendClientMessage(playerid, -1, "You have to wait 30 seconds between each usage.");
 	else
 	{
		format(str, 126, "Newbie %s: %s", GetName(playerid), say);
		Newbie(str);
		NoNewb[playerid] = 1;
		SetTimerEx("AbleNewb", 30000, false, "i", playerid);
	}
	return 1;
}

CMD:enter(playerid, params[])
{
	new string[128];
	for(new i = 0; i < sizeof(DoorInfo); i++)
	{
		if(IsPlayerInRangeOfPoint(playerid,3.0,DoorInfo[i][ddExteriorX], DoorInfo[i][ddExteriorY], DoorInfo[i][ddExteriorZ]) && PlayerInfo[playerid][pVW] == DoorInfo[i][ddExteriorVW])
		{
			format(string, sizeof(string), "* %s entered %s.", GetPlayerNameEx(playerid), DoorInfo[i][ddName]);
			ProxDetector(25.0, playerid, string, COLOR_PURPLE);
			SetPlayerInterior(playerid,DoorInfo[i][ddInteriorInt]);
			PlayerInfo[playerid][pInt] = DoorInfo[i][ddInteriorInt];
			PlayerInfo[playerid][pVW] = DoorInfo[i][ddInteriorVW];
			SetPlayerVirtualWorld(playerid, DoorInfo[i][ddInteriorVW]);
			if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER){
			SetPlayerPos(playerid,DoorInfo[i][ddInteriorX],DoorInfo[i][ddInteriorY],DoorInfo[i][ddInteriorZ]);
			}
			SetPlayerFacingAngle(playerid, DoorInfo[i][ddInteriorA]);
			SetCameraBehindPlayer(playerid);
			if(DoorInfo[i][ddVehicleAble] > 0 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
			{
			    new car;
			    car = GetPlayerVehicleID(playerid);
				SetVehiclePos(GetPlayerVehicleID(playerid), DoorInfo[i][ddInteriorX],DoorInfo[i][ddInteriorY],DoorInfo[i][ddInteriorZ]);
				SetVehicleZAngle(GetPlayerVehicleID(playerid), DoorInfo[i][ddInteriorA]);
				SetVehicleVirtualWorld(GetPlayerVehicleID(playerid), DoorInfo[i][ddInteriorVW]);
				PutPlayerInVehicle(playerid, car, 0);
				LinkVehicleToInterior(GetPlayerVehicleID(playerid), DoorInfo[i][ddInteriorInt]);
				return 1;
			}
		}
		if(IsPlayerInRangeOfPoint(playerid,3,DoorInfo[i][ddInteriorX], DoorInfo[i][ddInteriorY], DoorInfo[i][ddInteriorZ]) && PlayerInfo[playerid][pVW] == DoorInfo[i][ddInteriorVW])
		{
			if(DoorInfo[i][ddVehicleAble] > 0 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
			{
			    new car;
			    car = GetPlayerVehicleID(playerid);
				SetVehiclePos(GetPlayerVehicleID(playerid), DoorInfo[i][ddExteriorX],DoorInfo[i][ddExteriorY],DoorInfo[i][ddExteriorZ]);
				SetVehicleZAngle(GetPlayerVehicleID(playerid), DoorInfo[i][ddExteriorA]);
				SetVehicleVirtualWorld(GetPlayerVehicleID(playerid), DoorInfo[i][ddExteriorVW]);
				PutPlayerInVehicle(playerid, car, 0);
				LinkVehicleToInterior(GetPlayerVehicleID(playerid), DoorInfo[i][ddExteriorInt]);
			}
			format(string, sizeof(string), "* %s exited %s.", GetPlayerNameEx(playerid), DoorInfo[i][ddName]);
			ProxDetector(25.0, playerid, string, COLOR_PURPLE);
			SetPlayerInterior(playerid,DoorInfo[i][ddExteriorInt]);
			PlayerInfo[playerid][pInt] = DoorInfo[i][ddExteriorInt];
			SetPlayerVirtualWorld(playerid, DoorInfo[i][ddExteriorVW]);
			PlayerInfo[playerid][pVW] = DoorInfo[i][ddExteriorVW];
			if(DoorInfo[i][ddCustomExterior])
			{
				LoadObjectsForPlayer(playerid);
			}
			if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER){
			SetPlayerPos(playerid,DoorInfo[i][ddExteriorX],DoorInfo[i][ddExteriorY],DoorInfo[i][ddExteriorZ]);
			SetPlayerFacingAngle(playerid, DoorInfo[i][ddExteriorA]);
			SetCameraBehindPlayer(playerid);
			}
		}
	}
	return 1;
}

CMD:exit(playerid, params[]) return cmd_enter(playerid, params);

CMD:zone(playerid, params[])
{
    new zone[28];
	GetPlayer2DZone(playerid, zone, MAX_ZONE_NAME);
 	SendClientMessage(playerid, -1, zone);
	return 1;
}

CMD:lockers(playerid, params[])
{
	new faction = PlayerInfo[playerid][pFaction];
	if(faction != 1 && faction != 2 && faction != 3) return SendClientMessage(playerid, COLOR_GREY, "You are not in a faction with lockers.");
	if(faction == 1 && !IsPlayerInRangeOfPoint(playerid, 20, 264.73, 77.07, 1003.64)) return SendClientMessage(playerid, COLOR_GREY, "You are not near your lockers.");

	if(PlayerInfo[playerid][pFaction] == 1)
	{
	    ShowPlayerDialog(playerid, DIALOG_LSPD, DIALOG_STYLE_LIST, "Locker", "Duty\nEquipment\nUniform\nSelect Skin", "Ok", "Close");
		return 1;
	}
	if(PlayerInfo[playerid][pFaction] == 2)
	{
	    ShowPlayerDialog(playerid, DIALOG_FBI, DIALOG_STYLE_LIST, "Locker", "Duty\nEquipment\nUniform\nSelect Skin\nChange Name", "Ok", "Close");
		return 1;
	}
	if(PlayerInfo[playerid][pFaction] == 3)
	{
		return 1;
	}
	return 1;
}

CMD:load(playerid, params[])
{
	new giveplayerid, seat, Float:x, Float:y, Float:z, str[126];
	if(PlayerInfo[playerid][pFaction] != 3) return SendClientMessage(playerid, COLOR_GREY, "You are not a paramedic.");
	if(sscanf(params, "ui", giveplayerid, seat)) return SendClientMessage(playerid, -1, "USAGE: /load [playerid/partofname] [seat]");
	if(GetPVarInt(giveplayerid, "Injured") != 1) return SendClientMessage(playerid, COLOR_GREY, "Player is not injured.");
	GetPlayerPos(giveplayerid, x, y, z);
	if(seat == 0) return SendClientMessage(playerid, -1, "You can not load a patient in the driver seat.");
	if(cardetain[playerid] == -1) return SendClientMessage(playerid, COLOR_GREY, "Invalid detain vehicle.");
	if(!IsPlayerInRangeOfPoint(playerid, 20, x, y, z)) return SendClientMessage(playerid, COLOR_GREY, "You are not close enough to the patient.");
	KillTimer(itimer[giveplayerid]);
	SendClientMessage(giveplayerid, -1, "You have been loaded..");
	format(str, sizeof(str), "You have loaded %s. Go to the hospital loading point and type /deliver", GetName(giveplayerid));
	TogglePlayerControllable(giveplayerid, 0);
	SendClientMessage(playerid, -1, str);
	PutPlayerInVehicle(giveplayerid, cardetain[playerid], seat);
	return 1;
}

CMD:deliver(playerid, params[])
{
	new giveplayerid, Float:x, Float:y, Float:z, str[126];
	if(PlayerInfo[playerid][pFaction] != 3) return SendClientMessage(playerid, COLOR_GREY, "You are not a paramedic.");
	if(sscanf(params, "u", giveplayerid)) return SendClientMessage(playerid, -1, "USAGE: /deliver [playerid/partofname]");
	if(GetPVarInt(giveplayerid, "Injured") != 1) return SendClientMessage(playerid, COLOR_GREY, "Player is not injured.");
	GetPlayerPos(giveplayerid, x, y, z);
	if(!IsPlayerInRangeOfPoint(playerid, 20, x, y, z)) return SendClientMessage(playerid, COLOR_GREY, "You are not close enough to the patient.");
	if(!IsNearLoadingPoint(playerid)) return SendClientMessage(playerid, COLOR_GREY, "You are not close enough to a delivery point.");
	format(str, sizeof(str), "* %s %s has delivered patient %s at the hospital in %s.", GetRankName(playerid), GetName(playerid), GetName(giveplayerid), GetZone(playerid));
	SendClientMessageToLSFMD(RADIOLSFMD, str);
	PlayerInfo[playerid][pTotDel] += 1;
	format(str, sizeof(str), "You have recieved $200 for delivering the patient. You have delivered %i patients.", PlayerInfo[playerid][pTotDel]);
	SendClientMessage(playerid, COLOR_CYAN, str);
	PlayerInfo[playerid][pCash] += 200;
	TogglePlayerControllable(giveplayerid, 1);
	SendClientMessage(giveplayerid, COLOR_LIGHTRED, "HOSPITAL: You have been delivered to the hospital and the health care costed you $100.");
	if(IsPlayerInRangeOfPoint(playerid, 50, 2016.95, -1413.74, 16.99))
	{
	SetPlayerPos(giveplayerid, 2030.08, -1425, 17);
	}
    if(IsPlayerInRangeOfPoint(playerid, 50, 1140.90, -1326, 13.64))
	{
	SetPlayerPos(giveplayerid, 1181.34, -1323.80, 13.58);
	}
	SetPlayerHealth(giveplayerid, 80);
	KillTimer(iitimer[giveplayerid]);
	KillTimer(itimer[giveplayerid]);
	SetPVarInt(giveplayerid, "Injured", 0);
	return 1;
}


new AES[MAX_PLAYERS];
forward antiemsspam(playerid);
public antiemsspam(playerid)
{
AES[playerid] = 0;
return 1;
}

CMD:acceptcall(playerid, params[])
{
	new str[126], giveplayerid, Float:xx, Float:yy, Float:zz;
	if(PlayerInfo[playerid][pFaction] != 3 && PlayerInfo[playerid][pFaction] != 1) return SendClientMessage(playerid, COLOR_GREY, "You are not a paramedic or in the LSPD.");
	if(sscanf(params, "i", giveplayerid)) return SendClientMessage(playerid, -1, "USAGE: /acceptcall [playerid/partofname]");
	/* LSFMD ACCEPT CALL */
	if(PlayerInfo[playerid][pFaction] == 3)
	{
		if(GetPVarInt(giveplayerid, "Injured") != 1) return SendClientMessage(playerid, COLOR_GREY, "That player is not injured.");
		format(str, sizeof(str), "You have accepted the call from %s (ID %i) who is located in %s.", GetName(giveplayerid), giveplayerid, GetZone(giveplayerid));
		SendClientMessage(playerid, -1, str);
		format(str, sizeof(str), "%s has accepted the call from %s (ID %i).", GetName(playerid), GetName(giveplayerid), giveplayerid);
		SendClientMessageToLSFMD(RADIOLSFMD, str);
		GetPlayerPos(giveplayerid, xx, yy, zz);
		medicCP[playerid] = giveplayerid;
		SetPlayerCheckpoint(playerid, xx, yy, zz, 5);
		format(str, sizeof(str), "%s has accepted your EMS call, and will be there shortly.", GetName(playerid));
		SendClientMessage(giveplayerid, COLOR_CYAN, str);
		return 1;
	}
	/* LSPD ACCEPT CALL */
	if(PlayerInfo[playerid][pFaction] == 1)
	{
	    if(OnCall[giveplayerid] != 911) return SendClientMessage(playerid, COLOR_GREY, "The specified person have either hung up or have not called 911.");
		format(str, sizeof(str), "LSPD %s %s has accepted your 911 call and will speak with you shortly", GetRankName(playerid), GetName(playerid));
		SendClientMessage(giveplayerid, -1, str);
		format(str, sizeof(str), "You have accepted %s's 911 call.", GetName(giveplayerid));
		SendClientMessage(playerid, -1, str);
		format(str, sizeof(str), "* %s %s has accepted the 911-call from %s.", GetRankName(playerid), GetName(playerid), GetName(giveplayerid));
		SendClientMessageToLSPD(RADIO, str);
		OnCall[giveplayerid] = playerid;
		OnCall[playerid] = giveplayerid;
		return 1;
	}
	return 1;
}


CMD:ems(playerid, params[])
{
	new zone[34], str[126];
	if(GetPVarInt(playerid, "Injured") != 1) return SendClientMessage(playerid, COLOR_GREY, "You are not injured.");
	if(AES[playerid] == 1) return SendClientMessage(playerid, COLOR_GREY, "You have already called for EMS the last 30 seconds.");
	GetPlayer2DZone(playerid, zone, MAX_ZONE_NAME);
	format(str, sizeof(str), "ALL UNITS: %s (ID %i) has been reported wounded at %s.", GetName(playerid), playerid, zone);
	SendClientMessageToLSFMD(RADIOLSFMD, str);
	SendClientMessage(playerid, COLOR_CYAN, "You have called for EMS. Please wait for a paramedic to arrive.");
	AES[playerid] = 1;
	SetTimerEx("antiemsspam", 30000, false, "i", playerid);
	return 1;
}
CMD:setadminname(playerid, params[])
{
	new giveplayerid, name[56], str[126];
	if(PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, COLOR_GREY, "You are not authorized to use this command.");
    if(sscanf(params, "us[56]", giveplayerid, name)) return SendClientMessage(playerid, COLOR_GREY, "USAGE: /setadminname [playerid/partofname] [name]");
    if(PlayerInfo[giveplayerid][pAdmin] < 1)
	{
		SendClientMessage(playerid, COLOR_WHITE, "The player is not an admin.");
		return 1;
	}
	if(AdminDuty[giveplayerid] == 1)
	{
 		SendClientMessage(playerid, COLOR_WHITE, "That admin is currently on-duty. They must go off-duty in order for you to set their admin name.");
   		return 1;
	}

	new length = strlen(name);
	if(length < 3 || length > 20)
	{
		SendClientMessage(playerid, COLOR_WHITE, "The name can't less than 3 characters or more than 20 characters.");
		return 1;
	}

	if(strfind(name, "_", true) != -1)
	{
		SendClientMessage(playerid, COLOR_WHITE, "The admin name must be one name. There can't be an underscore in the name.");
		return 1;
	}
	if(strcmp(name, "Shock", true) == 0 && PlayerInfo[playerid][pAdmin] < 6)
	{
		SendClientMessage(playerid, COLOR_WHITE, "kan u stop! i am shock");
		return 1;
	}
	format(str, 126, "AdmCmd: %s has set %s's admin-name to %s.", GetName(playerid), GetName(giveplayerid), name);
	SendClientMessageToAdmins(COLOR_LIGHTRED, str, 1);
	format(PlayerInfo[giveplayerid][pAName], 56, name);
	return 1;
}

CMD:gotoid(playerid, params[])
{
	new giveplayerid;
	if(PlayerInfo[playerid][pAdmin] < 3) return SendClientMessage(playerid, COLOR_GRAD1, "You are not authorized to use this commad.");
	if(AdminDuty[playerid] == 0 && PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, -1, "You are not on duty as an admin");
	if(!IsPlayerConnected(giveplayerid)) return SendClientMessage(playerid, COLOR_GREY, "Invalid player specifed.");
	new Float:gotoX, Float:gotoY, Float:gotoZ;
	if(sscanf(params, "u", giveplayerid)) return SendClientMessage(playerid, -1, "USAGE: /gotoid [playerid/partofname]");
	GetPlayerPos(giveplayerid, gotoX, gotoY, gotoZ);
	SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(giveplayerid));
	PlayerInfo[playerid][pVW] = GetPlayerVirtualWorld(giveplayerid);
	PlayerInfo[playerid][pInt] = GetPlayerInterior(giveplayerid);
	SetPlayerInterior(playerid, GetPlayerInterior(giveplayerid));
	SetPlayerPos(playerid, gotoX, gotoY, gotoZ);
	SendClientMessage(playerid, -1, "You have been teleported.");
	return 1;
}

CMD:gethere(playerid, params[])
{
	new giveplayerid;
	if(PlayerInfo[playerid][pAdmin] < 3) return SendClientMessage(playerid, COLOR_GRAD1, "You are not authorized to use this commad.");
	if(AdminDuty[playerid] == 0 && PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, -1, "You are not on duty as an admin");
	if(PlayerInfo[playerid][pAdmin] < PlayerInfo[giveplayerid][pAdmin]) return SendClientMessage(playerid, -1, "You can't do this on a higher level administrator.");
	new Float:gotoX, Float:gotoY, Float:gotoZ;
	if(sscanf(params, "u", giveplayerid)) return SendClientMessage(playerid, -1, "USAGE: /gethere [playerid/partofname]");
	if(PlayerInfo[playerid][pAdmin] < PlayerInfo[giveplayerid][pAdmin]) return SendClientMessage(playerid, -1, "You can't do this on a higher level administrator.");
	GetPlayerPos(playerid, gotoX, gotoY, gotoZ);
	SetPlayerVirtualWorld(giveplayerid, GetPlayerVirtualWorld(playerid));
	SetPlayerInterior(giveplayerid, GetPlayerInterior(playerid));
	PlayerInfo[giveplayerid][pVW] = GetPlayerVirtualWorld(playerid);
	PlayerInfo[giveplayerid][pInt] = GetPlayerInterior(playerid);
	SetPlayerPos(giveplayerid, gotoX, gotoY, gotoZ);
	SendClientMessage(giveplayerid, -1, "You have been teleported.");
	return 1;
}



CMD:gotox(playerid, params[])
{
	new Float:tpx, Float:tpy, Float:tpz, int;
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_GREY, "You are not authorized to use this command.");
	if(AdminDuty[playerid] == 0 && PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, -1, "You are not on duty as an admin");
	if(sscanf(params, "fffi", tpx, tpy, tpz, int)) return SendClientMessage(playerid, -1, "USAGE: /gotox [coord x] [coord y] [coord z] [int]");
	if(!isnull(params))
	{
		SetPlayerPos(playerid, tpx, tpy, tpz);
		SetPlayerInterior(playerid, int);
		SendClientMessage(playerid, -1, "You have been teleported.");
		return 1;
	}
	return 1;
}
	

CMD:goto(playerid, params[])
{
	new choice[32];
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_GREY, "You are not authorized to use this command.");
	if(sscanf(params, "s[32]", choice))
	{
		SendClientMessage(playerid, COLOR_WHITE, "USAGE: /goto [choice]");
		SendClientMessage(playerid, -1, "Choices: LS, LV, SF, Allsaints, Gym, Trucker");
		return 1;
	}
	if(strcmp(choice, "ls", true) == 0)
	{
	    SetPlayerPos(playerid, 1529.58, -1687, 13.37);
	    SendClientMessage(playerid, -1, "You have been teleported.");
	    PlayerInfo[playerid][pVW] = 0;
		PlayerInfo[playerid][pInt] = 0;
	    SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld(playerid, 0);
	}
	if(strcmp(choice, "lv", true) == 0)
	{
	    SetPlayerPos(playerid, 1692.95, 1442.26, 10.76);
	    SendClientMessage(playerid, -1, "You have been teleported.");
	    PlayerInfo[playerid][pVW] = 0;
		PlayerInfo[playerid][pInt] = 0;
  	    SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld(playerid, 0);
	}
	if(strcmp(choice, "sf", true) == 0)
	{
	    SetPlayerPos(playerid, -1410.49, -315.44, 14);
	    SendClientMessage(playerid, -1, "You have been teleported.");
	    PlayerInfo[playerid][pVW] = 0;
		PlayerInfo[playerid][pInt] = 0;
  	    SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld(playerid, 0);
	}
	if(strcmp(choice, "allsaints", true) == 0)
	{
	    SetPlayerPos(playerid, 1187.06, -1318.26, 13.57);
	    SendClientMessage(playerid, -1, "You have been teleported.");
	    PlayerInfo[playerid][pVW] = 0;
		PlayerInfo[playerid][pInt] = 0;
    	SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld(playerid, 0);
	}
	if(strcmp(choice, "gym", true) == 0)
	{
		SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld(playerid, 0);
	    SetPlayerPos(playerid, 2223.96, -1717.37, 13.51);
	    SendClientMessage(playerid, -1, "You have been teleported.");
    	SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld(playerid, 0);
	}
	if(strcmp(choice, "trucker", true) == 0)
	{
		SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld(playerid, 0);
	    SetPlayerPos(playerid, 2233, -2637, 14);
	    SendClientMessage(playerid, -1, "You have been teleported.");
    	SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld(playerid, 0);
	}
	return 1;
}

CMD:aduty(playerid, params[])
{
	new str[126];
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_GREY, "You are not authorized to use this command.");
	if(GetPVarInt(playerid, "Injured") == 1) return SendClientMessage(playerid, COLOR_GREY, "You may not go on duty while injured, /giveup if emergency.");
	if(AdminDuty[playerid] != 1)
	{
	    AdminDutyCash[playerid] = PlayerInfo[playerid][pCash];
		GetPlayerHealth(playerid, AdminDutyHealth[playerid]);
	    AdminDutyArmor[playerid] = PlayerInfo[playerid][pArmor];
	    if(isnull(PlayerInfo[playerid][pAName])) return SendClientMessage(playerid, -1, "You don't have an admin name.");
		AdminDuty[playerid] = 1;
		format(str, sizeof(str), "%s (ID %i - %s) is now on duty as a level %i admin.", PlayerInfo[playerid][pAName], playerid, GetName(playerid), PlayerInfo[playerid][pAdmin]);
		SendClientMessageToAdmins(-1, str, 1);
		SetPlayerName(playerid, PlayerInfo[playerid][pAName]);
		SendClientMessage(playerid, -1, "You are now on duty as an admin, you do now have access to all of your commands.");
		GetPlayerPos(playerid, PlayerInfo[playerid][pAx], PlayerInfo[playerid][pAy], PlayerInfo[playerid][pAz]);
	}
	else
	{
	    waitcheck[playerid] = 2;
	    SetPVarInt(playerid, "SpecOff", 1);
		TogglePlayerSpectating(playerid, false);
		SetCameraBehindPlayer(playerid);
	    AdminDuty[playerid] = 0;
        SetSpawnInfo(playerid, 0, PlayerInfo[playerid][pSkin], PlayerInfo[playerid][pX], PlayerInfo[playerid][pY], PlayerInfo[playerid][pZ], 0, 0, 0, 0, 0, 0, 0);
        SpawnPlayer(playerid);
        SetPlayerWeapons(playerid);
        SetPlayerInterior(playerid, PlayerInfo[playerid][pInt]);
        SetPlayerVirtualWorld(playerid, PlayerInfo[playerid][pVW]);
		SetPlayerScore(playerid, PlayerInfo[playerid][pLevel]);
		SetPlayerHealth(playerid, PlayerInfo[playerid][pHealth]);
		SetPlayerArmour(playerid, PlayerInfo[playerid][pArmor]);
	    SetPlayerName(playerid, PlayerInfo[playerid][pName]);
		new backup[126];
		format(backup, 126, "%s Old cash: %i - New cash: %i", GetName(playerid), PlayerInfo[playerid][pCash], AdminDutyCash[playerid]);
		Log("/logs/backup.txt", backup);
	    PlayerInfo[playerid][pCash] = AdminDutyCash[playerid];
	    SetPlayerPos(playerid, PlayerInfo[playerid][pAx], PlayerInfo[playerid][pAy], PlayerInfo[playerid][pAz]);
	    format(str, sizeof(str), "%s (ID %i - %s) is now off admin duty.", PlayerInfo[playerid][pAName], playerid, GetName(playerid));
		SendClientMessageToAdmins(-1, str, 1);
		SendClientMessage(playerid, -1, "You are now off duty as an admin and have only a limited access to your commands.");
		spec[playerid] = -1;
		SetPlayerWeaponsEx(playerid);
	}
	return 1;
}

CMD:badge(playerid, params[])
{
	if(PlayerInfo[playerid][pFaction] == 1)
	{
	    if(badge[playerid] == 1)
	    {
	    	SetPlayerColor(playerid, 0xFFFFFF00);
	   		SendClientMessage(playerid, -1, "You have taken away your badge.");
			badge[playerid] = 0;
			return 1;
		}
		if(badge[playerid] == 0)
		{
	    SetPlayerColor(playerid, 0x0800FF00);
	    SendClientMessage(playerid, -1, "You have made your badge visible.");
		badge[playerid] = 1;
		return 1;
		}
	}
	return 1;
}

CMD:skill(playerid, params[])
{
	new skill, str[128];
	if(sscanf(params, "i", skill)) return SendClientMessage(playerid, COLOR_GREY, "USAGE: /skill 1 [Trucker] | 2 [Weapon Dealer]");
	if(skill == 1)
	{
	    new tl;

		if(PlayerInfo[playerid][pTruckerSkill] < 100)
		{
		tl = 1;
		}
		if(PlayerInfo[playerid][pTruckerSkill] > 99)
		{
		tl = (PlayerInfo[playerid][pTruckerSkill] / 100)+1;
		}
		if(PlayerInfo[playerid][pTruckerSkill] > 400)
		{
		tl = 5;
		}
	    SendClientMessage(playerid, COLOR_YELLOW, "Trucker Skill:");
	    format(str, sizeof(str), "You are a level %i trucker. You have done %i trucking deliveries. You level up every 100 deliveries.",tl, PlayerInfo[playerid][pTruckerSkill]);
	    SendClientMessage(playerid, COLOR_YELLOW, str);
	}
	if(skill == 2)
	{
	    new wdl;
	    wdl = (PlayerInfo[playerid][pWDealerSkill] / 100);
		if(PlayerInfo[playerid][pWDealerSkill] < 100)
		{
		wdl = 1;
		}
		if(PlayerInfo[playerid][pWDealerSkill] > 99)
		{
		wdl = (PlayerInfo[playerid][pWDealerSkill] / 100)+1;
		}
		if(PlayerInfo[playerid][pWDealerSkill] > 400)
		{
		wdl = 5;
		}
	    SendClientMessage(playerid, COLOR_YELLOW, "Weapon Dealer Skill:");
	    format(str, sizeof(str), "You are a level %i Weapon Dealer. You have done %i gun sales. You level up every 100 sales.",wdl, PlayerInfo[playerid][pWDealerSkill]);
	    SendClientMessage(playerid, COLOR_YELLOW, str);
	}
	return 1;
}

CMD:ok(playerid, params[])
{
		if(PlayerInfo[playerid][pAdmin] < 5) return 0;
        AddVehicleComponent(GetPlayerVehicleID(playerid),1080);
        return 1;
}

CMD:slap(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 1)
	{
		if(AdminDuty[playerid] != 1 && PlayerInfo[playerid][pAdmin] < 6)
		{
			SendClientMessage(playerid,COLOR_WHITE, "You are not on duty as an admin, /aduty to go on duty.");
			return 1;
		}
		new giveplayerid;
		new string[128];
		if(PlayerInfo[playerid][pAdmin] < PlayerInfo[giveplayerid][pAdmin]) return SendClientMessage(playerid, -1, "You can't do this on a higher level administrator.");
		if(sscanf(params, "u", giveplayerid)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /slap [playerid/partofname]");
		if(!IsPlayerConnected(giveplayerid)) return SendClientMessage(playerid, COLOR_GREY, "Invalid player specified.");
		if(giveplayerid == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_GREY, "Invalid player specified.");
        GetPlayerPos(giveplayerid, PlayerInfo[giveplayerid][pX], PlayerInfo[giveplayerid][pY], PlayerInfo[giveplayerid][pZ]);
		SetPlayerPos(giveplayerid, PlayerInfo[giveplayerid][pX], PlayerInfo[giveplayerid][pY], PlayerInfo[giveplayerid][pZ]+2);
		format(string, sizeof(string), "AdmCmd: %s was slapped by %s", GetName(giveplayerid), GetName(playerid));
		new ip[28];
		GetPlayerIp(giveplayerid, ip, sizeof(ip));
		SendClientMessageToAdmins(COLOR_LIGHTRED, string, 1);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was slapped by %s", GetName(giveplayerid), ip, GetName(playerid));
		Log("/logs/slap.txt", string);
		return 1;
	}
	return 1;
}

CMD:kiick(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 1)
	{
		new giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /kiick [playerid/partofname]");
        if(IsPlayerConnected(giveplayerid))
		{
			Kick(giveplayerid);
		}
	}
	else
	{
		SendClientMessage(playerid, COLOR_GRAD1, "You're not authorized to use that command!");
	}
	return 1;
}

CMD:kick(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 1)
	{
		new string[128], giveplayerid, reason[56];
		if(sscanf(params, "us[128]", giveplayerid, reason)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /kick [playerid/partofname] [reason]");
        if(PlayerInfo[playerid][pAdmin] < PlayerInfo[giveplayerid][pAdmin]) return SendClientMessage(playerid, -1, "You can't do this on a higher level administrator.");
		if(IsPlayerConnected(giveplayerid))
		{
		    format(string, sizeof(string), "AdmCmd: %s was kicked by %s, Reason: %s", GetName(giveplayerid), GetName(playerid), reason);
			new ip[28];
			GetPlayerIp(giveplayerid, ip, sizeof(ip));
			SendClientMessageToAll(COLOR_LIGHTRED, string);
			format(string, sizeof(string), "AdmCmd: %s (IP: %s) was kicked by %s, Reason: %s", GetName(giveplayerid), ip, GetName(playerid), reason);
			Log("/logs/kick.txt", string);
			Kick(giveplayerid);
		}
	}
	else
	{
		SendClientMessage(playerid, COLOR_GRAD1, "You're not authorized to use that command!");
	}
	return 1;
}

CMD:time(playerid, params[])
{
new str[126];
if(PlayerInfo[playerid][pJail] < 1) return SendClientMessage(playerid, -1, "You are not in prison.");
format(str, 128, "You have %i minutes left of prison.", PlayerInfo[playerid][pJail]);
GameTextForPlayer(playerid, str, 2000, 3);
SendClientMessage(playerid, COLOR_CYAN, str);
return 1;
}

CMD:release(playerid,params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 3)
	{
		new giveplayerid, reason[126], str[126];
		if(sscanf(params, "us[126]", giveplayerid, reason)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /release [playerid/partofname] [reason]");
		if(PlayerInfo[giveplayerid][pJail] < 1) return SendClientMessage(playerid, COLOR_GREY, "The specified player is not in jail.");
		SetPlayerPos(giveplayerid, 247.37, 67.92, 1003.64);
		SetPlayerInterior(giveplayerid, 6);
		SetPVarInt(giveplayerid, "Cuffed", 0);
		SetPlayerVirtualWorld(giveplayerid, 1337);
		PlayerInfo[giveplayerid][pInt] = 6;
		PlayerInfo[giveplayerid][pVW] = 1337;
		PlayerInfo[giveplayerid][pJail] = 0;
		ResetPlayerWeapons(giveplayerid);
		ResetPlayerWeaponsEx(giveplayerid);
		GameTextForPlayer(giveplayerid, "Released.", 5000, 3);
		KillTimer(rtimer[giveplayerid]);
		SendClientMessage(giveplayerid, COLOR_CYAN, "You have been released from prison by an admin.");
		format(str, 126, "AdmCmd: %s was released from prison by %s. Reason: %s.", GetName(giveplayerid), GetName(playerid), reason);
		SendClientMessageToAll(COLOR_LIGHTRED, str);
		SetPlayerColor(giveplayerid, 0xFFFFFF00);
		Log("/logs/prison.txt", str);
	}
	return 1;
}

CMD:park(playerid, params[])
{
	new currveh = GetPlayerVehicleID(playerid);
	new succeed = 0;
	if(GetPlayerState(playerid) != 2) return SendClientMessage(playerid, COLOR_GREY, "You are not the driver of the vehicle.");
	for(new y;y<MAX_PLAYER_VEHICLES;y++)
	{
		if(PlayerInfo[playerid][pVehicleSpawnedID][y] == currveh) { succeed = 1; }
	}
	if(succeed == 0) return SendClientMessage(playerid, -1, "This is not your vehicle.");
	for(new v; v<MAX_PLAYER_VEHICLES; v++)
	{
	    if(PlayerInfo[playerid][pVehicleSpawnedID][v] == currveh)
		{
		    new Float:vh;
		    GetVehicleHealth(GetPlayerVehicleID(playerid), vh);
		    if(vh < 700) { SendClientMessage(playerid, -1, "The car is too damaged to be parked."); break; }
			new Float:x, Float:y, Float:z, Float:a;
			GetVehiclePos(GetPlayerVehicleID(playerid), x, y, z);
			GetVehicleZAngle(GetPlayerVehicleID(playerid), a);
		    PlayerInfo[playerid][pVehiclePosX][v] = x;
		    PlayerInfo[playerid][pVehiclePosY][v] = y;
		    PlayerInfo[playerid][pVehiclePosZ][v] = z;
		    PlayerInfo[playerid][pVehicleRot][v] = a;
			new str[126];
			format(str, sizeof(str), "* %s has parked his vehicle.", GetName(playerid));
			ProxDetector(50.0, playerid, str, COLOR_PURPLE);
			break;
		}
	}
	return 1;
}

CMD:prison(playerid,params[])
{
	if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessage(playerid, COLOR_GRAD1, "You are not authorized to use this command");
	{
	    new giveplayerid, str[128], time, reason[56];
		if(sscanf(params, "uis[56]", giveplayerid, time, reason)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /prison [playerid/partofname] [time] [reason]");
        if(PlayerInfo[playerid][pAdmin] < PlayerInfo[giveplayerid][pAdmin]) return SendClientMessage(playerid, -1, "You can't do this on a higher level administrator.");
		PlayerInfo[giveplayerid][pJail] = time;
		PlayerInfo[giveplayerid][pBail] = 0;
		beingdragged[giveplayerid] = -1;
		SetPlayerSpecialAction(giveplayerid, SPECIAL_ACTION_NONE);
		ClearAnimations(giveplayerid);
		SetPlayerSkin(giveplayerid, GetPlayerSkin(giveplayerid));
		SetPVarInt(giveplayerid, "Dragged", 0);
		SetPVarInt(giveplayerid, "Cuffed", 0);
		TogglePlayerControllable(giveplayerid, 1);
		ResetPlayerWeapons(giveplayerid);
		ResetPlayerWeaponsEx(giveplayerid);
		PlayerInfo[giveplayerid][pInt] = 6;
		PlayerInfo[giveplayerid][pVW] = 1337;
		SetPlayerInterior(giveplayerid, 6);
		SetPlayerVirtualWorld(giveplayerid, 1337);
		SetPlayerPos(giveplayerid, 264.67, 77.79, 1001.04);
		format(str, 126, "AdmCmd: %s was prisoned by %s. Reason: %s.", GetName(giveplayerid), GetName(playerid), reason);
		SendClientMessageToAll(COLOR_LIGHTRED, str);
		Log("/logs/prison.txt", str);
		SetPlayerColor(giveplayerid, 0x65432100);
		rtimer[giveplayerid] = SetTimerEx("arrestrelease", 60000, true, "i", giveplayerid);
	}
	return 1;
}

CMD:jail(playerid,params[])
{
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_GRAD1, "You are not authorized to use this command");
	{
	    new giveplayerid, str[128], reason[56];
		if(sscanf(params, "us[56]", giveplayerid, reason)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /jail [playerid/partofname] [reason]");
        if(PlayerInfo[playerid][pAdmin] < PlayerInfo[giveplayerid][pAdmin]) return SendClientMessage(playerid, -1, "You can't do this on a higher level administrator.");
		PlayerInfo[giveplayerid][pJail] = 20;
		PlayerInfo[giveplayerid][pBail] = 0;
		beingdragged[giveplayerid] = -1;
		SetPlayerSpecialAction(giveplayerid, SPECIAL_ACTION_NONE);
		ClearAnimations(giveplayerid);
		SetPlayerSkin(giveplayerid, GetPlayerSkin(giveplayerid));
		SetPVarInt(giveplayerid, "Dragged", 0);
		SetPVarInt(giveplayerid, "Cuffed", 0);
		TogglePlayerControllable(giveplayerid, 1);
		ResetPlayerWeapons(giveplayerid);
		ResetPlayerWeaponsEx(giveplayerid);
		PlayerInfo[giveplayerid][pInt] = 6;
		PlayerInfo[giveplayerid][pVW] = 1337;
		SetPlayerInterior(giveplayerid, 6);
		SetPlayerVirtualWorld(giveplayerid, 1337);
		SetPlayerPos(giveplayerid, 264.67, 77.79, 1001.04);
		format(str, 126, "AdmCmd: %s was jailed by %s. Reason: %s.", GetName(giveplayerid), GetName(playerid), reason);
		SendClientMessageToAll(COLOR_LIGHTRED, str);
		Log("/logs/prison.txt", str);
		SetPlayerColor(giveplayerid, 0x65432100);
		rtimer[playerid] = SetTimerEx("arrestrelease", 60000, true, "i", giveplayerid);
	}
	return 1;
}


CMD:arrest(playerid, params[])
{
	new string[128];
	new giveplayerid, time, fine, bail;
	if(PlayerInfo[playerid][pFaction] != 1) return SendClientMessage(playerid, -1, "You are not in the LSPD.");
	if(!IsPlayerInRangeOfPoint(playerid, 10, 1526, -1676, 5.89)) return SendClientMessage(playerid, -1, "You are not at the arrest point.");
    if(sscanf(params, "uiii", giveplayerid, time, fine, bail)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /arrest [playerid/partofname] [time (1-20 min)] [fine (0-500)] [bail (0-1000)]");
	GetPlayerPos(giveplayerid, PlayerInfo[giveplayerid][pX], PlayerInfo[giveplayerid][pY], PlayerInfo[giveplayerid][pZ]);
	if(!IsPlayerInRangeOfPoint(playerid, 10, PlayerInfo[giveplayerid][pX], PlayerInfo[giveplayerid][pY], PlayerInfo[giveplayerid][pZ])) return SendClientMessage(playerid, -1, "You are not near the suspect.");
	if(PlayerInfo[giveplayerid][pWanted] < 1) return SendClientMessage(playerid, -1, "Player is not wanted.");
	if(time > 20 || time < 1) return SendClientMessage(playerid, -1, "Valid arrest time is between 1 and 20");
	if(fine > 500 || fine < 0) return SendClientMessage(playerid, -1, "Valid fine is between 0 and 500");
	if(bail > 1000 || bail < 0) return SendClientMessage(playerid, -1, "Valid bail is between 0 and 100");
	if(giveplayerid == INVALID_PLAYER_ID) return SendClientMessage(playerid, -1, "Invalid player specified.");
	if(giveplayerid == playerid) return SendClientMessage(playerid, -1, "You can not arrest yourself.");
	PlayerInfo[giveplayerid][pJail] = time;
	PlayerInfo[giveplayerid][pBail] = bail;
	PlayerInfo[giveplayerid][pCash] -= fine;
	PlayerInfo[giveplayerid][pWanted] = 0;
	PlayerInfo[giveplayerid][pInt] = 6;
	PlayerInfo[giveplayerid][pVW] = 1337;
	PlayerInfo[giveplayerid][pW1] = 0; PlayerInfo[giveplayerid][pW2] = 0; PlayerInfo[giveplayerid][pW3] = 0; PlayerInfo[giveplayerid][pW4] = 0;	PlayerInfo[giveplayerid][pW5] = 0;	PlayerInfo[giveplayerid][pW6] = 0;
	SetPlayerColor(giveplayerid, 0xFF8C0000);
	beingdragged[giveplayerid] = -1;
	SetPlayerSpecialAction(giveplayerid, SPECIAL_ACTION_NONE);
	ClearAnimations(giveplayerid);
	SetPlayerSkin(giveplayerid, GetPlayerSkin(giveplayerid));
	SetPVarInt(giveplayerid, "Dragged", 0);
	TogglePlayerControllable(giveplayerid, 1);
	SetPlayerInterior(giveplayerid, 6);
	ResetPlayerWeapons(giveplayerid);
	ResetPlayerWeaponsEx(giveplayerid);
	SetPlayerVirtualWorld(giveplayerid, 1337);
	SetPVarInt(giveplayerid, "Cuffed", 0);
	SetPlayerPos(giveplayerid, 264.67, 77.79, 1001.04);
	format(string, sizeof(string), "You have been arrested by Officer %s for %i minutes and have been fined $%i.", GetName(playerid), time, fine);
	SendClientMessage(giveplayerid, COLOR_CYAN, string);
	format(string, sizeof(string), "You have arrested %s for %i minutes, fined $%i and set the bail to %i.", GetName(giveplayerid), time, fine, bail);
	SendClientMessage(playerid, COLOR_CYAN, string);
	format(string, sizeof(string), "[LSPD JAIL] %s has arrested %s for %i minutes, fined $%i and set the bail to %i.", GetName(playerid), GetName(giveplayerid), time, fine, bail);
	Log("/logs/prison.txt", string);
	format(string, sizeof(string), "ALL UNITS: %s has arrested %s for %i minutes and fined $%i.", GetName(playerid), GetName(giveplayerid), time, fine);
	SendClientMessageToLSPD(RADIO, string);
	if(PlayerInfo[giveplayerid][pBail] > 0)
	{
	format(string, sizeof(string), "Your bail is: %i.", bail);
	}
	SendClientMessage(giveplayerid, COLOR_CYAN, string);
	rtimer[giveplayerid] = SetTimerEx("arrestrelease", 60000, true, "i", giveplayerid);
	return 1;
}

CMD:bail(playerid, params[])
{
    if(PlayerInfo[playerid][pJail] < 1) return SendClientMessage(playerid, -1, "You are not in jail.");
	if(PlayerInfo[playerid][pBail] < 1) return SendClientMessage(playerid, -1, "You don't have a bail.");
	if(PlayerInfo[playerid][pBail] > PlayerInfo[playerid][pCash]) return SendClientMessage(playerid, -1, "You don't have enough money to bail out.");
	SetPlayerPos(playerid, 247.37, 67.92, 1003.64);
	SetPlayerInterior(playerid, 6);
	SetPlayerVirtualWorld(playerid, 1337);
	PlayerInfo[playerid][pJail] = -1;
	SetPlayerColor(playerid, 0xFFFFF00);
	KillTimer(rtimer[playerid]);
	PlayerInfo[playerid][pCash] -= PlayerInfo[playerid][pBail];
	GameTextForPlayer(playerid, "Released. Try to be good now.", 5000, 3);
	SendClientMessage(playerid, COLOR_CYAN, "You have bailed out of jail.");
	return 1;
}

CMD:check(playerid,params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		new giveplayerid;
		if(sscanf(params, "u", giveplayerid)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /check [playerid/partofname]");
		ShowStats(playerid, giveplayerid);
	}
	return 1;
}


CMD:ban(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		new string[128], giveplayerid, reason[56];
		if(sscanf(params, "us[128]", giveplayerid, reason)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /ban [playerid/partofname] [reason]");
		if(IsPlayerConnected(giveplayerid))
		{
		    if(PlayerInfo[playerid][pAdmin] < PlayerInfo[giveplayerid][pAdmin]) return SendClientMessage(playerid, -1, "You can't do this on a higher level administrator.");
		    format(string, sizeof(string), "AdmCmd: %s was banned by %s, Reason: %s", GetName(giveplayerid), GetName(playerid), reason);
			PlayerInfo[giveplayerid][pBanned] =  1;
			new ip[28];
			GetPlayerIp(giveplayerid, ip, sizeof(ip));
			SendClientMessageToAll(COLOR_LIGHTRED, string);
			format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned by %s, Reason: %s", GetName(giveplayerid), ip, GetName(playerid), reason);
			Log("/logs/ban.txt", string);
			AddBan(ip);
			Kick(giveplayerid);
		}
	}
	else
	{
		SendClientMessage(playerid, COLOR_GRAD1, "You're not authorized to use that command!");
	}
	return 1;
}

CMD:drag(playerid, params[])
{
	new string[128], giveplayerid, Float:x, Float:y, Float:z;
	if(PlayerInfo[playerid][pFaction] != 1) return SendClientMessage(playerid, -1, "You are not in the LSPD.");
	if(sscanf(params, "u", giveplayerid)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /drag [playerid/partofname]");
	GetPlayerPos(giveplayerid, x, y, z);
	if(!IsPlayerInRangeOfPoint(playerid, 20, x, y, z)) return SendClientMessage(playerid, COLOR_GREY, "You are not close enough to the player.");
	if(giveplayerid == playerid) return SendClientMessage(playerid, -1, "You can not drag yourself");
	if(GetPVarInt(giveplayerid, "Cuffed") == 0) return SendClientMessage(playerid, -1, "Player is not cuffed.");
	//
	if(GetPVarInt(giveplayerid, "Dragged") == 1)
	{
		beingdragged[giveplayerid] = -1;
		format(string, sizeof(string), "* %s has stopped dragging %s.", GetName(playerid), GetName(giveplayerid));
		ProxDetector(30, playerid, string, COLOR_PURPLE);
		SetPVarInt(giveplayerid, "Dragged", 0);
		return 1;
	}
	beingdragged[giveplayerid] = playerid;
	SetPVarInt(giveplayerid, "Dragged", 1);
	format(string, sizeof(string), "* %s is dragging %s.", GetName(playerid), GetName(giveplayerid));
	ProxDetector(30, playerid, string, COLOR_PURPLE);
	return 1;
}

CMD:dragged(playerid, params[])
{
	new str[128];
	format(str, 128, "Dragged = %i", beingdragged[playerid]);
	SendClientMessage(playerid, COLOR_CYAN, str);
	return 1;
}
CMD:cuff(playerid, params[])
{
	if(PlayerInfo[playerid][pFaction] != 1) return SendClientMessage(playerid, -1, "You are not in the LSPD.");
	new string[128], giveplayerid;
	if(sscanf(params, "u", giveplayerid)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /cuff [playerid/partofname]");
	if(giveplayerid == playerid) return SendClientMessage(playerid, -1, "You can't cuff yourself");
	if(GetPVarInt(giveplayerid, "Restrained") == 0) return SendClientMessage(playerid, -1, "Player is not restrained.");
	SetPVarInt(giveplayerid, "Cuffed", 1);
	SetPlayerSkin(giveplayerid, GetPlayerSkin(giveplayerid));
	ClearAnimations(giveplayerid);
	TogglePlayerControllable(giveplayerid, 0);
	format(string, sizeof(string), "* %s has cuffed %s.", GetName(playerid), GetName(giveplayerid));
	ProxDetector(30, playerid, string, COLOR_PURPLE);
	SendClientMessage(giveplayerid, COLOR_CYAN, "You are cuffed.");
	SetPlayerSpecialAction(giveplayerid, SPECIAL_ACTION_CUFFED);

    return 1;
}

CMD:uncuff(playerid, params[])
{
    if(PlayerInfo[playerid][pFaction] != 1) return SendClientMessage(playerid, -1, "You are not in the LSPD.");
	new string[128], giveplayerid;
	if(sscanf(params, "u", giveplayerid)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /uncuff [playerid/partofname]");
	if(giveplayerid == playerid) return SendClientMessage(playerid, -1, "You can't uncuff yourself");
	if(GetPVarInt(giveplayerid, "Cuffed") == 0) return SendClientMessage(playerid, -1, "That player is not cuffed.");
	SetPVarInt(giveplayerid, "Cuffed", 0);
	SetPVarInt(giveplayerid, "Restrained", 0);
	TogglePlayerControllable(giveplayerid, 1);
	format(string, sizeof(string), "* %s has uncuffed %s.", GetName(playerid), GetName(giveplayerid));
	ProxDetector(30, playerid, string, COLOR_PURPLE);
	SendClientMessage(giveplayerid, COLOR_CYAN, "You have been uncuffed.");
	SetPlayerSpecialAction(giveplayerid, SPECIAL_ACTION_NONE);
	ClearAnimations(giveplayerid);
	SetPlayerSkin(giveplayerid, GetPlayerSkin(giveplayerid));
	beingdragged[giveplayerid] = -1;
	SetPVarInt(giveplayerid, "Dragged", 0);
	return 1;
}

CMD:detain(playerid, params[])
{
    if(PlayerInfo[playerid][pFaction] != 1) return SendClientMessage(playerid, -1, "You are not in the LSPD.");
	new str[128];
	new giveplayerid, seat;
    if(sscanf(params, "ui", giveplayerid, seat)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /detain [playerid/partofname] [seat 1-3]");
    if(GetPVarInt(giveplayerid, "Cuffed") == 0) return SendClientMessage(playerid, -1, "That player is not cuffed.");
    if(cardetain[playerid] == -1) return SendClientMessage(playerid, -1, "You have not entered any car to detain the player in.");
    if(seat == 0) return SendClientMessage(playerid, -1, "You can not detain someone in the driver seat.");
    if(seat > 3) return SendClientMessage(playerid, -1, "Valid seat ids are 1-3.");
    SetPVarInt(giveplayerid, "Dragged", 0);
	beingdragged[giveplayerid] = -1;
    RemovePlayerFromVehicle(giveplayerid);
	GetPlayerPos(giveplayerid, PlayerInfo[giveplayerid][pX], PlayerInfo[giveplayerid][pY], PlayerInfo[giveplayerid][pZ]);
	SetPlayerPos(giveplayerid, PlayerInfo[giveplayerid][pX], PlayerInfo[giveplayerid][pX], PlayerInfo[giveplayerid][pY]+1);
    ClearAnimations(giveplayerid);
    SetPlayerSkin(giveplayerid, GetPlayerSkin(giveplayerid));
	PutPlayerInVehicle(giveplayerid, cardetain[playerid], seat);
	format(str, sizeof(str), "* %s has detained %s.", GetName(playerid), GetName(giveplayerid));
	ProxDetector(30, playerid, str, COLOR_PURPLE);
	return 1;
}


CMD:su(playerid, params[])
{
	new string[128], crime[128], giveplayerid;
	if(PlayerInfo[playerid][pFaction] != 1) return SendClientMessage(playerid, -1, "You are not in the LSPD.");
	if(sscanf(params, "us[128]", giveplayerid, crime)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /su [playerid/partofname] [crime]");
	if(PlayerInfo[giveplayerid][pWanted] > 5) return SendClientMessage(playerid, -1, "The suspect is already most wanted.");
	//if(giveplayerid == playerid) return SendClientMessage(playerid, -1, "You can not do that on yourself.");
	format(string, sizeof(string), "ALL UNITS: Officer %s has placed a charge on %s. Crime: %s.", GetName(playerid), GetName(giveplayerid), crime);
	SendClientMessageToLSPD(RADIO, string);
	format(string, sizeof(string), "You have recieved a charge from officer %s, crime: %s.", GetName(playerid), crime);
	SendClientMessage(giveplayerid, COLOR_CYAN, string);
	if(PlayerInfo[giveplayerid][pWanted] == 0)
	{
	    format(PlayerInfo[giveplayerid][pW1], sizeof(PlayerInfo), "%s", crime);
	}
	if(PlayerInfo[giveplayerid][pWanted] == 1)
	{
	    format(PlayerInfo[giveplayerid][pW2], sizeof(PlayerInfo), "%s", crime);
	}
	if(PlayerInfo[giveplayerid][pWanted] == 2)
	{
	    format(PlayerInfo[giveplayerid][pW3], sizeof(PlayerInfo), "%s", crime);
	}
	if(PlayerInfo[giveplayerid][pWanted] == 3)
	{
	    format(PlayerInfo[giveplayerid][pW4], sizeof(PlayerInfo), "%s", crime);
	}
	if(PlayerInfo[giveplayerid][pWanted] == 4)
	{
	   format(PlayerInfo[giveplayerid][pW5], sizeof(PlayerInfo), "%s", crime);
	}
	if(PlayerInfo[giveplayerid][pWanted] == 5)
	{
	    format(PlayerInfo[giveplayerid][pW6], sizeof(PlayerInfo), "%s", crime);
	}
	PlayerInfo[giveplayerid][pWanted] += 1;
	PlayerInfo[giveplayerid][pTotWanted] += 1;
	return 1;
}

CMD:clearwanted(playerid, params[])
{
	new giveplayerid, str[128];
	if(PlayerInfo[playerid][pFaction] != 1) return SendClientMessage(playerid, -1, "You are not in the LSPD.");
	if(sscanf(params, "u", giveplayerid)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /clearwanted [playerid/partofname]");
	PlayerInfo[giveplayerid][pWanted] = 0;
	new ok[56] = "None";
	PlayerInfo[giveplayerid][pW1] = ok[50];
	PlayerInfo[giveplayerid][pW2] = ok[50];
	PlayerInfo[giveplayerid][pW3] = ok[50];
	PlayerInfo[giveplayerid][pW4] = ok[50];
	PlayerInfo[giveplayerid][pW5] = ok[50];
	PlayerInfo[giveplayerid][pW6] = ok[50];
	format(str, 128, "Your wanted record have been cleared by officer %s.", GetName(playerid));
	SendClientMessage(giveplayerid, COLOR_CYAN, str);
	format(str, 128, "You have cleared %s's wanted record", GetName(giveplayerid));
	SendClientMessage(giveplayerid, COLOR_CYAN, str);
	format(str, 128, "%s have cleared %s's wanted record", GetName(playerid), GetName(giveplayerid));
	SendClientMessageToLSPD(RADIO, str);
	return 1;
}

CMD:tazer(playerid, params[])
{
	new string[128];
	if(PlayerInfo[playerid][pFaction] != 1) return SendClientMessage(playerid, COLOR_GRAD1, "You are not a Law Enforcement Officer.");
	if(tazer[playerid] == 0)
	{
	        waitcheck[playerid] = 1;
	        if(waitcheck[playerid] == 2)
	    	{
 				waitcheck[playerid] = 0;
	   		}
			tazerreplace[playerid] = PlayerInfo[playerid][pGuns][2];
			if(PlayerInfo[playerid][pGuns][2] != 0) RemovePlayerWeapon(playerid, PlayerInfo[playerid][pGuns][2]);
   			format(string, sizeof(string), "* %s unholsters their tazer.", GetPlayerNameEx(playerid));
			ProxDetector(30, playerid, string, COLOR_PURPLE);
			GivePlayerValidWeapon(playerid, 23, 60000);
			Log("/logs/weapon.txt", string);
			tazer[playerid] = 1;
		} else {
      		waitcheck[playerid] = 1;
        	if(waitcheck[playerid] == 2)
	    	{
 				waitcheck[playerid] = 0;
	   		}
			RemovePlayerWeapon(playerid, 23);
			GivePlayerValidWeapon(playerid, tazerreplace[playerid], 60000);
			format(string, sizeof(string), "* %s holsters their tazer.", GetPlayerNameEx(playerid));
			ProxDetector(30, playerid, string, COLOR_PURPLE);
			tazer[playerid] = 0;
			Log("/logs/weapon.txt", string);
			return 1;
	}
	return 1;
}

CMD:mole(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 2) return SendClientMessage(playerid, COLOR_GREY, "You are not authorized to use this command.");
	if(AdminDuty[playerid] == 0 && PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, -1, "You are not on duty as an admin");
	new say[126];
	if(sscanf(params, "s[126]", say)) return SendClientMessage(playerid, -1, "USAGE: /mole [text]");
	new str[126];
	format(str, sizeof(str), "SMS: %s, Sender: Mole (555)", say);
	SendClientMessageToAll(COLOR_YELLOW, str);
	return 1;
}


CMD:unban(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4)
	{
		new string[128], giveplayername[MAX_PLAYER_NAME];
		if(sscanf(params, "s[128]", giveplayername)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /unban [exact name]");
		format(string,sizeof(string),PATH,giveplayername);
		if(!fexist(string)) return SendClientMessage(playerid, COLOR_GREY, "Account does not exist.");
		new INI:File = INI_Open(string);
	 	INI_SetTag(File,"data");
		INI_WriteInt(File,"Banned",0);
 		INI_Close(File);
  		new amsg[56];
  		format(amsg, 56, "AdmCmd: %s has unbanned %s.", GetName(playerid), params);
  		SendClientMessageToAdmins(COLOR_LIGHTRED, amsg, 1);
		Log("logs/ban.txt", amsg);
		return 1;
	}
	return 1;
}

CMD:setvw(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		if(AdminDuty[playerid] != 1 && PlayerInfo[playerid][pAdmin] < 6)
	    {
	        SendClientMessage(playerid,COLOR_WHITE, "You are not on duty as an admin, /aduty to go on duty.");
			return 1;
	    }
		new string[128], giveplayerid, vw;
		if(sscanf(params, "ud", giveplayerid, vw)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /setvw [playerid/partofname] [virtual world]");

		if(IsPlayerConnected(giveplayerid))
		{
			PlayerInfo[giveplayerid][pVW] =  vw;
			SetPlayerVirtualWorld(giveplayerid,  vw);
			format(string, sizeof(string), "You have set %s's virtual world to %d.", GetPlayerNameEx(giveplayerid),  vw);
			SendClientMessage(playerid, COLOR_GRAD2, string);
		}
	}
	else
	{
		SendClientMessage(playerid, COLOR_GRAD1, "You're not authorized to use that command!");
	}
	return 1;
}

CMD:setint(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 2)
	{
		if(AdminDuty[playerid] != 1 && PlayerInfo[playerid][pAdmin] < 6)
	    {
	        SendClientMessage(playerid,COLOR_WHITE, "You are not on duty as an admin, /aduty to go on duty.");
			return 1;
	    }

		new string[128], giveplayerid, int;
		if(sscanf(params, "ud", giveplayerid, int)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /setint [playerid/partofname] [interiorid]");

		if(IsPlayerConnected(giveplayerid))
		{
		    if(PlayerInfo[giveplayerid][pAdmin] <= PlayerInfo[playerid][pAdmin]) {
				PlayerInfo[giveplayerid][pInt] = int;
				SetPlayerInterior(giveplayerid, int);
				format(string, sizeof(string), "You have set %s's interior to %d.", GetPlayerNameEx(giveplayerid), int);
				SendClientMessage(playerid, COLOR_GRAD2, string);
			} else return SendClientMessage(playerid, COLOR_GRAD1, "You can't execute this command on equal or higher level admins.");
		}
	}
	else
	{
		SendClientMessage(playerid, COLOR_GRAD1, "You're not authorized to use that command!");
	}
	return 1;
}

CMD:doornear(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4)
	{
		if(AdminDuty[playerid] != 1 && PlayerInfo[playerid][pAdmin] < 6)
	    {
	        SendClientMessage(playerid,COLOR_WHITE, "You are not on duty as an admin, /aduty to go on duty.");
			return 1;
	    }
		new Float:X, Float:Y, Float:Z;
  		GetPlayerPos(playerid, X, Y, Z);
		for(new i;i<MAX_DDOORS;i++)
		{
  			 if(IsPlayerInRangeOfPoint(playerid, 15, DoorInfo[i][ddExteriorX], DoorInfo[i][ddExteriorY], DoorInfo[i][ddExteriorZ]))
			{
				if(DoorInfo[i][ddName] != 0)
				{
				    new string[128];
			    	format(string, sizeof(string), "Door ID %d | %f from you", i, GetDistance(DoorInfo[i][ddExteriorX], DoorInfo[i][ddExteriorY], DoorInfo[i][ddExteriorZ], X, Y, Z));
			    	SendClientMessage(playerid, COLOR_WHITE, string);
				}
			}
		}
	}
	else
	{
	    SendClientMessage(playerid, COLOR_GRAD2, "You're not authorized to use that command!");
	}
	return 1;
}

CMD:doornext(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] >= 4)
	{
		if(AdminDuty[playerid] != 1 && PlayerInfo[playerid][pAdmin] < 6)
	    {
	        SendClientMessage(playerid,COLOR_WHITE, "You are not on duty as an admin, /aduty to go on duty.");
			return 1;
	    }
		for(new x;x<MAX_DDOORS;x++)
		{
		    if(DoorInfo[x][ddName] == 0 && DoorInfo[x][ddInteriorX] == 0 && DoorInfo[x][ddInteriorY] == 0 && DoorInfo[x][ddInteriorZ] == 0)
		    {
		        new string[128];
		        format(string, sizeof(string), "Next dynamic door: %d", x);
		        SendClientMessage(playerid, COLOR_WHITE, string);
		        break;
			}
		}
	}
	else
	{
	    SendClientMessage(playerid, COLOR_GRAD2, "You're not authorized to use that command!");
		return 1;
	}
	return 1;
}

CMD:doorname(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4)
	{
		SendClientMessage(playerid, COLOR_GRAD2, "You're not authorized to use that command!");
		return 1;
	}
	if(AdminDuty[playerid] != 1 && PlayerInfo[playerid][pAdmin] < 6)
 	{
  		SendClientMessage(playerid,COLOR_WHITE, "You are not on duty as an admin, /aduty to go on duty.");
		return 1;
	}

	new string[128], doorid, doorname[128];

	if(sscanf(params, "ds[128]", doorid, doorname)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /doorname [doorid] [name]");

	if(DoorInfo[doorid][ddNotEditable] == 1)
	{
	    SendClientMessage(playerid, COLOR_WHITE, "This door has been set to non-editable by a Level 6 Admin, contact them if you wish to make any changes.");
	    return 1;
	}

	format(DoorInfo[doorid][ddName], 128, "%s", doorname);
	SendClientMessage(playerid, COLOR_WHITE, "You have changed the name of the door!");
	//if(IsValidDynamicPickup(DoorInfo[doorid][ddPickupID])) DestroyPickup(DoorInfo[doorid][ddPickupID]);
	DestroyPickup(DoorInfo[doorid][ddPickupID]);
	if(IsValidDynamic3DTextLabel(DoorInfo[doorid][ddTextID])) DestroyDynamic3DTextLabel(DoorInfo[doorid][ddTextID]);
	CreateDynamicDoor(doorid);
	SaveDynamicDoors();

	format(string, sizeof(string), "%s has edited DoorID %d's Name to %s.", GetPlayerNameEx(playerid), doorid, doorname);
	return 1;
}

CMD:lockdoor(playerid, params[])
{
    for(new i = 0; i < sizeof(DoorInfo); i++) {
        if(IsPlayerInRangeOfPoint(playerid,3.0,DoorInfo[i][ddExteriorX], DoorInfo[i][ddExteriorY], DoorInfo[i][ddExteriorZ]) && PlayerInfo[playerid][pVW] == DoorInfo[i][ddExteriorVW] || IsPlayerInRangeOfPoint(playerid,3.0,DoorInfo[i][ddInteriorX], DoorInfo[i][ddInteriorY], DoorInfo[i][ddInteriorZ]) && PlayerInfo[playerid][pVW] == DoorInfo[i][ddInteriorVW]) {
        	if(DoorInfo[i][ddPass] < 1)
                return SendClientMessage(playerid, COLOR_GREY, "This door isn't allowed to be locked");
         	if(strcmp(DoorInfo[i][ddPass], "None", true) == 0)
                return SendClientMessage(playerid, COLOR_GREY, "This door isn't allowed to be locked");

			ShowPlayerDialogEx(playerid, DOORLOCK, DIALOG_STYLE_INPUT, "Door Security","Enter the password for this door","Login","Cancel");
			SetPVarInt(playerid, "Door", i);
		}
	}
	return 1;
}

CMD:switchfac(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] > 2)
	{
	    	if(AdminDuty[playerid] != 1 && PlayerInfo[playerid][pAdmin] < 6)
 			{
  				SendClientMessage(playerid,COLOR_WHITE, "You are not on duty as an admin, /aduty to go on duty.");
				return 1;
			}
			new fac, str[126];
			if(sscanf(params, "i", fac)) return SendClientMessage(playerid, -1, "USAGE: /switchfac [faction id]");
			PlayerInfo[playerid][pFaction] = fac;
			format(str, sizeof(str), "You have switched faction to: %s.", GetFactionName(playerid));
			SendClientMessage(playerid, COLOR_CYAN, str);
	}
	return 1;
}
CMD:switchrank(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] > 2)
	{
	    	if(AdminDuty[playerid] != 1 && PlayerInfo[playerid][pAdmin] < 6)
 			{
  				SendClientMessage(playerid,COLOR_WHITE, "You are not on duty as an admin, /aduty to go on duty.");
				return 1;
			}
			new rank, str[126];
			if(sscanf(params, "i", rank)) return SendClientMessage(playerid, -1, "USAGE: /switchrank [rank]");
			format(str, sizeof(str), "You have switched rank to: %i.", rank);
            SendClientMessage(playerid, COLOR_CYAN, str);
			PlayerInfo[playerid][pFacRank] = rank;
	}
	return 1;
}

CMD:a(playerid, params[])
{
	if(isnull(params)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /a [text]");
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_GRAD1, "You are not authorized to use this command.");
	new str[128], str2[128];
	if(sscanf(params, "s[128]", str)) SendClientMessage(playerid, COLOR_WHITE, "USAGE: /a [text]");
	format(str2, sizeof(str2), "Level %i Admin %s: %s", PlayerInfo[playerid][pAdmin], GetName(playerid), str);
	SendClientMessageToAdmins(COLOR_YELLOW, str2, 1);
	Log("logs/achat.txt", str2);
	return 1;
}
CMD:c(playerid, params[])
{
	if(isnull(params)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /c [text]");
	if(PlayerInfo[playerid][pHelper] < 2 && PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_GRAD1, "You are not authorized to use this command.");
	new str[128], str2[128];
	if(sscanf(params, "s[128]", str)) SendClientMessage(playerid, COLOR_WHITE, "USAGE: /c [text]");
	if(PlayerInfo[playerid][pHelper] > 1)
	{
		format(str2, sizeof(str2), "Super Helper %s: %s", GetName(playerid), str);
		SendClientMessageToHelpersEx(COLOR_CYAN, str2, 1);
	}
	if(PlayerInfo[playerid][pAdmin] > 1)
	{
		format(str2, sizeof(str2), "Level %i Admin %s: %s", PlayerInfo[playerid][pAdmin], GetName(playerid), str);
		SendClientMessageToHelpersEx(COLOR_CYAN, str2, 1);
	}
	Log("logs/helperchat.txt", str2);
	return 1;
}
CMD:revive(playerid, params[])
{
	new giveplayerid;
    if(PlayerInfo[playerid][pAdmin] < 3) return SendClientMessage(playerid, COLOR_GRAD1, "You are not authorized to use this command.");
   	if(AdminDuty[playerid] != 1 && PlayerInfo[playerid][pAdmin] < 6)
	{
		SendClientMessage(playerid,COLOR_WHITE, "You are not on duty as an admin, /aduty to go on duty.");
		return 1;
	}
    if(sscanf(params, "u", giveplayerid)) SendClientMessage(playerid, COLOR_WHITE, "USAGE: /revive [playerid/partofname]");
    if(isnull(params)) return 1;
	if(GetPVarInt(giveplayerid, "Injured") == 0) return SendClientMessage(playerid, COLOR_GREY, "Player is not injured.");
    SetPVarInt(giveplayerid, "Injured", 0);
    ClearAnimations(giveplayerid, 1);
    SetPlayerHealth(giveplayerid, 100);
    KillTimer(itimer[giveplayerid]);
    KillTimer(iitimer[giveplayerid]);
    SendClientMessage(giveplayerid, -1, "You were revived by an admin.");
	return 1;
}

CMD:sethp(playerid, params[])
{
	new giveplayerid, Float:HP, str[126];
    if(PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, COLOR_GRAD1, "You are not authorized to use this command.");
   	if(AdminDuty[playerid] != 1 && PlayerInfo[playerid][pAdmin] < 6)
	{
		SendClientMessage(playerid,COLOR_WHITE, "You are not on duty as an admin, /aduty to go on duty.");
		return 1;
	}
    if(sscanf(params, "uf", giveplayerid, HP)) SendClientMessage(playerid, COLOR_WHITE, "USAGE: /sethp [playerid/partofname] [hp]");
    SetPlayerHealth(giveplayerid, HP);
	format(str, 126, "You have set %s's health to %.2f", GetName(giveplayerid), HP);
	SendClientMessage(playerid, -1, str);
	return 1;
}

CMD:setarmor(playerid, params[])
{
	new giveplayerid, Float:HP, str[126];
    if(PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, COLOR_GRAD1, "You are not authorized to use this command.");
   	if(AdminDuty[playerid] != 1 && PlayerInfo[playerid][pAdmin] < 6)
	{
		SendClientMessage(playerid,COLOR_WHITE, "You are not on duty as an admin, /aduty to go on duty.");
		return 1;
	}
    if(sscanf(params, "uf", giveplayerid, HP)) SendClientMessage(playerid, COLOR_WHITE, "USAGE: /setarmor [playerid/partofname] [armor]");
	skipacheck[playerid] = 2;
    PlayerInfo[giveplayerid][pArmor] = HP;
    SetPlayerArmour(giveplayerid, HP);
	format(str, 126, "You have set %s's armor to %.2f", GetName(giveplayerid), HP);
	SendClientMessage(playerid, -1, str);
	return 1;
}

CMD:makeadmin(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 6) return SendClientMessage(playerid, COLOR_GRAD1, "Stop!");
    new giveid, admlvl, str[128];
	if(sscanf(params, "ui", giveid, admlvl)) SendClientMessage(playerid, COLOR_WHITE, "USAGE: /makeadmin [playerid/partofname] [1-6]");
	if(isnull(params)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /makeadmin [playerid/partofname] [1-6]");
	PlayerInfo[giveid][pAdmin] = admlvl;
	format(str, sizeof(str), "%s has been made a level %i admin by %s.", GetName(giveid), PlayerInfo[giveid][pAdmin], GetName(playerid));
	SendClientMessageToAdmins(COLOR_LIGHTRED, str, 1);
	Log("logs/makeadmin.txt", str);
    return 1;
}

CMD:respawnvehicles(playerid, params[])
{
	SendClientMessageToAll(-1, "Respawning all cars in 10 seconds.");
	SetTimer("respawncars", 10000, false);
    return 1;
}

forward respawncars();
public respawncars()
{
    for(new i; i < MAX_VEHICLES; i++) if(!IsVehicleOccupied(i)) SetVehicleToRespawn(i);
    return 1;
}

CMD:ah(playerid, params[])
{
    if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, -1, "You are not an admin.");
	SendClientMessage(playerid, COLOR_GREY, "* = Not scripted yet");
	if(PlayerInfo[playerid][pAdmin] >= 1)
	SendClientMessage(playerid, COLOR_GREY, "ADMIN LEVEL 1: /a /spec /jail /kick /aduty /slap /ao /nrn /gotox /ar /tr");
	if(PlayerInfo[playerid][pAdmin] >= 2)
	SendClientMessage(playerid, COLOR_GREY, "ADMIN LEVEL 2: /ban /check /prison /mole");
	if(PlayerInfo[playerid][pAdmin] >= 3)
	SendClientMessage(playerid, COLOR_GREY, "ADMIN LEVEL 3: /switchfac /switchrank /revive /release /gotoid /gethere /fine");
	if(PlayerInfo[playerid][pAdmin] >= 4)
	SendClientMessage(playerid, COLOR_GREY, "ADMIN LEVEL 4: /dooredit /doornext /doorname /doornear /unban /sethp /setarmor /makehelper /unbanip /banip");
	SendClientMessage(playerid, COLOR_GREY, "ADMIN LEVEL 4: /givemoney /givegun /seteventpos /editevent /startevent /beginevent /announceevent /lockevent");
	if(PlayerInfo[playerid][pAdmin] >= 5)
	SendClientMessage(playerid, COLOR_GREY, "ADMIN LEVEL 5: /setadminname /respawnvehicles");
	if(PlayerInfo[playerid][pAdmin] >= 6)
	SendClientMessage(playerid, COLOR_GREY, "ADMIN LEVEL 6: /makeadmin");
	return 1;
}
CMD:drop(playerid, params[])
{
	new choice[56];
	if(sscanf(params, "s", choice)) { SendClientMessage(playerid, -1, "USAGE: /drop [choice]"); SendClientMessage(playerid, -1, "Choices: materials, weapons"); return 1; }
    if(strcmp(choice, "materials", true) == 0)
	{
		new str[126];
	    format(str, sizeof(str), "%s has dropped their materials.", GetName(playerid));
		ProxDetector(30, playerid, str, COLOR_PURPLE);
		format(str, sizeof(str), "You have dropped %i materials.", PlayerInfo[playerid][pMaterials]);
		SendClientMessage(playerid, -1, str);
		PlayerInfo[playerid][pMaterials] = 0;
		return 1;
	}
    if(strcmp(choice, "weapons", true) == 0)
	{
		new str[126];
	    format(str, sizeof(str), "%s has dropped their weapons.", GetName(playerid));
		ProxDetector(30, playerid, str, COLOR_PURPLE);
		SendClientMessage(playerid, -1, "You have dropped your weapons.");
		ResetPlayerWeapons(playerid);
		ResetPlayerWeaponsEx(playerid);
		return 1;
	}
	return 1;
}
CMD:help(playerid, params[])
{
	SendClientMessage(playerid, COLOR_GREY, "GENERAL: /me /do /s /help /join /quitjob /kill /bail /time /findboatmatrun");
	SendClientMessage(playerid, COLOR_GREY, "GENERAL: /togooc /drop weapons /tognewb /togooc /pm /contract");
	SendClientMessage(playerid, COLOR_GREY, "VEHICLE: /park /v(de)spawn /vlist /vdelete /spraycar");
	SendClientMessage(playerid, COLOR_GREY, "HELP: /n(ewb) /report");
	if(PlayerInfo[playerid][pHelper] > 1) { SendClientMessage(playerid, COLOR_GREY, "LEVEL 2 HELPER: /nmute /nrn"); }
	if(PlayerInfo[playerid][pFaction] == 1)
	{
		SendClientMessage(playerid, COLOR_GREY, "LSPD: /m /cuff /detain /arrest /tazer /drag /su /quitfaction");
		SendClientMessage(playerid, COLOR_GREY, "LSPD: /clearwanted /r /d /badge /deploycade(2) /deployspike /destroycade(s) /destroyspike(s)");
		if(PlayerInfo[playerid][pFacRank] >= 4)
		{
			SendClientMessage(playerid, COLOR_GREY, "LSPD: /div");
		}
	    if(PlayerInfo[playerid][pFacRank] >= 5)
		{
			SendClientMessage(playerid, COLOR_GREY, "LSPD: /giverank /invite");

		}
	}
	if(PlayerInfo[playerid][pFaction] == 3)
	{
		SendClientMessage(playerid, COLOR_GREY, "LSFMD: /acceptcall /load /deliver");
		{
			if(PlayerInfo[playerid][pFacRank] >= 4)
		 	{
				SendClientMessage(playerid, COLOR_GREY, "LSFMD: /div");
			}
		}
	}
	if(PlayerInfo[playerid][pFaction] == 4)
	{
	SendClientMessage(playerid, COLOR_GREY, "HITMAN: /togdr /givemehit /accept hit /contracts /hstats");
	}
	if(PlayerInfo[playerid][pJob] == 1)
	SendClientMessage(playerid, COLOR_GREY, "JOB: /loadtruck /canceltruck");
	if(PlayerInfo[playerid][pJob] == 2)
	SendClientMessage(playerid, COLOR_GREY, "JOB: /guard*");
	if(PlayerInfo[playerid][pJob] == 3)
	SendClientMessage(playerid, COLOR_GREY, "JOB: /getmats /sellgun");
	if(PlayerInfo[playerid][pAdmin] >= 1)
	SendClientMessage(playerid, COLOR_GREY, "ADMIN: /ah");
	if(PlayerInfo[playerid][pHelper] >= 2)
	SendClientMessage(playerid, COLOR_GREY, "HELPER: /c /nrn");
	return 1;
}

CMD:ao(playerid, params[])
{
	new say[256];
	if(PlayerInfo[playerid][pAdmin] < 1) return SendClientMessage(playerid, COLOR_GREY, "You are not authorized to use this command.");
	if(isnull(params)) return SendClientMessage(playerid, -1, "USAGE: /ao [text]");
	if(sscanf(params, "s[256]", say))
	{
	SendClientMessage(playerid, -1, "USAGE: /ao [text]");
	}
	new str[256];
	format(str, 256, "(( Administrator [OOC] %s says: %s ))", GetName(playerid), say);
	SendClientMessageToAll(COLOR_LIGHTRED, str);
	return 1;
}

CMD:o(playerid, params[])
{
	new say[256];
	if(togo[playerid] == 0) return SendClientMessage(playerid, COLOR_CYAN, "You have not enabled OOC chat. Type /togooc if you wish to toggle it.");
	if(isnull(params)) return SendClientMessage(playerid, -1, "USAGE: /o [text]");
	if(sscanf(params, "s[256]", say))
	{
	SendClientMessage(playerid, -1, "USAGE: /o [text]");
	}
	new str[256];
	format(str, 256, "(( [OOC] %s says: %s ))", GetName(playerid), say);
	SCMTO(str);
	return 1;
}
CMD:togooc(playerid, params[])
{
	if(togo[playerid] == 0)
	{
	togo[playerid] = 1;
	SendClientMessage(playerid, COLOR_CYAN, "You have enabled OOC chat. (Type /o to chat.)");
	return 1;
	}
	if(togo[playerid] == 1)
	{
	togo[playerid] = 0;
	SendClientMessage(playerid, COLOR_CYAN, "You have disabled OOC chat. (Type /o to chat.)");
	return 1;
	}
	return 1;
}

CMD:tognewb(playerid, params[])
{
	if(tognewbie[playerid] == 0)
	{
	tognewbie[playerid] = 1;
	SendClientMessage(playerid, COLOR_GREY, "You have disabled newbie chat.");
	return 1;
	}
	if(tognewbie[playerid] == 1)
	{
	tognewbie[playerid] = 0;
	SendClientMessage(playerid, COLOR_GREY, "You have enabled newbie chat.");
	return 1;
	}
	return 1;
}

CMD:togdr(playerid, params[])
{
	if(PlayerInfo[playerid][pFaction] != 4) return SendClientMessage(playerid, -1, "You are not a hitman.");
    if(togdr[playerid] == 1)
	{
	togdr[playerid] = 0;
	SendClientMessage(playerid, COLOR_CYAN, "You have disabled department radio.");
	return 1;
	}
	if(togdr[playerid] == 0)
	{
	togdr[playerid] = 1;
	SendClientMessage(playerid, COLOR_CYAN, "You have enabled department radio.");
	return 1;
	}
	return 1;
}

CMD:m(playerid, params[])
{
	new
        string[128],
        action[100];
	if(PlayerInfo[playerid][pFaction] != 1 && 2 && 3)
	{
	    SendClientMessage(playerid, COLOR_GREY, "You are not in a faction with a megaphone.");
	    return 1;
	}
    if(sscanf(params, "s[100]", action))
    {
        SendClientMessage(playerid, -1, "USAGE: /m [text]");
        return 1;
    }
    else
    {
        format(string, sizeof(string), "[MEGAPHONE] %s: %s", GetName(playerid), action);
        ProxDetector(30, playerid, string, COLOR_YELLOW);
    }
    return 1;
}

CMD:d(playerid, params[])
{
	new string[128], text[100];
	if(PlayerInfo[playerid][pFaction] != 1 && PlayerInfo[playerid][pFaction] != 2 && PlayerInfo[playerid][pFaction] != 3)
	{
	    SendClientMessage(playerid, COLOR_GREY, "You are not in a faction with a department radio.");
	    return 1;
	}
 	if(sscanf(params, "s[100]", text))
    {
        SendClientMessage(playerid, -1, "USAGE: /d(epartment chat) [text]");
        return 1;
    }
    if(PlayerInfo[playerid][pFacDiv] != 0)
    {
		format(string, sizeof(string), "* %s (%s) %s: %s", GetRankName(playerid), GetDivisionName(playerid), GetName(playerid), text);
	}
	else
	{
	    format(string, sizeof(string), "* %s %s: %s", GetRankName(playerid), GetName(playerid), text);
	}
 	SendClientMessageToDepartments(DEPTRADIO, string);
	Log("/logs/radio.txt", string);
	return 1;
}

CMD:invite(playerid, params[])
{
	new giveplayerid, str[126];
	if(PlayerInfo[playerid][pFaction] == 0) return SendClientMessage(playerid, COLOR_GREY, "You are not in a faction.");
	if(PlayerInfo[playerid][pFacRank] < 6 && PlayerInfo[playerid][pFacLeader] != PlayerInfo[playerid][pFaction]) return SendClientMessage(playerid, COLOR_GREY, "You are not rank 6 or have leadership powers.");
    if(sscanf(params, "u", giveplayerid)) return SendClientMessage(playerid, -1, "USAGE: /invite [playerid/partofname]");
    if(PlayerInfo[giveplayerid][pFaction] != 0) return SendClientMessage(playerid, COLOR_GREY, "The specified player is already in a faction.");
    invitedby[giveplayerid] = playerid;
    invitedto[giveplayerid] = PlayerInfo[playerid][pFaction];
    format(str, sizeof(str), "%s has invited you to the faction %s. (/accept invite to accept.)", GetName(playerid), GetFactionNameEx(PlayerInfo[playerid][pFaction]));
    SendClientMessage(giveplayerid, COLOR_CYAN, str);
    format(str, sizeof(str), "You have invited %s to %s.", GetName(giveplayerid), GetFactionNameEx(PlayerInfo[playerid][pFaction]));
    SendClientMessage(playerid, COLOR_CYAN, str);
    format(str, sizeof(str), "%s has invited %s to %s.", GetName(playerid), GetName(giveplayerid), GetFactionNameEx(PlayerInfo[playerid][pFaction]));
	Log("/logs/invite.txt", str);
	return 1;
}

CMD:uninvite(playerid, params[])
{
	new giveplayerid, str[126];
	if(PlayerInfo[playerid][pFaction] == 0) return SendClientMessage(playerid, COLOR_GREY, "You are not in a faction.");
	if(PlayerInfo[playerid][pFacRank] < 5) return SendClientMessage(playerid, COLOR_GREY, "You are not above rank 5.");
    if(sscanf(params, "u", giveplayerid)) return SendClientMessage(playerid, -1, "USAGE: /uninvite [playerid/partofname]");
    if(PlayerInfo[giveplayerid][pFaction] != PlayerInfo[playerid][pFaction]) return SendClientMessage(playerid, COLOR_GREY, "The specified player is not in your faction.");
    format(str, sizeof(str), "%s has removed you from %s.", GetName(playerid), GetFactionNameEx(PlayerInfo[playerid][pFaction]));
    SendClientMessage(giveplayerid, COLOR_CYAN, str);
    format(str, sizeof(str), "You have removed %s to %s.", GetName(giveplayerid), GetFactionNameEx(PlayerInfo[playerid][pFaction]));
    SendClientMessage(playerid, COLOR_CYAN, str);
    format(str, sizeof(str), "%s has uninvited %s from %s as a rank %i.", GetName(playerid), GetName(giveplayerid), GetFactionNameEx(PlayerInfo[playerid][pFaction]), PlayerInfo[playerid][pFacRank]);
	PlayerInfo[giveplayerid][pFaction] = 0;
	PlayerInfo[giveplayerid][pFacRank] = 0;
    PlayerInfo[giveplayerid][pFacDiv] = 0;
    SetPlayerColor(giveplayerid, 0xFFFFFF00);
    ShowPlayerDialog(giveplayerid, DIALOG_UNINVITESKIN, DIALOG_STYLE_INPUT,""COL_WHITE"Skin change",""COL_WHITE"Select a skin to use. Valid skin IDs are 0 to 299.","Change","No");
	Log("/logs/invite.txt", str);
	return 1;
}

CMD:gov(playerid, params[])
{
	new say[126], str[126];
	if(PlayerInfo[playerid][pFaction] != 1 && PlayerInfo[playerid][pFaction] != 2 && PlayerInfo[playerid][pFaction] != 3) return SendClientMessage(playerid, COLOR_GREY, "You don't have access to this command.");
	if(PlayerInfo[playerid][pFacRank] < 5) return SendClientMessage(playerid, COLOR_GREY, "You don't have access to this command.");
	if(sscanf(params, "s[126]", say)) return SendClientMessage(playerid, -1, "USAGE: /gov [text]");
	format(str, sizeof(str), "%s %s %s: %s", GetFactionName(playerid), GetRankName(playerid), GetName(playerid), say);
	SendClientMessageToAll(COLOR_GREEN, "|______________GOVERNMENT ANNOUNCEMENT______________|");
	SendClientMessageToAll(COLOR_TWBLUE, str);
	SendClientMessageToAll(COLOR_GREEN, "|___________________________________________________|");
	return 1;
}

CMD:givegun(playerid, params[])
{
	new giveplayerid, gun;
	if(PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, COLOR_GREY, "You are not authorized to use this command.");
	if(AdminDuty[playerid] != 1 && PlayerInfo[playerid][pAdmin] < 6)
	{
		SendClientMessage(playerid,COLOR_WHITE, "You are not on duty as an admin, /aduty to go on duty.");
		return 1;
	}
	if(sscanf(params, "ui", giveplayerid, gun)) return SendClientMessage(playerid, -1, "USAGE: /givegun [playerid/partofname] [weaponid]");
	SendClientMessage(playerid, -1, "Gave player gun.");
	SendClientMessage(giveplayerid, -1, "Given gun.");
	GivePlayerValidWeapon(giveplayerid, gun, 999999);
	return 1;
}


CMD:findboatmatrun(playerid, params[])
{
	if(CPT[playerid] < 1) return SendClientMessage(playerid, -1, "You currently have a checkpoint, please /destroycheckpoint.");
	SetPlayerCheckpoint(playerid, 2099.64, -105.84, 0.68, 5);
	return 1;
}
	


CMD:accept(playerid, params[])
{
	new choice[56];
	if(sscanf(params, "s", choice)) { SendClientMessage(playerid, -1, "USAGE: /accept [choice]"); SendClientMessage(playerid, -1, "Choices: invite, wep"); return 1; }
	if(strcmp(choice, "hit", true) == 0)
	{
	    new str[126];
	    if(PlayerInfo[playerid][pFaction] != 4) return SendClientMessage(playerid, -1, "You are not in the Hitman Agency.");
	    if(GetPVarInt(playerid, "givemehit") == -1) return SendClientMessage(playerid, -1, "No-one has offered you a contract.");
	    SetPVarInt(playerid, "acceptcontract", GetPVarInt(playerid, "givemehit"));
	    format(str, sizeof(str), "Hitman %s has accepted the hit on %s.", GetName(playerid), GetName(GetPVarInt(playerid, "givemehit")));
	    SendClientMessageToHA(COLOR_YELLOW, str);
		SendClientMessageToAll(-1, str);
		return 1;
	}
	if(strcmp(choice, "vest", true) == 0)
	{
		new offeredby = GetPVarInt(playerid, "OfferedBy");
		new price = GetPVarInt(playerid, "VestPrice");
		if(GetPVarInt(playerid, "OfferedBy") == -1) return SendClientMessage(playerid, COLOR_GREY, "Nobody has offered you a vest.");
		if(GetPVarInt(playerid, "VestPrice") == 0) return SendClientMessage(playerid, COLOR_GREY, "Nobody has offered you a vest."); // just in case someone finds an exploit.
		if(PlayerInfo[playerid][pCash] < price) return SendClientMessage(playerid, COLOR_GREY, "You don't have enough cash.");
		new Float:armor;
        GetPlayerArmour(playerid, armor);
		if(armor > 49) return SendClientMessage(playerid, COLOR_GREY, "You can't wear another vest as you already have one.");
		PlayerInfo[playerid][pArmor] = 50;
		SetPlayerArmour(playerid, 50);
		PlayerInfo[playerid][pCash] -= price;
		PlayerInfo[offeredby][pCash] += price;
		SetPVarInt(playerid, "VestPrice", 0);
		SetPVarInt(playerid, "OfferedBy", 0);
		return 1;
	}
	if(strcmp(choice, "invite", true) == 0)
	{
		if(invitedto[playerid] == 0) return SendClientMessage(playerid, COLOR_GREY, "You have not been invited to join any faction.");
	    new str[126];
	    format(str, sizeof(str), "You have accepted the invite from %s to %s.", GetName(invitedby[playerid]), GetFactionNameEx(invitedto[playerid]));
	    PlayerInfo[playerid][pFaction] = invitedto[playerid];
	    PlayerInfo[playerid][pFacRank] = 0;
	    PlayerInfo[playerid][pFacDiv] = 0;
		SendClientMessage(playerid, COLOR_CYAN, str);
		format(str, sizeof(str), "%s has accepted the invitation to join %s.", GetName(playerid), GetFactionName(PlayerInfo[playerid][pFaction]));
		SendClientMessage(invitedby[playerid], COLOR_CYAN, str);
		invitedby[playerid] = -1;
		invitedto[playerid] = 0;
		return 1;
	}
	if(strcmp(choice, "wep", true) == 0)
	{
	    if(weaponbeingoffered[playerid] == 0) return SendClientMessage(playerid, COLOR_GRAD1, "No-one has offered you a weapon.");
		if(beingofferedby[playerid] > -1)
		{
			new str[128];
	        waitcheck[playerid] = 1;
	        if(waitcheck[playerid] == 2)
	 		waitcheck[playerid] = 0;
		    GivePlayerValidWeapon(playerid, weaponbeingoffered[playerid], 60000);
			format(str, sizeof(str), "%s has accepted the weapon.", GetName(playerid));
			SendClientMessage(beingofferedby[playerid], COLOR_CYAN, str);
			format(str, sizeof(str), "You have accepted the weapon from %s.", GetName(beingofferedby[playerid]));
			SendClientMessage(beingofferedby[playerid], COLOR_CYAN, str);
			PlayerInfo[beingofferedby[playerid]][pWDealerSkill] += 1;
			beingofferedby[playerid] = -1;
	  		weaponbeingoffered[playerid] = 0;
			if(weaponbeingoffered[playerid] == 23)
	  		PlayerInfo[beingofferedby[playerid]][pMaterials] -= 100;
	  		if(weaponbeingoffered[playerid] == 22)
	    	PlayerInfo[beingofferedby[playerid]][pMaterials] -= 150;
	  		if(weaponbeingoffered[playerid] == 25)
	  		PlayerInfo[beingofferedby[playerid]][pMaterials] -= 200;
	  		if(weaponbeingoffered[playerid] == 29)
	  		PlayerInfo[beingofferedby[playerid]][pMaterials] -= 400;
	  		if(weaponbeingoffered[playerid] == 5)
	  		PlayerInfo[beingofferedby[playerid]][pMaterials] -= 25;
	  		if(weaponbeingoffered[playerid] == 33)
	  		PlayerInfo[beingofferedby[playerid]][pMaterials] -= 1500;
	  	  	if(weaponbeingoffered[playerid] == 8)
	  		PlayerInfo[beingofferedby[playerid]][pMaterials] -= 50;
	  		if(weaponbeingoffered[playerid] == 30)
	  		PlayerInfo[beingofferedby[playerid]][pMaterials] -= 2000;
	  		if(weaponbeingoffered[playerid] == 24)
	  		PlayerInfo[beingofferedby[playerid]][pMaterials] -= 1000;
	  		if(weaponbeingoffered[playerid] == 27)
	  		PlayerInfo[beingofferedby[playerid]][pMaterials] -= 6000;
	  		if(weaponbeingoffered[playerid] == 31)
	  		PlayerInfo[beingofferedby[playerid]][pMaterials] -= 3000;
	  		if(weaponbeingoffered[playerid] == 34)
	  		PlayerInfo[beingofferedby[playerid]][pMaterials] -= 7000;
	  		if(weaponbeingoffered[playerid] == 1)
	    	PlayerInfo[beingofferedby[playerid]][pMaterials] -= 50;
	  		return 1;
		}
	}
	return 1;
}


CMD:giverank(playerid, params[])
{
	new rank, giveplayerid, str[126];
	if(PlayerInfo[playerid][pFaction] == 0) return SendClientMessage(playerid, COLOR_GREY, "You are not in a faction.");
	if(PlayerInfo[playerid][pFacRank] < 5) return SendClientMessage(playerid, COLOR_GREY, "You are not above rank 5.");
	if(sscanf(params, "ui", giveplayerid, rank)) return SendClientMessage(playerid, -1, "USAGE: /give [playerid/partofname] [rank]");
	if(PlayerInfo[giveplayerid][pFaction] != PlayerInfo[playerid][pFaction]) return SendClientMessage(playerid, COLOR_GREY, "The specified player is not in your faction.");
	PlayerInfo[giveplayerid][pFacRank] = rank;
	format(str, sizeof(str), "You have set %s's rank to %i (%s)", GetName(giveplayerid), rank, GetRankName(giveplayerid));
	SendClientMessage(playerid, COLOR_CYAN, str);
	format(str, sizeof(str), "%s has set your rank to %i (%s)", GetName(playerid), rank, GetRankName(giveplayerid));
	SendClientMessage(playerid, COLOR_CYAN, str);
	return 1;
}

CMD:div(playerid, params[])
{
	new div, giveplayerid, str[126];
	if(PlayerInfo[playerid][pFaction] == 0) return SendClientMessage(playerid, COLOR_GREY, "You are not in a faction.");
	if(PlayerInfo[playerid][pFacRank] < 4) return SendClientMessage(playerid, COLOR_GREY, "You are not above rank 4.");
	if(sscanf(params, "ui", giveplayerid, div))
	{
		SendClientMessage(playerid, -1, "USAGE: /div [playerid/partofname] [division number]");
		if(PlayerInfo[playerid][pFaction] == 1)
		{
		SendClientMessage(playerid, -1, "Divisions: 0) None - 1) SWAT - 2) TE - 3) FTO - 4) IA");
		}
		if(PlayerInfo[playerid][pFaction] == 2)
		{
	 	SendClientMessage(playerid, -1, "Divisions: 0) None - 1) FAN - 2) GU - 3) IA");
	 	}
	 	if(PlayerInfo[playerid][pFaction] == 3)
	 	{
		SendClientMessage(playerid, -1, "Divisions: 0) None - 1) Human Resources - 2) Life Flight");
		}
		return 1;
	}
	if(PlayerInfo[giveplayerid][pFaction] != PlayerInfo[playerid][pFaction]) return SendClientMessage(playerid, COLOR_GREY, "The specified player is not in your faction.");
	PlayerInfo[giveplayerid][pFacDiv] = div;
	format(str, sizeof(str), "You have set %s's divison to %s (%i)", GetName(giveplayerid), GetDivisionName(giveplayerid), div);
	SendClientMessage(playerid, COLOR_CYAN, str);
	format(str, sizeof(str), "%s has set your divison to %s (%i)", GetName(playerid), GetDivisionName(giveplayerid), div);
	SendClientMessage(giveplayerid, COLOR_CYAN, str);
	return 1;
}

CMD:r(playerid, params[])
{
	new string[128], text[100];
	if(PlayerInfo[playerid][pFaction] != 1 && PlayerInfo[playerid][pFaction] != 3 && PlayerInfo[playerid][pFaction] != 2)
	{
	    SendClientMessage(playerid, COLOR_GREY, "You are not in a faction with a radio.");
	    return 1;
	}
 	if(sscanf(params, "s[100]", text))
    {
        SendClientMessage(playerid, -1, "USAGE: /r(adio) [text]");
        return 1;
    }
	if(PlayerInfo[playerid][pFaction] == 1)
	{
	    if(PlayerInfo[playerid][pFacDiv] > 0)
		{
		format(string, sizeof(string), "* %s %s (%s): %s", GetRankName(playerid), GetName(playerid), GetDivisionName(playerid), text);
  		SendClientMessageToLSPD(RADIO, string);
	    Log("/logs/radio.txt", string);
		}
			else
		{
		format(string, sizeof(string), "* %s %s: %s", GetRankName(playerid), GetName(playerid), text);
  		SendClientMessageToLSPD(RADIO, string);
	    Log("/logs/radio.txt", string);
	    }
	}
	if(PlayerInfo[playerid][pFaction] == 2)
	{
	    if(PlayerInfo[playerid][pFacDiv] > 0)
		{
		format(string, sizeof(string), "* %s %s (%s): %s", GetRankName(playerid), GetName(playerid), GetDivisionName(playerid), text);
  		SendClientMessageToLSPD(RADIO, string);
	    Log("/logs/radio.txt", string);
		}
			else
		{
		format(string, sizeof(string), "* %s %s: %s", GetRankName(playerid), GetName(playerid), text);
  		SendClientMessageToLSPD(RADIO, string);
	    Log("/logs/radio.txt", string);
	    }
	}
	if(PlayerInfo[playerid][pFaction] == 3)
	{
	    if(PlayerInfo[playerid][pFacDiv] > 0)
		{
		format(string, sizeof(string), "* %s %s (%s): %s", GetRankName(playerid), GetName(playerid), GetDivisionName(playerid), text);
  		SendClientMessageToLSPD(RADIO, string);
	    Log("/logs/radio.txt", string);
		}
			else
		{
		format(string, sizeof(string), "* %s %s: %s", GetRankName(playerid), GetName(playerid), text);
  		SendClientMessageToLSPD(RADIO, string);
	    Log("/logs/radio.txt", string);
	    }
	}
	return 1;
}

CMD:me(playerid, params[])
{
    new
        string[128],
        action[100];
    if(sscanf(params, "s[100]", action))
    {
        SendClientMessage(playerid, -1, "USAGE: /me [action]");
        return 1;
    }
    else
    {
        format(string, sizeof(string), "* %s %s", GetName(playerid), action);
        ProxDetector(30, playerid, string, COLOR_PURPLE);
    }
    return 1;
}

CMD:do(playerid, params[])
{
    new
        string[128],
        action[100];
    if(sscanf(params, "s[100]", action))
    {
        SendClientMessage(playerid, -1, "USAGE: /do [action]");
        return 1;
    }
    else
    {
        format(string, sizeof(string), "* %s (( %s ))", action, GetName(playerid));
        ProxDetector(30, playerid, string, COLOR_PURPLE);
    }
    return 1;
}
CMD:shout(playerid, params[])
{
    new
        string[128],
        shout[100];
    if(sscanf(params, "s[100]", shout))
    {
        SendClientMessage(playerid, -1, "USAGE: /(s)hout [message]");
        return 1;
    }
    else
    {
        format(string, sizeof(string), "%s shouts: %s!",GetName(playerid),shout);
        ProxDetector(50.0, playerid, string, -1);
        Log("/logs/chat.txt", string);
    }
    return 1;
}
CMD:b(playerid, params[])
{
	new string[128], text[100];
	if(sscanf(params, "s[100]", text)) return SendClientMessage(playerid, -1, "USAGE: /b [TEXT]");
 	format(string, sizeof(string), "(( %s says: %s ))", GetName(playerid), text);
	ProxDetector(30.0, playerid, string, COLOR_GREY);
  	Log("/logs/chat.txt", string);
	return 1;
}
CMD:s(playerid, params[]) return cmd_shout(playerid, params);

CMD:pm(playerid, params[])
{
	new str[256], str2[256], id, Name1[MAX_PLAYER_NAME], Name2[MAX_PLAYER_NAME];
	if(sscanf(params, "us", id, str2))
	{
	    SendClientMessage(playerid, 0xFF0000FF, "Usage: /pm [playerid/partofname]");
	    return 1;
	}
	if(!IsPlayerConnected(id)) return SendClientMessage(playerid, COLOR_GREY, "Invalid player specified.");
	if(playerid == id) return SendClientMessage(playerid, COLOR_GREY, "You can not PM yourself.");
	{
		GetPlayerName(playerid, Name1, sizeof(Name1));
		GetPlayerName(id, Name2, sizeof(Name2));
		format(str, sizeof(str), "(( PM to %s (ID %d): %s ))", Name2, id, str2);
		SendClientMessage(playerid, 0xFF0000FF, str);
		format(str, sizeof(str), "(( PM from %s (ID %d): %s ))", Name1, playerid, str2);
		SendClientMessage(id, 0xFF0000FF, str);
	}
	return 1;
}

CMD:kill(playerid, params[])
{
	if(GetPVarInt(playerid, "Restrained") == 1)
	{
		SendClientMessage(playerid, COLOR_GREY, "You can not kill yourself while restrained.");
		return 1;
	}
	if(GetPVarInt(playerid, "Cuffed") == 1)
	{
		SendClientMessage(playerid, COLOR_GREY, "You can not kill yourself while restrained.");
		return 1;
	}
	if(GetPVarInt(playerid, "Tazed") == 1)
	{
		SendClientMessage(playerid, COLOR_GREY, "You can not kill yourself while restrained.");
		return 1;
	}
	SetPlayerHealth(playerid, 0);
	SetPlayerArmour(playerid, 0);
	return 1;
}
CMD:giveup(playerid, params[])
{
    if(GetPVarInt(playerid, "Injured") == 1)
	{
	    SetPlayerHealth(playerid, 0);
	}
	else
	{
	    SendClientMessage(playerid, COLOR_GREY, "You are not injured.");
	}
	return 1;
}

CMD:stats(playerid, params[])
{
	ShowStats(playerid, playerid);
	return 1;
}
CMD:quitfaction(playerid, params[])
{
	if(PlayerInfo[playerid][pFaction] < 1) return SendClientMessage(playerid, COLOR_GREY, "You are not in a faction.");
	PlayerInfo[playerid][pFaction] = 0;
	PlayerInfo[playerid][pFacRank] = 0;
	PlayerInfo[playerid][pFacDiv] = 0;
	PlayerInfo[playerid][pFacLeader] = 0;
	SetPlayerColor(playerid, 0xFFFFFF00);
	SendClientMessage(playerid, COLOR_OOC, "You have quit your faction and is now a civillian again.");
	ShowPlayerDialog(playerid, DIALOG_UNINVITESKIN, DIALOG_STYLE_INPUT,""COL_WHITE"Skin change",""COL_WHITE"Select a skin to use. Valid skin IDs are 0 to 299.","Change","No");
	return 1;
}
CMD:veh(playerid, params[])
{
	if(IsPlayerConnected(playerid))
	{
		if(PlayerInfo[playerid][pAdmin] < 4) return SendClientMessage(playerid, COLOR_GRAD1, "You are not authorized to use this command-");
		new car, col1, col2, string[126];
		if(sscanf(params, "iii", car, col1, col2)) return SendClientMessage(playerid, COLOR_GRAD2, "USAGE: /veh [carid] [color1] [color2]");
		if(car < 400 || car > 611) return SendClientMessage(playerid, COLOR_GREY, "Vehicle number can't be below 400 or above 611!");
		if(col1 < 0 || col1 > 256) return SendClientMessage(playerid, COLOR_GREY, "Color number can't be below 0 or above 256!");
		new Float:X,Float:Y,Float:Z;
		GetPlayerPos(playerid, X,Y,Z);
		new carid = CreateVehicle(car, X,Y,Z, 0.0, col1, col2, 60000);
		format(string, sizeof(string), "Vehicle %d spawned.", carid);
		SendClientMessage(playerid, COLOR_GREY, string);
	}
	return 1;
}
CMD:job(playerid, params[])
{
	new str[56];
    PlayerInfo[playerid][pJob] = strval(params);
	format(str, 56, "You have joined %s.", GetJobName(playerid));
	SendClientMessage(playerid, -1, str);
	return 1;
}
CMD:timeplayed(playerid, params[])
{
	new str[56];
	new hTime = PlayerInfo[playerid][pHours]/60/60;
	new mTime = PlayerInfo[playerid][pHours]/60;
	format(str, 56, "You have played %i hours,", hTime);
	SendClientMessage(playerid, -1, str);
	format(str, 56, "which is %i minutes,", mTime);
	SendClientMessage(playerid, -1, str);
	format(str, 56, "and that is %i seconds played.", PlayerInfo[playerid][pHours]);
	SendClientMessage(playerid, -1, str);
	return 1;
}
CMD:join(playerid, params[])
{
    if(IsPlayerInRangeOfPoint(playerid, 5, 2212, -2663.03, 13.55))
    {
    	SendClientMessage(playerid, COLOR_CYAN, "You have joined the Trucker Job.");
		PlayerInfo[playerid][pJob] = 1;
		return 1;
    }
	if(IsPlayerInRangeOfPoint(playerid, 5, 1365.79, -1280, 13.55))
	{
	    SendClientMessage(playerid, COLOR_CYAN, "You have joined the Weapon Dealer Job.");
		PlayerInfo[playerid][pJob] = 3;
		return 1;
	}
	else
	{
		SendClientMessage(playerid, COLOR_GREY, "You are not at a job location.");
		return 1;
	}
}
CMD:jobskill(playerid, params[])
{
	PlayerInfo[playerid][pTruckerSkill] = strval(params);
	PlayerInfo[playerid][pWDealerSkill] = strval(params);
	SendClientMessage(playerid, -1, "Skills set.");
	return 1;
}
CMD:quitjob(playerid, params[])
{
    PlayerInfo[playerid][pJob] = 0;
    SendClientMessage(playerid, COLOR_CYAN, "You have quit your job.");
    return 1;
}
CMD:destroycheckpoint(playerid, params[])
{
    DisablePlayerCheckpoint(playerid);
	SendClientMessage(playerid, COLOR_GREY, "You have ended all your missions and checkpoints.");
	CPT[playerid] = 0;
	return 1;
}
CMD:canceltruck(playerid, params[])
{
    DisablePlayerCheckpoint(playerid);
	SendClientMessage(playerid, COLOR_GREY, "You have ended your trucking mission.");
	CPT[playerid] = 0;
	return 1;
}

CMD:loadtruck(playerid, params[])
{
    if(IsPlayerInRangeOfPoint(playerid, 15, 2197.8425,-2662.9883,13.5469))
	{ // Checks if you are close enough to the loading point.
	    if(GetPlayerState(playerid) != 2) return SendClientMessage(playerid, COLOR_GREY, "You need to be in the driver seat to load a truck.");
    	if(IsATruck(GetPlayerVehicleID(playerid)))
		{
		    if(!IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)) && !IsA1Truck(GetPlayerVehicleID(playerid)) && !IsA2Truck(GetPlayerVehicleID(playerid))) return SendClientMessage(playerid, COLOR_GREY, "You don't have a trailer attached.");
    		loadtruck1(playerid); // calls the script to LoadTruck
    		return 1;
    	} else return SendClientMessage(playerid, COLOR_WHITE, "You are not in a truck.");
    }
    if(CPT[playerid] != 0)
    {
        SendClientMessage(playerid, -1, "You are currently on a route, or have another checkpoint.");
        return 1;
	}
	else
	{
		SendClientMessage(playerid, COLOR_WHITE, "To load the truck, go to the loading garage in Ocean Docks, then /loadtruck.");
		SetPlayerCheckpoint(playerid, 2197.8425,-2662.9883,13.5469,15);
		CPT[playerid] = 0; // waypoint
	}
    return 1;
}
CMD:secretcommand(playerid, params[])
{
ShowPlayerDialog(playerid, DIALOG_ADS, DIALOG_STYLE_INPUT,""COL_WHITE"Shhh",""COL_WHITE"Ok.","Okay","No");
return 1;
}

CMD:getmats(playerid, params[])
{
	if(PlayerInfo[playerid][pJob] != 3) return SendClientMessage(playerid, COLOR_GRAD2, "You're not a weapon dealer.");
	if(CPT[playerid] != 0) return SendClientMessage(playerid, COLOR_GRAD2, "You already have an existing material package or checkpoint.");
	if(IsPlayerInRangeOfPoint(playerid, 5, 2099.64, -105.84, 0.68))
	{
	    SetPlayerCheckpoint(playerid, -331.24, -466.16, -0.54, 5.0); // sets a checkpoint.
	    SendClientMessage(playerid, COLOR_YELLOW, "You have loaded the materials, and a marker have been set on your map to the destination.");
		CPT[playerid] = 3;
		return 1;
	}
	if(!IsPlayerInRangeOfPoint(playerid, 5, 1423.70, -1319, 13.55)) return SendClientMessage(playerid, COLOR_GRAD2, "You are not near enough the material pickup.");
	new rand = random(sizeof(MDestinations));
 	SetPlayerCheckpoint(playerid, MDestinations[rand][0], MDestinations[rand][1], MDestinations[rand][2], 3.0); // sets a checkpoint.
    SendClientMessage(playerid, COLOR_YELLOW, "You have loaded the materials, and a marker have been set on your map to the destination.");
	CPT[playerid] = 3;
	return 1;
}

CMD:sellgun(playerid, params[])
{
	if(PlayerInfo[playerid][pJob] != 3)
	{
		SendClientMessage(playerid, COLOR_GRAD2, "You're not a weapon dealer.");
		return 1;
	}

	new choice[32], str[156];
	new giveplayerid;
	if(sscanf(params, "us[32]", giveplayerid, choice))
	{
		SendClientMessage(playerid, COLOR_WHITE, "USAGE: /sellgun [ID / name or part of name] [weapon]");
		SendClientMessage(playerid, COLOR_GREY, "Weapon Dealer Level 1: sdpistol(100 mats) 9mm(150 mats) shotgun(200 mats) ");
		SendClientMessage(playerid, COLOR_GREY, "Weapon Dealer Level 2: mp5(400 mats) bat(25 mats) rifle(1500 mats)");
		SendClientMessage(playerid, COLOR_GREY, "Weapon Dealer Level 3: katana(50 mats) ak47(2000 mats) deagle(1000 mats)");
		SendClientMessage(playerid, COLOR_GREY, "Weapon Dealer Level 4: spas(6000 mats) m4(3000 mats)");
		SendClientMessage(playerid, COLOR_GREY, "Weapon Dealer Level 5: sniper(7000 mats) knuckles(50 mats)");
		return 1;
	}
	if(strcmp(choice, "sdpistol", true) == 0)
	{
	    if(PlayerInfo[playerid][pWDealerSkill] < 0) return SendClientMessage(playerid, COLOR_GREY, "You are not a skilled enough weapon dealer.");
	    if(PlayerInfo[playerid][pMaterials] < 100) return SendClientMessage(playerid, COLOR_GREY, "You don't have enough materials.");
		weaponbeingoffered[giveplayerid] = 23;
		beingofferedby[giveplayerid] = playerid;
	    format(str, sizeof(str), "%s has offered you a silenced pistol. /accept wep to accept it.", GetName(playerid));
		SendClientMessage(giveplayerid, COLOR_CYAN, str);
		return 1;
	}
	if(strcmp(choice, "9mm", true) == 0)
	{
		if(PlayerInfo[playerid][pWDealerSkill] < 0) return SendClientMessage(playerid, COLOR_GREY, "You are not a skilled enough weapon dealer.");
	    if(PlayerInfo[playerid][pMaterials] < 150) return SendClientMessage(playerid, COLOR_GREY, "You don't have enough materials.");
		weaponbeingoffered[giveplayerid] = 22;
		beingofferedby[giveplayerid] = playerid;
	    format(str, sizeof(str), "%s has offered you a 9mm. /accept wep to accept it.", GetName(playerid));
		SendClientMessage(giveplayerid, COLOR_CYAN, str);
		return 1;
	}
	if(strcmp(choice, "shotgun", true) == 0)
	{
		if(PlayerInfo[playerid][pWDealerSkill] < 0) return SendClientMessage(playerid, COLOR_GREY, "You are not a skilled enough weapon dealer.");
	    if(PlayerInfo[playerid][pMaterials] < 200) return SendClientMessage(playerid, COLOR_GREY, "You don't have enough materials.");
		weaponbeingoffered[giveplayerid] = 25;
		beingofferedby[giveplayerid] = playerid;
	    format(str, sizeof(str), "%s has offered you a shotgun. /accept wep to accept it.", GetName(playerid));
		SendClientMessage(giveplayerid, COLOR_CYAN, str);
		return 1;
	}
	if(strcmp(choice, "mp5", true) == 0)
	{
		if(PlayerInfo[playerid][pWDealerSkill] < 100) return SendClientMessage(playerid, COLOR_GREY, "You are not a skilled enough weapon dealer.");
	    if(PlayerInfo[playerid][pMaterials] < 400) return SendClientMessage(playerid, COLOR_GREY, "You don't have enough materials.");
		weaponbeingoffered[giveplayerid] = 29;
		beingofferedby[giveplayerid] = playerid;
	    format(str, sizeof(str), "%s has offered you a mp5. /accept wep to accept it.", GetName(playerid));
		SendClientMessage(giveplayerid, COLOR_CYAN, str);
		return 1;
	}
	if(strcmp(choice, "bat", true) == 0)
	{
		if(PlayerInfo[playerid][pWDealerSkill] < 100) return SendClientMessage(playerid, COLOR_GREY, "You are not a skilled enough weapon dealer.");
	    if(PlayerInfo[playerid][pMaterials] < 25) return SendClientMessage(playerid, COLOR_GREY, "You don't have enough materials.");
		weaponbeingoffered[giveplayerid] = 5;
		beingofferedby[giveplayerid] = playerid;
	    format(str, sizeof(str), "%s has offered you a baseball bat. /accept wep to accept it.", GetName(playerid));
		SendClientMessage(giveplayerid, COLOR_CYAN, str);
		return 1;
	}
	if(strcmp(choice, "ak47", true) == 0)
	{
		if(PlayerInfo[playerid][pWDealerSkill] < 200) return SendClientMessage(playerid, COLOR_GREY, "You are not a skilled enough weapon dealer.");
	    if(PlayerInfo[playerid][pMaterials] < 1500) return SendClientMessage(playerid, COLOR_GREY, "You don't have enough materials.");
		weaponbeingoffered[giveplayerid] = 30;
		beingofferedby[giveplayerid] = playerid;
	    format(str, sizeof(str), "%s has offered you an ak47. /accept wep to accept it.", GetName(playerid));
		SendClientMessage(giveplayerid, COLOR_CYAN, str);
		return 1;
	}
	if(strcmp(choice, "m4", true) == 0)
	{
		if(PlayerInfo[playerid][pWDealerSkill] < 300) return SendClientMessage(playerid, COLOR_GREY, "You are not a skilled enough weapon dealer.");
	    if(PlayerInfo[playerid][pMaterials] < 3000) return SendClientMessage(playerid, COLOR_GREY, "You don't have enough materials.");
		weaponbeingoffered[giveplayerid] = 31;
		beingofferedby[giveplayerid] = playerid;
	    format(str, sizeof(str), "%s has offered you a m4. /accept wep to accept it.", GetName(playerid));
		SendClientMessage(giveplayerid, COLOR_CYAN, str);
		return 1;
	}
	if(strcmp(choice, "rifle", true) == 0)
	{
		if(PlayerInfo[playerid][pWDealerSkill] < 100) return SendClientMessage(playerid, COLOR_GREY, "You are not a skilled enough weapon dealer.");
	    if(PlayerInfo[playerid][pMaterials] < 2000) return SendClientMessage(playerid, COLOR_GREY, "You don't have enough materials.");
		weaponbeingoffered[giveplayerid] = 33;
		beingofferedby[giveplayerid] = playerid;
	    format(str, sizeof(str), "%s has offered you a rifle. /accept wep to accept it.", GetName(playerid));
		SendClientMessage(giveplayerid, COLOR_CYAN, str);
		return 1;
	}
	if(strcmp(choice, "deagle", true) == 0)
	{
		if(PlayerInfo[playerid][pWDealerSkill] < 200) return SendClientMessage(playerid, COLOR_GREY, "You are not a skilled enough weapon dealer.");
	    if(PlayerInfo[playerid][pMaterials] < 1000) return SendClientMessage(playerid, COLOR_GREY, "You don't have enough materials.");
		weaponbeingoffered[giveplayerid] = 24;
		beingofferedby[giveplayerid] = playerid;
	    format(str, sizeof(str), "%s has offered you a deagle. /accept wep to accept it.", GetName(playerid));
		SendClientMessage(giveplayerid, COLOR_CYAN, str);
		return 1;
	}
	if(strcmp(choice, "spas", true) == 0)
	{
		if(PlayerInfo[playerid][pWDealerSkill] < 300) return SendClientMessage(playerid, COLOR_GREY, "You are not a skilled enough weapon dealer.");
	    if(PlayerInfo[playerid][pMaterials] < 6000) return SendClientMessage(playerid, COLOR_GREY, "You don't have enough materials.");
		weaponbeingoffered[giveplayerid] = 27;
		beingofferedby[giveplayerid] = playerid;
	    format(str, sizeof(str), "%s has offered you a spas-12. /accept wep to accept it.", GetName(playerid));
		SendClientMessage(giveplayerid, COLOR_CYAN, str);
		return 1;
	}
	if(strcmp(choice, "katana", true) == 0)
	{
		if(PlayerInfo[playerid][pWDealerSkill] < 200) return SendClientMessage(playerid, COLOR_GREY, "You are not a skilled enough weapon dealer.");
	    if(PlayerInfo[playerid][pMaterials] < 50) return SendClientMessage(playerid, COLOR_GREY, "You don't have enough materials.");
		weaponbeingoffered[giveplayerid] = 8;
		beingofferedby[giveplayerid] = playerid;
	    format(str, sizeof(str), "%s has offered you a katana. /accept wep to accept it.", GetName(playerid));
		SendClientMessage(giveplayerid, COLOR_CYAN, str);
		return 1;
	}
	if(strcmp(choice, "sniper", true) == 0)
	{
		if(PlayerInfo[playerid][pWDealerSkill] < 400) return SendClientMessage(playerid, COLOR_GREY, "You are not a skilled enough weapon dealer.");
	    if(PlayerInfo[playerid][pMaterials] < 7000) return SendClientMessage(playerid, COLOR_GREY, "You don't have enough materials.");
		weaponbeingoffered[giveplayerid] = 34;
		beingofferedby[giveplayerid] = playerid;
	    format(str, sizeof(str), "%s has offered you a sniper. /accept wep to accept it.", GetName(playerid));
		SendClientMessage(giveplayerid, COLOR_CYAN, str);
		return 1;
	}
	if(strcmp(choice, "knuckles", true) == 0)
	{
		if(PlayerInfo[playerid][pWDealerSkill] < 400) return SendClientMessage(playerid, COLOR_GREY, "You are not a skilled enough weapon dealer.");
	    if(PlayerInfo[playerid][pMaterials] < 50) return SendClientMessage(playerid, COLOR_GREY, "You don't have enough materials.");
		weaponbeingoffered[giveplayerid] = 1;
		beingofferedby[giveplayerid] = playerid;
	    format(str, sizeof(str), "%s has offered you a sniper. /accept wep to accept it.", GetName(playerid));
		SendClientMessage(giveplayerid, COLOR_CYAN, str);
		return 1;
	}
	return 1;
}


CMD:dooredit(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 4)
	{
		SendClientMessage(playerid, COLOR_GRAD2, "You're not authorized to use that command!");
		return 1;
	}

	new string[128], choice[32], doorid, amount;
	if(sscanf(params, "s[32]dD(1)", choice, doorid, amount))
	{
		SendClientMessage(playerid, COLOR_WHITE, "USAGE: /dooredit [name] [doorid] [###]");
		SendClientMessage(playerid, COLOR_GREY, "Names: Exterior, Interior, Faction, Admin, VehicleAble, Color, PickupModel, Delete");
		return 1;
	}

	if(doorid >= MAX_DDOORS)
	{
		SendClientMessage(playerid, COLOR_WHITE, "Invalid Door ID!");
		return 1;
	}

	if(strcmp(choice, "interior", true) == 0)
	{
		GetPlayerPos(playerid, DoorInfo[doorid][ddInteriorX], DoorInfo[doorid][ddInteriorY], DoorInfo[doorid][ddInteriorZ]);
		GetPlayerFacingAngle(playerid, DoorInfo[doorid][ddInteriorA]);
		DoorInfo[doorid][ddInteriorInt] = GetPlayerInterior(playerid);
		DoorInfo[doorid][ddInteriorVW] = GetPlayerVirtualWorld(playerid);
		SendClientMessage(playerid, COLOR_WHITE, "You have changed the interior!");
		SaveDynamicDoors();
		format(string, sizeof(string), "%s has edited DoorID %d's Interior.", GetPlayerNameEx(playerid), doorid);
		return 1;
	}
	else if(strcmp(choice, "custominterior", true) == 0)
	{
		if(DoorInfo[doorid][ddCustomInterior] == 0)
		{
			DoorInfo[doorid][ddCustomInterior] = 1;
			SendClientMessage(playerid, COLOR_WHITE, "Door set to custom interior!");
		}
		else
		{
			DoorInfo[doorid][ddCustomInterior] = 0;
			SendClientMessage(playerid, COLOR_WHITE, "Door set to normal (not custom) interior!");
		}
		SaveDynamicDoors();
		format(string, sizeof(string), "%s has edited DoorID %d's CustomInterior.", GetPlayerNameEx(playerid), doorid);

		return 1;
	}
	else if(strcmp(choice, "customexterior", true) == 0)
	{
		if(DoorInfo[doorid][ddCustomExterior] == 0)
		{
			DoorInfo[doorid][ddCustomExterior] = 1;
			SendClientMessage(playerid, COLOR_WHITE, "Door set to custom exterior!");
		}
		else
		{
			DoorInfo[doorid][ddCustomExterior] = 0;
			SendClientMessage(playerid, COLOR_WHITE, "Door set to normal (not custom) exterior!");
		}
		SaveDynamicDoors();
		format(string, sizeof(string), "%s has edited DoorID %d's CustomExterior.", GetPlayerNameEx(playerid), doorid);

		return 1;
	}
	else if(strcmp(choice, "exterior", true) == 0)
	{
		GetPlayerPos(playerid, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ]);
		GetPlayerFacingAngle(playerid, DoorInfo[doorid][ddExteriorA]);
		DoorInfo[doorid][ddExteriorVW] = GetPlayerVirtualWorld(playerid);
		DoorInfo[doorid][ddExteriorInt] = GetPlayerInterior(playerid);
		SendClientMessage(playerid, COLOR_WHITE, "You have changed the exterior!");
		DestroyPickup(DoorInfo[doorid][ddPickupID]);
		if(IsValidDynamic3DTextLabel(DoorInfo[doorid][ddTextID])) DestroyDynamic3DTextLabel(DoorInfo[doorid][ddTextID]);
		CreateDynamicDoor(doorid);
		SaveDynamicDoors();
		format(string, sizeof(string), "%s has edited DoorID %d's Exterior.", GetPlayerNameEx(playerid), doorid);

	}

	else if(strcmp(choice, "faction", true) == 0)
	{
		DoorInfo[doorid][ddFaction] = amount;

		format(string, sizeof(string), "You have changed the Faction to %d.", amount);
		SendClientMessage(playerid, COLOR_WHITE, string);

		SaveDynamicDoors();
		format(string, sizeof(string), "%s has edited DoorID %d's Faction.", GetPlayerNameEx(playerid), doorid);
		return 1;
	}
	else if(strcmp(choice, "admin", true) == 0)
	{
		DoorInfo[doorid][ddAdmin] = amount;

		format(string, sizeof(string), "You have changed the Admin Level to %d.", amount);
		SendClientMessage(playerid, COLOR_WHITE, string);

		SaveDynamicDoors();
		format(string, sizeof(string), "%s has edited DoorID %d's Admin Level.", GetPlayerNameEx(playerid), doorid);
		return 1;
	}
	else if(strcmp(choice, "vehicleable", true) == 0)
	{
		DoorInfo[doorid][ddVehicleAble] = amount;

		format(string, sizeof(string), "You have changed the VehicleAble to %d.", amount);
		SendClientMessage(playerid, COLOR_WHITE, string);

		SaveDynamicDoors();
		format(string, sizeof(string), "%s has edited DoorID %d's VehicleAble.", GetPlayerNameEx(playerid), doorid);
		return 1;
	}
	else if(strcmp(choice, "color", true) == 0)
	{
		DoorInfo[doorid][ddColor] = amount;

		format(string, sizeof(string), "You have changed the Color to %d.", amount);
		SendClientMessage(playerid, COLOR_WHITE, string);
		DestroyPickup(DoorInfo[doorid][ddPickupID]);
		if(IsValidDynamic3DTextLabel(DoorInfo[doorid][ddTextID])) DestroyDynamic3DTextLabel(DoorInfo[doorid][ddTextID]);
		CreateDynamicDoor(doorid);

		SaveDynamicDoors();
		format(string, sizeof(string), "%s has edited DoorID %d's Color.", GetPlayerNameEx(playerid), doorid);
		return 1;
	}
	else if(strcmp(choice, "pickupmodel", true) == 0)
	{
		DoorInfo[doorid][ddPickupModel] = amount;

		format(string, sizeof(string), "You have changed the PickupModel to %d.", amount);
		SendClientMessage(playerid, COLOR_WHITE, string);
		DestroyPickup(DoorInfo[doorid][ddPickupID]);
		if(IsValidDynamic3DTextLabel(DoorInfo[doorid][ddTextID])) DestroyDynamic3DTextLabel(DoorInfo[doorid][ddTextID]);
		CreateDynamicDoor(doorid);

		SaveDynamicDoors();
		format(string, sizeof(string), "%s has edited DoorID %d's PickupModel.", GetPlayerNameEx(playerid), doorid);
		return 1;
	}
	else if(strcmp(choice, "delete", true) == 0)
	{
	    if(DoorInfo[doorid][ddName] == 0) {
	        format(string, sizeof(string), "DoorID %d does not exist.", doorid);
			SendClientMessage(playerid, COLOR_WHITE, string);
			return 1;
	    }
    	DestroyPickup(DoorInfo[doorid][ddPickupID]);
	    DestroyDynamic3DTextLabel(DoorInfo[doorid][ddTextID]);
		DoorInfo[doorid][ddName] = 0;
		DoorInfo[doorid][ddCustomInterior] = 0;
		DoorInfo[doorid][ddExteriorVW] = 0;
		DoorInfo[doorid][ddExteriorInt] = 0;
		DoorInfo[doorid][ddInteriorVW] = 0;
		DoorInfo[doorid][ddInteriorInt] = 0;
		DoorInfo[doorid][ddExteriorX] = 0;
		DoorInfo[doorid][ddExteriorY] = 0;
		DoorInfo[doorid][ddExteriorZ] = 0;
		DoorInfo[doorid][ddExteriorA] = 0;
		DoorInfo[doorid][ddInteriorX] = 0;
		DoorInfo[doorid][ddInteriorY] = 0;
		DoorInfo[doorid][ddInteriorZ] = 0;
		DoorInfo[doorid][ddInteriorA] = 0;
		DoorInfo[doorid][ddCustomExterior] = 0;
		DoorInfo[doorid][ddFaction] = 0;
		DoorInfo[doorid][ddAdmin] = 0;
		DoorInfo[doorid][ddWanted] = 0;
		DoorInfo[doorid][ddVehicleAble] = 0;
		DoorInfo[doorid][ddColor] = 0;
		DoorInfo[doorid][ddPass] = 0;
		DoorInfo[doorid][ddLocked] = 0;
		DoorInfo[doorid][ddNotEditable] = 0;
		SaveDynamicDoors();
		format(string, sizeof(string), "You have deleted DoorID %d.", doorid);
		SendClientMessage(playerid, COLOR_WHITE, string);
		format(string, sizeof(string), "%s has deleted DoorID %d.", GetPlayerNameEx(playerid), doorid);
		return 1;
	}
	return 1;
}

public OnGameModeInit()
{
	settime();
	WeekDayg = TextDrawCreate(502.000000,11.000000,"----");
	TextDrawAlignment(WeekDayg,0);
	TextDrawBackgroundColor(WeekDayg,0x000000ff);
	TextDrawFont(WeekDayg,3);
	TextDrawLetterSize(WeekDayg,0.700000,1.000000);
	TextDrawColor(WeekDayg,0xffff00cc);
	TextDrawSetOutline(WeekDayg,1);
	TextDrawSetProportional(WeekDayg,1);
	TextDrawSetShadow(WeekDayg,10);
	Clock = TextDrawCreate(547.0, 24.0, "--:--");
	TextDrawLetterSize(Clock, 0.6, 1.8);
	TextDrawFont(Clock, 3);
	TextDrawSetOutline(Clock, 2);

	SetTimer("settime",1000,true);
	SetTimer("weatherchange",10800000,true);
	EnableStuntBonusForAll(0);
	UsePlayerPedAnims();
	LoadDynamicDoors();
    DisableInteriorEnterExits();
	SetGameModeText(version);
	LSPDGate = CreateObject(971, 1589.04, -1637.95, 14.73, 0.00, 0.00, 180.00);
	LSPDBarrier = CreateObject(968, 1544.69, -1630.80, 13.08, -90.00, 0.00, 0.00);
	LSPDDoor1 = CreateObject(1536,244.89999390,72.50000000,1002.59997559,0.00000000,0.00000000,0.00000000); //object(gen_doorext15) (1)
	LSPDDoor2 = CreateObject(1536,247.89999390,72.50000000,1002.59997559,0.00000000,0.00000000,180.00000000); //object(gen_doorext15) (2)
	CreateObject(1495, 1582.62, -1637.90, 12.33, 0.00, 0.00, 0.00);
	CreateObject(1653, 1577.74, -1637.86, 15.49, 0.00, 0.00, 0.00);
	CreateObject(983, 1543.96, -1632.96, 13.23,   0.00, 0.00, 90.00);
	CreateObject(983, 1547.15, -1636.21, 13.23,   0.00, 4.00, 0.00);
	CreateObject(983, 1544.66, -1622.93, 13.23,   0.00, 0.00, 90.00);
	CreateObject(983, 1547.15, -1636.21, 13.23,   0.00, 4.00, 0.00);
	CreateObject(983, 1548.03, -1619.75, 13.23,   0.00, 0.00, -4.00);
	CreateObject(1227, 1548.27, -1616.84, 13.55,   0.00, 0.00, 0.00);
	AddPlayerClass(299, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
	// Pickups
	CreatePickup(1239, 1, 2212, -2663.03, 13.55, 0);
	CreatePickup(1239, 1, 1366, -1276, 13.55, 0);
	CreatePickup(1239, 1, 1423.70, -1319, 13.55, 0);
	CreatePickup(1239, 1, 1526.92, -1677, 5.89, 0); // Arrest Point
	CreatePickup(1239, 1, 1141.23, -1326.42, 13.65, 0); // Hospital Delivery
	CreatePickup(1239, 1, 2017.17, -1413.84, 16.99, 0); // Hospital Delivery
	CreatePickup(1239, 1, 207.48, -101.49, 1005.26, 45235); // Binco
	CreatePickup(1239, 1, -27.69, -89.42, 1003.55, 53434241); // 24/7
	CreatePickup(1239, 1, -27.69, -89.42, 1003.55, 53434242); // 24/7
	CreatePickup(1239, 1, -27.69, -89.42, 1003.55, 53434243); // 24/7
	CreatePickup(1239, 1, 2099.64, -105.84, 0.68, 0); // Boat Delivery
	Create3DTextLabel("Arrest Point - /arrest", 0x008080FF, 1526.92, -1677, 5.89, 5.0, 0, 0);
	Create3DTextLabel("Hospital Delivery Point - /deliver", 0x008080FF, 1141.23, -1326.42, 13.65, 30.0, 0, 0);
	Create3DTextLabel("Hospital Delivery Point - /deliver", 0x008080FF, 2017.17, -1413.84, 16.99, 30.0, 0, 0);
	Create3DTextLabel("LSPD Lockers - /lockers", 0x0008080FF, 254, 77, 1003, 10, 1337, 0);
	Create3DTextLabel("Binco - /buy", 0x0008080FF, 207.48, -101.49, 1005.26, 15, 45235, 0);
	Create3DTextLabel("24/7 - /buy", 0x0008080FF, -27.69, -89.42, 1003.55, 18, 53434241, 0);
	Create3DTextLabel("24/7 - /buy", 0x0008080FF, -27.69, -89.42, 1003.55, 18, 53434242, 0);
	Create3DTextLabel("24/7 - /buy", 0x0008080FF, -27.69, -89.42, 1003.55, 18, 53434243, 0);
	Create3DTextLabel("Boat materials pickup - /getmats", 0x0008080FF, 2099.64, -105.84, 0.68, 0, 0, 0);
	// Trucker
	level1Trucks[0] = AddStaticVehicle(499,2248.7166,-2641.8423,13.5628,88.1596,1,31); // level 1 truck
	level1Trucks[1] = AddStaticVehicle(499,2249.7317,-2649.7966,13.5401,89.4008,31,31); // level 1 truck
	level1Trucks[2] = AddStaticVehicle(414,2233.6287,-2680.4116,13.5382,356.4799,6,41); // level 1 truck
	level1Trucks[3] = AddStaticVehicle(499,2227.4983,-2679.9048,13.5463,0.3895,37,21); // level 1 truck
	level1Trucks[4] = AddStaticVehicle(414,2245.2544,-2681.3452,13.5427,0.2067,27,17); // level 1 truck
	level1Trucks[5] = AddStaticVehicle(414,2252.2861,-2679.6343,13.5426,1.2572,36,47); // level 1 truck
	//
	level2Trucks[0] = AddStaticVehicle(498,2261.5137,-2680.0657,13.6207,359.5156,36,10); // Level 2 truck
	level2Trucks[1] = AddStaticVehicle(498,2238.7996,-2603.8298,13.6184,90.1549,54,59); // Level 2 truck
	level2Trucks[2] = AddStaticVehicle(498,2238.5786,-2619.1267,13.6145,86.9422,45,40); // Level 2 truck
	level2Trucks[3] = AddStaticVehicle(498,2238.9553,-2611.7659,13.6141,91.2811,8,40); // Level 2 truck
	//
	level3Trucks[0] = AddStaticVehicle(403,2184.0037,-2639.8213,14.5653,180.8443,26,20); // Truck (LEVEL 3)
	level3Trucks[1] = AddStaticVehicle(403,2176.6162,-2637.8469,14.5890,175.4726,26,20); // Truck (LEVEL 3)
	level3Trucks[2] = AddStaticVehicle(403,2250.3188,-2634.3699,14.1771,91.0775,40,40); // Truck (LEVEL 3)
	//
	level5Trucks[0] = AddStaticVehicle(515,2207.8276,-2598.1008,14.5620,267.6627,0,58); // Level 5 Truck
	level5Trucks[1] = AddStaticVehicle(515,2230.3008,-2555.9944,14.4759,0.7771,0,58); // Level 5 Truck
	level5Trucks[2] = AddStaticVehicle(515,2205.2166,-2570.2583,14.5752,270.1937,0,58); // Level 5 Truck
	//
	trailers[0] = AddStaticVehicle(591,2178.0486,-2624.6274,14.1822,175.1626,56,31); // Trailer
	trailers[1] = AddStaticVehicle(591,2184.6934,-2625.1929,14.1454,175.1649,56,31); // Trailer
	trailers[2] = AddStaticVehicle(591,2230.5833,-2576.0195,14.0940,0.7798,7,16); // Trailer
	trailers[3] = AddStaticVehicle(591,2229.7905,-2534.6511,14.1194,0.7601,7,16); // Trailer
	trailers[4] = AddStaticVehicle(591,2220.0430,-2624.9260,14.0625,0.9242,7,16); // Trailer
	trailers[5] = AddStaticVehicle(591,2203.8923,-2642.7629,14.1967,266.2004,35,41); // Trailer
	// LSPD
	LSPDVeh[0] = AddStaticVehicle(596, 1601.795898, -1684.209350, 5.631327, 90.0, 79, 1); // Police Car (LSPD)
	LSPDVeh[1] = AddStaticVehicle(596, 1601.790527, -1688.099243, 5.611071, 90.0, 79, 1); // Police Car (LSPD)
	LSPDVeh[2] = AddStaticVehicle(596, 1601.790649, -1692.043945, 5.627151, 90.0, 79, 1); // Police Car (LSPD)
	LSPDVeh[3] = AddStaticVehicle(596, 1601.790527, -1696.380981, 5.617440, 90.0, 79, 1); // Police Car (LSPD)
	LSPDVeh[4] = AddStaticVehicle(596, 1601.790161, -1700.374267, 5.618237, 90.0, 86, 1); // Police Car (LSPD)
	LSPDVeh[5] = AddStaticVehicle(596, 1601.791015, -1704.578247, 5.613302, 90.0, 86, 1); // Police Car (LSPD)
	LSPDVeh[6] = AddStaticVehicle(596, 1595.375122, -1710.665039, 5.629010, 0.0, 86, 1); // Police Car (LSPD)
	LSPDVeh[7] = AddStaticVehicle(596, 1591.266113, -1711.172851, 5.562825, 0.0, 86, 1); // Police Car (LSPD)
	LSPDVeh[8] = AddStaticVehicle(596, 1587.176269, -1711.167724, 5.559627, 0.0, 0, 1); // Police Car (LSPD)
	LSPDVeh[9] = AddStaticVehicle(596, 1583.157104, -1711.164550, 5.575726, 0.0, 0, 1); // Police Car (LSPD)
	LSPDVeh[10] = AddStaticVehicle(596, 1578.746948, -1711.159790, 5.579936, 0.0, 0, 1); // Police Car (LSPD)
	LSPDVeh[11] = AddStaticVehicle(596, 1574.747192, -1711.155517, 5.616508, 0.0, 0, 1); // Police Car (LSPD)
	LSPDVeh[12] = AddStaticVehicle(596, 1570.507080, -1711.150390, 5.631289, 0.0, 0, 1); // Police Car (LSPD)
	LSPDVeh[13] = AddStaticVehicle(402, 1545.363403, -1684.183715, 5.776185, 90.0, 0, 0); // Buffalo
	LSPDVeh[14] = AddStaticVehicle(402, 1545.271606, -1680.033325, 5.789134, 90.0, 0, 0); // Buffalo
	LSPDVeh[15] = AddStaticVehicle(451, 1545.206909, -1676.062377, 5.768874, 90.0, 0, 0); // Turismo
	LSPDVeh[16] = AddStaticVehicle(560, 1545.136840, -1671.935791, 5.796144, 90.0, 0, 79); // Sultan
	LSPDVeh[17] = AddStaticVehicle(525, 1545.113891, -1667.590332, 5.768740, 90.0, 0, 79); // Tow Truck
	LSPDVeh[18] = AddStaticVehicle(525, 1545.052978, -1663.159057, 5.769451, 90.0, 0, 79); // Tow Truck
	LSPDVeh[19] = AddStaticVehicle(528, 1539.080932, -1644.956298, 6.022599, 180.0, 0, 1); // S.W.A.T. Van
	LSPDVeh[20] = AddStaticVehicle(528, 1534.736694, -1644.953979, 6.025968, 180.0, 0, 1); // S.W.A.T. Van
	LSPDVeh[21] = AddStaticVehicle(601, 1530.765136, -1644.953735, 5.626488, 180.0, 0, 0); // S.W.A.T. Van
	LSPDVeh[22] = AddStaticVehicle(601, 1526.807250, -1644.952392, 5.685305, 180.0, 0, 0); // S.W.A.T. Van
	LSPDVeh[23] = AddStaticVehicle(523, 1586.753173, -1680.919067, 5.467967, 270.0, 0, 0); // HPV-1000
	LSPDVeh[24] = AddStaticVehicle(523, 1583.504272, -1680.935913, 5.456614, 270.0, 0, 0); // HPV-1000
	LSPDVeh[25] = AddStaticVehicle(523, 1583.508789, -1678.958862, 5.454283, 270.0, 0, 0); // HPV-1000
	LSPDVeh[26] = AddStaticVehicle(523, 1583.510498, -1677.093017, 5.481368, 270.0, 0, 0); // HPV-1000
	LSPDVeh[27] = AddStaticVehicle(523, 1583.519409, -1675.270629, 5.453042, 270.0, 0, 0); // HPV-1000
	LSPDVeh[28] = AddStaticVehicle(523, 1586.685302, -1678.958740, 5.490104, 270.0, 0, 0); // HPV-1000
	LSPDVeh[29] = AddStaticVehicle(523, 1586.702880, -1677.099365, 5.452620, 270.0, 0, 0); // HPV-1000
	LSPDVeh[30] = AddStaticVehicle(523, 1586.705566, -1675.270629, 5.434679, 270.0, 0, 0); // HPV-1000
	LSPDVeh[31] = AddStaticVehicle(599, 1585.306152, -1667.855957, 6.086935, 270.0, 0, 1); // Police Ranger
	LSPDVeh[32] = AddStaticVehicle(599, 1585.286010, -1671.934448, 6.118605, 270.0, 0, 1); // Police Ranger
	LSPDVeh[33] = AddStaticVehicle(427, 1544.986694, -1659.187500, 6.019245, 90.0, 0, 1); // Enforcer
	LSPDVeh[34] = AddStaticVehicle(598, 1544.987060, -1655.224243, 6.054365, 90.0, 0, 1); // LVPD
	LSPDVeh[35] = AddStaticVehicle(598, 1544.987182, -1651.171020, 6.010422, 90.0, 0, 1); // LVPD
	LSPDVeh[36] = AddStaticVehicle(599, 1558.675781, -1711.144897, 6.032533, 0.0, 0, 1); // Police Ranger
	LSPDVeh[37] = AddStaticVehicle(497,1564.34960938,-1648.89172363,28.66711426,90.00000000,0,1); //Police Maverick
	LSPDVeh[38] = AddStaticVehicle(497,1564.30908203,-1700.77612305,28.66711426,90.00000000,0,1); //Police Maverick
	// LSFMD
	LSFMDVeh[0] = AddStaticVehicle(416,1180.2567,-1309.1852,13.8508,271.2980,1,7); // Ambulance (LSFMD)
	LSFMDVeh[1] = AddStaticVehicle(416,1180.1334,-1339.1980,13.9381,269.7634,1,7); // Ambulance (LSFMD)
	LSFMDVeh[2] = AddStaticVehicle(416,1211.5840,-1321.3564,13.6269,179.5706,1,7); // Ambulance (LSFMD)
	LSFMDVeh[3] = AddStaticVehicle(416,2010.0961,-1414.6855,17.1415,268.0157,1,7); // Ambulance (LSFMD)
	LSFMDVeh[4] = AddStaticVehicle(416,2034.0977,-1442.0782,17.4529,183.7214,1,7); // Ambulance (LSFMD)
	LSFMDVeh[5] = AddStaticVehicle(416,2035.1072,-1428.5984,17.1647,178.6801,1,7); // Ambulance (LSFMD)
	// Dealership
	DSV[0] = AddStaticVehicle(560, 533.3519,-1277.7756,16.9470, 224.1641, 1, 0); // Sultan
	DSV[1] = AddStaticVehicle(562,537.9197,-1274.1235,17.1387,220.2820, 1, 1); // Elegy
	
	//
	/*
	Random Vehicles
 	*/
	AddStaticVehicle(553,1944.5242,-2639.1465,14.8823,28.0299,-1, -1);
	AddStaticVehicle(553,1984.2778,-2637.7561,14.8831,9.0602,-1, -1);
	AddStaticVehicle(553,2019.7615,-2642.5803,14.8759,318.3256,-1, -1);
	AddStaticVehicle(510,2081.9866,-2359.7229,13.1551,64.1485,-1, -1);
	AddStaticVehicle(510,1866.6115,-2660.4602,13.1552,18.6151,-1, -1);
	AddStaticVehicle(513,1881.0273,-2632.3281,14.0996,40.9586,-1, -1);
	AddStaticVehicle(513,1891.9824,-2632.7056,14.1085,332.5663,-1, -1);
	AddStaticVehicle(463,920.4453,-1290.5063,13.3508,118.6505,-1, -1);
	AddStaticVehicle(542,863.2733,-1375.0151,13.3187,85.7265,-1, -1);
	AddStaticVehicle(496,821.6033,-1473.7249,12.5756,357.5008,-1, -1);
	AddStaticVehicle(461,1031.1113,-1446.3105,13.1411,59.0580,-1, -1);
	AddStaticVehicle(418,1005.0084,-1461.3424,13.6427,183.0261,-1, -1);
	AddStaticVehicle(489,990.5985,-1306.8129,13.5204,179.0488,-1, -1);
	AddStaticVehicle(475,1002.5063,-1306.5654,13.1866,359.6424,-1, -1);
	AddStaticVehicle(518,981.5054,-1306.6899,13.1630,181.0135,-1, -1);
	AddStaticVehicle(549,955.8333,-1190.2795,16.6425,270.2728,-1, -1);
	AddStaticVehicle(482,956.0022,-1199.3633,17.1270,268.5538,-1, -1);
	AddStaticVehicle(468,956.3898,-1193.4253,16.6297,89.6432,-1, -1);
	AddStaticVehicle(567,1085.8342,-1199.3883,17.7945,90.5839,-1, -1);
	AddStaticVehicle(542,1097.0354,-1218.1705,17.5471,356.6483,-1, -1);
	AddStaticVehicle(461,1084.2866,-1232.2461,15.3945,243.6654,-1, -1);
	AddStaticVehicle(461,1083.9337,-1235.0449,15.4088,243.8919,-1, -1);
	AddStaticVehicle(461,1083.7941,-1238.1573,15.4110,243.1097,-1, -1);
	AddStaticVehicle(405,1109.0310,-1225.8809,15.6987,181.5343,-1, -1);
	AddStaticVehicle(461,1032.2993,-1082.4255,23.4136,166.6669,-1, -1);
	AddStaticVehicle(475,1003.6659,-1054.6088,30.6946,3.0438,-1, -1);
	AddStaticVehicle(560,1070.9109,-1102.3247,24.4439,270.7971,-1, -1);
	AddStaticVehicle(496,1137.6492,-1025.5586,31.5121,177.9917,-1, -1);
	AddStaticVehicle(558,1131.7341,-1010.0580,29.4899,95.0937,-1, -1);
	AddStaticVehicle(581,1205.2384,-977.0176,43.0742,179.7537,-1, -1);
	AddStaticVehicle(536,1227.2596,-974.1713,43.2139,180.2966,-1, -1);
	AddStaticVehicle(581,989.3703,-1589.3812,13.0903,21.5606,-1, -1);
	AddStaticVehicle(542,1061.2451,-1665.2649,13.4966,91.9120,-1, -1);
	AddStaticVehicle(405,1136.5767,-1695.5199,13.6956,88.9354,-1, -1);
	AddStaticVehicle(463,1137.1466,-1700.1902,13.3869,87.9396,-1, -1);
	AddStaticVehicle(518,1280.4908,-1816.1259,13.0556,270.4623,-1, -1);
	AddStaticVehicle(482,1250.2468,-1835.0884,13.5047,180.4024,-1, -1);
	AddStaticVehicle(545,1238.0167,-1835.2385,13.2008,177.5310,-1, -1);
	AddStaticVehicle(468,1900.5659,-1849.8379,13.2277,44.6102,-1, -1);
	AddStaticVehicle(463,1097.5217,-1763.8896,12.8933,267.4286,-1, -1);
	AddStaticVehicle(475,892.6356,-1668.8604,13.3544,179.2466,-1, -1);
	AddStaticVehicle(535,276.9328,-1267.3054,73.7098,302.5802,-1, -1);
	AddStaticVehicle(496,280.3806,-1255.7952,73.6166,281.7693,-1, -1);
	AddStaticVehicle(589,569.3154,-1131.7330,50.2950,243.4572,-1, -1);
	AddStaticVehicle(562,687.5812,-1072.8162,49.1274,62.7814,-1, -1);
	AddStaticVehicle(545,795.9840,-840.3973,60.4526,174.5740,-1, -1);
	AddStaticVehicle(534,831.9914,-858.8560,69.6527,199.3811,-1, -1);
	AddStaticVehicle(535,839.4457,-893.5928,68.5340,21.2260,-1, -1);
	AddStaticVehicle(477,912.5916,-832.0980,92.1407,218.1897,-1, -1);
	AddStaticVehicle(562,966.6584,-842.2115,95.4213,208.6852,-1, -1);
	AddStaticVehicle(589,1024.2820,-777.6995,102.7277,142.3072,-1, -1);
	AddStaticVehicle(477,1460.3851,-633.6793,95.5530,179.4419,-1, -1);
	AddStaticVehicle(535,1516.9452,-765.4361,79.7405,142.5422,-1, -1);
	AddStaticVehicle(458,1530.6602,-814.2603,71.8145,269.5966,-1, -1);
	AddStaticVehicle(560,1536.7003,-841.9440,64.3992,91.2450,-1, -1);
	AddStaticVehicle(550,1038.2852,-640.5812,119.9407,3.9959,-1, -1);
	AddStaticVehicle(534,834.7188,-754.2109,85.0352,221.3681,-1, -1);
	AddStaticVehicle(545,812.7324,-768.6061,76.6226,240.9842,-1, -1);
	AddStaticVehicle(562,792.6622,-824.7413,69.7717,10.8903,-1, -1);
	AddStaticVehicle(405,211.8928,-1419.0681,13.1531,135.6236,-1, -1);
	AddStaticVehicle(461,203.5655,-1441.0552,12.6881,319.3540,-1, -1);
	AddStaticVehicle(482,216.6308,-1431.9065,13.3691,313.9951,-1, -1);
	AddStaticVehicle(462,338.6057,-1340.7114,14.1075,116.4867,-1, -1);
	AddStaticVehicle(439,343.3987,-1353.3427,14.4033,299.2459,-1, -1);
	AddStaticVehicle(542,412.7446,-1318.5144,14.6645,210.7711,-1, -1);
	AddStaticVehicle(521,411.1232,-1311.2087,14.5024,140.9818,-1, -1);
	AddStaticVehicle(562,500.5935,-1304.4486,16.8673,309.5460,-1, -1);
	AddStaticVehicle(521,531.3096,-1315.9927,16.8135,188.1211,-1, -1);
	AddStaticVehicle(461,587.8506,-1279.8562,15.9628,75.5049,-1, -1);
	AddStaticVehicle(463,588.5497,-1282.7085,15.7110,71.1037,-1, -1);
	AddStaticVehicle(589,569.1940,-1264.3147,16.4483,105.7125,-1, -1);
	AddStaticVehicle(474,580.0232,-1310.1290,13.6310,190.1793,-1, -1);
	AddStaticVehicle(463,892.2068,-944.0689,41.3930,346.6371,-1, -1);
	AddStaticVehicle(496,1039.0024,-925.8621,42.0801,3.8901,-1, -1);
	AddStaticVehicle(496,1028.1858,-887.8458,41.8743,18.1745,-1, -1);
	AddStaticVehicle(534,1091.6672,-934.4342,42.7434,181.8923,-1, -1);
	AddStaticVehicle(496,1196.4460,-887.2950,42.7778,4.9401,-1, -1);
	AddStaticVehicle(461,1184.3699,-898.7025,42.8468,50.8006,-1, -1);
	AddStaticVehicle(576,929.9745,-996.4139,37.8311,274.6470,-1, -1);
	AddStaticVehicle(404,863.1107,-1056.6387,24.8362,216.7097,-1, -1);
	AddStaticVehicle(463,868.9804,-1068.5559,24.6418,26.0884,-1, -1);
	AddStaticVehicle(439,783.3749,-1356.8221,13.4354,272.4747,-1, -1);
	AddStaticVehicle(463,733.6376,-1347.5618,13.0519,258.9138,-1, -1);
	AddStaticVehicle(536,1696.6791,-2097.0415,13.2841,179.3459,-1, -1);
	AddStaticVehicle(542,1662.7777,-2110.7148,13.2900,90.3870,-1, -1);
	AddStaticVehicle(400,1707.4287,-2142.6919,13.6471,229.0505,-1, -1);
	AddStaticVehicle(567,1725.0461,-2130.4683,13.4259,180.7540,-1, -1);
	AddStaticVehicle(412,1724.0801,-2092.9343,13.3837,178.9921,-1, -1);
	AddStaticVehicle(536,1747.4430,-2097.3616,13.2870,179.0798,-1, -1);
	AddStaticVehicle(576,1793.3020,-2149.7551,13.2392,180.6801,-1, -1);
	AddStaticVehicle(536,1772.7323,-2096.0732,13.2853,181.7548,-1, -1);
	AddStaticVehicle(549,1948.6121,-2114.0183,13.2416,90.8657,-1, -1);
	AddStaticVehicle(475,2014.0079,-1597.3103,13.3757,134.4442,-1, -1);
	AddStaticVehicle(466,2057.4875,-1636.5558,13.2887,269.2682,-1, -1);
	AddStaticVehicle(496,2062.4905,-1694.4796,13.3308,89.8789,-1, -1);
	AddStaticVehicle(533,2062.6511,-1738.6663,13.2560,90.7603,-1, -1);
	AddStaticVehicle(412,2238.7908,-1630.9789,15.5684,339.3786,-1, -1);
	AddStaticVehicle(534,2284.0630,-1681.7241,13.8912,0.3629,-1, -1);
	AddStaticVehicle(475,2271.4482,-1634.8553,15.1246,1.4485,-1, -1);
	AddStaticVehicle(463,2289.7493,-1685.7275,13.2727,338.6942,-1, -1);
	AddStaticVehicle(496,2296.9233,-1644.5267,14.5451,178.7794,-1, -1);
	AddStaticVehicle(474,2328.1565,-1677.1449,14.1746,268.4948,-1, -1);
	AddStaticVehicle(475,2416.0103,-1707.7166,13.5772,180.6127,-1, -1);
	AddStaticVehicle(400,2443.6687,-1637.1934,13.3619,180.6244,-1, -1);
	AddStaticVehicle(426,2500.2908,-1755.7277,13.1737,179.5942,-1, -1);
	AddStaticVehicle(479,2452.3486,-1784.1185,13.3435,358.6820,-1, -1);
	AddStaticVehicle(475,2498.7920,-1953.6908,13.2268,180.0759,-1, -1);
	AddStaticVehicle(482,2482.8601,-1953.4886,13.5429,359.9536,-1, -1);
	AddStaticVehicle(475,2731.4260,-1937.1626,13.3474,270.9490,-1, -1);
	AddStaticVehicle(536,2685.3967,-2021.3516,13.2650,179.1453,-1, -1);
	AddStaticVehicle(475,2644.9438,-1989.3313,13.3576,178.5030,-1, -1);
	AddStaticVehicle(547,2787.8420,-1876.2371,9.5681,179.4587,-1, -1);
	AddStaticVehicle(426,2757.7773,-1847.0181,9.4532,21.0801,-1, -1);
	AddStaticVehicle(521,2654.6636,-1692.5939,8.8779,251.8571,-1, -1);
	AddStaticVehicle(463,2696.4189,-1669.2604,9.0249,152.7104,-1, -1);
	AddStaticVehicle(474,2813.8862,-1429.2637,16.0126,357.9624,-1, -1);
	AddStaticVehicle(546,2792.6982,-1432.1294,19.9428,95.9562,-1, -1);
	AddStaticVehicle(521,2819.5498,-1427.8861,27.7283,97.0200,-1, -1);
	AddStaticVehicle(400,2794.7859,-1464.7653,40.1536,180.1253,-1, -1);
	AddStaticVehicle(418,2816.5820,-1431.5497,40.1556,268.4159,-1, -1);
	AddStaticVehicle(521,2794.0625,-1576.2109,10.4993,252.9832,-1, -1);
	AddStaticVehicle(600,2796.4966,-1562.6956,10.6452,89.5535,-1, -1);
	AddStaticVehicle(426,2822.3193,-1553.4038,10.6672,89.8755,-1, -1);
	AddStaticVehicle(533,2807.4377,-1540.4016,10.6310,180.0459,-1, -1);
	AddStaticVehicle(589,2855.3896,-1354.9142,10.8385,271.7889,-1, -1);
	AddStaticVehicle(521,2850.3010,-1323.3470,10.8710,43.7938,-1, -1);
	AddStaticVehicle(562,2845.5762,-1287.0035,18.8725,276.4800,-1, -1);
	AddStaticVehicle(463,2802.9653,-1174.3158,25.0878,148.6355,-1, -1);
	AddStaticVehicle(589,2814.8518,-1186.5088,24.9740,125.2599,-1, -1);
	AddStaticVehicle(496,2827.8259,-1165.8298,24.8425,74.4954,-1, -1);
	AddStaticVehicle(419,2828.4297,-1193.2813,24.7035,319.2678,-1, -1);
	AddStaticVehicle(521,2686.6938,-1102.2723,68.9335,36.2440,-1, -1);
	AddStaticVehicle(536,2570.6431,-1101.5728,65.9616,224.2815,-1, -1);
	AddStaticVehicle(461,2589.6411,-967.6470,80.9740,54.8113,-1, -1);
	AddStaticVehicle(543,2561.0659,-955.9353,82.5712,189.2468,-1, -1);
	AddStaticVehicle(543,2499.9092,-961.6536,82.0865,177.1486,-1, -1);
	AddStaticVehicle(478,2492.5671,-951.8682,82.2364,268.9169,-1, -1);
	AddStaticVehicle(463,2450.5344,-957.0054,79.5994,88.6032,-1, -1);
	AddStaticVehicle(521,2359.4319,-648.6396,127.7032,321.5916,-1, -1);
	AddStaticVehicle(478,2368.4819,-651.1127,127.6424,221.5063,-1, -1);
	AddStaticVehicle(529,2497.5225,-1063.2612,69.7644,180.0623,-1, -1);
	AddStaticVehicle(536,2485.7839,-1015.6508,65.0513,332.0788,-1, -1);
	AddStaticVehicle(475,2453.7122,-1011.7231,59.5763,354.2991,-1, -1);
	AddStaticVehicle(475,2390.2915,-1487.7120,23.6330,90.8244,-1, -1);
	AddStaticVehicle(400,2390.6387,-1503.7330,23.9272,270.7136,-1, -1);
	AddStaticVehicle(463,2389.4578,-1497.8422,23.3752,243.2236,-1, -1);
	AddStaticVehicle(545,2396.8088,-1536.9807,23.8111,0.1546,-1, -1);
	AddStaticVehicle(479,2407.3284,-1538.0587,23.7968,0.6749,-1, -1);
	AddStaticVehicle(466,2412.8625,-1537.3831,23.7432,357.6566,-1, -1);
	AddStaticVehicle(475,2449.7637,-1556.8450,23.8046,1.3418,-1, -1);
	AddStaticVehicle(529,2454.6299,-1557.0045,23.6327,180.1560,-1, -1);
	AddStaticVehicle(496,2477.5659,-1557.4111,23.7818,358.5618,-1, -1);
	AddStaticVehicle(463,2491.4055,-1535.6182,23.5519,59.4337,-1, -1);
	AddStaticVehicle(461,2491.1179,-1529.3501,23.5688,56.2088,-1, -1);
	AddStaticVehicle(521,2491.4360,-1532.5398,23.5717,55.7102,-1, -1);
	AddStaticVehicle(496,2489.5791,-1518.4509,23.7588,269.8171,-1, -1);
	AddStaticVehicle(562,2482.6208,-1557.3427,23.6524,2.3099,-1, -1);
	AddStaticVehicle(468,2499.0034,-1538.0708,23.6439,335.4962,-1, -1);
	AddStaticVehicle(536,2520.1445,-1480.9065,23.7363,1.3232,-1, -1);
	AddStaticVehicle(533,2573.5979,-1489.6091,23.7162,87.7542,-1, -1);
	AddStaticVehicle(521,2554.3159,-1367.9281,31.7872,241.1393,-1, -1);
	AddStaticVehicle(536,2411.6626,-1390.6456,24.0787,268.8195,-1, -1);
	AddStaticVehicle(533,1819.8600,-1403.5051,13.1363,89.9457,-1, -1);
	AddStaticVehicle(496,1809.4696,-1432.1268,13.0139,274.7705,-1, -1);
	AddStaticVehicle(400,2784.2922,-2387.0547,13.7279,89.7828,-1, -1);
	AddStaticVehicle(400,2753.1467,-2387.5439,13.7358,1.3794,-1, -1);
	AddStaticVehicle(552,2656.9172,-2451.1821,13.3204,93.4499,-1, -1);
	AddStaticVehicle(422,2428.1499,-2492.5559,13.6317,45.6813,-1, -1);
	AddStaticVehicle(530,2435.3372,-2434.5278,13.3911,41.7356,-1, -1);
	AddStaticVehicle(530,2418.4021,-2506.5557,13.4131,273.4680,-1, -1);
	AddStaticVehicle(455,2152.5361,-2148.2825,13.9860,310.8004,-1, -1);
	AddStaticVehicle(439,1373.6738,-1634.1741,13.2790,271.5004,-1, -1);
	AddStaticVehicle(542,1362.9803,-1659.5125,13.1263,270.4668,-1, -1);
	AddStaticVehicle(475,1359.6680,-1749.6177,13.1843,0.0962,-1, -1);
	AddStaticVehicle(439,1401.3602,-1507.1211,13.4834,163.4146,-1, -1);
	AddStaticVehicle(475,1500.1357,-1487.4355,13.3556,91.3002,-1, -1);
	AddStaticVehicle(542,1797.1293,-1701.1102,13.2757,179.5340,-1, -1);
	AddStaticVehicle(521,1807.9387,-1688.3774,13.1068,105.3693,-1, -1);
	AddStaticVehicle(475,306.7730,-1438.4087,27.7341,120.6372,-1, -1);
	AddStaticVehicle(475,1277.5547,-1610.1168,13.3511,90.3928,-1, -1);
	AddStaticVehicle(475,1145.1482,-1366.7389,13.5456,184.4175,-1, -1);
	AddStaticVehicle(418,2090.4797,-1556.7979,13.2113,181.8175,-1, -1);
	AddStaticVehicle(554,2224.8198,-2211.0693,13.6286,314.5282,-1, -1);
	AddStaticVehicle(439,2393.2522,-1927.3457,13.2782,179.4218,-1, -1);
	AddStaticVehicle(475,2383.3689,-1928.1165,13.1844,179.4976,-1, -1);
	AddStaticVehicle(521,2376.8760,-1929.3613,12.9563,341.1395,-1, -1);
	AddStaticVehicle(439,2349.1824,-2000.2684,13.2666,267.0585,-1, -1);
	AddStaticVehicle(542,1512.3342,-2211.7639,13.2940,359.3842,-1, -1);
	AddStaticVehicle(518,1546.2539,-2211.5557,13.2254,178.7042,-1, -1);
	AddStaticVehicle(521,1560.0939,-2243.5127,13.1179,94.0584,-1, -1);
	AddStaticVehicle(518,1454.6436,-2224.9185,13.2177,0.2168,-1, -1);
	AddStaticVehicle(496,1408.1469,-2242.1521,13.2630,359.3946,-1, -1);
	AddStaticVehicle(439,1398.1570,-2225.4885,13.4427,179.6260,-1, -1);
	AddStaticVehicle(475,1391.6555,-2241.8704,13.3495,180.5889,-1, -1);
	AddStaticVehicle(542,1364.5348,-2242.7036,13.2899,270.7713,-1, -1);
	AddStaticVehicle(542,1404.6641,-2314.1211,13.2898,180.5298,-1, -1);
	AddStaticVehicle(518,1411.2491,-2347.3430,13.2101,180.0483,-1, -1);
	AddStaticVehicle(496,1391.5173,-2364.2131,13.2633,179.7053,-1, -1);
	AddStaticVehicle(521, 1365.7269, -2351.5515, 13.1069, 87.0619, -1, -1);
    AddStaticVehicle(487, -146.6659, 1043.2775, 20.1435, 10.6522, 256, 6);
	return 1;
}

public OnGameModeExit()
{
	for(new i;MAX_PLAYERS>i;i++)
	{
	    SaveChar(i);
	}
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	if(Connected[playerid] == 1 && GetPVarInt(playerid, "prelogin") == 0)
	{
	SetSpawnInfo(playerid, 0, PlayerInfo[playerid][pSkin], PlayerInfo[playerid][pX], PlayerInfo[playerid][pY], PlayerInfo[playerid][pZ], 0, 0, 0, 0, 0, 0, 0);
	SpawnPlayer(playerid);
	return 1;
	}
	return 0;
}


public OnPlayerCommandPerformed(playerid, cmdtext[], success)
{

	if(!success)
	{
	new str[126];
	format(str, sizeof(str), "Error executing command {FFFFFF}%s{E39656}. Please type /help for a list of available commands.",cmdtext);
	SendClientMessage(playerid, 0xE39656AA, str);
	return 1;
	}
	return 1;
}

public OnPlayerCommandReceived(playerid, cmdtext[])
{
	if(Connected[playerid] != 1)
	{
		SendClientMessage(playerid, COLOR_RED, "You're not logged in.");
		return 0;
	}
	new cmd[256];
	format(cmd, 256, "[cmd] [%s]: %s", GetPlayerNameEx(playerid), cmdtext);
	Log("/logs/cmd.txt", cmd);
	return 1;
}

forward LoadingScreen(playerid);
public LoadingScreen(playerid)
{
    if(fexist(UserPath(playerid)))
    {
	    INI_ParseFile(UserPath(playerid), "LoadUser_%s", .bExtra = true, .extra = playerid);
	    if(PlayerInfo[playerid][pBanned] > 0)
	    {
	    	Connected[playerid] = 0;
	    	SendClientMessage(playerid, COLOR_ORANGE, "This account name is banned from the server. Please appeal your ban at http://changeme.com");
			Kick(playerid);
			return 1;
		}
        INI_ParseFile(UserPath(playerid), "LoadUser_%s", .bExtra = true, .extra = playerid);
        ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD,""COL_WHITE"Login",""COL_WHITE"Type your password below to login.","Login","Quit");
        SetPVarInt(playerid, "prelogin", 1);
        InterpolateCameraPos(playerid, 2356.6528, -1742.2469, 142.7728, 1174.76, -1377.98, 150.88, 50000, CAMERA_MOVE);
		InterpolateCameraLookAt(playerid, 1513.8353, -1655.7241, 58.0422, 1513.8353, -1655.7241, 58.0422, 50000, CAMERA_MOVE);
    }
    else
    {   new ip[126]; GetPlayerIp(playerid, ip, 126);
        new str[126];
        SetPVarInt(playerid, "prelogin", 1);
        format(str, sizeof(str), ""COL_WHITE"Type your password below to register a new account. Your IP is %s", ip);
        ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD,""COL_WHITE"Registering...",str,"Register","Quit");
        InterpolateCameraPos(playerid, 2356.6528, -1742.2469, 142.7728, 1174.76, -1377.98, 150.88, 50000, CAMERA_MOVE);
		InterpolateCameraLookAt(playerid, 1513.8353, -1655.7241, 58.0422, 1513.8353, -1655.7241, 58.0422, 50000, CAMERA_MOVE);
		SetPVarInt(playerid, "Quiz", 1);
    }
    new PlayerName[MAX_PLAYER_NAME], Length;
	GetPlayerName(playerid, PlayerName, sizeof(PlayerName));
	Length = strlen(PlayerName);
	if(PlayerName[Length - 1] == '_' || PlayerName[0] == '_' || strfind(PlayerName, "_", false) == -1)
	{
		SendClientMessage(playerid, COLOR_CYAN, "You have failed to connect with a role play name, please select another name.");
		ShowPlayerDialog(playerid, DIALOG_NAME, DIALOG_STYLE_INPUT,""COL_WHITE"Name Change",""COL_WHITE"Type in another name to play with.","Change","No!");
		return 1;
	}
    return 1;
}

public OnPlayerConnect(playerid)
{
	settime();
	SetTimerEx("LoadingScreen", 1500, false, "i", playerid);
	GameTextForPlayer(playerid, "~w~Loading account info..", 1500, 3);
	SetPVarInt(playerid, "prelogin", 1);
	SetPVarInt(playerid, "SpecOff", 1);
	SetPVarInt(playerid, "givemehit", -1);
	SetPVarInt(playerid, "acceptcontract", -1);
	ForceClassSelection(playerid);
	TogglePlayerSpectating(playerid, 1);
	new PlayerIp[32];
	GetPlayerIp(playerid, PlayerIp, 32);
   	if(CheckBan(PlayerIp) == 1) {
	SendClientMessage(playerid, -1, "Your IP is banned from the server.");
	Kick(playerid);
	return 1;
	}
	GetPlayerIp(playerid, PlayerInfo[playerid][pIp], 50);
	SetPlayerColor(playerid, 0xFFFFFF00);
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	new l[56];
	if(reason == 0) { l = "Timed out"; }
	if(reason == 1) { l = "Leaving"; }
	if(reason == 2) { l = "kicked / banned"; }
	if(GetPVarInt(playerid, "Cuffed") == 1 && reason != 2)
	{
	    new brcst[126];
	    format(brcst, sizeof(brcst), "AdmCmd: %s has been automatically prisoned for logging while cuffed. (%s)", GetName(playerid), l);
	    SendClientMessageToAll(COLOR_LIGHTRED, brcst);
		PlayerInfo[playerid][pJail] = 2700;
	}
	if(GetPVarInt(playerid, "Restrained") == 1)
	{
		new brcst[126];
	    format(brcst, sizeof(brcst), "AdmCmd: %s has been automatically prisoned for logging while tazed. (%s)", GetName(playerid), l);
	    SendClientMessageToAll(COLOR_LIGHTRED, brcst);
		PlayerInfo[playerid][pJail] = 2700;
	}
	AntiSpam[playerid] = 0;
	TextDrawHideForPlayer(playerid, Clock);
	TextDrawHideForPlayer(playerid, WeekDayg);
	new str[256];
	format(str, sizeof(str), "%s has left the server (%s)", GetName(playerid), l);
	ProxDetector(50.0, playerid, str, COLOR_YELLOW);
	SaveChar(playerid);
	UnloadChar(playerid);
	pass[playerid] = -1;
    spec[playerid] = -1;
    SetPVarInt(playerid, "SpecOff", 1);
	TogglePlayerSpectating(playerid, false);
	SetCameraBehindPlayer(playerid);
	AdminDuty[playerid] = 0;
	AutoTPban[playerid] = 0;
    if(IsPlayerConnected(playerid))
	{
		if(GetPVarInt(playerid, "Quiz") == 1)
		{
			new account[126];
			new name[126];
			GetPlayerName(playerid, name, sizeof(name));
			format(account, 126, "/users/%s.ini", name);
			fremove(account);
		}
	}
	for(new i; MAX_PLAYERS>i; i++)
	if(beingdragged[i] == playerid)
	{
	    if(GetPVarInt(i, "Dragged") == 1)
	    {
			SetPVarInt(i, "Dragged", 0);
			beingdragged[i] = 0;
		}
	}
	if(IsPlayerConnected(playerid))
	{
		if(GetPVarInt(playerid, "Injured") == 1)
		{
			SaveChar(playerid);
			Connected[playerid] = 0;
			PlayerInfo[playerid][pHealth] = -1337;
		}

		if(GetPVarInt(playerid, "Recovering") == 1)
		{
		    SaveChar(playerid);
			PlayerInfo[playerid][pHealth] = -1337;
		}
		else
		{
		return 1;
		}
	}
	return 1;
}

forward Unmute(playerid);
public Unmute(playerid)
{
	mute[playerid] = 0;
}

forward ansp(playerid);
public ansp(playerid)
{
	AntiSpam[playerid] = 0;
}

public OnPlayerSpawn(playerid)
{
	TextDrawShowForPlayer(playerid, Clock);
	TextDrawShowForPlayer(playerid, WeekDayg);
	Connected[playerid] = 1;
	SetPlayerWeaponsEx(playerid);
	if(PlayerInfo[playerid][pJail] > 0)
	{
	SetPlayerInterior(playerid, 6);
	SetPlayerVirtualWorld(playerid, 1337);
	SetPlayerPos(playerid, 264.67, 77.79, 1001.04);
	return 1;
	}
    if(GetPVarInt(playerid, "Injured") == 1)
    {
        iitimer[playerid] = SetTimerEx("LoseHP", 20000, true, "i", playerid);
        SetPlayerInterior(playerid, PlayerInfo[playerid][pInt]);
        SetPlayerVirtualWorld(playerid, PlayerInfo[playerid][pVW]);
    	ClearAnimations(playerid, 1);
		GameTextForPlayer(playerid, "~w~ Type ~r~/ems~w~ or ~r~/giveup~w~.", 6000, 3);
        SendClientMessage(playerid, COLOR_RED, "You are critically injured. You have to call for EMS or give up hope.");
        ApplyAnimation(playerid, "KNIFE", "KILL_Knife_Ped_Die", 4.0, 0, 1, 1, 1, 0, 0);
		return 1;
	}
	if(GetPVarInt(playerid, "Recovering") == 1)
	{
 		SetPlayerInterior(playerid, 0);
        SetPlayerVirtualWorld(playerid, 0);
	    SetPlayerHealth(playerid, 40);
		TogglePlayerControllable(playerid, 0);
		SetPlayerCameraPos(playerid, 1201.5009,-1325.1001,16.6868);
		SetPlayerCameraLookAt(playerid, 1176.9282,-1323.5554,14.0455);
		return 1;
	}
	if(GetPVarInt(playerid, "Recovering") == 2)
	{
 		SetPlayerInterior(playerid, 0);
        SetPlayerVirtualWorld(playerid, 0);
	    SetPlayerHealth(playerid, 40);
		TogglePlayerControllable(playerid, 0);
		SetPlayerCameraPos(playerid, 2030.01, -1432.00, 23.00);
		SetPlayerCameraLookAt(playerid, 2031.33, -1408.66, 19.17);
		return 1;
	}
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	if(GetPVarInt(playerid, "InEvent") == 1)
	{
		SetPVarInt(playerid, "Injured", 0);
	    SkipWepCheck(playerid);
	    SetPVarInt(playerid, "InEvent", 0);
	    SetPlayerInterior(playerid, oINT[playerid]);
	    SetPlayerVirtualWorld(playerid, oVW[playerid]);
	    SetPlayerPos(playerid, oX[playerid], oY[playerid], oZ[playerid]);
	    SetPlayerHealth(playerid, oHP[playerid]);
	    SkipWepCheck(playerid);
     	SkipACheck(playerid);
       	PlayerInfo[playerid][pArmor] = oA[playerid];
	    SetPlayerArmour(playerid, oA[playerid]);
		SetPlayerWeaponsEx(playerid);
		SetPlayerSkin(playerid, oSkin[playerid]);
		ClearAnimations(playerid);
		return 1;
	}
	if(GetPVarInt(killerid, "acceptcontract") == playerid)
	{
	    if(AdminDuty[playerid] == 1 || AdminDuty[killerid] == 1) return 1;
	    if(PlayerInfo[playerid][pContracted] != 1) return 1;
		new str[126];
		format(str, sizeof(str), "You have been critically wounded by a hitman and have lost $%i. This note was left: %s", PlayerInfo[playerid][pContractAmount], PlayerInfo[playerid][pContractReason]);
		SendClientMessage(playerid, COLOR_YELLOW, str);
		format(str, sizeof(str), "Hitman %s has completed the hit on %s and got $%i.", GetName(killerid), GetName(playerid), PlayerInfo[playerid][pContractAmount]);
		SendClientMessage(killerid, -1, "You have completed a contract. A successfull hit has been added to your hitman statistics.");
		PlayerInfo[playerid][pCash] -= PlayerInfo[playerid][pContractAmount];
		PlayerInfo[killerid][pCash] += PlayerInfo[playerid][pContractAmount];
		SendClientMessageToHA(COLOR_YELLOW, str);
		PlayerInfo[playerid][pContracted] = 0;
		format(PlayerInfo[playerid][pContractReason], 126, "None");
		PlayerInfo[playerid][pContractAmount] = 0;
		format(PlayerInfo[playerid][pContractedBy], 126, "None");
		SetPVarInt(killerid, "givemehit", -1);
		SetPVarInt(killerid, "acceptcontract", -1);
		PlayerInfo[killerid][pSuccess]++;
	}
	if(GetPVarInt(playerid, "acceptcontract") == killerid)
	{
	    if(AdminDuty[playerid] == 1 || AdminDuty[killerid] == 1) return 1;
	    if(PlayerInfo[killerid][pContracted] != 1) return 1;
		new str[126];
		format(str, sizeof(str), "You have critically wounded the hitman that was after you. You got: $%i. Contracted by %s for %s.", PlayerInfo[killerid][pContractAmount], PlayerInfo[killerid][pContractedBy],PlayerInfo[killerid][pContractReason]);
		SendClientMessage(killerid, COLOR_YELLOW, str);
		format(str, sizeof(str), "Hitman %s has failed the hit on %s.", GetName(playerid), GetName(killerid));
		SendClientMessage(playerid, -1, "You have failed a contract. A failed hit has been added to your hitman statistics.");
		SendClientMessageToHA(COLOR_YELLOW, str);
		PlayerInfo[playerid][pCash] -= PlayerInfo[killerid][pContractAmount];
		PlayerInfo[killerid][pCash] += PlayerInfo[killerid][pContractAmount];
		PlayerInfo[killerid][pContracted] = 0;
		format(PlayerInfo[killerid][pContractReason], 126, "None");
		PlayerInfo[killerid][pContractAmount] = 0;
		format(PlayerInfo[killerid][pContractedBy], 126, "None");
		SetPVarInt(playerid, "givemehit", -1);
		SetPVarInt(playerid, "acceptcontract", -1);
		PlayerInfo[playerid][pFailed]++;
	}
	if(reason == 40 || reason == 43 || reason == 44 || reason == 45 || reason == 46 || reason == 46)
	{
	    new string[156];
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Fake kills death (%i)", GetName(playerid), reason);
		PlayerInfo[playerid][pBanned] = 1;
		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Fake kills death (%i)", GetName(playerid), ip, reason);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
		return 1;
	}
 	for(new i; MAX_PLAYERS>i; i++)
	if(beingdragged[i] == playerid)
	{
		if(GetPVarInt(i, "Dragged") == 1)
		{
			SetPVarInt(i, "Dragged", 0);
			beingdragged[i] = 0;
		}
	}
	if(PlayerInfo[playerid][pAdmin] > 0 && AdminDuty[playerid] == 1)
	{
	    GetPlayerPos(playerid, PlayerInfo[playerid][pX], PlayerInfo[playerid][pY], PlayerInfo[playerid][pZ]);
		SetSpawnInfo(playerid, 0, PlayerInfo[playerid][pSkin], PlayerInfo[playerid][pX], PlayerInfo[playerid][pY], PlayerInfo[playerid][pZ], 0, 0, 0, 0, 0, 0, 0);
		SpawnPlayer(playerid);
		SetPlayerHealth(playerid, 100);
	}
	if(reason == 50)
	{
		new string[128];
		format(string, 128, "AdmWarn: %s (ID: %i) has possibly just helibladed %s.", GetName(killerid), killerid, GetName(playerid));
		SendClientMessageToAdmins(COLOR_YELLOW, string, 1);
	}
	if(reason == 49)
	{
		new string[128];
		format(string, 128, "AdmWarn: %s (ID: %i) has possibly just car rammed %s to death.", GetName(killerid), killerid, GetName(playerid));
		SendClientMessageToAdmins(COLOR_YELLOW, string, 1);
	}
	if(AdminDuty[playerid] > 0)
	{
	return 1;
	}
	if(PlayerInfo[playerid][pJail] > 0)
	{
		SetSpawnInfo(playerid, 0, PlayerInfo[playerid][pSkin], 264.67, 77.79, 1001.04, 0, 0, 0, 0, 0, 0, 0);
		SpawnPlayer(playerid);
		return 1;
	}
	if(GetPVarInt(playerid, "Recovering") == 1) // to prevent double recovering in case of a bug
	{
	    SetSpawnInfo(playerid, 0, PlayerInfo[playerid][pSkin], 1178, -1324, 5.11, 0, 0, 0, 0, 0, 0, 0);
		SpawnPlayer(playerid);
		TogglePlayerControllable(playerid, 0);
		return 1;
	}

	if(GetPVarInt(playerid, "Injured") != 1)
	{
		SetPVarInt(playerid, "Injured", 1);
		PlayerInfo[playerid][pVW] = GetPlayerVirtualWorld(playerid);
		PlayerInfo[playerid][pInt] = GetPlayerInterior(playerid);
		GetPlayerPos(playerid, PlayerInfo[playerid][pX], PlayerInfo[playerid][pY], PlayerInfo[playerid][pZ]);
		SetSpawnInfo(playerid, 0, PlayerInfo[playerid][pSkin], PlayerInfo[playerid][pX], PlayerInfo[playerid][pY], PlayerInfo[playerid][pZ], 0, 0, 0, 0, 0, 0, 0);
        GetPlayerPos(playerid, iX[playerid], iY[playerid], iZ[playerid]);
		itimer[playerid] = SetTimerEx("checkmoved", 1000, true, "i", playerid);
		PreloadAnims(playerid);
//	    SendClientMessage(playerid, -1, "Entering injured state.");
	}
	else
	{
		new rand = random(2);
	    if(rand == 1)
		{
			SendClientMessage(playerid, -1, "The medics failed to save you, and you were immediately sent to hospital.");
			RecoverHospital(playerid);
			KillTimer(iitimer[playerid]);
			KillTimer(itimer[playerid]);
			SetTimerEx("RecoverHospital2", 6000, false, "i", playerid);
			SetTimerEx("RecoverHospital3", 8000, false, "i", playerid);
			SetTimerEx("RecoverHospital4", 10000, false, "i", playerid);
			SetTimerEx("RecoverHospital5", 12000, false, "i", playerid);
			SetTimerEx("RecoverHospital6", 14000, false, "i", playerid);
			SetSpawnInfo(playerid, 0, PlayerInfo[playerid][pSkin], 1178, -1324, 8.11, 0, 0, 0, 0, 0, 0, 0);
	        SetPVarInt(playerid, "Injured", 0);
	        SetPVarInt(playerid, "Recovering", 1);
	        SpawnPlayer(playerid);
	        PlayerInfo[killerid][pKills]++;
	 		PlayerInfo[playerid][pDeaths]++;
	 		TogglePlayerControllable(playerid, 1);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, -1, "The medics failed to save you, and you were immediately sent to hospital.");
			RecoverHospital(playerid);
			KillTimer(iitimer[playerid]);
			KillTimer(itimer[playerid]);
			SetTimerEx("RecoverHospital2", 6000, false, "i", playerid);
			SetTimerEx("RecoverHospital3", 8000, false, "i", playerid);
			SetTimerEx("RecoverHospital4", 10000, false, "i", playerid);
			SetTimerEx("RecoverHospital5", 12000, false, "i", playerid);
			SetTimerEx("RecoverHospital26", 14000, false, "i", playerid);
			SetSpawnInfo(playerid, 0, PlayerInfo[playerid][pSkin], 2029.52, -1421.81, 10.99, 0, 0, 0, 0, 0, 0, 0);
	        SetPVarInt(playerid, "Injured", 0);
	        SetPVarInt(playerid, "Recovering", 2);
	        SpawnPlayer(playerid);
	        PlayerInfo[killerid][pKills]++;
	 		PlayerInfo[playerid][pDeaths]++;
	 		TogglePlayerControllable(playerid, 1);
			return 1;
		}
	}
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	new plate[126];
	format(plate, sizeof(plate), "LS%i", vehicleid);
	SetVehicleNumberPlate(vehicleid, plate);
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
    for(new i; i < MAX_PLAYERS; i++)
	if(IsATruck(vehicleid))
	{
		if(truckloadedon[i] == vehicleid && truckloadedon[i] != -1 && truckloaded[i] == 1)
		{
		    DisablePlayerCheckpoint(i);
		    SendClientMessage(i, COLOR_GRAD1, "Your truck suffered terminal damage and your trucking route was cancelled.");
            truckloadedon[i] = -1;
            CPT[i] = 0;
		    return 1;
		}
	}
	return 1;
}

public OnPlayerText(playerid, text[])
{
	if(AntiSpam[playerid] > 1)
	{
    	SetTimerEx("ansp", 100, false, "i", playerid);
	}
    AntiSpam[playerid] += 1;
	if(AntiSpam[playerid] > 10)
 	{
 	    new str[156];
		format(str, sizeof(str), "AdmWarn: %s may possibly have attempted to crash the server.", GetName(playerid));
		SendClientMessageToAdmins(COLOR_RED, str, 1);
		Kick(playerid);
		Log("logs/crasher.txt", str);
	}
    new message[128], string[126];

	if(OnCall[playerid] == -1 || OnCall[playerid] == 0)
	{
 		format(message, sizeof(message), "%s says: %s", GetName(playerid), text);
  		ProxDetector(30.0, playerid, message, -1);
  		Log("/logs/chat.txt", message);
  		SetPlayerChatBubble(playerid,text,COLOR_WHITE,20.0,5000);
	}
   	if(OnCall[playerid] != -1 && OnCall[playerid] != 0)
	{
		format(string, sizeof(string), "(cellphone) %s says: %s", GetPlayerNameEx(playerid), text);
		ProxDetector(20.0, playerid, string,COLOR_FADE1);
		SetPlayerChatBubble(playerid,text,COLOR_WHITE,20.0,5000);
	}
		
    if(IsPlayerConnected(OnCall[playerid]))
	{
		if(OnCall[OnCall[playerid]] == playerid)
		{
			SendClientMessage(OnCall[playerid], COLOR_YELLOW, string);
			Log("/logs/cellphone.txt", message);
		}
	}
    return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	if(ispassenger) return 1;
	if(IsACopCar(vehicleid))
	{
	    if(PlayerInfo[playerid][pFaction] != 1)
	    {
	        SendClientMessage(playerid, COLOR_OOC, "You are not in the LSPD!");
	        GetPlayerPos(playerid, PlayerInfo[playerid][pX], PlayerInfo[playerid][pY], PlayerInfo[playerid][pZ]);
			SetPlayerPos(playerid, PlayerInfo[playerid][pX], PlayerInfo[playerid][pY], PlayerInfo[playerid][pZ]+0.5);
		}
	}
	if(IsAnAmbulance(vehicleid))
	{
	    if(PlayerInfo[playerid][pFaction] != 3)
	    {
	        SendClientMessage(playerid, COLOR_OOC, "You are not in the LSFMD!");
	        GetPlayerPos(playerid, PlayerInfo[playerid][pX], PlayerInfo[playerid][pY], PlayerInfo[playerid][pZ]);
			SetPlayerPos(playerid, PlayerInfo[playerid][pX], PlayerInfo[playerid][pY], PlayerInfo[playerid][pZ]+0.5);
		}
	}
	if(IsA3Truck(vehicleid))
	{
	    if(PlayerInfo[playerid][pJob] == 1 && PlayerInfo[playerid][pTruckerSkill] < 200)
	    {
	        SendClientMessage(playerid, COLOR_OOC, "You are not a level 3 trucker.");
	        GetPlayerPos(playerid, PlayerInfo[playerid][pX], PlayerInfo[playerid][pY], PlayerInfo[playerid][pZ]);
			SetPlayerPos(playerid, PlayerInfo[playerid][pX], PlayerInfo[playerid][pY], PlayerInfo[playerid][pZ]+0.5);
		}
	}
	if(IsA2Truck(vehicleid))
	{
	    if(PlayerInfo[playerid][pJob] == 1 && PlayerInfo[playerid][pTruckerSkill] < 100)
	    {
	        SendClientMessage(playerid, COLOR_OOC, "You are not a level 2 trucker.");
	        GetPlayerPos(playerid, PlayerInfo[playerid][pX], PlayerInfo[playerid][pY], PlayerInfo[playerid][pZ]);
			SetPlayerPos(playerid, PlayerInfo[playerid][pX], PlayerInfo[playerid][pY], PlayerInfo[playerid][pZ]+0.5);
		}
	}
	if(IsA5Truck(vehicleid))
	{
	    if(PlayerInfo[playerid][pJob] == 1 && PlayerInfo[playerid][pTruckerSkill] < 400)
	    {
	        SendClientMessage(playerid, COLOR_OOC, "You are not a level 5 trucker.");
	        GetPlayerPos(playerid, PlayerInfo[playerid][pX], PlayerInfo[playerid][pY], PlayerInfo[playerid][pZ]);
			SetPlayerPos(playerid, PlayerInfo[playerid][pX], PlayerInfo[playerid][pY], PlayerInfo[playerid][pZ]+0.5);
		}
	}
	if(IsATruck(vehicleid))
	{
	    if(PlayerInfo[playerid][pJob] != 1)
	    {
	        SendClientMessage(playerid, COLOR_OOC, "You are not a trucker.");
	        GetPlayerPos(playerid, PlayerInfo[playerid][pX], PlayerInfo[playerid][pY], PlayerInfo[playerid][pZ]);
			SetPlayerPos(playerid, PlayerInfo[playerid][pX], PlayerInfo[playerid][pY], PlayerInfo[playerid][pZ]+0.5);
		}
	}
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	//new string[128];
	cardetain[playerid] = vehicleid;
//	format(string, 128, "#DEBUG# Detain-Vehicle for %s is now %i.", GetName(playerid), cardetain[playerid]);
//	SendClientMessageToAll(COLOR_CYAN, string);
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(newstate == 2)
	{
	    carsentered[playerid] += 1;
	    if(carsentered[playerid] > 5 && dontcheck[playerid] != 1)
	    {
     		new string[126];
		    format(string, sizeof(string), "AdmWarn: %s (ID: %i) may possibly be warp-hacking.", GetName(playerid), playerid);
		    SendClientMessageToAdmins(COLOR_YELLOW, string, 1);
			SetVehicleToRespawn(GetPlayerVehicleID(playerid));
			dontcheck[playerid] = 1;
		}
	}
	if(newstate == 2)
	{
	    new car = GetPlayerVehicleID(playerid);
		for(new x;x<MAX_PLAYER_VEHICLES;x++)
		{
 			if(PlayerInfo[playerid][pVehicleSpawnedID][x] == car)
   			{
		        SendClientMessage(playerid, -1, "This is your vehicle.");
			}
		}
		new str[126];
		for(new x;x<MAX_PLAYERS;x++)
		{
			for(new y;y<MAX_PLAYER_VEHICLES;y++)
			{
			   	if(PlayerInfo[x][pVehicleSpawnedID][y] == car && x != playerid)
				{
			 	   format(str, sizeof(str), "This vehicle is registered to %s.", GetName(x));
			 	   SendClientMessage(playerid, -1, str);
				}
			}
		}
	}
    if(newstate == 2)
	{
        if(IsATruck(GetPlayerVehicleID(playerid)) && PlayerInfo[playerid][pJob] != 1)
		{
        RemovePlayerFromVehicle(playerid);
        }
    }
    if(newstate == 2)
	{
        if(IsADSV(GetPlayerVehicleID(playerid)))
		{
		new strbuy[126];
		format(strbuy, sizeof(strbuy), "You can buy this vehicle. \n Price: $%i", GetVehicleCost(GetVehicleModel(GetPlayerVehicleID(playerid))));
        ShowPlayerDialog(playerid, DIALOG_BUYCAR, DIALOG_STYLE_MSGBOX, "Buy car", strbuy, "Buy", "Close");
        }
    }
    if(newstate == 2)
	{
        if(IsATruck(GetPlayerVehicleID(playerid)))
		{
        SendClientMessage(playerid, COLOR_YELLOW, "You've entered a truck. /loadtruck to load some goods.");
        }
    }
    if(newstate == 2)
	{
        if(IsA3Truck(GetPlayerVehicleID(playerid)) && PlayerInfo[playerid][pJob] == 1 && PlayerInfo[playerid][pTruckerSkill] < 300)
		{
        RemovePlayerFromVehicle(playerid);
        SendClientMessage(playerid, COLOR_GREY, "You are not a level 3 trucker.");
        }
    }
    if(newstate == 2)
	{
        if(IsA5Truck(GetPlayerVehicleID(playerid)) && PlayerInfo[playerid][pJob] == 1 && PlayerInfo[playerid][pTruckerSkill] < 500)
		{
        RemovePlayerFromVehicle(playerid);
        SendClientMessage(playerid, COLOR_GREY, "You are not a level 5 trucker.");
        }
    }
    if(newstate == 2)
	{
        if(IsACopCar(GetPlayerVehicleID(playerid)) && PlayerInfo[playerid][pFaction] != 1)
		{
        RemovePlayerFromVehicle(playerid);
        }
    }
    if(newstate == 2)
	{
        if(IsAnAmbulance(GetPlayerVehicleID(playerid)) && PlayerInfo[playerid][pFaction] != 3)
		{
        RemovePlayerFromVehicle(playerid);
        }
    }
    return 1;
}

CMD:doors(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 5, 245.89999390,72.50000000,1002.59997559)) return SendClientMessage(playerid, COLOR_GREY, "You are not near the LSPD doors.");
	if(PlayerInfo[playerid][pFaction] != 1 && PlayerInfo[playerid][pFaction] != 2) return SendClientMessage(playerid, COLOR_GREY, "You are not in the LSPD.");
	if(LSPDDoorStatus == 0)
	{
		MoveObject(LSPDDoor1, 240.89999390,72.50000000,1002.59997559, 3);
		MoveObject(LSPDDoor2, 251.89999390,72.50000000,1002.59997559, 3);
		SendClientMessage(playerid, -1, "Doors opened.");
		LSPDDoorStatus = 1;
		return 1;
	}
	if(LSPDDoorStatus == 1)
	{
		MoveObject(LSPDDoor1, 244.89999390,72.50000000,1002.59997559, 3);
		MoveObject(LSPDDoor2, 247.89999390,72.50000000,1002.59997559, 3);
		SendClientMessage(playerid, -1, "Doors closed.");
		LSPDDoorStatus = 0;
		return 1;
	}
	return 1;
}

CMD:gate(playerid, params[])
{
	/* LSPD BARRIER */
	new str[126];
	if(IsPlayerInRangeOfPoint(playerid, 8, 1544.79, -1627.07, 13.37))
	{
	    if(PlayerInfo[playerid][pFaction] != 1) return SendClientMessage(playerid, COLOR_GREY, "You are not in the LSPD.");
		if(LSPDBarrierStatus == 0)
		{
		    format(str, sizeof(str), "%s presses their remote control and opens the barrier.", GetName(playerid));
		    ProxDetector(50.0, playerid, str, COLOR_PURPLE);
		    MoveObject(LSPDBarrier, 1544.69, -1630.80, 13.08, 1, -0.0, -0.0, -0.0);
		    LSPDBarrierStatus = 1;
		    return 1;
		}
		if(LSPDBarrierStatus == 1)
		{
			format(str, sizeof(str), "%s presses their remote control and closes the barrier.", GetName(playerid));
		    ProxDetector(50.0, playerid, str, COLOR_PURPLE);
		    MoveObject(LSPDBarrier, 1544.69, -1630.80, 13.08, 1, -90.00, -0.0, -0.0);
		    LSPDBarrierStatus = 0;
		    return 1;
		}
	}
	/* LSPD GATE */
	if(IsPlayerInRangeOfPoint(playerid, 8, 1588.31, -1637.49, 13.37))
	{
		if(PlayerInfo[playerid][pFaction] != 1) return SendClientMessage(playerid, COLOR_GREY, "You are not in the LSPD.");
		if(LSPDGateStatus == 0)
		{
			format(str, sizeof(str), "%s presses their remote control and opens the gate.", GetName(playerid));
		    ProxDetector(50.0, playerid, str, COLOR_PURPLE);
		    MoveObject(LSPDGate, 1589.04, -1637.95, 7.73, 2);
		    LSPDGateStatus = 1;
		    return 1;
		}
		if(LSPDGateStatus == 1)
		{
			format(str, sizeof(str), "%s presses their remote control and closes the gate.", GetName(playerid));
		    ProxDetector(50.0, playerid, str, COLOR_PURPLE);
		    MoveObject(LSPDGate, 1589.04, -1637.95, 14.73, 2);
		    LSPDGateStatus = 0;
		    return 1;
		}
	}
	return 1;
}


CMD:unbanip(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4)
	{
		if(AdminDuty[playerid] != 1 && PlayerInfo[playerid][pAdmin] < 6)
		{
			SendClientMessage(playerid,COLOR_WHITE, "You are not on duty as an admin, /aduty to go on duty.");
			return 1;
		}
		if(isnull(params)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /unbanip [ip]");

		new string[128];
		RemoveBan(params);
		format(string, 128, "AdmCmd: %s has unbanned IP %s", GetName(playerid), params);
		SendClientMessageToAdmins(COLOR_LIGHTRED,string,1);
		format(string, sizeof(string), "AdmCmd: %s has unbanned IP %s", GetName(playerid), params);
		Log("logs/bans.txt", string);
	}

	return 1;
}
CMD:banip(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] >= 4)
	{
		if(AdminDuty[playerid] != 1 && PlayerInfo[playerid][pAdmin] < 6)
		{
			SendClientMessage(playerid,COLOR_WHITE, "You are not on duty as an admin, /aduty to go on duty.");
			return 1;
		}
		if(isnull(params)) return SendClientMessage(playerid, COLOR_WHITE, "USAGE: /banip [ip]");

		new string[128];
		AddBan(params);
		format(string, 128, "AdmCmd: %s has banned IP %s", GetName(playerid), params);
		SendClientMessageToAdmins(COLOR_LIGHTRED,string,1);
		format(string, sizeof(string), "AdmCmd: %s has banned IP %s", GetName(playerid), params);
		Log("logs/bans.txt", string);
	}

	return 1;
}
CMD:cc(playerid, params[])
{
	new string[128];
	format(string, 128, "Connected = %i. Injured = %i. Recovering = %i", Connected[playerid], GetPVarInt(playerid, "Injured"), GetPVarInt(playerid, "Recovering"));
	SendClientMessage(playerid, COLOR_CYAN, string);
	return 1;
}
CMD:ct(playerid, params[])
{
	new string[128];
	new truck;
	if(IsA1Truck(GetPlayerVehicleID(playerid)))
	{
	truck = 1;
	}
	if(IsA2Truck(GetPlayerVehicleID(playerid)))
	{
	truck = 2;
	}
	if(IsA3Truck(GetPlayerVehicleID(playerid)))
	{
	truck = 3;
	}
	if(IsA5Truck(GetPlayerVehicleID(playerid)))
	{
	truck = 5;
	}
	if(GetPlayerState(playerid) != 2)
	{
	truck = 0;
	}
	new trailer = GetVehicleTrailer(GetPlayerVehicleID(playerid));
	if(IsTrailerAttachedToVehicle(trailer))
	{
	trailer = 1;
	}
	format(string, sizeof(string), "Truck Loaded: %i. CPT: %i. Truck: Level %i. Trailer ID: %i", truckloaded[playerid], CPT[playerid], truck, trailer);
	SendClientMessage(playerid, COLOR_CYAN, string);
	return 1;
}
public OnPlayerEnterCheckpoint(playerid)
{
    if(CPT[playerid] == 3)
	{
	    new str[128];
	    new rand = random(100)+200;
	    format(str, sizeof(str), "You have delivered the package, and you got %i materials from them.", rand);
		SendClientMessage(playerid, COLOR_CYAN, str);
		PlayerInfo[playerid][pMaterials] += rand;
		CPT[playerid] = 0;
	}
	if(GetPlayerState(playerid) == 2)
	{
		if(IsA1Truck(GetPlayerVehicleID(playerid))) // Level 1 trucks
		{
		    if(truckloaded[playerid] == 1)
		    {
				if(CPT[playerid] == 1) // Stage: Delivery
				{
					if(GetPlayerVehicleID(playerid) != truckloadedon[playerid])
					{
					    SendClientMessage(playerid, COLOR_GREY, "This is not the truck that you loaded the goods in.");
					    CPT[playerid] = 0;
						DisablePlayerCheckpoint(playerid);
  						truckloaded[playerid] = 0;
	   					truckloadedon[playerid] = -1;
						return 1;
					}
				    SendClientMessage(playerid, COLOR_GREEN, "You have delivered the goods, and you have been paid $75. You will recieve a bonus of $50");
				    SendClientMessage(playerid, COLOR_GREEN, "if you return the truck. "COL_RED"You will only recieve a skill point if you return it.");
					PlayerInfo[playerid][pCash] += 75;
					CPT[playerid] = 2;
					DisablePlayerCheckpoint(playerid);
					SetPlayerCheckpoint(playerid, 2223.48, -2650.71, 13.40, 15);
					return 1;
				}
			}
	  		if(truckloaded[playerid] == 1) // Stage: Return
		    {
				if(CPT[playerid] == 2)
				{
					if(GetPlayerVehicleID(playerid) != truckloadedon[playerid])
					{
					    SendClientMessage(playerid, COLOR_GREY, "This is not the truck that you loaded the goods in.");
					    CPT[playerid] = 0;
						DisablePlayerCheckpoint(playerid);
						truckloaded[playerid] = 0;
	   					truckloadedon[playerid] = -1;
						return 1;
					}
	             	SendClientMessage(playerid, COLOR_GREEN, "You have returned the truck, and you have recieved a $50 bonus and a skill point.");
	   				PlayerInfo[playerid][pCash] += 50;
	   				PlayerInfo[playerid][pTruckerSkill] +=1;
	   				DisablePlayerCheckpoint(playerid);
	   				truckloaded[playerid] = 0;
	   				truckloadedon[playerid] = -1;
					CPT[playerid] = 0;
					return 1;
				}
			}
			return DisablePlayerCheckpoint(playerid);
		}
		if(IsA2Truck(GetPlayerVehicleID(playerid))) // Level 1 trucks
		{
		    if(truckloaded[playerid] == 1)
		    {
				if(CPT[playerid] == 1) // Stage: Delivery
				{
					if(GetPlayerVehicleID(playerid) != truckloadedon[playerid])
					{
					    SendClientMessage(playerid, COLOR_GREY, "This is not the truck that you loaded the goods in.");
					    CPT[playerid] = 0;
					    truckloaded[playerid] = 0;
	   					truckloadedon[playerid] = -1;
						DisablePlayerCheckpoint(playerid);
						return 1;
					}
				    SendClientMessage(playerid, COLOR_GREEN, "You have delivered the goods, and you have been paid $125. You will recieve a bonus of $50");
				    SendClientMessage(playerid, COLOR_GREEN, "if you return the truck. "COL_RED"You will only recieve a skill point if you return it.");
					PlayerInfo[playerid][pCash] += 125;
					CPT[playerid] = 2;
					DisablePlayerCheckpoint(playerid);
					SetPlayerCheckpoint(playerid, 2223.48, -2650.71, 13.40, 15);
					return 1;
				}
			}
	  		if(truckloaded[playerid] == 1) // Stage: Return
		    {
				if(CPT[playerid] == 2)
				{
					if(GetPlayerVehicleID(playerid) != truckloadedon[playerid])
					{
					    SendClientMessage(playerid, COLOR_GREY, "This is not the truck that you loaded the goods in.");
					    CPT[playerid] = 0;
					    truckloaded[playerid] = 0;
	   					truckloadedon[playerid] = -1;
						DisablePlayerCheckpoint(playerid);
						return 1;
					}
	             	SendClientMessage(playerid, COLOR_GREEN, "You have returned the truck, and you have recieved a $50 bonus and a skill point.");
	   				PlayerInfo[playerid][pCash] += 50;
	   				PlayerInfo[playerid][pTruckerSkill] +=1;
	   				truckloaded[playerid] = 0;
	   				truckloadedon[playerid] = -1;
	   				DisablePlayerCheckpoint(playerid);
					CPT[playerid] = 0;
					return 1;
				}
			}
			return DisablePlayerCheckpoint(playerid);
		}
		if(IsA3Truck(GetPlayerVehicleID(playerid))) // Level 3 trucks
		{
		    if(truckloaded[playerid] == 1)
		    {
				if(CPT[playerid] == 1) // Stage: Delivery
				{
				    new truck = GetPlayerVehicleID(playerid);
					if(!IsTrailerAttachedToVehicle(truck))
					{
					SendClientMessage(playerid, COLOR_GREY, "You have lost your trailer, and the route have been cancelled.");
					CPT[playerid] = 0;
					truckloaded[playerid] = 0;
					truckloadedon[playerid] = -1;
					DisablePlayerCheckpoint(playerid);
					return 1;
					}
					if(GetPlayerVehicleID(playerid) != truckloadedon[playerid])
					{
					    SendClientMessage(playerid, COLOR_GREY, "This is not the truck that you loaded the goods in.");
					    CPT[playerid] = 0;
					    truckloaded[playerid] = 0;
	   					truckloadedon[playerid] = -1;
						DisablePlayerCheckpoint(playerid);
						return 1;
					}
					new trailer = GetVehicleTrailer(GetPlayerVehicleID(playerid));
					SetVehicleToRespawn(trailer);
				    SendClientMessage(playerid, COLOR_GREEN, "You have delivered the goods, and you have been paid $200. You will recieve a bonus of $50");
				    SendClientMessage(playerid, COLOR_GREEN, "if you return the truck. "COL_RED"You will only recieve a skill point if you return it.");
					PlayerInfo[playerid][pCash] += 200;
					CPT[playerid] = 2;
					DisablePlayerCheckpoint(playerid);
					SetPlayerCheckpoint(playerid, 2223.48, -2650.71, 13.40, 15);
					return 1;
				}
			}
	  		if(truckloaded[playerid] == 1) // Stage: Return
		    {
				if(CPT[playerid] == 2)
				{
					if(GetPlayerVehicleID(playerid) != truckloadedon[playerid])
					{
					    SendClientMessage(playerid, COLOR_GREY, "This is not the truck that you loaded the goods in.");
					    CPT[playerid] = 0;
					    truckloaded[playerid] = 0;
	   					truckloadedon[playerid] = -1;
						DisablePlayerCheckpoint(playerid);
						return 1;
					}
	             	SendClientMessage(playerid, COLOR_GREEN, "You have returned the truck, and you have recieved a $50 bonus and a skill point.");
	   				PlayerInfo[playerid][pCash] += 50;
	   				PlayerInfo[playerid][pTruckerSkill] +=1;
	   				DisablePlayerCheckpoint(playerid);
	   				truckloaded[playerid] = 0;
	   				truckloadedon[playerid] = -1;
					CPT[playerid] = 0;
					return 1;
				}
			}
			return DisablePlayerCheckpoint(playerid);
		}
		if(IsA5Truck(GetPlayerVehicleID(playerid))) // Level 5 trucks
		{
		    if(truckloaded[playerid] == 1)
		    {
				if(CPT[playerid] == 1) // Stage: Delivery
				{
				    new truck = GetPlayerVehicleID(playerid);
					if(!IsTrailerAttachedToVehicle(truck))
					{
					SendClientMessage(playerid, COLOR_GREY, "You have lost your trailer, and the route have been cancelled.");
					CPT[playerid] = 0;
					DisablePlayerCheckpoint(playerid);
					truckloaded[playerid] = 0;
	   				truckloadedon[playerid] = -1;
					return 1;
					}
					if(GetPlayerVehicleID(playerid) != truckloadedon[playerid])
					{
					    SendClientMessage(playerid, COLOR_GREY, "This is not the truck that you loaded the goods in.");
					    CPT[playerid] = 0;
						DisablePlayerCheckpoint(playerid);
						truckloaded[playerid] = 0;
	   					truckloadedon[playerid] = -1;
						return 1;
					}
					new trailer = GetVehicleTrailer(GetPlayerVehicleID(playerid));
					SetVehicleToRespawn(trailer);
				    SendClientMessage(playerid, COLOR_GREEN, "You have delivered the goods, and you have been paid $450. You will recieve a bonus of $50");
				    SendClientMessage(playerid, COLOR_GREEN, "if you return the truck. "COL_RED"You will only recieve a skill point if you return it.");
					PlayerInfo[playerid][pCash] += 200;
					DisablePlayerCheckpoint(playerid);
					CPT[playerid] = 2;
					return 1;
				}
			}

	  		if(truckloaded[playerid] == 1)
		    {
				if(CPT[playerid] == 2) // Stage: Return
				{
					if(GetPlayerVehicleID(playerid) != truckloadedon[playerid])
					{
					    SendClientMessage(playerid, COLOR_GREY, "This is not the truck that you loaded the goods in.");
					    CPT[playerid] = 0;
						DisablePlayerCheckpoint(playerid);
						truckloaded[playerid] = 0;
	   					truckloadedon[playerid] = -1;
						return 1;
					}
	             	SendClientMessage(playerid, COLOR_GREEN, "You have returned the truck, and you have recieved a $50 bonus and a skill point.");
	   				PlayerInfo[playerid][pCash] += 50;
	   				PlayerInfo[playerid][pTruckerSkill] +=1;
	   				DisablePlayerCheckpoint(playerid);
 					truckloaded[playerid] = 0;
	   				truckloadedon[playerid] = -1;
					CPT[playerid] = 0;
					return 1;
				}
			}
		}
	}
	return DisablePlayerCheckpoint(playerid);
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
    SendClientMessage(playerid, -1, "3");
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
 	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
if(IsKeyJustDown(KEY_YES, newkeys, oldkeys))
{
return cmd_enter(playerid, "");
}
return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}


public OnPlayerUpdate(playerid)
{
        if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
    	{
	        for(new i = 0; i < sizeof(SpikeInfo); i++)
	  	    {
	  	        if(IsPlayerInRangeOfPoint(playerid, 3.0, SpikeInfo[i][sX], SpikeInfo[i][sY], SpikeInfo[i][sZ]))
	            {
	  	            if(SpikeInfo[i][sCreated] == 1)
	  	            {
	  	                new panels, doors, lights, tires;
	  	                new carid = GetPlayerVehicleID(playerid);
			            GetVehicleDamageStatus(carid, panels, doors, lights, tires);
			            tires = encode_tires(1, 1, 1, 1);
			            UpdateVehicleDamageStatus(carid, panels, doors, lights, tires);
	  	                return 0;
	  	            }
	  	        }
			}
  	    }
    	SetPlayerWantedLevel(playerid, PlayerInfo[playerid][pWanted]);
	    new Float:gx, Float:gy, Float:gz;
		if(GetPVarInt(playerid, "Dragged") == 1)
		{
			if(beingdragged[playerid] == -1)
			{
			    SetPVarInt(playerid, "Dragged", 0);
			}
		    if(beingdragged[playerid] == INVALID_PLAYER_ID)
			{
			beingdragged[playerid] = -1;
			SetPVarInt(playerid, "Dragged", 0);
			}
		    GetPlayerPos(beingdragged[playerid], gx, gy, gz);
		    SetPlayerInterior(playerid, GetPlayerInterior(beingdragged[playerid]));
		    SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(beingdragged[playerid]));
		    SetPlayerPos(playerid, gx, gy-1, gz);
		}
		if(tazer[playerid] == 1)
		{
		    SetPlayerArmedWeapon(playerid, 23);
		}

		if(IsPlayerInRangeOfPoint(playerid, 5, 2212, -2663.03, 13.55))
	 	{
			GameTextForPlayer(playerid, "~g~Trucker Job ~w~- ~r~/join", 5000, 3);
		}
	 	if(IsPlayerInRangeOfPoint(playerid, 5, 1366, -1276, 13.55))
	 	{
	 		GameTextForPlayer(playerid, "~g~Weapon Dealer Job ~w~- ~r~/join", 5000, 3);
		}
		if(IsPlayerInRangeOfPoint(playerid, 5, 1423.70, -1319, 13.55))
		{
			GameTextForPlayer(playerid, "~r~ Materials Package ~w~ - ~g~~n~ /getmats to get a package.", 5000, 3);
		}
		if(IsPlayerInRangeOfPoint(playerid, 5, 2099.64, -105.84, 0.68))
		{
			GameTextForPlayer(playerid, "~r~ Materials Package ~w~ - ~g~~n~ /getmats to get a package.", 5000, 3);
		}
		SetPlayerMoney(playerid);
		new hTime = PlayerInfo[playerid][pHours]/60/60;
		if(hTime < 8)
		{
			SetPlayerScore(playerid, 1);
			PlayerInfo[playerid][pLevel] = 1;
			return 1;
		}
		if(hTime > 8)
		{
		    SetPlayerScore(playerid, hTime/8);
		    PlayerInfo[playerid][pLevel] = hTime/8;
		    return 1;
		}
		return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}


public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	new string[256];
	if(strfind(inputtext, "%s", true) != -1)
 	{
		format(string, sizeof(string), "AdmCmd: %s was kicked by system, Reason: Dialog Exploiting", GetName(playerid));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		Kick(playerid);
		return 1;
	}
    switch( dialogid )
	{
	    case DIALOG_BAR:
	    {
     		if(!response) return -1;
			if(response)
			{
			    switch(listitem)
			    {
			        // 0 = Beer ($2) 1= Wine ($5) 2= Cocktail ($4) 3= Piñacolada ($4) 4= Mojito ($4) 5=Cider ($3) 6=Sprunk ($1)
			    	case 0:
			    	{
						SetPVarInt(playerid, "DrinkPrice", 2);
						SetPVarString(playerid, "DrinkName", "bottle of beer");
						SetPVarInt(playerid, "Animation", SPECIAL_ACTION_DRINK_BEER);
					}
			    	case 1:
			    	{
			    		SetPVarInt(playerid, "DrinkPrice", 5);
			    		SetPVarString(playerid, "DrinkName", "glass wine");
			    		SetPVarInt(playerid, "Animation", SPECIAL_ACTION_DRINK_WINE);
			    	}
			    	case 2:
					{
						SetPVarInt(playerid, "DrinkPrice", 4);
			    		SetPVarString(playerid, "DrinkName", "cocktail");
			    		SetPVarInt(playerid, "Animation", SPECIAL_ACTION_DRINK_WINE);
					}
			    	case 3:
					{
			    		SetPVarInt(playerid, "DrinkPrice", 4);
			    		SetPVarString(playerid, "DrinkName", "glass of piñacolada");
			    		SetPVarInt(playerid, "Animation", SPECIAL_ACTION_DRINK_WINE);
					}
					case 4:
					{
			    		SetPVarInt(playerid, "DrinkPrice", 4);
			    		SetPVarString(playerid, "DrinkName", "glass of mojito");
					}
					case 5:
					{
			    		SetPVarInt(playerid, "DrinkPrice", 3);
			    		SetPVarString(playerid, "DrinkName", "bottle of cider");
					}
			    	case 6:
					{
			    		SetPVarInt(playerid, "DrinkPrice", 1);
			    		SetPVarString(playerid, "DrinkName", "cup of sprunk");
					}
				}
   				new price = GetPVarInt(playerid, "DrinkPrice");
    			new drink[56];
				GetPVarString(playerid, "DrinkName", drink, sizeof(drink));
				new action = GetPVarInt(playerid, "Animation");
				SetPlayerSpecialAction(playerid, action);
				if(price > PlayerInfo[playerid][pCash]) return SendClientMessage(playerid, -1, "You can't afford the drink.");
				new str[126];
				format(str, sizeof(str), "You bought a %s for $%i", drink, price);
				SendClientMessage(playerid, -1, str);
				return 1;
			}
		}

        case DIALOG_CHANGENAME:
        {
            if(!response) return -1;
			if(response)
			{
			    if(doesAccountExist(inputtext)) return SendClientMessage(playerid, -1, "Name is already taken.");
	            new oldName[MAX_PLAYER_NAME], str[150];
	            GetPlayerName(playerid, oldName, sizeof(oldName));
	            new name[MAX_PLAYER_NAME];
	            format(name, sizeof(name), "%s", inputtext);
	            SetPlayerName(playerid, name);
	            new PlayerName[MAX_PLAYER_NAME], Length;
				GetPlayerName(playerid, PlayerName, sizeof(PlayerName));
				Length = strlen(PlayerName);
				if(oldName[playerid] == PlayerName[playerid]) return 1;
				if(PlayerName[Length - 1] == '_' || PlayerName[0] == '_' || strfind(PlayerName, "_", false) == -1)
				{
				    SetPlayerName(playerid, oldName);
					SendClientMessage(playerid, COLOR_CYAN, "You failed to select a role play name, please select another name.");
					ShowPlayerDialog(playerid, DIALOG_CHANGENAME, DIALOG_STYLE_INPUT,""COL_WHITE"Name Change",""COL_WHITE"Type in another name to use.","Change","No!");
					return 1;
				}
				format(str, sizeof(str), "AdmWarn: %s (ID: %i) has changed name to %s.", oldName, playerid, name);
				SendClientMessageToAdmins(COLOR_YELLOW, str, 1);
				new account[126];
				format(account, sizeof(account), "/users/%s.ini", oldName);
				pass[playerid] = PlayerInfo[playerid][pPass];
				SetPVarInt(playerid, "RecentlyChangedName", 1);
				fremove(account);
				Log("/logs/changename.txt", str);
				SaveChar(playerid);
				INI_ParseFile(UserPath(playerid), "LoadUser_%s", .bExtra = true, .extra = playerid);
				return 1;
			}
		}
        case DIALOG_REGISTER:
        {
            if (!response) return Kick(playerid);
            if(response)
            {
                if(!strlen(inputtext)) return ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, ""COL_WHITE"Registering...",""COL_RED"You have entered an invalid password.\n"COL_WHITE"Type your password below to register a new account.","Register","Quit");
        	   	new INI:File = INI_Open(UserPath(playerid));
                INI_SetTag(File,"data");
                INI_WriteInt(File,"Password",udb_hash(inputtext));
                INI_WriteInt(File,"Health", 100);
                INI_Close(File);
        	    ShowPlayerDialog(playerid, DIALOG_QUIZ, DIALOG_STYLE_LIST, "Quiz - What is deathmatching?", "Duelling someone.\nHaving a boxing fight with someone to death.\nShooting someone for no In Character reason.", "Answer", "Quit");
				ForceClassSelection(playerid);
				Connected[playerid] = 1;
				SetPlayerCameraPos(playerid, 1545.2980, -1361.2811, 368.0274);
				SetPlayerCameraLookAt(playerid, 1545.1799, -1362.2729, 367.2717);
				InterpolateCameraLookAt(playerid, 1590.0299, -1689.4938, 47.3620, 1412.5718, -1690.9845, 41.9617, 5000, CAMERA_MOVE);
			}
        }
        
        case DIALOG_BUYCAR:
        {
            if (!response) return RemovePlayerFromVehicle(playerid);
            if(response)
			{
			    new car, str[126], ownedcar;
				car = GetVehicleModel(GetPlayerVehicleID(playerid));
		    	for(new x;x<MAX_PLAYER_VEHICLES;x++)
				{
					if(GetVehicleCost(car) == -1) { SendClientMessage(playerid, -1, "Default price has not been changed yet, you can not buy this vehicle."); RemovePlayerFromVehicle(playerid); return 1; }
					if(PlayerInfo[playerid][pVehicle][x] == 0)
  					{
  					    new rand = random(255), rand2 = random(255);
  					    if(PlayerInfo[playerid][pCash] < GetVehicleCost(car)) { SendClientMessage(playerid, -1, "You don't have enough cash."); RemovePlayerFromVehicle(playerid); return 1; }
				   		PlayerInfo[playerid][pVehicle][x] = car;
				   		PlayerInfo[playerid][pCash] -= GetVehicleCost(car);
						SetVehicleToRespawn(GetPlayerVehicleID(playerid));
				   		RemovePlayerFromVehicle(playerid);
				   		PlayerInfo[playerid][pVehicleSpawned][x] = 1;
				   		PlayerInfo[playerid][pVehiclePosX][x] = 555.87;
				   		PlayerInfo[playerid][pVehiclePosY][x] = -1265.16;
				   		PlayerInfo[playerid][pVehiclePosZ][x] = 17.24;
				   		PlayerInfo[playerid][pVehicleCol1][x] = rand;
				   		PlayerInfo[playerid][pVehicleCol1][x] = rand2;
				   		ownedcar = CreateVehicle(car, PlayerInfo[playerid][pVehiclePosX][x], PlayerInfo[playerid][pVehiclePosY][x], PlayerInfo[playerid][pVehiclePosZ][x], 0, rand, rand2, 0);
                        PlayerInfo[playerid][pVehicleSpawnedID][x] = ownedcar;
						PutPlayerInVehicle(playerid, ownedcar, 0);
				  		format(str, sizeof(str), "MoneyTrace: %s bought a car (MID: %i) for %i.", GetName(playerid), car, GetVehicleCost(car));
				   		Log("/logs/moneytrace.txt", str);
						format(str, sizeof(str), "You bought a car for %i. (%i)", GetVehicleCost(car), ownedcar);
						SendClientMessage(playerid, -1, str);
						new plate[126];
						format(plate, sizeof(plate), "LS%i", ownedcar);
						SetVehicleNumberPlate(ownedcar, plate);
						break;
   					}
				}
			}
		}

        case DIALOG_QUIZ:
        {
       		if (!response) return Kick(playerid);
       		if(response)
            {
                if(listitem != 2)
				{
				SendClientMessage(playerid, COLOR_NEWBIE, "Wrong answer.");
				ShowPlayerDialog(playerid, DIALOG_QUIZ3, DIALOG_STYLE_LIST, "Quiz - What is powergaming?", "Forcing a roleplay action towards a player, not giving them a chance to resist.\nUsing the powers of fast cars to escape the police.\nFlying a plane without a pilot's license.", "Answer", "Quit");
				quizwrong[playerid] += 1;
				}
				if(listitem == 2)
				{
				SendClientMessage(playerid, COLOR_NEWBIE, "Correct answer.");
				ShowPlayerDialog(playerid, DIALOG_QUIZ2, DIALOG_STYLE_LIST, "Quiz - What is metagaming?", "Forcing roleplay action towards a player, not giving them a chance to resist.\nUsing OOC information ICly.\nCommitting crimes in a crowded place.", "Answer", "Quit");
				InterpolateCameraPos(playerid, 1544.7931, -1362.1440, 366.9819, 1459.6842, -1661.7963, 57.8967, 5000, CAMERA_MOVE);
				InterpolateCameraLookAt(playerid, 1412.5718, -1690.9845, 41.9617, 1531.1875, -1672.8884, 27.4342, 5000, CAMERA_MOVE);
				}
			}
			return 1;
		}


  		case DIALOG_QUIZ2:
        {
       		if (!response) return Kick(playerid);
       		if(response)
            {
                if(listitem != 1)
				{
				SendClientMessage(playerid, COLOR_NEWBIE, "Wrong answer.");
				quizwrong[playerid] += 1;
				ShowPlayerDialog(playerid, DIALOG_QUIZ5, DIALOG_STYLE_LIST, "Quiz - What do you do if you spot a hacker?", "PM them to stop hacking.\nCalmly report the player, and try to avoid him.\nPM admins in game.", "Answer", "Quit");
				}
				if(quizwrong[playerid] > 2)
				{
				    SendClientMessage(playerid, -1, "You failed the quiz.");
				    Kick(playerid);
				}
				if(listitem == 1)
				{
				InterpolateCameraPos(playerid, 1459.6842, -1661.7963, 57.8967, 1474.3441, -1709.7754, 37.5671, 5000, CAMERA_MOVE);
				InterpolateCameraLookAt(playerid, 1531.1875, -1672.8884, 27.4342, 1477.4785, -1726.4415, 30.8563, 5000, CAMERA_MOVE);
				SendClientMessage(playerid, COLOR_NEWBIE, "Correct answer.");
				ShowPlayerDialog(playerid, DIALOG_QUIZ3, DIALOG_STYLE_LIST, "Quiz - What is powergaming?", "Forcing a roleplay action toward a player, not giving them a chance to resist.\nUsing the powers of fast cars to escape the police.\nFlying a plane without a pilot's license.", "Answer", "Quit");
				}
			}
			return 1;
		}


		case DIALOG_QUIZ3:
        {
       		if (!response) return Kick(playerid);
       		if(response)
            {
                if(listitem != 0)
				{
				SendClientMessage(playerid, COLOR_NEWBIE, "Wrong answer.");
				quizwrong[playerid] += 1;
				ShowPlayerDialog(playerid, DIALOG_QUIZ5, DIALOG_STYLE_LIST, "Quiz - How do you properly take out a big weapon?", "/me takes out a gun\n/me pops open the trunk as he grasps his shotgun.\nJust take it out.", "Answer", "Quit");
				}
				if(quizwrong[playerid] > 2)
				{
				    SendClientMessage(playerid, -1, "You failed the quiz.");
				    Kick(playerid);
				}
				if(listitem == 0)
				{
				InterpolateCameraPos(playerid, 1474.3441, -1709.7754, 37.5671, 2162.6824, -1756.9773, 45.1830, 5000, CAMERA_MOVE);
               	InterpolateCameraLookAt(playerid, 1477.4785, -1726.4415, 30.8563, 2220.4507, -1726.3226, 18.5690, 3000, CAMERA_MOVE);
				SendClientMessage(playerid, COLOR_NEWBIE, "Correct answer.");
				ShowPlayerDialog(playerid, DIALOG_QUIZ4, DIALOG_STYLE_LIST, "Quiz - What do you do if you spot a hacker?", "PM them to stop hacking.\nCalmly report the player, and try to avoid him.\nPM admins in game.", "Answer", "Quit");
				}
			}
			return 1;
		}

		case DIALOG_QUIZ4:
        {
       		if (!response) return Kick(playerid);
       		if(response)
            {
                if(listitem != 1)
				{
				SendClientMessage(playerid, COLOR_NEWBIE, "Wrong answer.");
				quizwrong[playerid] += 1;
				ShowPlayerDialog(playerid, DIALOG_QUIZ6, DIALOG_STYLE_LIST, "Quiz - What is roleplay?", "Playing a role as a serial killer.\nHelping in /newb.\nActing out a character realisticly and using /me and /do.", "Answer", "Quit");
				}
				if(quizwrong[playerid] > 2)
				{
				    SendClientMessage(playerid, -1, "You failed the quiz.");
				    Kick(playerid);
				}
				if(listitem == 1)
				{
				SendClientMessage(playerid, COLOR_NEWBIE, "Correct answer.");
				InterpolateCameraPos(playerid, 2162.6824, -1756.9773, 45.1830, 2265.1353, -2682.1121, 88.5434, 5000, CAMERA_MOVE);
				InterpolateCameraLookAt(playerid, 2220.4507, -1726.3226, 18.5690, 2201.1077, -2638.2690, 16.4266, 3000, CAMERA_MOVE);
				ShowPlayerDialog(playerid, DIALOG_QUIZ5, DIALOG_STYLE_LIST, "Quiz - How do you properly take out a big weapon?", "/me takes out a gun\n/me pops open the trunk as he grasps his shotgun.\nJust take it out.", "Answer", "Quit");
				}
			}
			return 1;
		}

 		case DIALOG_QUIZ5:
        {
       		if (!response) return Kick(playerid);
       		if(response)
            {
                if(listitem != 1)
				{
				SendClientMessage(playerid, COLOR_NEWBIE, "Wrong answer.");
				quizwrong[playerid] += 1;
				ShowPlayerDialog(playerid, DIALOG_QUIZ7, DIALOG_STYLE_LIST, "Quiz - If you need help, what do you do?", "Ask politely on /newb about your issues.\nPM the admins that are online.\nAsk everyone around you on /b.", "Answer", "Quit");
				}
				if(quizwrong[playerid] > 2)
				{
				    SendClientMessage(playerid, -1, "You failed the quiz.");
				    Kick(playerid);
				}
				if(listitem == 1)
				{
				SendClientMessage(playerid, COLOR_NEWBIE, "Correct answer.");
				InterpolateCameraPos(playerid, 2265.1353, -2682.1121, 88.5434, 1306.0331, -1283.6243, 52.5546, 5000, CAMERA_MOVE);
				InterpolateCameraLookAt(playerid, 2201.1077, -2638.2690, 16.4266, 1360.0269, -1280.1663, 18.9822, 3000, CAMERA_MOVE);
				ShowPlayerDialog(playerid, DIALOG_QUIZ6, DIALOG_STYLE_LIST, "Quiz - What is roleplay?", "Playing a role as a serial killer.\nHelping in /newb.\nActing out a character realisticly and using /me and /do.", "Answer", "Quit");
				}
			}
			return 1;
		}

  		case DIALOG_QUIZ6:
        {
       		if (!response) return Kick(playerid);
       		if(response)
            {
                if(listitem != 2)
				{
				SendClientMessage(playerid, COLOR_NEWBIE, "Wrong answer.");
				quizwrong[playerid] += 1;
				ShowPlayerDialog(playerid, DIALOG_QUIZ8, DIALOG_STYLE_LIST, "Quiz - What is IC and OOC?", "In Car and Out Of Car.\nInjured Crackhead and Out Of Crack\nIn Character and Out Of Character", "Answer", "Quit");
				}
				if(quizwrong[playerid] > 2)
				{
				    SendClientMessage(playerid, -1, "You failed the quiz.");
				    Kick(playerid);
				}
				if(listitem == 2)
				{
				SendClientMessage(playerid, COLOR_NEWBIE, "Correct answer.");
				InterpolateCameraPos(playerid, 1306.0331, -1283.6243, 52.5546, 1223.0563, -1304.5181, 59.4092, 5000, CAMERA_MOVE);
				InterpolateCameraLookAt(playerid, 1360.0269, -1280.1663, 18.9822, 1177.9976, -1353.1117, 29.8385, 3000, CAMERA_MOVE);
				ShowPlayerDialog(playerid, DIALOG_QUIZ7, DIALOG_STYLE_LIST, "Quiz - If you need help, what do you do?", "Ask politely on /newb about your issues.\nPM the admins that are online.\nAsk everyone around you on /b.", "Answer", "Quit");
				}
			}
			return 1;
		}

		case DIALOG_QUIZ7:
        {
       		if (!response) return Kick(playerid);
       		if(response)
            {
                if(listitem != 0)
				{
					SendClientMessage(playerid, COLOR_NEWBIE, "Wrong answer.");
					quizwrong[playerid] += 1;
					if(quizwrong[playerid] > 2)
					{
					    SendClientMessage(playerid, -1, "You failed the quiz.");
					    Kick(playerid);
					}
					ShowPlayerDialog(playerid, DIALOG_SKIN, DIALOG_STYLE_INPUT,""COL_WHITE"Select Skin",""COL_WHITE"You passed the test. Select a skin to start with. Valid skin IDs are 0 to 299.","Change","No");
				}
				if(listitem == 0)
				{
				SendClientMessage(playerid, COLOR_NEWBIE, "Correct answer.");
				InterpolateCameraPos(playerid, 1223.0563, -1304.5181, 59.4092, 1395.4175, -937.2007, 106.7558, 5000, CAMERA_MOVE);
				InterpolateCameraLookAt(playerid, 1177.9976, -1353.1117, 29.8385, 1407.9408, -840.4412, 86.2264, 3000, CAMERA_MOVE);
				ShowPlayerDialog(playerid, DIALOG_QUIZ8, DIALOG_STYLE_LIST, "Quiz - What is IC and OOC?", "In Car and Out Of Car.\nInjured Crackhead and Out Of Crack\nIn Character and Out Of Character", "Answer", "Quit");
				}
			}
			return 1;
		}

		case DIALOG_QUIZ8:
        {
       		if (!response) return Kick(playerid);
       		if(response)
            {
                if(listitem != 2)
				{
				SendClientMessage(playerid, COLOR_NEWBIE, "Wrong answer.");
				quizwrong[playerid] += 1;
				}
				if(quizwrong[playerid] > 2)
				{
				    SendClientMessage(playerid, -1, "You failed the quiz.");
				    Kick(playerid);
				}
				if(listitem == 2)
				{
				SendClientMessage(playerid, COLOR_NEWBIE, "You have passed the test.");
				InterpolateCameraPos(playerid, 1395.4175, -937.2007, 106.7558, 1543.3014, -1329.3446, 647.5134, 5000, CAMERA_MOVE);
				InterpolateCameraLookAt(playerid, 1407.9408, -840.4412, 86.2264, 1543.0229, -1358.7617, 334.1657, 3000, CAMERA_MOVE);
				ShowPlayerDialog(playerid, DIALOG_SKIN, DIALOG_STYLE_INPUT,""COL_WHITE"Select Skin",""COL_WHITE"You passed the test. Select a skin to start with. Valid skin IDs are 0 to 299.","Change","No");
				}
			}
			return 1;
		}

		case DIALOG_247:
		{
		    if(!response)
			{
				ProxDetector(50.0, playerid, "Shop Clerk: Alright, come back later then.", COLOR_GRAD1);
			    return 1;
			}
			if(response)
			{
			    new cost, str[126];
			    if(listitem == 0)
				{
        			new numb = 1 + random(100000);
        			if(numb == 911)
					{
					numb = numb + random(100000-numb);
					}
  					if(numb == 555)
					{
					numb = numb + random(100000-numb);
					}
					if(numb == 0)
					{
					numb = 1 + random(100000);
					}
	    			if(CheckPh(numb) == 1)
			    	{
			    	    numb = random(100000);
					}
  					if(CheckPh(numb) == 1)
			    	{
			    	    ProxDetector(50.0, playerid, "Shop Clerk: Uh, we had an error setting up your phone. Try again.", COLOR_GRAD1);
						return 1;
					}
					AddPh(PlayerInfo[playerid][pPhone], numb);
					PlayerInfo[playerid][pPhone] = numb;
    				cost = 600;
				    SendClientMessage(playerid, -1, "You bought a cellphone.");
				    PlayerInfo[playerid][pCash] -= cost;
				    format(str, sizeof(str), "MoneyTrace: %s bought a cellphone for $%i", GetName(playerid), cost);
				    Log("/logs/moneytrace.txt", str);
   					format(str, sizeof(str), "Your number is %i.", numb);
					SendClientMessage(playerid, -1, str);
				    return 1;
				}
    			if(listitem == 1)
				{
				    cost = 300;
					if(PlayerInfo[playerid][pSpraycan] > 25) return SendClientMessage(playerid, COLOR_GREY, "You can't hold more spraycans.");
				    SendClientMessage(playerid, -1, "You bought 5 spraycans.");
				    PlayerInfo[playerid][pCash] -= cost;
				    PlayerInfo[playerid][pSpraycan] += 5;
				    format(str, sizeof(str), "MoneyTrace: %s bought 5 spraycans for $%i", GetName(playerid), cost);
				    Log("/logs/moneytrace.txt", str);
				    return 1;
				}
   			    if(listitem == 2)
				{
				    cost = 1;
				    SendClientMessage(playerid, -1, "Item 3");
				    PlayerInfo[playerid][pCash] -= cost;
				    format(str, sizeof(str), "MoneyTrace: %s bought Item 3 for $%i", GetName(playerid), cost);
				    Log("/logs/moneytrace.txt", str);
				    return 1;
				}
   			    if(listitem == 3)
				{
				    cost = 1;
				    SendClientMessage(playerid, -1, "Item 4");
				    PlayerInfo[playerid][pCash] -= cost;
				    format(str, sizeof(str), "MoneyTrace: %s bought Item 4 for $%i", GetName(playerid), cost);
				    Log("/logs/moneytrace.txt", str);
				    return 1;
				}
   			    if(listitem == 4)
				{
				    cost = 1;
				    SendClientMessage(playerid, -1, "Item 5");
				    PlayerInfo[playerid][pCash] -= cost;
				    format(str, sizeof(str), "MoneyTrace: %s bought Item 5 for $%i", GetName(playerid), cost);
				    Log("/logs/moneytrace.txt", str);
				    return 1;
				}
      			if(listitem == 5)
				{
				    cost = 1;
				    SendClientMessage(playerid, -1, "Item 6");
				    PlayerInfo[playerid][pCash] -= cost;
				    format(str, sizeof(str), "MoneyTrace: %s bought Item 6 for $%i", GetName(playerid), cost);
				    Log("/logs/moneytrace.txt", str);
				    return 1;
				}
			}
		}

        case DIALOG_FBI:
        {
            if(!response)
            {
                return 1;
			}
			if(response)
			{
			    if(listitem == 0)
			    {
			        if(badge[playerid] == 0)
			        {
					    SetPlayerColor(playerid, 0x9FA1ED00);
					    badge[playerid] = 1;
					    SkipWepCheck(playerid);
						SkipACheck(playerid);
						PlayerInfo[playerid][pArmor] = 100;
						SetPlayerArmour(playerid, 100);
						SetPlayerHealth(playerid, 100);
						GivePlayerValidWeapon(playerid, 24, 999999);
						GivePlayerValidWeapon(playerid, 29, 999999);
						GivePlayerValidWeapon(playerid, 3, 999999);
						GivePlayerValidWeapon(playerid, 25, 999999);
						GivePlayerValidWeapon(playerid, 41, 999999);
						PlayerInfo[playerid][pSkin] = 286;
						SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
						return 1;
					}
    			    if(badge[playerid] == 1)
			        {
					    SetPlayerColor(playerid, 0xFFFFFF00);
					    badge[playerid] = 0;
					    SkipWepCheck(playerid);
						SkipACheck(playerid);
						PlayerInfo[playerid][pArmor] = 100;
						SetPlayerArmour(playerid, 100);
						SetPlayerHealth(playerid, 100);
						ResetPlayerWeapons(playerid);
						ResetPlayerWeaponsEx(playerid);
						PlayerInfo[playerid][pSkin] = 2;
						SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
						return 1;
					}
				}
               	if(listitem == 1)
			    {
                    ShowPlayerDialog(playerid, DIALOG_FBI2, DIALOG_STYLE_LIST, "Equipment", "Desert Eagle ($0)\nShotgun ($0)\nMP5 ($0)\nM4($0)\nSpray Can ($0)\nNitestick\nSpas-12 ($600)\nSniper ($700)\nFirst Aid Kit\nKevlar Vest", "Ok", "Close");
					return 1;
				}
                if(listitem == 2)
			    {
                    ShowPlayerDialog(playerid, DIALOG_FBI3, DIALOG_STYLE_LIST, "Uniform", "FBI Agent (Blue Coat)\nAgent\nAgent\nDark Agent\nBlack Agent", "Ok", "Close");
					return 1;
				}
				if(listitem == 3)
				{
				    ShowPlayerDialog(playerid, DIALOG_UNINVITESKIN, DIALOG_STYLE_INPUT,""COL_WHITE"Skin change",""COL_WHITE"Select a skin to use. Valid skin IDs are 0 to 299.","Change","No");
					return 1;
				}
				if(listitem == 4)
				{
				    ShowPlayerDialog(playerid, DIALOG_CHANGENAME, DIALOG_STYLE_INPUT,""COL_WHITE"Name Change",""COL_WHITE"Change your identity to go undercover.","Change","No");
					return 1;
				}
			}
			return 1;
		}


		case DIALOG_FBI2:
        {
            if(!response)
            {
            	ShowPlayerDialog(playerid, DIALOG_FBI, DIALOG_STYLE_LIST, "Locker", "Duty\nEquipment\nUniform\nSelect Skin\nChange Name", "Ok", "Close");
				return 1;
			}
			if(response)
			{
			    switch(listitem)
			    {
			        case 0:
			        {
			        SkipWepCheck(playerid);
					GivePlayerValidWeapon(playerid, 24, 99999);
					}
					case 1:
					{
					SkipWepCheck(playerid);
					GivePlayerValidWeapon(playerid, 25, 99999);
					}
					case 2:
					{
					SkipWepCheck(playerid);
					GivePlayerValidWeapon(playerid, 29, 99999);
					}
					case 3:
					{
					SkipWepCheck(playerid);
					GivePlayerValidWeapon(playerid, 31, 99999);
					}
					case 4:
					{
					SkipWepCheck(playerid);
					GivePlayerValidWeapon(playerid, 41, 99999);
					}
					case 5:
					{
					SkipWepCheck(playerid);
					GivePlayerValidWeapon(playerid, 3, 1);
					}
					case 6:
					{
					if(PlayerInfo[playerid][pCash] < 600) { SendClientMessage(playerid, -1, "You don't have enough cash to buy this."); return -1; }
					GivePlayerValidWeapon(playerid, 27, 99999);
					PlayerInfo[playerid][pCash] -= 600;
					}
					case 7:
					{
					if(PlayerInfo[playerid][pCash] < 700) { SendClientMessage(playerid, -1, "You don't have enough cash to buy this."); return -1; }
					GivePlayerValidWeapon(playerid, 34, 99999);
					PlayerInfo[playerid][pCash] -= 700;
					}
					case 8:
					{
					SetPlayerHealth(playerid, 100);
					}
					case 9:
					{
					SkipACheck(playerid);
					PlayerInfo[playerid][pArmor] = 100;
					SetPlayerArmour(playerid, 100);
					}
				}
				return 1;
			}
			return 1;
		}

        case DIALOG_FBI3:
        {
            if(!response)
            {
            	ShowPlayerDialog(playerid, DIALOG_FBI, DIALOG_STYLE_LIST, "Locker", "Duty\nEquipment\nUniform\nSelect Skin\nChange Name", "Ok", "Close");
				return 1;
			}
			if(response)
			{
			    if(listitem == 0)
			    {
					PlayerInfo[playerid][pSkin] = 286; // FBI skin
					SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
				}
                if(listitem == 1)
			    {
					PlayerInfo[playerid][pSkin] = 165; // White Agent with a black suit
					SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
				}
    			if(listitem == 2)
			    {
					PlayerInfo[playerid][pSkin] = 164; // White Agent with a black suit
					SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
				}
				if(listitem == 3)
				{
					PlayerInfo[playerid][pSkin] = 163; // Dark Agent with a black suit
					SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
				}
				if(listitem == 4)
				{
					PlayerInfo[playerid][pSkin] = 166; // Black Agent
					SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
				}
				return 1;
			}
			return 1;
		}
		case DIALOG_LSPD:
        {
            if(!response)
            {
                return 1;
			}
			if(response)
			{
			    if(listitem == 0)
			    {
			        if(badge[playerid] == 0)
			        {
					    SetPlayerColor(playerid, 0x0800FF00);
					    badge[playerid] = 1;
					    SkipWepCheck(playerid);
						SkipACheck(playerid);
						PlayerInfo[playerid][pArmor] = 100;
						SetPlayerArmour(playerid, 100);
						SetPlayerHealth(playerid, 100);
						GivePlayerValidWeapon(playerid, 24, 99999);
						GivePlayerValidWeapon(playerid, 29, 99999);
						GivePlayerValidWeapon(playerid, 3, 99999);
						GivePlayerValidWeapon(playerid, 25, 99999);
						GivePlayerValidWeapon(playerid, 41, 99999);
						PlayerInfo[playerid][pSkin] = 280;
						SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
						return 1;
					}
    			    if(badge[playerid] == 1)
			        {
					    SetPlayerColor(playerid, 0xFFFFFF00);
					    badge[playerid] = 0;
					    SkipWepCheck(playerid);
						SkipACheck(playerid);
						PlayerInfo[playerid][pArmor] = 100;
						SetPlayerArmour(playerid, 100);
						SetPlayerHealth(playerid, 100);
						ResetPlayerWeapons(playerid);
						ResetPlayerWeaponsEx(playerid);
						PlayerInfo[playerid][pSkin] = 2;
						SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
						return 1;
					}
				}
               	if(listitem == 1)
			    {
                    ShowPlayerDialog(playerid, DIALOG_LSPD2, DIALOG_STYLE_LIST, "Equipment", "Desert Eagle ($0)\nShotgun ($0)\nMP5 ($0)\nM4($0)\nSpray Can ($0)\nNitestick\nSpas-12 ($700)\nSniper ($800)\nFirst Aid Kit\nKevlar Vest", "Ok", "Close");
					return 1;
				}
                if(listitem == 2)
			    {
                    ShowPlayerDialog(playerid, DIALOG_LSPD3, DIALOG_STYLE_LIST, "Uniform", "Cadet\nOfficer\nCorporal\nCorporal2\nCorporal3\nBike Officer\nSergeant\nLieutenant\nChief\nSWAT", "Ok", "Close");
					return 1;
				}
				if(listitem == 2)
				{
				    ShowPlayerDialog(playerid, DIALOG_UNINVITESKIN, DIALOG_STYLE_INPUT,""COL_WHITE"Skin change",""COL_WHITE"Select a skin to use. Valid skin IDs are 0 to 299.","Change","No");
					return 1;
				}
			}
			return 1;
		}


		case DIALOG_LSPD2:
        {
            if(!response)
            {
            	ShowPlayerDialog(playerid, DIALOG_LSPD, DIALOG_STYLE_LIST, "Locker", "Duty\nEquipment\nUniform\nSelect Skin", "Ok", "Close");
				return 1;
			}
			if(response)
			{
			    switch(listitem)
			    {
			        case 0:
			        {
			        SkipWepCheck(playerid);
					GivePlayerValidWeapon(playerid, 24, 99999);
					}
					case 1:
					{
					SkipWepCheck(playerid);
					GivePlayerValidWeapon(playerid, 25, 99999);
					}
					case 2:
					{
					SkipWepCheck(playerid);
					GivePlayerValidWeapon(playerid, 29, 99999);
					}
					case 3:
					{
					SkipWepCheck(playerid);
					GivePlayerValidWeapon(playerid, 31, 99999);
					}
					case 4:
					{
					SkipWepCheck(playerid);
					GivePlayerValidWeapon(playerid, 41, 99999);
					}
					case 5:
					{
					SkipWepCheck(playerid);
					GivePlayerValidWeapon(playerid, 3, 1);
					}
					case 6:
					{
					if(PlayerInfo[playerid][pCash] < 700) { SendClientMessage(playerid, -1, "You don't have enough cash to buy this."); return -1; }
					GivePlayerValidWeapon(playerid, 27, 99999);
					PlayerInfo[playerid][pCash] -= 700;
					}
					case 7:
					{
					if(PlayerInfo[playerid][pCash] < 800) { SendClientMessage(playerid, -1, "You don't have enough cash to buy this."); return -1; }
					GivePlayerValidWeapon(playerid, 34, 99999);
					PlayerInfo[playerid][pCash] -= 800;
					}
					case 8:
					{
					SetPlayerHealth(playerid, 100);
					}
					case 9:
					{
					SkipACheck(playerid);
					PlayerInfo[playerid][pArmor] = 100;
					SetPlayerArmour(playerid, 100);
					}
				}
				return 1;
			}
			return 1;
		}

        case DIALOG_LSPD3:
        {
            if(!response)
            {
            	ShowPlayerDialog(playerid, DIALOG_LSPD, DIALOG_STYLE_LIST, "Locker", "Duty\nEquipment\nUniform\nSelect Skin", "Ok", "Close");
				return 1;
			}
			if(response)
			{
			    if(listitem == 0)
			    {
					PlayerInfo[playerid][pSkin] = 71; // cadet
					SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
				}
                if(listitem == 1)
			    {
					PlayerInfo[playerid][pSkin] = 280; // officer
					SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
				}
    			if(listitem == 2)
			    {
					PlayerInfo[playerid][pSkin] = 281; // corporal 1
					SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
				}
				if(listitem == 3)
				{
					PlayerInfo[playerid][pSkin] = 266; // corporal 2
					SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
				}
				if(listitem == 4)
				{
					PlayerInfo[playerid][pSkin] = 267; // corporal 3
					SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
				}
                if(listitem == 5)
				{
					PlayerInfo[playerid][pSkin] = 284; // bike officer
					SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
				}
				if(listitem == 6)
				{
					PlayerInfo[playerid][pSkin] = 282; // sergeant
					SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
				}
				if(listitem == 7)
				{
					PlayerInfo[playerid][pSkin] = 283; // lieutenant
					SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
				}
    			if(listitem == 8)
				{
					PlayerInfo[playerid][pSkin] = 288; // chief
					SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
				}
    			if(listitem == 9)
				{
					PlayerInfo[playerid][pSkin] = 285; // SWAT
					SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
				}
				return 1;
			}
			return 1;
		}
		case DIALOG_NAME:
		{
		    if(!response)
		    {
				Kick(playerid);
			}
			if(response)
			{
			    SetPlayerName(playerid, inputtext);
    			new Name[MAX_PLAYER_NAME], Len;
				GetPlayerName(playerid, Name, sizeof(Name));
				Len = strlen(Name);
				if(Name[Len - 1] == '_' || Name[0] == '_' || strfind(Name, "_", false) == -1)
				{
					SendClientMessage(playerid, COLOR_CYAN, "You failed to select a role play name, please select another name.");
					ShowPlayerDialog(playerid, DIALOG_NAME, DIALOG_STYLE_INPUT,""COL_WHITE"Name Change",""COL_WHITE"Type in another name to use.","Change","No!");
					return 1;
				}
				INI_ParseFile(UserPath(playerid), "LoadUser_%s", .bExtra = true, .extra = playerid);
        		ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD,""COL_WHITE"Login",""COL_WHITE"Type your password below to login.","Login","Quit");
			}
		}

		case DIALOG_SKIN:
		{
		    if(!response)
		    {
                PlayerInfo[playerid][pCash] = 300;
                PlayerInfo[playerid][pBank] = 300;
                PlayerInfo[playerid][pLevel] = 1;
                SetPlayerScore(playerid, PlayerInfo[playerid][pLevel]);
                TogglePlayerSpectating(playerid, 0);
                PlayerInfo[playerid][pSkin] = 299;
                SetSpawnInfo(playerid, 0, 299, 1780.1759,-1933.6698,13.3859,356.5534, 0, 0, 0, 0, 0, 0);
                SpawnPlayer(playerid);
                Connected[playerid] = 1;
				SetPVarInt(playerid, "prelogin", 0);
				TogglePlayerControllable(playerid, 1);
				SetPVarInt(playerid, "Quiz", 0);
				SaveChar(playerid);
				SetCameraBehindPlayer(playerid);
			}
		    if(response)
		    {
		        new skin = strval(inputtext);
		        if(skin < 0 || skin > 299) return ShowPlayerDialog(playerid, DIALOG_SKIN, DIALOG_STYLE_INPUT,""COL_WHITE"Skin change",""COL_WHITE"Invalid skin. Valid skin IDs are 0 to 299.","Change","No");
                TogglePlayerSpectating(playerid, 0);
				PlayerInfo[playerid][pCash] = 300;
                PlayerInfo[playerid][pBank] = 300;
                PlayerInfo[playerid][pLevel] = 1;
                SetPlayerScore(playerid, PlayerInfo[playerid][pLevel]);
                PlayerInfo[playerid][pSkin] = skin;
                SetSpawnInfo(playerid, 0, skin, 1780.1759,-1933.6698,13.3859,356.5534, 0, 0, 0, 0, 0, 0);
                SpawnPlayer(playerid);
                Connected[playerid] = 1;
                SetPVarInt(playerid, "prelogin", 0);
				TogglePlayerControllable(playerid, 1);
				SetPVarInt(playerid, "Quiz", 0);
				SaveChar(playerid);
				SetCameraBehindPlayer(playerid);
			}
			return 1;
		}

		case DIALOG_UNINVITESKIN:
		{
		    if(!response)
		    {
                PlayerInfo[playerid][pSkin] = 299;
				SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
			}
		    if(response)
		    {
		        new skin = strval(inputtext);
		        if(skin < 0 || skin > 299) return ShowPlayerDialog(playerid, DIALOG_UNINVITESKIN, DIALOG_STYLE_INPUT,""COL_WHITE"Skin change",""COL_WHITE"Invalid skin. Valid skin IDs are 0 to 299.","Change","No");
          		PlayerInfo[playerid][pSkin] = skin;
				SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
			}
			return 1;
		}

  		case DIALOG_BUYSKIN:
		{
		    if(!response)
		    {
				ProxDetector(50.0, playerid, "Shop Clerk says: Alright, come back later.", COLOR_GRAD1);
			}
		    if(response)
		    {
		        new skin = strval(inputtext);
		        if(skin < 0 || skin > 299) return ShowPlayerDialog(playerid, DIALOG_BUYSKIN, DIALOG_STYLE_INPUT,""COL_WHITE"Buy clothes",""COL_WHITE"Invalid skin. Valid skin IDs are 0 to 299.","Buy","No");
				if(PlayerInfo[playerid][pCash] < 300)
			 	{
			 		ProxDetector(50.0, playerid, "Shop Clerk says: Oh I am sorry, I don't think that's enough cash.", COLOR_GRAD1);
			 		return 1;
				}
				PlayerInfo[playerid][pCash] -= 300;
				PlayerInfo[playerid][pSkin] = skin;
				SetPlayerSkin(playerid, PlayerInfo[playerid][pSkin]);
				ProxDetector(50.0, playerid, "Shop Clerk says: Excellent choice!", COLOR_GRAD1);
				new str[126];
    			format(str, sizeof(str), "MoneyTrace: %s bought clothes for $300", GetName(playerid));
			    Log("/logs/moneytrace.txt", str);
			}
			return 1;
		}

		case DIALOG_ADS:
		{
        	new str[128];
			format(str, 128, "%s: %s", GetName(playerid), inputtext);
			SendClientMessageToAll(COLOR_RED, str);
			return 1;
		}


        case DIALOG_LOGIN:
        {
            if ( !response ) return Kick ( playerid );
            if( response )
            {
                if(udb_hash(inputtext) != PlayerInfo[playerid][pPass]) return ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD,""COL_WHITE"Login",""COL_RED"You have entered an incorrect password.\n"COL_WHITE"Type your password below to login.","Login","Quit");
                if(udb_hash(inputtext) == PlayerInfo[playerid][pPass])
                {
					TogglePlayerSpectating(playerid, 0);
                    INI_ParseFile(UserPath(playerid), "LoadUser_%s", .bExtra = true, .extra = playerid);
                    SetPVarInt(playerid, "prelogin", 0);
                    SetSpawnInfo(playerid, 0, PlayerInfo[playerid][pSkin], PlayerInfo[playerid][pX], PlayerInfo[playerid][pY], PlayerInfo[playerid][pZ], 0, 0, 0, 0, 0, 0, 0);
                	SpawnPlayer(playerid);
                	SetPlayerWeapons(playerid);
                	SetPlayerInterior(playerid, PlayerInfo[playerid][pInt]);
                	SetPlayerVirtualWorld(playerid, PlayerInfo[playerid][pVW]);
					SetPlayerScore(playerid, PlayerInfo[playerid][pLevel]);
					SetPlayerHealth(playerid, PlayerInfo[playerid][pHealth]);
					SetPlayerArmour(playerid, PlayerInfo[playerid][pArmor]);
					SetPlayerWeaponsEx(playerid);
					SetTimerEx("PlayerTime", 1000, true, "i", playerid);
    				SetTimerEx("CheckArmHack", 5000, true, "i", playerid);
    				SetTimerEx("CheckWepHack", 1000, true, "i", playerid);
     				SetTimerEx("CheckTPHack", 3000, true, "i", playerid);
     				SetTimerEx("CheckWarpHack", 3000, true, "i", playerid);
    				SetTimerEx("SaveChar", 200000, true, "i", playerid);
    				SendClientMessage(playerid, -1, "Welcome back to the Roleplay Server.");
					Connected[playerid] = 1;
					SetCameraBehindPlayer(playerid);
					TogglePlayerControllable(playerid, 1);
					//
					if(PlayerInfo[playerid][pX] == 0 && PlayerInfo[playerid][pY] == 0 && PlayerInfo[playerid][pZ] == 0)
					{
			    		PlayerInfo[playerid][pX] = 1780.1759;
						PlayerInfo[playerid][pY] = -1933.6698;
						PlayerInfo[playerid][pZ] = 13.3859;
						SetPlayerHealth(playerid, 100);
						SetPlayerVirtualWorld(playerid, 0);
						SetPlayerInterior(playerid, 0);
						SetPlayerPos(playerid, PlayerInfo[playerid][pX], PlayerInfo[playerid][pY], PlayerInfo[playerid][pZ]);
						SendClientMessage(playerid, COLOR_CYAN, "Your spawn location got saved inproperly, you have been sent to Los Santos.");
					}
					//
					if(PlayerInfo[playerid][pHealth] == -1337)
					{
						SetPlayerInterior(playerid, 0);
				        SetPlayerVirtualWorld(playerid, 0);
					    SetPlayerHealth(playerid, 40);
						TogglePlayerControllable(playerid, 0);
						SetPlayerCameraPos(playerid, 1201.5009,-1325.1001,16.6868);
						SetPlayerCameraLookAt(playerid, 1176.9282,-1323.5554,14.0455);
						RecoverHospital(playerid);
						SetTimerEx("RecoverHospital2", 6000, false, "i", playerid);
						SetTimerEx("RecoverHospital3", 8000, false, "i", playerid);
						SetTimerEx("RecoverHospital4", 10000, false, "i", playerid);
						SetTimerEx("RecoverHospital5", 12000, false, "i", playerid);
						SetTimerEx("RecoverHospital6", 14000, false, "i", playerid);
						SetSpawnInfo(playerid, 0, PlayerInfo[playerid][pSkin], 1178, -1324, 8.11, 0, 0, 0, 0, 0, 0, 0);
						SpawnPlayer(playerid);
				        SetPVarInt(playerid, "Injured", 0);
				        SetPVarInt(playerid, "Recovering", 1);
			        }
			        if(PlayerInfo[playerid][pJail] >= 1)
					{
					    rtimer[playerid] = SetTimerEx("arrestrelease", 1000, true, "i", playerid);
					   // SendClientMessage(playerid, COLOR_CYAN, "You got sent back to jail.");
					}
                }
                return 1;
            }
        }
    }
    return 1;
}

forward checkmoved(playerid);
public checkmoved(playerid)
{
	if(!IsPlayerInRangeOfPoint(playerid, 6, iX[playerid], iY[playerid], iZ[playerid]))
	{
	SetPlayerHealth(playerid, 0);
	KillTimer(itimer[playerid]);
	KillTimer(iitimer[playerid]);
	return 1;
	}
	return 1;
}

forward PlayerTime();
public PlayerTime()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        if(IsPlayerConnected(i))
        {
            PlayerInfo[i][pHours]++;
		}
    }
    return 1;
}

forward LoseHP(playerid);
public LoseHP(playerid)
{
	new Float:HP;
	GetPlayerHealth(playerid, HP);
	SetPlayerHealth(playerid, HP-5);
}

forward RecoverHospital(playerid);
public RecoverHospital(playerid)
{
    SendClientMessage(playerid, -1, "You have to recover health at the hospital.");
	SetPlayerHealth(playerid, 50);
}
forward RecoverHospital2(playerid);
public RecoverHospital2(playerid)
{
	SetPlayerHealth(playerid, 60);
}
forward RecoverHospital3(playerid);
public RecoverHospital3(playerid)
{
	SetPlayerHealth(playerid, 65);
}
forward RecoverHospital4(playerid);
public RecoverHospital4(playerid)
{
	SetPlayerHealth(playerid, 70);
}
forward RecoverHospital5(playerid);
public RecoverHospital5(playerid)
{
	SetPlayerHealth(playerid, 75);
}
forward RecoverHospital6(playerid);
public RecoverHospital6(playerid)
{
    SetPlayerPos(playerid, 1178.4980,-1323.4543,14.1230);
    SetPlayerFacingAngle(playerid, 271.3259);
	SetPlayerHealth(playerid, 80);
	TogglePlayerControllable(playerid, 1);
	SetCameraBehindPlayer(playerid);
	SetPVarInt(playerid, "Recovering", 0);
	SendClientMessage(playerid, COLOR_LIGHTRED, "Hospital: The hospital bill came to $200. Buy an insurance for a cheaper bill.");
	ResetPlayerWeapons(playerid);
	ResetPlayerWeaponsEx(playerid);
	PlayerInfo[playerid][pCash] -= 200;
}
forward RecoverHospital26(playerid);
public RecoverHospital26(playerid)
{
    SetPlayerPos(playerid, 2029.52, -1421.81, 16.99);
	SetPlayerHealth(playerid, 80);
	TogglePlayerControllable(playerid, 1);
	SetCameraBehindPlayer(playerid);
	SetPVarInt(playerid, "Recovering", 0);
	SendClientMessage(playerid, COLOR_LIGHTRED, "Hospital: The hospital bill came to $200. Buy an insurance for a cheaper bill.");
	ResetPlayerWeapons(playerid);
	ResetPlayerWeaponsEx(playerid);
	PlayerInfo[playerid][pCash] -= 200;
}


public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

stock IsNearLoadingPoint(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid, 20, 1141.23, -1326.42, 13.65)) return 1;
	if(IsPlayerInRangeOfPoint(playerid, 20, 2017.17, -1413.84, 16.99)) return 1;
	return 0;
}

stock GetVehicleCost(carid)
{
	if(carid == 560) return 60000;
	if(carid == 562) return 85000;
	return -1;
}



stock GetZone(playerid)
{
	new zone[50];
    GetPlayer2DZone(playerid, zone, MAX_ZONE_NAME);
    return zone;
}


stock LoadDynamicDoors()
{
	new arrCoords[26][64];
	new strFromFile2[256];
	new File: file = fopen("dynamicdoors.cfg", io_read);
	if(file)
	{
		new idx;
		while (idx < sizeof(DoorInfo))
		{
			fread(file, strFromFile2);
			splits(strFromFile2, arrCoords, '|');
			strmid(DoorInfo[idx][ddName], arrCoords[0], 0, strlen(arrCoords[0]), 128);
	  		DoorInfo[idx][ddCustomInterior] = strval(arrCoords[1]);
	  		DoorInfo[idx][ddExteriorVW] = strval(arrCoords[2]);
	  		DoorInfo[idx][ddExteriorInt] = strval(arrCoords[3]);
	  		DoorInfo[idx][ddInteriorVW] = strval(arrCoords[4]);
	  		DoorInfo[idx][ddInteriorInt] = strval(arrCoords[5]);
	  		DoorInfo[idx][ddExteriorX] = floatstr(arrCoords[6]);
	  		DoorInfo[idx][ddExteriorY] = floatstr(arrCoords[7]);
	  		DoorInfo[idx][ddExteriorZ] = floatstr(arrCoords[8]);
	  		DoorInfo[idx][ddExteriorA] = floatstr(arrCoords[9]);
	  		DoorInfo[idx][ddInteriorX] = floatstr(arrCoords[10]);
	  		DoorInfo[idx][ddInteriorY] = floatstr(arrCoords[11]);
	  		DoorInfo[idx][ddInteriorZ] = floatstr(arrCoords[12]);
	  		DoorInfo[idx][ddInteriorA] = floatstr(arrCoords[13]);
	  		DoorInfo[idx][ddCustomExterior] = strval(arrCoords[14]);
	  		DoorInfo[idx][ddFaction] = strval(arrCoords[17]);
	  		DoorInfo[idx][ddAdmin] = strval(arrCoords[18]);
	  		DoorInfo[idx][ddWanted] = strval(arrCoords[19]);
	  		DoorInfo[idx][ddVehicleAble] = strval(arrCoords[20]);
	  		DoorInfo[idx][ddColor] = strval(arrCoords[21]);
	  		DoorInfo[idx][ddPickupModel] = strval(arrCoords[22]);
	  		strmid(DoorInfo[idx][ddPass], arrCoords[23], 0, strlen(arrCoords[23]), 24);
	  		DoorInfo[idx][ddLocked] = strval(arrCoords[24]);
            DoorInfo[idx][ddNotEditable] = strval(arrCoords[25]);

	  		if(!isnull(DoorInfo[idx][ddName]))
	  		{
	  		    CreateDynamicDoor(idx);
			}

			idx++;
		}
		fclose(file);
	}
	return 1;
}


stock SaveDynamicDoors()
{

	new
		szFileStr[512],
		File: fHandle = fopen("dynamicdoors.cfg", io_write);

	for(new iIndex; iIndex < MAX_DDOORS; iIndex++) {
		format(szFileStr, sizeof(szFileStr), "%s|%d|%d|%d|%d|%d|%f|%f|%f|%f|%f|%f|%f|%f|%d|%d|%d|%d|%d|%d|%d|%d|%d|%s|%d|%d\r\n",
			DoorInfo[iIndex][ddName],
			DoorInfo[iIndex][ddCustomInterior],
			DoorInfo[iIndex][ddExteriorVW],
			DoorInfo[iIndex][ddExteriorInt],
			DoorInfo[iIndex][ddInteriorVW],
			DoorInfo[iIndex][ddInteriorInt],
			DoorInfo[iIndex][ddExteriorX],
			DoorInfo[iIndex][ddExteriorY],
			DoorInfo[iIndex][ddExteriorZ],
			DoorInfo[iIndex][ddExteriorA],
			DoorInfo[iIndex][ddInteriorX],
			DoorInfo[iIndex][ddInteriorY],
			DoorInfo[iIndex][ddInteriorZ],
			DoorInfo[iIndex][ddInteriorA],
			DoorInfo[iIndex][ddCustomExterior],
			0,
	  		0,
	  		DoorInfo[iIndex][ddFaction],
	  		DoorInfo[iIndex][ddAdmin],
	  		DoorInfo[iIndex][ddWanted],
	  		DoorInfo[iIndex][ddVehicleAble],
	  		DoorInfo[iIndex][ddColor],
	  		DoorInfo[iIndex][ddPickupModel],
	  		DoorInfo[iIndex][ddPass],
	  		DoorInfo[iIndex][ddLocked],
	  		DoorInfo[iIndex][ddNotEditable]
		);
		fwrite(fHandle, szFileStr);
	}
	return fclose(fHandle);
}

stock CreateDynamicDoor(doorid)
{
	new string[128];
	//format(string, sizeof(string), "%s\nID: %d",DoorInfo[doorid][ddName],doorid);
	format(string, sizeof(string), "%s",DoorInfo[doorid][ddName]);

	switch(DoorInfo[doorid][ddColor])
	{
	    case -1:{ /* Disable 3d Textdraw */ }
	    case 1:{DoorInfo[doorid][ddTextID] = CreateDynamic3DTextLabel(string, COLOR_TWWHITE, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ]+0.7,10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, DoorInfo[doorid][ddExteriorVW], DoorInfo[doorid][ddExteriorInt], -1);}
	    case 2:{DoorInfo[doorid][ddTextID] = CreateDynamic3DTextLabel(string, COLOR_TWPINK, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ]+0.7,10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, DoorInfo[doorid][ddExteriorVW], DoorInfo[doorid][ddExteriorInt], -1);}
	    case 3:{DoorInfo[doorid][ddTextID] = CreateDynamic3DTextLabel(string, COLOR_TWRED, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ]+0.7,10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, DoorInfo[doorid][ddExteriorVW], DoorInfo[doorid][ddExteriorInt], -1);}
	    case 4:{DoorInfo[doorid][ddTextID] = CreateDynamic3DTextLabel(string, COLOR_TWBROWN, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ]+0.7,10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, DoorInfo[doorid][ddExteriorVW], DoorInfo[doorid][ddExteriorInt], -1);}
	    case 5:{DoorInfo[doorid][ddTextID] = CreateDynamic3DTextLabel(string, COLOR_TWGRAY, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ]+0.7,10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, DoorInfo[doorid][ddExteriorVW], DoorInfo[doorid][ddExteriorInt], -1);}
	    case 6:{DoorInfo[doorid][ddTextID] = CreateDynamic3DTextLabel(string, COLOR_TWOLIVE, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ]+0.7,10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, DoorInfo[doorid][ddExteriorVW], DoorInfo[doorid][ddExteriorInt], -1);}
	    case 7:{DoorInfo[doorid][ddTextID] = CreateDynamic3DTextLabel(string, COLOR_TWPURPLE, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ]+0.7,10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, DoorInfo[doorid][ddExteriorVW], DoorInfo[doorid][ddExteriorInt], -1);}
	    case 8:{DoorInfo[doorid][ddTextID] = CreateDynamic3DTextLabel(string, COLOR_TWORANGE, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ]+0.7,10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, DoorInfo[doorid][ddExteriorVW], DoorInfo[doorid][ddExteriorInt], -1);}
	    case 9:{DoorInfo[doorid][ddTextID] = CreateDynamic3DTextLabel(string, COLOR_TWAZURE, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ]+0.7,10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, DoorInfo[doorid][ddExteriorVW], DoorInfo[doorid][ddExteriorInt], -1);}
	    case 10:{DoorInfo[doorid][ddTextID] = CreateDynamic3DTextLabel(string, COLOR_TWGREEN, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ]+0.7,10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, DoorInfo[doorid][ddExteriorVW], DoorInfo[doorid][ddExteriorInt], -1);}
	    case 11:{DoorInfo[doorid][ddTextID] = CreateDynamic3DTextLabel(string, COLOR_TWBLUE, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ]+0.7,10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, DoorInfo[doorid][ddExteriorVW], DoorInfo[doorid][ddExteriorInt], -1);}
	    case 12:{DoorInfo[doorid][ddTextID] = CreateDynamic3DTextLabel(string, COLOR_TWBLACK, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ]+0.7,10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, DoorInfo[doorid][ddExteriorVW], DoorInfo[doorid][ddExteriorInt], -1);}
		default:
		{
			DoorInfo[doorid][ddTextID] = CreateDynamic3DTextLabel(string, COLOR_YELLOW, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ]+0.7,10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, DoorInfo[doorid][ddExteriorVW], DoorInfo[doorid][ddExteriorInt], -1);
		}
	}

	switch(DoorInfo[doorid][ddPickupModel])
	{
	    case -1: { /* Disable Pickup */ }
		case 1:
		{
			{DoorInfo[doorid][ddPickupID] = CreatePickup(1210, 23, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ], DoorInfo[doorid][ddExteriorVW]);}
		}
		case 2: {DoorInfo[doorid][ddPickupID] = CreatePickup(1212, 1, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ], DoorInfo[doorid][ddExteriorVW]);}
		case 3:{DoorInfo[doorid][ddPickupID] = CreatePickup(1239, 1, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ], DoorInfo[doorid][ddExteriorVW]);}
		case 4:{DoorInfo[doorid][ddPickupID] = CreatePickup(1240, 1, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ], DoorInfo[doorid][ddExteriorVW]);}
		case 5:{DoorInfo[doorid][ddPickupID] = CreatePickup(1241, 1, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ], DoorInfo[doorid][ddExteriorVW]);}
		case 6:{DoorInfo[doorid][ddPickupID] = CreatePickup(1242, 1, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ], DoorInfo[doorid][ddExteriorVW]);}
		case 7:{DoorInfo[doorid][ddPickupID] = CreatePickup(1247, 1, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ], DoorInfo[doorid][ddExteriorVW]);}
		case 8:{DoorInfo[doorid][ddPickupID] = CreatePickup(1248, 1, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ], DoorInfo[doorid][ddExteriorVW]);}
		case 9:{DoorInfo[doorid][ddPickupID] = CreatePickup(1252, 1, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ], DoorInfo[doorid][ddExteriorVW]);}
		case 10:{DoorInfo[doorid][ddPickupID] = CreatePickup(1253, 1, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ], DoorInfo[doorid][ddExteriorVW]);}
		case 11:{DoorInfo[doorid][ddPickupID] = CreatePickup(1254, 23, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ], DoorInfo[doorid][ddExteriorVW]);}
		case 12:{DoorInfo[doorid][ddPickupID] = CreatePickup(1313, 23, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ], DoorInfo[doorid][ddExteriorVW]);}
		case 13:{DoorInfo[doorid][ddPickupID] = CreatePickup(1272, 23, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ], DoorInfo[doorid][ddExteriorVW]);}
		case 14:{DoorInfo[doorid][ddPickupID] = CreatePickup(1273, 23, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ], DoorInfo[doorid][ddExteriorVW]);}
		case 15:{DoorInfo[doorid][ddPickupID] = CreatePickup(1274, 23, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ], DoorInfo[doorid][ddExteriorVW]);}
		case 16:{DoorInfo[doorid][ddPickupID] = CreatePickup(1275, 23, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ], DoorInfo[doorid][ddExteriorVW]);}
		case 17:{DoorInfo[doorid][ddPickupID] = CreatePickup(1276, 23, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ], DoorInfo[doorid][ddExteriorVW]);}
		case 18:{DoorInfo[doorid][ddPickupID] = CreatePickup(1277, 23, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ], DoorInfo[doorid][ddExteriorVW]);}
		case 19:{DoorInfo[doorid][ddPickupID] = CreatePickup(1279, 23, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ], DoorInfo[doorid][ddExteriorVW]);}
		case 20:{DoorInfo[doorid][ddPickupID] = CreatePickup(1314, 23, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ], DoorInfo[doorid][ddExteriorVW]);}
		case 21:{DoorInfo[doorid][ddPickupID] = CreatePickup(1316, 23, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ], DoorInfo[doorid][ddExteriorVW]);}
		case 22:{DoorInfo[doorid][ddPickupID] = CreatePickup(1317, 23, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ], DoorInfo[doorid][ddExteriorVW]);}
		case 23:{DoorInfo[doorid][ddPickupID] = CreatePickup(1559, 23, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ], DoorInfo[doorid][ddExteriorVW]);}
		case 24:{DoorInfo[doorid][ddPickupID] = CreatePickup(1582, 23, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ], DoorInfo[doorid][ddExteriorVW]);}
		case 25:{DoorInfo[doorid][ddPickupID] = CreatePickup(2894, 23, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ], DoorInfo[doorid][ddExteriorVW]);}
	    default:
	    {
			DoorInfo[doorid][ddPickupID] = CreatePickup(1318, 23, DoorInfo[doorid][ddExteriorX], DoorInfo[doorid][ddExteriorY], DoorInfo[doorid][ddExteriorZ], DoorInfo[doorid][ddExteriorVW]);
		}
	}
}


stock GetPlayerNameEx(playerid)
{

	new
		sz_playerName[MAX_PLAYER_NAME],
		i_pos;

	GetPlayerName(playerid, sz_playerName, MAX_PLAYER_NAME);
	while ((i_pos = strfind(sz_playerName, "_", false, i_pos)) != -1) sz_playerName[i_pos] = ' ';
	return sz_playerName;
}

stock ShowPlayerDialogEx(playerid, dialogid, style, caption[], info[], button1[], button2[]) {
	SetPVarInt(playerid, "dialog", dialogid);
	ShowPlayerDialog(playerid, dialogid, style, caption, info, button1, button2);
	return 1;
}

stock IsKeyJustDown(key, newkeys, oldkeys)
{
	if((newkeys & key) && !(oldkeys & key)) return 1;
	return 0;
}


stock IsACop(playerid)
{
	if(PlayerInfo[playerid][pFaction] == 1)
	{
	    return 1;
	}
	return 0;
}

stock LoadObjectsForPlayer(playerid) {
	TogglePlayerControllable(playerid, 0);
	for(new o = 0; o < 6; o++)
	{
	TextDrawShowForPlayer(playerid, ObjectsLoadingTD[o]);
	}
	SetPVarInt(playerid, "LoadingObjects", 1);
	SetTimerEx("SafeLoadObjects", 3000, 0, "d", playerid);
}

stock splits(const strsrc[], strdest[][], delimiter)
{
	new i, li;
	new aNum;
	new len;
	while(i <= strlen(strsrc)){
		if(strsrc[i]==delimiter || i==strlen(strsrc)){
			len = strmid(strdest[aNum], strsrc, li, i, 128);
			strdest[aNum][len] = 0;
			li = i+1;
			aNum++;
		}
		i++;
	}
	return 1;
}

stock Log(FileName[], Input[]) {

	new string[156], date[2][3], File: fileHandle = fopen(FileName, io_append);
	gettime(date[0][0], date[0][1], date[0][2]);
	getdate(date[1][0], date[1][1], date[1][2]);
	format(string, sizeof(string), "[%i/%i/%i - %i:%i:%i] %s\r\n", date[1][2], date[1][1], date[1][0], date[0][0], date[0][1], date[0][2], Input);
	fwrite(fileHandle, string);
	return fclose(fileHandle);
}

stock CreateFile(FileName[], Input[]) {

	new string[156], File: fileHandle = fopen(FilneName, io_append);
	format(string, sizeof(string), "%s\r\n", Input);
	fwrite(fileHandle, string);
	return fclose(fileHandle);
}

stock SendClientMessageToAdmins(color,string[],level)
{
	foreach(Player, i)
	{
	    if(!IsPlayerConnected(i)) return 1;
		if(PlayerInfo[i][pAdmin] >= level && Connected[i] == 1)
		{
			SendClientMessage(i, color, string);
			//printf("%s", string);
		}
	}
	return 1;
}

stock SendClientMessageToHelpersEx(color,string[],level)
{
	foreach(Player, i)
	{
	    if(!IsPlayerConnected(i)) return 1;
		if(PlayerInfo[i][pAdmin] >= level && Connected[i] == 1)
		{
			SendClientMessage(i, color, string);
			//printf("%s", string);
		}
	}
	return 1;
}

stock SendClientMessageToLSPD(color,string[])
{
	foreach(Player, i)
	{
	    if(!IsPlayerConnected(i)) return 1;
		if(PlayerInfo[i][pFaction] == 1 && Connected[i] == 1)
		{
			SendClientMessage(i, color, string);
			//printf("%s", string);
		}
	}
	return 1;
}

stock SendClientMessageToHelpers(color,string[])
{
	foreach(Player, i)
	{
	    if(!IsPlayerConnected(i)) return 1;
		if(PlayerInfo[i][pHelper] > 0 && Connected[i] == 1)
		{
			SendClientMessage(i, color, string);
		}
	}
	return 1;
}

stock SCMTO(string[])
{
	foreach(Player, i)
	{
	    if(!IsPlayerConnected(i)) return 1;
		if(togo[i] == 1 && Connected[i] == 1)
		{
			SendClientMessage(i, COLOR_OOC, string);
		}
	}
	return 1;
}

stock Newbie(string[])
{
	foreach(Player, i)
	{
	    if(!IsPlayerConnected(i)) return 1;
	    if(tognewbie[i] == 0 && Connected[i] == 1)
	    {
	        SendClientMessage(i, COLOR_NEWBIE, string);
		}
	}
	return 1;
}

stock SendClientMessageToFBI(color,string[])
{
	foreach(Player, i)
	{
	    if(!IsPlayerConnected(i)) return 1;
		if(PlayerInfo[i][pFaction] == 2 && Connected[i] == 1)
		{
			SendClientMessage(i, color, string);
			//printf("%s", string);
		}
	}
	return 1;
}

stock SendClientMessageToLSFMD(color,string[])
{
	foreach(Player, i)
	{
	    if(!IsPlayerConnected(i)) return 1;
		if(PlayerInfo[i][pFaction] == 3 && Connected[i] == 1)
		{
			SendClientMessage(i, color, string);
			//printf("%s", string);
		}
	}
	return 1;
}

stock SendClientMessageToHA(color,string[])
{
	foreach(Player, i)
	{
	    if(!IsPlayerConnected(i)) return 1;
		if(PlayerInfo[i][pFaction] == 4 && Connected[i] == 1)
		{
			SendClientMessage(i, color, string);
			//printf("%s", string);
		}
	}
	return 1;
}

stock SendClientMessageToGOV(color,string[])
{
	foreach(Player, i)
	{
	    if(!IsPlayerConnected(i)) return 1;
		if(PlayerInfo[i][pFaction] == 5 && Connected[i] == 1)
		{
			SendClientMessage(i, color, string);
			//printf("%s", string);
		}
	}
	return 1;
}

stock SendClientMessageToSN(color,string[])
{
	foreach(Player, i)
	{
	    if(!IsPlayerConnected(i)) return 1;
		if(PlayerInfo[i][pFaction] == 6 && Connected[i] == 1)
		{
			SendClientMessage(i, color, string);
			//printf("%s", string);
		}
	}
	return 1;
}

stock SendClientMessageToDepartments(color,string[])
{
	foreach(Player, i)
	{
	    if(!IsPlayerConnected(i)) return 1;
		if(PlayerInfo[i][pFaction] == 1 || PlayerInfo[i][pFaction] == 2 || PlayerInfo[i][pFaction] == 3 || PlayerInfo[i][pFaction] == 5  && Connected[i] == 1)
		{
			SendClientMessage(i, color, string);
			//printf("%s", string);
		}
		if(!IsPlayerConnected(i)) return 1;
		if(PlayerInfo[i][pFaction] == 4 && togdr[i] == 1 && Connected[i] == 1)
		{
			SendClientMessage(i, color, string);
			//printf("%s", string);
		}
	}
	return 1;
}

public OnPlayerGiveDamage(playerid, damagedid, Float: amount, weaponid) {
		if(tazer[playerid] == 1)
		{
			if(weaponid == 23)
			{
			    if(AdminDuty[damagedid] == 1)
			    {
			        SendClientMessage(playerid, -1, "You can not taze that admin at the moment.");
					return 1;
				}
				if(GetPVarInt(damagedid, "Restrained") == 1)
				{
				    SendClientMessage(playerid, -1, "This player is already restrained.");
				    return 1;
				}
				if(GetPVarInt(damagedid, "Cuffed") == 1)
				{
				    SendClientMessage(playerid, -1, "This player is cuffed.");
				    return 1;
				}
				if(GetPVarInt(damagedid, "Recovering") == 1)
				{
				    SendClientMessage(playerid, -1, "This player is in hospital.");
				    return 1;
				}
				if(GetPVarInt(damagedid, "Injured") == 1)
				{
				    SendClientMessage(playerid, -1, "This player is injured,");
				    return 1;
				}
				new playerState = GetPlayerState(damagedid); // Get the killer's state
				if (playerState == PLAYER_STATE_PASSENGER || playerState == PLAYER_STATE_DRIVER) return 1;
				if(playerid == damagedid) return Kick(playerid);
			    new string[56];
	 			format(string, sizeof(string), "* %s fires their tazer at %s.", GetPlayerNameEx(playerid), GetPlayerNameEx(damagedid));
				ProxDetector(30.0, playerid, string, COLOR_PURPLE);
				GameTextForPlayer(damagedid, "~r~Tazed", 3500, 3);
				TogglePlayerControllable(damagedid, 0);
				PreloadAnims(playerid);
				ApplyAnimation(damagedid,"CRACK","crckdeth2",4.1,0,1,1,1,1,0);
				SetTimerEx("untaze", 5000, false, "i", damagedid);
				SetPVarInt(damagedid, "Restrained", 1);
				return 1;
			}
		}
		return 1;
}

forward untaze(playerid);
public untaze(playerid)
{
	if(GetPVarInt(playerid, "Cuffed") == 1) return SetPVarInt(playerid, "Restrained", 0);
	ClearAnimations(playerid);
	TogglePlayerControllable(playerid, 1);
	SetPVarInt(playerid, "Restrained", 0);
	return 1;
}

stock SetPlayerWeaponsEx(playerid)
{
	ResetPlayerWeapons(playerid);
	for(new s = 0; s < 12; s++)
	{
		if(PlayerInfo[playerid][pGuns][s] > 0)
		{
			GivePlayerValidWeapon(playerid, PlayerInfo[playerid][pGuns][s], 60000);
		}
	}
	SetPlayerArmedWeapon(playerid, GetPVarInt(playerid, "LastWeapon"));
}

stock GivePlayerValidWeapon(playerid, WeaponID, Ammo)
{
	switch(WeaponID)
	{
  		case 0, 1:
		{
			PlayerInfo[playerid][pGuns][0] = WeaponID;
			GivePlayerWeapon(playerid, WeaponID, Ammo);
		}
		case 2, 3, 4, 5, 6, 7, 8, 9:
		{
			PlayerInfo[playerid][pGuns][1] = WeaponID;
			GivePlayerWeapon(playerid, WeaponID, Ammo);
		}
		case 22, 23, 24:
		{
			PlayerInfo[playerid][pGuns][2] = WeaponID;
			GivePlayerWeapon(playerid, WeaponID, Ammo);
		}
		case 25, 26, 27:
		{
			PlayerInfo[playerid][pGuns][3] = WeaponID;
			GivePlayerWeapon(playerid, WeaponID, Ammo);
		}
		case 28, 29, 32:
		{
			PlayerInfo[playerid][pGuns][4] = WeaponID;
			GivePlayerWeapon(playerid, WeaponID, Ammo);
		}
		case 30, 31:
		{
			PlayerInfo[playerid][pGuns][5] = WeaponID;
			GivePlayerWeapon(playerid, WeaponID, Ammo);
		}
		case 33, 34:
		{
			PlayerInfo[playerid][pGuns][6] = WeaponID;
			GivePlayerWeapon(playerid, WeaponID, Ammo);
		}
		case 35, 36, 37, 38:
		{
			PlayerInfo[playerid][pGuns][7] = WeaponID;
			GivePlayerWeapon(playerid, WeaponID, Ammo);
		}
		case 16, 17, 18, 39, 40:
		{
			PlayerInfo[playerid][pGuns][8] = WeaponID;
			GivePlayerWeapon(playerid, WeaponID, Ammo);
		}
		case 41, 42, 43:
		{
			PlayerInfo[playerid][pGuns][9] = WeaponID;
			GivePlayerWeapon(playerid, WeaponID, Ammo);
		}
		case 10, 11, 12, 13, 14, 15:
		{
			PlayerInfo[playerid][pGuns][10] = WeaponID;
			GivePlayerWeapon(playerid, WeaponID, Ammo);
		}
		case 44, 45, 46:
		{
			PlayerInfo[playerid][pGuns][11] = WeaponID;
			GivePlayerWeapon(playerid, WeaponID, Ammo);
		}
	}
	return 1;
}
stock SetPlayerWeapons(playerid)
{
    if(GetPVarInt(playerid, "PBM") > 0) { return 1; }
	ResetPlayerWeapons(playerid);
	for(new s = 0; s < 12; s++)
	{
		if(PlayerInfo[playerid][pGuns][s] > 0)
		{
		    if(PlayerInfo[playerid][pGuns][s] == 17)
				GivePlayerValidWeapon(playerid, PlayerInfo[playerid][pGuns][s], 5);
			else
				GivePlayerValidWeapon(playerid, PlayerInfo[playerid][pGuns][s], 60000);
		}
	}
	return 1;
}
RemovePlayerWeapon(playerid, weaponid)
{
	new plyWeapons[13];
	for(new s = 0; s < 13; s++)
	{
		new wep, ammo;
		GetPlayerWeaponData(playerid, s, wep, ammo);

		if(wep != weaponid)
		{
			GetPlayerWeaponData(playerid, s, plyWeapons[s], ammo);
		}
		else
		{
			PlayerInfo[playerid][pGuns][s] = 0;
		}
	}

	ResetPlayerWeapons(playerid);
 	for(new s = 0; s < 12; s++)
	{
		GivePlayerValidWeapon(playerid, plyWeapons[s], 60000);
	}
	return 1;
}

stock ResetPlayerWeaponsEx(playerid)
{
	ResetPlayerWeapons(playerid);
	PlayerInfo[playerid][pGuns][0] = 0;
	PlayerInfo[playerid][pGuns][1] = 0;
	PlayerInfo[playerid][pGuns][2] = 0;
	PlayerInfo[playerid][pGuns][3] = 0;
	PlayerInfo[playerid][pGuns][4] = 0;
	PlayerInfo[playerid][pGuns][5] = 0;
	PlayerInfo[playerid][pGuns][6] = 0;
	PlayerInfo[playerid][pGuns][7] = 0;
	PlayerInfo[playerid][pGuns][8] = 0;
	PlayerInfo[playerid][pGuns][9] = 0;
	PlayerInfo[playerid][pGuns][10] = 0;
	PlayerInfo[playerid][pGuns][11] = 0;
	return 1;
}

forward loadtruck1(playerid);
forward loadtruck2(playerid);
forward loadtruck3(playerid);
forward loadtruck4(playerid);
forward loadtruck5(playerid);
forward loadtruckGO(playerid);
public loadtruck1(playerid)
{
	GameTextForPlayer(playerid, "~g~|||~y~|||~r~||||", 5000, 3);
	SetTimerEx("loadtruck2", 1000, false, "i", playerid);
	TogglePlayerControllable(playerid, 0);
}
public loadtruck2(playerid)
{
	GameTextForPlayer(playerid, "~g~|||~y~|||~r~||", 5000, 3);
	SetTimerEx("loadtruck3", 1500, false, "i", playerid);
}
public loadtruck3(playerid)
{
	GameTextForPlayer(playerid, "~g~|||~y~|||", 5000, 3);
	SetTimerEx("loadtruck4", 1500, false, "i", playerid);
}
public loadtruck4(playerid)
{
	GameTextForPlayer(playerid, "~g~|||~y~|", 5000, 3);
	SetTimerEx("loadtruck5", 1500, false, "i", playerid);
}
public loadtruck5(playerid)
{
	GameTextForPlayer(playerid, "~g~||", 5000, 3);
	SetTimerEx("loadtruckGO", 1500, false, "i", playerid);
}
public loadtruckGO(playerid)
{
	new currenttruck;
	currenttruck = GetPlayerVehicleID(playerid);
	GameTextForPlayer(playerid, "Loaded", 3000, 3);
 	new rand = random(sizeof(Destinations)); // defines the rand variable.
    SetPlayerCheckpoint(playerid, Destinations[rand][0], Destinations[rand][1], Destinations[rand][2], 3.0); // sets a checkpoint.
    SendClientMessage(playerid, COLOR_YELLOW, "Truck loaded - Go to the checkpoint to collect your payment.");
    truckloaded[playerid] = 1;
	truckloadedon[playerid] = currenttruck;
	CPT[playerid] = 1;
	TogglePlayerControllable(playerid, 1);
}

forward CheckArmHack(playerid);
public CheckArmHack(playerid)
{

	new Float:armr, str[100];
	GetPlayerArmour(playerid, armr);
	if(skipacheck[playerid] > 0)
	{
	skipacheck[playerid] =- 1;
	return 1; // wait.
	}
	if(armr > PlayerInfo[playerid][pArmor] && AdminDuty[playerid] != 1)
	{
		format(str, 100, "WARNING: %s may possibly be armor hacking. Has %.1f while he is supposed to have %.1f", GetName(playerid), armr, PlayerInfo[playerid][pArmor]);
	    SendClientMessageToAdmins(COLOR_YELLOW, str, 1);
	    Log("/logs/hacks.txt", str);
	}
	return 1;
}

forward CheckWarpHack(playerid);
public CheckWarpHack(playerid)
{
	carsentered[playerid] = 0;
	dontcheck[playerid] = 0;
	return 1;
}

forward CheckWepHack(playerid);
public CheckWepHack(playerid)
{
 	if(waitcheck[playerid] > 0)
	{
		waitcheck[playerid] -= 1;
		return 1;
	}
    new wep;

	if(!IsPlayerConnected(playerid)) return 1; // if is not connected skip
	if(Connected[playerid] == 0) return 1; // if not logged in
	if(AdminDuty[playerid] > 0 && PlayerInfo[playerid][pAdmin] > 0) return 1;// dont check if admin duty and is admin
	if(GetPVarInt(playerid, "Injured") == 1) return 1; // dont check if injured
	if(GetPVarInt(playerid, "prelogin") == 1) return 1; // dont check if not finished the login screen.
	if(GetPlayerInterior(playerid) > 1) return 1; // likely entered a bulding
	if(spec[playerid] != -1 && PlayerInfo[playerid][pAdmin] > 0) return 1; // spectate mode

	if(wep == 1 && PlayerInfo[playerid][pGuns][0] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 3 && PlayerInfo[playerid][pGuns][1] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 4 && PlayerInfo[playerid][pGuns][1] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 5 && PlayerInfo[playerid][pGuns][1] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 6 && PlayerInfo[playerid][pGuns][1] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 7 && PlayerInfo[playerid][pGuns][1] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 8 && PlayerInfo[playerid][pGuns][1] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 9 && PlayerInfo[playerid][pGuns][1] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 22 && PlayerInfo[playerid][pGuns][2] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 23 && PlayerInfo[playerid][pGuns][2] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 24 && PlayerInfo[playerid][pGuns][2] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 25 && PlayerInfo[playerid][pGuns][3] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 26 && PlayerInfo[playerid][pGuns][3] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 27 && PlayerInfo[playerid][pGuns][3] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 28 && PlayerInfo[playerid][pGuns][4] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 29 && PlayerInfo[playerid][pGuns][4] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 32 && PlayerInfo[playerid][pGuns][4] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 30 && PlayerInfo[playerid][pGuns][5] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 31 && PlayerInfo[playerid][pGuns][5] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 34 && PlayerInfo[playerid][pGuns][6] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 33 && PlayerInfo[playerid][pGuns][6] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 35 && PlayerInfo[playerid][pGuns][7] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 36 && PlayerInfo[playerid][pGuns][7] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 37 && PlayerInfo[playerid][pGuns][7] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 16 && PlayerInfo[playerid][pGuns][8] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 17 && PlayerInfo[playerid][pGuns][8] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 18 && PlayerInfo[playerid][pGuns][8] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 39 && PlayerInfo[playerid][pGuns][8] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 40 && PlayerInfo[playerid][pGuns][8] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 41 && PlayerInfo[playerid][pGuns][9] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 42 && PlayerInfo[playerid][pGuns][9] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 43 && PlayerInfo[playerid][pGuns][9] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 10 && PlayerInfo[playerid][pGuns][10] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 11 && PlayerInfo[playerid][pGuns][10] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 12 && PlayerInfo[playerid][pGuns][10] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 13 && PlayerInfo[playerid][pGuns][10] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 14 && PlayerInfo[playerid][pGuns][10] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 15 && PlayerInfo[playerid][pGuns][10] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 44 && PlayerInfo[playerid][pGuns][11] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	if(wep == 45 && PlayerInfo[playerid][pGuns][11] != wep)
	{
	    SetTimerEx("DoubleCheck", 500, false, "i", playerid);
	}
	return 1;
}

forward DoubleCheck(playerid);
public DoubleCheck(playerid)
{
    new wep, string[128];
	new wepname[56];
	wep = GetPlayerWeapon(playerid);
	GetWeaponName(wep, wepname, sizeof(wepname));
	
	if(waitcheck[playerid] > 0)
	{
		waitcheck[playerid] -= 1;
		return 1;
	}

	if(wep == 1 && PlayerInfo[playerid][pGuns][0] != wep)
	{
	    new sttrrr[236], wepp[126];
	    GetWeaponName(wep, wepp, 126);
	    format(sttrrr, 236, "gun %s", wepp);
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;
		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 3 && PlayerInfo[playerid][pGuns][1] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;
		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 4 && PlayerInfo[playerid][pGuns][1] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 5 && PlayerInfo[playerid][pGuns][1] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 6 && PlayerInfo[playerid][pGuns][1] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 7 && PlayerInfo[playerid][pGuns][1] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 8 && PlayerInfo[playerid][pGuns][1] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 9 && PlayerInfo[playerid][pGuns][1] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 22 && PlayerInfo[playerid][pGuns][2] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 23 && PlayerInfo[playerid][pGuns][2] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 24 && PlayerInfo[playerid][pGuns][2] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 25 && PlayerInfo[playerid][pGuns][3] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 26 && PlayerInfo[playerid][pGuns][3] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 27 && PlayerInfo[playerid][pGuns][3] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 28 && PlayerInfo[playerid][pGuns][4] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 29 && PlayerInfo[playerid][pGuns][4] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 32 && PlayerInfo[playerid][pGuns][4] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 30 && PlayerInfo[playerid][pGuns][5] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 31 && PlayerInfo[playerid][pGuns][5] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 34 && PlayerInfo[playerid][pGuns][6] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 33 && PlayerInfo[playerid][pGuns][6] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 35 && PlayerInfo[playerid][pGuns][7] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 36 && PlayerInfo[playerid][pGuns][7] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 37 && PlayerInfo[playerid][pGuns][7] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 16 && PlayerInfo[playerid][pGuns][8] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 17 && PlayerInfo[playerid][pGuns][8] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 18 && PlayerInfo[playerid][pGuns][8] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 39 && PlayerInfo[playerid][pGuns][8] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 40 && PlayerInfo[playerid][pGuns][8] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 41 && PlayerInfo[playerid][pGuns][9] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 42 && PlayerInfo[playerid][pGuns][9] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 43 && PlayerInfo[playerid][pGuns][9] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 10 && PlayerInfo[playerid][pGuns][10] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 11 && PlayerInfo[playerid][pGuns][10] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 12 && PlayerInfo[playerid][pGuns][10] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 13 && PlayerInfo[playerid][pGuns][10] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 14 && PlayerInfo[playerid][pGuns][10] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 15 && PlayerInfo[playerid][pGuns][10] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 44 && PlayerInfo[playerid][pGuns][11] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;

		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	if(wep == 45 && PlayerInfo[playerid][pGuns][11] != wep)
	{
		format(string, sizeof(string), "AdmCmd: %s was banned, Reason: Weapon Hacks (%s)", GetName(playerid), wepname);
		PlayerInfo[playerid][pBanned] =  1;
		new ip[28];
		GetPlayerIp(playerid, ip, sizeof(ip));
		SendClientMessageToAll(COLOR_LIGHTRED, string);
		format(string, sizeof(string), "AdmCmd: %s (IP: %s) was banned, Reason: Weapon Hacks (%s)", GetName(playerid), ip, wepname);
		Log("/logs/ban.txt", string);
		AddBan(ip);
		Kick(playerid);
	}
	return 1;
}


forward GetWeekdayNum(d,m,y);
forward settime();
forward weatherchange();


public weatherchange(){
	SetWeather(random(18));
}

public settime(){
	new hour,minute,second;
	new string[256];
	gettime(hour,minute,second);
	if (minute <= 9){format(string,25,"%d:0%d",hour,minute);}
	else {format(string,25,"%d:%d",hour,minute);}
	TextDrawSetString(Clock,string);
	SetWorldTime(hour);
	new day, month, year;
	new weekday;
	getdate(day, month, year);
	weekday = GetWeekdayNum(day, month, year);
	if(weekday == 1){TextDrawSetString(WeekDayg,"Monday");}
	if(weekday == 2){TextDrawSetString(WeekDayg,"Tuesday");}
	if(weekday == 3){TextDrawSetString(WeekDayg,"Wednesday");}
	if(weekday == 4){TextDrawSetString(WeekDayg,"Thursday");}
	if(weekday == 5){TextDrawSetString(WeekDayg,"Friday");}
	if(weekday == 6){TextDrawSetString(WeekDayg,"Saturday");}
	if(weekday == 7){TextDrawSetString(WeekDayg,"Sunday");}
	return 1;
}

public GetWeekdayNum(d,m,y) //by d.wine
{
	m-=2;
	if(m<=0)
		{
		y--;
		m+=12;
		}
	new cen = y/100;
	y=getrem(y,100);
	new w = d + ((13*m-1)/5) + y + (y/4) + (cen/4) - 2*cen;
	w=getrem(w,7);
	if (w==0) w=7;
	return w-1;
}
