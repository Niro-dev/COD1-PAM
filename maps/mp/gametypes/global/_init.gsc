// This function is called from every <gametype>.gsc::main function
InitSystems()
{
	thread maps\mp\gametypes\_callbacksetup::Init();

    if (isDefined(game["firstInit"]))
		game["firstInit"] = false;
	else
		game["firstInit"] = true;

	thread resetFirstInit();


    maps\mp\gametypes\global\events::Init();	// Init events so we can use them
    maps\mp\gametypes\global\cvar_system::Init();	// Define g_gametpe, fs_mode, ... cvars
	maps\mp\gametypes\global\pam::Init();		// Define pam_mode cvar
	maps\mp\gametypes\global\rules::Init();		// Register rule cvar values
	maps\mp\gametypes\global\cvars::Init();		// Define game and shared cvars

    // Precache (only once)
	if (game["firstInit"])
	{
		maps\mp\gametypes\global\precache::Init();
	}
}

resetFirstInit()
{
	wait 0;
	game["firstInit"] = false;
}

// This function is called at the end of <gametype>.gsc::main() function
InitModules()
{
    thread maps\mp\gametypes\_pam::init();

    thread maps\mp\gametypes\_bots::Init();			// must be called to indentify bots as first
    thread maps\mp\gametypes\_log::init();
    thread maps\mp\gametypes\_server_restart::init();

    thread maps\mp\gametypes\_weapons::init();		// must be caled before _menus because of rifle mode
	thread maps\mp\gametypes\_menus::init();		// must be called before another onMenuResponse
    thread maps\mp\gametypes\_teams::init();
}