#include maps\mp\gametypes\global\_global;

init()
{
	if(game["firstInit"])
	{
		precacheString2("STRING_VERSION_INFO", &"zPAM 1.0"); // ZPAM_RENAME
	}
}

