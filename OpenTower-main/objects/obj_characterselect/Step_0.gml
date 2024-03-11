var _dvc = obj_inputAssigner.player_input_device[0]
var _dvc2 = obj_inputAssigner.player_input_device[1]
var verticaldeadzone = global.input_controller_deadzone_vertical;
var horizontaldeadzone = global.input_controller_deadzone_horizontal;
var vertpress_dz = global.input_controller_deadzone_press;
var horizpress_dz = global.input_controller_deadzone_press;
var stickpressed_horizontal = 0
var stickpressed_vertical = 0
if ((keyboard_check_pressed(global.key_right) || gamepad_button_check_pressed(_dvc, global.key_rightC) || (gamepad_axis_value(_dvc, gp_axislh) > horizpress_dz && stickpressed_horizontal == 0)) && ready == 0)
    selected += 1
if ((keyboard_check_pressed(global.key_left) || gamepad_button_check_pressed(_dvc, global.key_leftC) || (gamepad_axis_value(_dvc, gp_axislh) < (-horizpress_dz) && stickpressed_horizontal == 0)) && ready == 0)
    selected -= 1
if (obj_player1.key_jump && selected == 1 && obj_peppinoselect.sprite_index != spr_peppinoselected)
{
    ready = 1
    obj_peppinoselect.sprite_index = spr_peppinoselected
    obj_peppinoselect.image_index = 0
    with (obj_player1)
    {
        character = "P"
        ispeppino = 1
        scr_characterspr()
		isgustavo = 0
    }
    with (obj_player2)
    {
        character = "G"
        ispeppino = 1
        scr_characterspr()
        if (global.coop == 1)
        {
            obj_noiseselect.sprite_index = spr_noiseselected
            obj_noiseselect.image_index = 0
        }
    }
    with (obj_player3)
    {
        character = "L"
        ispeppino = 1
        scr_characterspr()
        if (global.coop == 1)
        {
            obj_noiseselect.sprite_index = spr_noiseselected
            obj_noiseselect.image_index = 0
        }
    }
    with (obj_player4)
    {
        character = "F"
        ispeppino = 1
        scr_characterspr()
        if (global.coop == 1)
        {
            obj_noiseselect.sprite_index = spr_noiseselected
            obj_noiseselect.image_index = 0
        }
    }
    alarm[0] = 100
}
if (obj_player1.key_jump && selected == 2 && obj_gustavoselect.sprite_index != spr_gugavoselected)
{
    ready = 1
    obj_gustavoselect.sprite_index = spr_gugavoselected
    obj_gustavoselect.image_index = 0
    with (obj_player1)
    {
        character = "G"
        ispeppino = 0
        scr_characterspr()
    }
    with (obj_player2)
    {
        character = "N"
        ispeppino = 1
        scr_characterspr()
        if (global.coop == 1)
        {
            obj_peppinoselect.sprite_index = spr_peppinoselected
            obj_peppinoselect.image_index = 0
        }
    }
    with (obj_player3)
    {
        character = "V"
        ispeppino = 0
        scr_characterspr()
        if (global.coop == 1)
        {
            obj_noiseselect.sprite_index = spr_noiseselected
            obj_noiseselect.image_index = 0
        }
    }
    alarm[0] = 100
}
if (obj_player1.key_jump && selected == 3 && obj_fakepeppinoselect.sprite_index != spr_noiseselected)
{
    ready = 1
    obj_fakepeppinoselect.sprite_index = spr_noiseselected
    obj_fakepeppinoselect.image_index = 0
    with (obj_player1)
    {
        character = "G"
        ispeppino = 0
        scr_characterspr()
    }
    with (obj_player2)
    {
        character = "N"
        ispeppino = 1
        scr_characterspr()
        if (global.coop == 1)
        {
            obj_peppinoselect.sprite_index = spr_peppinoselected
            obj_peppinoselect.image_index = 0
        }
    }
    with (obj_player3)
    {
        character = "V"
        ispeppino = 0
        scr_characterspr()
        if (global.coop == 1)
        {
            obj_noiseselect.sprite_index = spr_noiseselected
            obj_noiseselect.image_index = 0
        }
    }
    alarm[0] = 100
}
if (obj_player1.key_jump && selected == 0 && obj_fakepepselect.sprite_index != spr_peppinoselected)
{
    ready = 1
    obj_fakepepselect.sprite_index = spr_peppinoselected
    obj_fakepepselect.image_index = 0
    with (obj_player1)
    {
        character = "F"
        ispeppino = 0
        scr_characterspr()
    }
    with (obj_player2)
    {
        character = "N"
        ispeppino = 1
        scr_characterspr()
        if (global.coop == 1)
        {
            obj_peppinoselect.sprite_index = spr_peppinoselected
            obj_peppinoselect.image_index = 0
        }
    }
    with (obj_player3)
    {
        character = "V"
        ispeppino = 0
        scr_characterspr()
        if (global.coop == 1)
        {
            obj_noiseselect.sprite_index = spr_noiseselected
            obj_noiseselect.image_index = 0
        }
    }
    with (obj_player4)
    {
        character = "F"
        ispeppino = 0
        scr_characterspr()
        if (global.coop == 1)
        {
            obj_noiseselect.sprite_index = spr_noiseselected
            obj_noiseselect.image_index = 0
        }
    }
    alarm[0] = 100
}

if (keyboard_check_pressed(global.key_jumpN) || gamepad_button_check_pressed(_dvc2, global.key_jumpCN))
    global.coop = 1
if (obj_player1.key_down || obj_player1.key_down2)
    global.lockedmpcamera = 1
else
    global.lockedmpcamera = 0
