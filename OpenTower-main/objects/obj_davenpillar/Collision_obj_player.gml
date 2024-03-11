if solid=false{
with (obj_player)
{
		state = states.bump;
		hsp = -xscale * 5;
		vsp = -2;
		sprite_index = spr_bump;
		fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
}
}