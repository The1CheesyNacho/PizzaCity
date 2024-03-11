function scr_getinput3() //gml_Script_scr_getinput2
{
    if (instance_exists(obj_debugcontroller) && obj_debugcontroller.active)
        return;
    var _dvc = obj_inputAssigner.player_input_device[1]
    gamepad_set_axis_deadzone(_dvc, 0.4)
    key_up = (keyboard_check(global.key_upV) || gamepad_button_check(_dvc, global.key_upCV) || gamepad_axis_value(_dvc, gp_axislv) < 0)
    key_up2 = (keyboard_check_pressed(global.key_upV) || gamepad_button_check_pressed(_dvc, global.key_upCV) || (gamepad_axis_value(_dvc, gp_axislv) < -0.5 && stickpressed == 0))
    key_right = (keyboard_check(global.key_rightV) || gamepad_button_check(_dvc, global.key_rightCV) || gamepad_axis_value(_dvc, gp_axislh) > 0)
    key_right2 = (keyboard_check_pressed(global.key_rightV) || gamepad_button_check_pressed(_dvc, global.key_rightCV) || (gamepad_axis_value(_dvc, gp_axislh) > 0.5 && stickpressed == 0))
    key_left = (-((keyboard_check(global.key_leftV) || gamepad_button_check(_dvc, global.key_leftCV) || gamepad_axis_value(_dvc, gp_axislh) < 0)))
    key_left2 = (-((keyboard_check_pressed(global.key_leftV) || gamepad_button_check_pressed(_dvc, global.key_leftCV) || (gamepad_axis_value(_dvc, gp_axislh) < -0.5 && stickpressed == 0))))
    key_down = (keyboard_check(global.key_downV) || gamepad_button_check(_dvc, global.key_downCV) || gamepad_axis_value(_dvc, gp_axislv) > 0)
    key_down2 = (keyboard_check_pressed(global.key_downV) || gamepad_button_check_pressed(_dvc, global.key_downCV) || (gamepad_axis_value(_dvc, gp_axislv) > 0.5 && stickpressed == 0))
    key_jump = (keyboard_check_pressed(global.key_jumpV) || gamepad_button_check_pressed(_dvc, global.key_jumpCV))
    key_jump2 = (keyboard_check(global.key_jumpV) || gamepad_button_check(_dvc, global.key_jumpCV))
    key_slap = (keyboard_check(global.key_slapV) || gamepad_button_check(_dvc, global.key_slapCV))
    key_slap2 = (keyboard_check_pressed(global.key_slapV) || gamepad_button_check_pressed(_dvc, global.key_slapCV))
    key_taunt = (keyboard_check(global.key_tauntV) || gamepad_button_check(_dvc, global.key_tauntCV))
    key_taunt2 = (keyboard_check_pressed(global.key_tauntV) || gamepad_button_check_pressed(_dvc, global.key_tauntCV))
    key_attack = (keyboard_check(global.key_attackV) || gamepad_button_check(_dvc, global.key_attackCV) || gamepad_button_check(_dvc, gp_shoulderrb))
    key_attack2 = (keyboard_check_pressed(global.key_attackV) || gamepad_button_check_pressed(_dvc, global.key_attackCV) || gamepad_button_check_pressed(_dvc, gp_shoulderrb))
    key_shoot = 0
    key_shoot2 = 0
    key_start = (keyboard_check_pressed(global.key_startV) || gamepad_button_check_pressed(_dvc, global.key_startCV))
    key_escape = (keyboard_check_pressed(vk_escape) || gamepad_button_check(_dvc, gp_select))
    key_chainsaw = (keyboard_check(global.key_chainsawV) || gamepad_button_check(_dvc, global.key_chainsawCV) || gamepad_button_check(_dvc, gp_shoulderlb))
    key_chainsaw2 = (keyboard_check_pressed(global.key_chainsawV) || gamepad_button_check_pressed(_dvc, global.key_chainsawCV) || gamepad_button_check_pressed(_dvc, gp_shoulderlb))
    key_superjump = 0
    key_groundpound = 0
    key_groundpound2 = 0
    if (object_index == obj_player3 && state == (99 << 0))
    {
        var haxis = gamepad_axis_value(_dvc, gp_axislh)
        var vaxis = gamepad_axis_value(_dvc, gp_axislv)
        if (haxis != 0 || vaxis != 0)
        {
            var _dir = point_direction(0, 0, haxis, vaxis)
            trace(_dir)
            var _deadzone = 5
            if (_dir >= _deadzone && _dir <= (180 - _deadzone))
                key_up = 1
        }
    }
    if (gamepad_axis_value(_dvc, gp_axislh) > 0.5 || gamepad_axis_value(_dvc, gp_axislh) < -0.5 || gamepad_axis_value(_dvc, gp_axislv) > 0.5 || gamepad_axis_value(_dvc, gp_axislv) < -0.5)
        stickpressed = 1
    else
        stickpressed = 0
}

