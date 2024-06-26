function scr_player_shoulderbash()
{
	movespeed = 1
	hsp += movespeed * xscale;
	if (!instance_exists(chargeeffectid))
	{
		with (instance_create(x + 5, y - 5, obj_chargeeffect))
		{
			playerid = other.object_index;
			other.chargeeffectid = id;
			depth = other.depth - 1;
		}
	}
	if (sprite_index == spr_playerPM_shoulderstart && floor(image_index) == (image_number - 1))
		sprite_index = spr_playerPM_shoulderloop;
	if (sprite_index == spr_playerPM_shoulderloop && !key_attack)
	{
		state = states.normal;
	}
	if (grounded)
		jumpstop = false;
	if (key_up)
	{
		state = states.Sjumpprep;
	}
	if (!key_jump2 && jumpstop == 0 && vsp < 0.5)
	{
		vsp /= 60;
		jumpstop = true;
	}
	if (input_buffer_jump > 0 && can_jump)
	{
		input_buffer_jump = 0;
		vsp = -shoulderbash_jumpspeed;
		scr_fmod_soundeffect(jumpsnd, x, y);
	}
	if (!instance_exists(dashcloudid) && grounded)
	{
		with (instance_create(x, y - 5, obj_dashcloud))
		{
			image_xscale = other.xscale;
			other.dashcloudid = id;
		}
	}
	if (place_meeting(x + xscale, y, obj_solid))
		state = states.normal;
}
