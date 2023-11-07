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
	
}

resetFirstInit()
{
	wait 0;
	game["firstInit"] = false;
}