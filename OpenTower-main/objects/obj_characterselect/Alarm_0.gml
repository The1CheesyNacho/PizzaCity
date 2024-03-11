with (instance_create(x, y, obj_fadeout))
{
	obj_player1.targetRoom = hub_loadingscreen;
	obj_player1.targetDoor = "A";
if (obj_characterselect.selected != 1){
	obj_player1.state = states.normal;
}
else{
	obj_player1.state = states.ratmount;
}
	if (global.coop == 1)
	{
		obj_player2.state = states.normal;
		obj_player2.targetDoor = "A";
		obj_player3.state = states.normal;
		obj_player3.targetDoor = "A";
		obj_player4.state = states.normal;
		obj_player4.targetDoor = "A";
	}
}
gamesave_async_load();
