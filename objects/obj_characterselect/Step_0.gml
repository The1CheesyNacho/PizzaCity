image_speed = 0.35;
if ((obj_player1.key_right2 || -obj_player2.key_left2) && ready == 0)
	selected += 1;
if ((-obj_player1.key_left2 || obj_player2.key_right2) && ready == 0)
	selected -= 1;
if (obj_player1.key_jump && selected == 0 && obj_peppinoselect.sprite_index != spr_peppinoselected)
{
	ready = true;
	obj_peppinoselect.sprite_index = spr_peppinoselected;
	obj_peppinoselect.image_index = 0;
	with (obj_player1)
	{
		character = "P";
		ispeppino = true;
		brick = false
		isgustavo = false
		scr_characterspr();
	}
	with (obj_player2)
	{
		character = "N";
		ispeppino = false;
		scr_characterspr();
		if (global.coop == 1)
		{
			obj_noiseselect.sprite_index = spr_noiseselected;
			obj_noiseselect.image_index = 0;
		}
	}
	alarm[0] = 100;
}
if (obj_player1.key_jump && selected == 1 && obj_noiseselect.sprite_index != spr_noiseselected)
{
	ready = true;
	obj_noiseselect.sprite_index = spr_noiseselected;
	obj_noiseselect.image_index = 0;
	with (obj_player1)
	{
		character = "N";
		ispeppino = false;
		brick = false
		isgustavo = false
		scr_characterspr();
	}
	with (obj_player2)
	{
		character = "P";
		ispeppino = true;
		scr_characterspr();
		if (global.coop == 1)
		{
			obj_peppinoselect.sprite_index = spr_peppinoselected;
			obj_peppinoselect.image_index = 0;
		}
	}
	alarm[0] = 100;
}
if (obj_player1.key_jump && selected == 2 && obj_peppinoselect.sprite_index != spr_peppinoselected)
{
	ready = true;
	obj_peppinoselect.sprite_index = spr_peppinoselected;
	obj_peppinoselect.image_index = 0;
	with (obj_player1)
	{
		isgustavo = true
		character = "G";
		ispeppino = false;
		scr_characterspr();
	}
	with (obj_player2)
	{
		character = "N";
		ispeppino = false;
		scr_characterspr();
		if (global.coop == 1)
		{
			obj_noiseselect.sprite_index = spr_noiseselected;
			obj_noiseselect.image_index = 0;
		}
	}
	alarm[0] = 100;
}
if (obj_player1.key_jump && selected == 3 && obj_noiseselect.sprite_index != spr_noiseselected)
{
	ready = true;
	obj_noiseselect.sprite_index = spr_noiseselected;
	obj_noiseselect.image_index = 0;
	with (obj_player1)
	{
		character = "V";
		ispeppino = false;
		brick = false
		isgustavo = false
		scr_characterspr();
	}
	with (obj_player2)
	{
		character = "P";
		ispeppino = true;
		scr_characterspr();
		if (global.coop == 1)
		{
			obj_peppinoselect.sprite_index = spr_peppinoselected;
			obj_peppinoselect.image_index = 0;
		}
	}
	alarm[0] = 100;
}
if (obj_player1.key_jump && selected == 4 && obj_noiseselect.sprite_index != spr_noiseselected)
{
	ready = true;
	obj_noiseselect.sprite_index = spr_noiseselected;
	obj_noiseselect.image_index = 0;
	with (obj_player1)
	{
		character = "PM";
		ispeppino = false;
		brick = false
		isgustavo = false
		scr_characterspr();
	}
	with (obj_player2)
	{
		character = "P";
		ispeppino = true;
		scr_characterspr();
		if (global.coop == 1)
		{
			obj_peppinoselect.sprite_index = spr_peppinoselected;
			obj_peppinoselect.image_index = 0;
		}
	}
	alarm[0] = 100;
}
if (obj_player1.key_jump && selected == 5 && obj_peppinoselect.sprite_index != spr_peppinoselected)
{
	ready = true;
	obj_peppinoselect.sprite_index = spr_peppinoselected;
	obj_peppinoselect.image_index = 0;
	with (obj_player1)
	{
		character = "S";
		ispeppino = false;
		scr_characterspr();
	}
	with (obj_player2)
	{
		character = "N";
		ispeppino = false;
		scr_characterspr();
		if (global.coop == 1)
		{
			obj_noiseselect.sprite_index = spr_noiseselected;
			obj_noiseselect.image_index = 0;
		}
	}
	alarm[0] = 100;
}
