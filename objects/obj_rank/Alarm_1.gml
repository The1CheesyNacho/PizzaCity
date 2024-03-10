global.levelcomplete = true;
scr_playerreset();
with (obj_player)
{
	room = backtohubroom;
	x = backtohubstartx;
	y = backtohubstarty;
	state = states.normal;
	targetDoor = "A";
	targetRoom = Realtitlescreen;
    trace(room_get_name(backtohubroom), " ", x, " ", y)
}
global.exitrank = false;
global.leveltorestart = -4;
global.leveltosave = -4;
global.level_minutes = 0;
global.level_seconds = 0;
