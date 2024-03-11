instance_destroy();
with (playerid)
{
	if (character != "G")
		state = states.normal;
	else
		state = states.ratmount;
	visible = true;
}
with (obj_ghostfollow)
{
	x = xstart;
	y = ystart;
}
