// This function is called from every <gametype>.gsc::main function
InitSystems()
{
	thread maps\mp\gametypes\_callbacksetup::Init();
}