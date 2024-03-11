if (global.coop == 0)
{
    if (room == editor_room)
    {
    }
    player = (obj_player1.spotlight == 1 ? obj_player1 : obj_player2)
    if (!instance_exists(obj_pizzaball))
        targetgolf = noone
    if (collect_shake > 0)
        collect_shake *= 0.5
    if (healthshaketime > 0)
    {
        healthshaketime--
        healthshake = random_range(-2, 2)
    }
    if (healthshaketime == 0)
        healthshake = 0
    if (obj_player1.character == "V")
    {
        if (healthold != global.playerhealth)
        {
            playerhealthup = healthold < global.hp
            healthshaketime = 30
            healthold = global.playerhealth
        }
    }
    else if (obj_player1.character == "P")
    {
        if (healthold != global.hp)
        {
            playerhealthup = healthold < global.hp
            healthshaketime = 30
            healthold = global.hp
        }
    }
    if (global.coop == 1)
    {
        var p1 = player
        var p2 = (obj_player1.spotlight == 1 ? obj_player2 : obj_player1)
        p2pdistance = point_distance(p1.x, 0, p2.x, 0)
        p2pdistancex = (p1.x >= p2.x ? ((-p2pdistance) / 5) : (p2pdistance / 5))
    }
    else
        p2pdistancex = 0
    if (floor(image_index) == 10)
        shoving = 0
    if (room == strongcold_endscreen || room == Longintro || room == Mainmenu || room == rm_levelselect || room == rank_room || room == timesuproom || room == Realtitlescreen || room == characterselect || room == hub_loadingscreen || (string_copy(room_get_name(room), 1, 5) == "tower" && (!global.panic)))
        visible = false
    else
        visible = true
    if ((instance_exists(obj_debugcontroller) && (!obj_debugcontroller.showhud)) || (!global.option_hud))
        visible = false
    if (global.combo > 0)
    {
        comboend = 1
        var ct = global.combotime
        if (ct <= 40)
        {
            if (alarm[5] == -1)
            {
                if (ct >= 20)
                    alarm[5] = 12
                else
                    alarm[5] = 5
            }
        }
        else
            combobubblevisible = 1
    }
    else if comboend
    {
        comboend = 0
        event_perform(ev_alarm, 4)
    }
    if (shoving == 1 && image_index >= 3 && bang == 0)
    {
        with (instance_create(x, y, obj_fallingHUDface))
        {
            if ((obj_player1.spotlight == 0 && obj_player1.character == "P") || (obj_player1.spotlight == 1 && obj_player2.character == "P"))
            {
                sprite = 1783
                hsp = random_range(-1, -5)
            }
            else
            {
                sprite = 1690
                hsp = random_range(1, 5)
            }
        }
        bang = 1
    }
    if (shoving == 0)
        bang = 0
    if (global.seconds <= 0 && global.minutes <= 0 && ded == 0)
    {
        alarm[1] = -1
        if (global.miniboss || instance_exists(obj_toppinwarrior))
            alarm[2] = 1
        else
            alarm[3] = 1
        ded = 1
    }
    if (global.seconds > 59)
    {
        global.minutes += 1
        global.seconds -= 59
    }
    if global.timedgatetimer
    {
        if (global.timedgatetime > 0)
            global.timedgatetime--
        else
        {
            global.timedgatetime = 0
            global.timedgatetimer = 0
        }
    }
    if (!instance_exists(obj_ghostcollectibles))
    {
        if ((global.panic == 1 && global.minutes < 1) || player.sprite_index == spr_player_timesup)
        {
            shake_mag = 2
            shake_mag_acc = (3 / room_speed)
        }
        else if (global.panic == 1 && basement == 0)
        {
            shake_mag = 2
            shake_mag_acc = (3 / room_speed)
        }
    }
    if (shake_mag > 0)
    {
        shake_mag -= shake_mag_acc
        if (shake_mag < 0)
            shake_mag = 0
    }
    detachedby = -1
    detach = 0
    follow_golf = 0
    if (instance_exists(player) && (!lock) && player.state != (64 << 0) && player.state != (89 << 0))
    {
        switch state
        {
            case (0 << 0):
                var target = player
                var tx = target.x
                var ty = target.y
                if (target.state == (290 << 0))
                    ty = target.backtohubstarty
                if (target.cutscene || (target.collision_flags & (1 << 0)) > 0)
                {
                    if (player.state == (146 << 0) && room == tower_pizzafacehall)
                        chargecamera = Approach(chargecamera, 150, 8)
                    else
                        chargecamera = Approach(chargecamera, 0, 10)
                }
                else if (target.state == (104 << 0) || target.state == (121 << 0))
                {
                    var _targetcharge = (target.xscale * ((target.movespeed / 4) * 50))
                    var _tspeed = 0.3
                    chargecamera = Approach(chargecamera, _targetcharge, _tspeed)
                }
                else if (target.ratmount_movespeed > 2 && target.key_attack && (target.state == (191 << 0) || target.state == (192 << 0)))
                {
                    _targetcharge = (target.xscale * ((abs(target.hsp) / 4) * 70))
                    _tspeed = 0.3
                    chargecamera = Approach(chargecamera, _targetcharge, _tspeed)
                }
                else if ((abs(target.hsp) >= 16 || (target.state == (61 << 0) && target.tauntstoredmovespeed >= 16)) && player.state != (37 << 0) && player.state != (97 << 0))
                {
                    _targetcharge = (target.xscale * ((abs(target.hsp) / 4) * 50))
                    _tspeed = 2
                    if ((_targetcharge > 0 && chargecamera < 0) || (_targetcharge < 0 && chargecamera > 0))
                        _tspeed = 8
                    chargecamera = Approach(chargecamera, _targetcharge, _tspeed)
                }
                else if (target.state == (105 << 0))
                    chargecamera = Approach(chargecamera, 0, 10)
                else
                    chargecamera = Approach(chargecamera, 0, 6)
                var cam_width = camera_get_view_width(view_camera[0])
                var cam_height = camera_get_view_height(view_camera[0])
                if (targetgolf != noone && (!instance_exists(targetgolf)))
                    targetgolf = noone
                if (targetgolf == noone)
                {
                    if ((!global.coop) || room == characterselect || room == rm_levelselect || room == Realtitlescreen)
                    {
                        var cam_x = (((tx - (cam_width / 2)) + chargecamera) + p2pdistancex)
                        var cam_y = ((ty - (cam_height / 2)) - 50)
                        cam_x = clamp(cam_x, 0, (room_width - cam_width))
                        cam_y = clamp(cam_y, 0, (room_height - cam_height))
                        camera_zoom(1, 0.035)
                    }
                    else if (obj_player2.state != (18 << 0))
                    {
                        cam_x = (((obj_player1.x + obj_player2.x) / 2) - (cam_width / 2))
                        cam_y = (((obj_player1.y + obj_player2.y) / 2) - (cam_height / 2))
                        var disx = (abs((obj_player1.x - obj_player2.x)) / coop_zoom_width)
                        var disy = (abs((obj_player1.y - obj_player2.y)) / coop_zoom_height)
                        var dis = max(disx, disy)
                        dis = max(1, dis)
                        camera_zoom(dis, 0.035)
                    }
                }
                else
                {
                    var _px = 0
                    var _py = 0
                    if global.coop
                    {
                        _px = obj_player2.x
                        _py = obj_player2.y
                    }
                    cam_x = ((((obj_player1.x + targetgolf.x) + _px) / 2) - (cam_width / 2))
                    cam_y = (((((obj_player1.y + targetgolf.y) + _py) / 2) - (cam_height / 2)) - 50)
                    disx = (abs(((obj_player1.x - targetgolf.x) - _px)) / coop_zoom_width)
                    disy = (abs(((obj_player1.y - targetgolf.y) - _py)) / coop_zoom_height)
                    dis = max(disx, disy)
                    dis = max(1, dis)
                    camera_zoom(dis, 0.035)
                }
                if (shake_mag != 0)
                {
                    cam_x += irandom_range((-shake_mag), shake_mag)
                    cam_y += irandom_range((-shake_mag), shake_mag)
                }
                cx = (cam_x + (cam_width / 2))
                cy = (cam_y + (cam_height / 2))
                if (cam_width > room_width)
                    cam_x += ((cam_width - room_width) / 2)
                if (cam_height > room_height)
                    cam_y += ((cam_height - room_height) / 2)
                camera_set_view_pos(view_camera[0], cam_x, (cam_y + irandom_range((-shake_mag), shake_mag)))
                break
            case (299 << 0):
                cam_width = camera_get_view_width(view_camera[0])
                cam_height = camera_get_view_height(view_camera[0])
                tx = followtarget.x
                ty = (followtarget.y - 50)
                var dir = point_direction(x, y, followtarget.x, ty)
                cx = Approach(cx, followtarget.x, followspeed)
                cy = Approach(cy, ty, followspeed)
                if (abs((cx - followtarget.x)) <= 4 && abs((cy - ty)) <= 4)
                    state = (0 << 0)
                cam_x = (cx - (cam_width / 2))
                cam_y = (cy - (cam_height / 2))
                cam_x = clamp(cam_x, 0, (room_width - cam_width))
                cam_y = clamp(cam_y, 0, (room_height - cam_height))
                if (shake_mag != 0)
                {
                    cam_x += irandom_range((-shake_mag), shake_mag)
                    cam_y += irandom_range((-shake_mag), shake_mag)
                }
                if (cam_width > room_width)
                    cam_x += ((cam_width - room_width) / 2)
                if (cam_height > room_height)
                    cam_y += ((cam_height - room_height) / 2)
                camera_set_view_pos(view_camera[0], cam_x, (cam_y + irandom_range((-shake_mag), shake_mag)))
                break
        }

    }
}
if (global.coop == 1)
{
    if (global.lockedmpcamera == 0)
    {
        if (room == boss_room1 || room == boss_pepperman || room == boss_vigilante || room == boss_noise || room == boss_mrstick || room == boss_pizzaface || room == boss_pizzaface_p3 || room == boss_bee || room == boss_fakepep || room == boss_fakepepkey || room == boss_pizzafacefinale || room == boss_pizzafacehub || room == rank_room)
        {
            if (room == editor_room)
            {
            }
            if (obj_player1.spotlight == 1)
            {
                if (!instance_exists(obj_pizzaball))
                    targetgolf = noone
            }
            if (collect_shake > 0)
                collect_shake *= 0.5
            if (healthshaketime > 0)
            {
                healthshaketime--
                healthshake = random_range(-2, 2)
            }
            if (healthshaketime == 0)
                healthshake = 0
            if (obj_player1.character == "V")
            {
                if (healthold != global.playerhealth)
                {
                    playerhealthup = healthold < global.hp
                    healthshaketime = 30
                    healthold = global.playerhealth
                }
            }
            else if (obj_player1.character == "P")
            {
                if (healthold != global.hp)
                {
                    playerhealthup = healthold < global.hp
                    healthshaketime = 30
                    healthold = global.hp
                }
            }
            if (global.coop == 1)
            {
                if (obj_player1.spotlight == 1)
                {
                    p2pdistance = point_distance(obj_player1.x, 0, obj_player2.x, 0)
                    if (obj_player1.x >= obj_player2.x)
                        p2pdistancex = ((-p2pdistance) / 2)
                    else
                        p2pdistancex = (p2pdistance / 2)
                }
                else
                {
                    p2pdistance = point_distance(obj_player2.x, 0, obj_player1.x, 0)
                    if (obj_player2.x >= obj_player1.x)
                        p2pdistancex = ((-p2pdistance) / 2)
                    else
                        p2pdistancex = (p2pdistance / 2)
                }
            }
            else
                p2pdistancex = 0
            if (floor(image_index) == 10)
                shoving = 0
            if (room == strongcold_endscreen || room == Longintro || room == Mainmenu || room == rm_levelselect || room == rank_room || room == timesuproom || room == Realtitlescreen || room == characterselect || room == hub_loadingscreen || (string_copy(room_get_name(room), 1, 5) == "tower" && (!global.panic)))
                visible = false
            else
                visible = true
            if ((instance_exists(obj_debugcontroller) && (!obj_debugcontroller.showhud)) || (!global.option_hud))
                visible = false
            if (global.combo >= 10)
            {
                global.SAGEcombo10 = 1
                ini_open("saveData.ini")
                ini_write_string("SAGE2019", "combo10", 1)
                ini_close()
            }
            if (shoving == 1 && image_index >= 3 && bang == 0)
            {
                with (instance_create(x, y, obj_fallingHUDface))
                {
                    if ((obj_player1.spotlight == 0 && obj_player1.character == "P") || (obj_player1.spotlight == 1 && obj_player2.character == "P"))
                    {
                        sprite = 1026
                        hsp = random_range(-1, -5)
                    }
                    else
                    {
                        sprite = 954
                        hsp = random_range(1, 5)
                    }
                }
                bang = 1
            }
            if (shoving == 0)
                bang = 0
            if (room == timesuproom)
                timestop = 1
            if (global.seconds <= 0 && global.minutes <= 0 && ded == 0)
            {
                alarm[1] = -1
                alarm[2] = 3
                ded = 1
            }
            if (global.seconds < 0)
            {
                global.seconds = 59
                global.minutes -= 1
            }
            if (global.seconds > 59)
            {
                global.minutes += 1
                global.seconds -= 59
            }
            if ((global.panic == 1 && global.minutes < 1) || player.sprite_index == spr_player_timesup)
            {
                shake_mag = 2
                shake_mag_acc = (3 / room_speed)
            }
            else if (global.panic == 1 && basement == 0)
            {
                shake_mag = 2
                shake_mag_acc = (3 / room_speed)
            }
            if (shake_mag > 0)
            {
                shake_mag -= shake_mag_acc
                if (shake_mag < 0)
                    shake_mag = 0
            }
            if (instance_exists(player) && player.state != (44 << 0) && player.state != (63 << 0))
            {
                if (room != custom_lvl_room)
                {
                    target = player
                    var coopdistance = (distance_to_object(obj_player2) / 2)
                    if (player.state == (92 << 0) || player.state == (5 << 0) || player.state == (21 << 0) || player.state == (45 << 0))
                    {
                        if (chargecamera > (player.xscale * 100))
                            chargecamera -= 2
                        if (chargecamera < (player.xscale * 100))
                            chargecamera += 2
                        __view_set((0 << 0), 0, (((target.x - (__view_get((2 << 0), 0) / 2)) + chargecamera) + p2pdistancex))
                    }
                    else
                    {
                        if (chargecamera > 0)
                            chargecamera -= 2
                        if (chargecamera < 0)
                            chargecamera += 2
                        __view_set((0 << 0), 0, (((target.x - (__view_get((2 << 0), 0) / 2)) + chargecamera) + p2pdistancex))
                    }
                    __view_set((0 << 0), 0, clamp(__view_get((0 << 0), 0), 0, (room_width - __view_get((2 << 0), 0))))
                    __view_set((1 << 0), 0, (target.y - (__view_get((3 << 0), 0) / 2)))
                    __view_set((1 << 0), 0, clamp(__view_get((1 << 0), 0), 0, (room_height - __view_get((3 << 0), 0))))
                    if (shake_mag != 0)
                    {
                        __view_set((0 << 0), 0, (((target.x - (__view_get((2 << 0), 0) / 2)) + chargecamera) + p2pdistancex))
                        __view_set((0 << 0), 0, clamp(__view_get((0 << 0), 0), 0, (room_width - __view_get((2 << 0), 0))))
                        __view_set((1 << 0), 0, ((target.y - (__view_get((3 << 0), 0) / 2)) + irandom_range((-shake_mag), shake_mag)))
                        __view_set((1 << 0), 0, clamp(__view_get((1 << 0), 0), (0 + irandom_range((-shake_mag), shake_mag)), ((room_height - __view_get((3 << 0), 0)) + irandom_range((-shake_mag), shake_mag))))
                    }
                }
                else
                {
                    target = player
                    coopdistance = (distance_to_object(obj_player2) / 2)
                    if (player.state == (92 << 0) || player.state == (21 << 0) || player.state == (45 << 0))
                    {
                        if (chargecamera > (player.xscale * 100))
                            chargecamera -= 2
                        if (chargecamera < (player.xscale * 100))
                            chargecamera += 2
                        __view_set((0 << 0), 0, (((target.x - (__view_get((2 << 0), 0) / 2)) + chargecamera) + p2pdistancex))
                    }
                    else
                    {
                        if (chargecamera > 0)
                            chargecamera -= 2
                        if (chargecamera < 0)
                            chargecamera += 2
                        __view_set((0 << 0), 0, (((target.x - (__view_get((2 << 0), 0) / 2)) + chargecamera) + p2pdistancex))
                    }
                    if (bound_camera == 1)
                    {
                        __view_set((0 << 0), 0, clamp(__view_get((0 << 0), 0), obj_player.cam.x, ((obj_player.cam.x + obj_player.cam_width) - __view_get((2 << 0), 0))))
                        __view_set((1 << 0), 0, (target.y - (__view_get((3 << 0), 0) / 2)))
                        __view_set((1 << 0), 0, clamp(__view_get((1 << 0), 0), obj_player.cam.y, ((obj_player.cam.y + obj_player.cam_height) - __view_get((3 << 0), 0))))
                        if (shake_mag != 0)
                        {
                            __view_set((0 << 0), 0, (((target.x - (__view_get((2 << 0), 0) / 2)) + chargecamera) + p2pdistancex))
                            __view_set((0 << 0), 0, clamp(__view_get((0 << 0), 0), obj_player.cam.x, ((obj_player.cam.x + obj_player.cam_width) - __view_get((2 << 0), 0))))
                            __view_set((1 << 0), 0, ((target.y - (__view_get((3 << 0), 0) / 2)) + irandom_range((-shake_mag), shake_mag)))
                            __view_set((1 << 0), 0, clamp(__view_get((1 << 0), 0), (obj_player.cam.y + irandom_range((-shake_mag), shake_mag)), (((obj_player.cam.y + obj_player.cam_height) - __view_get((3 << 0), 0)) + irandom_range((-shake_mag), shake_mag))))
                        }
                        if (obj_player.cam != noone)
                        {
                            instance_deactivate_object(obj_minijohn_hitbox)
                            instance_deactivate_object(obj_pepgoblin_kickhitbox)
                            instance_deactivate_object(obj_forkhitbox)
                            instance_deactivate_object(obj_baddiecollisionbox)
                            instance_deactivate_object(obj_baddie)
                            offset = 64
                            instance_activate_region((obj_player.cam.x - offset), (obj_player.cam.y - offset), (obj_player.cam_width + offset), (obj_player.cam_height + offset), true)
                        }
                    }
                    else
                    {
                        __view_set((1 << 0), 0, (target.y - (__view_get((3 << 0), 0) / 2)))
                        if (shake_mag != 0)
                        {
                            __view_set((0 << 0), 0, (((target.x - (__view_get((2 << 0), 0) / 2)) + chargecamera) + p2pdistancex))
                            __view_set((1 << 0), 0, ((target.y - (__view_get((3 << 0), 0) / 2)) + irandom_range((-shake_mag), shake_mag)))
                        }
                    }
                }
            }
        }
        else
        {
            if (room == editor_room)
            {
            }
            if (obj_player1.spotlight == 1)
            {
                if (!instance_exists(obj_pizzaball))
                    targetgolf = noone
            }
            if (collect_shake > 0)
                collect_shake *= 0.5
            if (healthshaketime > 0)
            {
                healthshaketime--
                healthshake = random_range(-2, 2)
            }
            if (healthshaketime == 0)
                healthshake = 0
            if (obj_player1.character == "V")
            {
                if (healthold != global.playerhealth)
                {
                    playerhealthup = healthold < global.hp
                    healthshaketime = 30
                    healthold = global.playerhealth
                }
            }
            else if (obj_player1.character == "P")
            {
                if (healthold != global.hp)
                {
                    playerhealthup = healthold < global.hp
                    healthshaketime = 30
                    healthold = global.hp
                }
            }
            if (global.coop == 1)
            {
                if (obj_player1.spotlight == 1)
                {
                    p2pdistance = point_distance(obj_player1.x, 0, obj_player2.x, 0)
                    if (obj_player1.x >= obj_player2.x)
                        p2pdistancex = ((-p2pdistance) / 2)
                    else
                        p2pdistancex = (p2pdistance / 2)
                }
                else
                {
                    p2pdistance = point_distance(obj_player2.x, 0, obj_player1.x, 0)
                    if (obj_player2.x >= obj_player1.x)
                        p2pdistancex = ((-p2pdistance) / 2)
                    else
                        p2pdistancex = (p2pdistance / 2)
                }
            }
            else
                p2pdistancex = 0
            if (floor(image_index) == 10)
                shoving = 0
            if (room == strongcold_endscreen || room == Longintro || room == Mainmenu || room == rm_levelselect || room == rank_room || room == timesuproom || room == Realtitlescreen || room == characterselect || room == hub_loadingscreen || (string_copy(room_get_name(room), 1, 5) == "tower" && (!global.panic)))
                visible = false
            else
                visible = true
            if ((instance_exists(obj_debugcontroller) && (!obj_debugcontroller.showhud)) || (!global.option_hud))
                visible = false
            if (global.combo >= 10)
            {
                global.SAGEcombo10 = 1
                ini_open("saveData.ini")
                ini_write_string("SAGE2019", "combo10", 1)
                ini_close()
            }
            if (shoving == 1 && image_index >= 3 && bang == 0)
            {
                with (instance_create(x, y, obj_fallingHUDface))
                {
                    if ((obj_player1.spotlight == 0 && obj_player1.character == "P") || (obj_player1.spotlight == 1 && obj_player2.character == "P"))
                    {
                        sprite = 1026
                        hsp = random_range(-1, -5)
                    }
                    else
                    {
                        sprite = 954
                        hsp = random_range(1, 5)
                    }
                }
                bang = 1
            }
            if (shoving == 0)
                bang = 0
            if (room == timesuproom)
                timestop = 1
            if (global.seconds <= 0 && global.minutes <= 0 && ded == 0)
            {
                alarm[1] = -1
                alarm[2] = 3
                ded = 1
            }
            if (global.seconds < 0)
            {
                global.seconds = 59
                global.minutes -= 1
            }
            if (global.seconds > 59)
            {
                global.minutes += 1
                global.seconds -= 59
            }
            if ((global.panic == 1 && global.minutes < 1) || player.sprite_index == spr_player_timesup)
            {
                shake_mag = 2
                shake_mag_acc = (3 / room_speed)
            }
            else if (global.panic == 1 && basement == 0)
            {
                shake_mag = 2
                shake_mag_acc = (3 / room_speed)
            }
            if (shake_mag > 0)
            {
                shake_mag -= shake_mag_acc
                if (shake_mag < 0)
                    shake_mag = 0
            }
            if (instance_exists(player) && player.state != (44 << 0) && player.state != (63 << 0))
            {
                if (room != custom_lvl_room)
                {
                    target = player
                    coopdistance = (distance_to_object(obj_player2) / 2)
                    if (player.state == (92 << 0) || player.state == (5 << 0) || player.state == (21 << 0) || player.state == (45 << 0))
                    {
                        if (chargecamera > (player.xscale * 100))
                            chargecamera -= 2
                        if (chargecamera < (player.xscale * 100))
                            chargecamera += 2
                        __view_set((0 << 0), 0, (((target.x - (__view_get((2 << 0), 0) / 2)) + chargecamera) + p2pdistancex))
                    }
                    else
                    {
                        if (chargecamera > 0)
                            chargecamera -= 2
                        if (chargecamera < 0)
                            chargecamera += 2
                        __view_set((0 << 0), 0, (((target.x - (__view_get((2 << 0), 0) / 2)) + chargecamera) + p2pdistancex))
                    }
                    __view_set((0 << 0), 0, clamp(__view_get((0 << 0), 0), 0, (room_width - __view_get((2 << 0), 0))))
                    __view_set((1 << 0), 0, (target.y - (__view_get((3 << 0), 0) / 2)))
                    __view_set((1 << 0), 0, clamp(__view_get((1 << 0), 0), 0, (room_height - __view_get((3 << 0), 0))))
                    if (shake_mag != 0)
                    {
                        __view_set((0 << 0), 0, (((target.x - (__view_get((2 << 0), 0) / 2)) + chargecamera) + p2pdistancex))
                        __view_set((0 << 0), 0, clamp(__view_get((0 << 0), 0), 0, (room_width - __view_get((2 << 0), 0))))
                        __view_set((1 << 0), 0, ((target.y - (__view_get((3 << 0), 0) / 2)) + irandom_range((-shake_mag), shake_mag)))
                        __view_set((1 << 0), 0, clamp(__view_get((1 << 0), 0), (0 + irandom_range((-shake_mag), shake_mag)), ((room_height - __view_get((3 << 0), 0)) + irandom_range((-shake_mag), shake_mag))))
                    }
                }
                else
                {
                    target = player
                    coopdistance = (distance_to_object(obj_player2) / 2)
                    if (player.state == (92 << 0) || player.state == (21 << 0) || player.state == (45 << 0))
                    {
                        if (chargecamera > (player.xscale * 100))
                            chargecamera -= 2
                        if (chargecamera < (player.xscale * 100))
                            chargecamera += 2
                        __view_set((0 << 0), 0, (((target.x - (__view_get((2 << 0), 0) / 2)) + chargecamera) + p2pdistancex))
                    }
                    else
                    {
                        if (chargecamera > 0)
                            chargecamera -= 2
                        if (chargecamera < 0)
                            chargecamera += 2
                        __view_set((0 << 0), 0, (((target.x - (__view_get((2 << 0), 0) / 2)) + chargecamera) + p2pdistancex))
                    }
                    if (bound_camera == 1)
                    {
                        __view_set((0 << 0), 0, clamp(__view_get((0 << 0), 0), obj_player.cam.x, ((obj_player.cam.x + obj_player.cam_width) - __view_get((2 << 0), 0))))
                        __view_set((1 << 0), 0, (target.y - (__view_get((3 << 0), 0) / 2)))
                        __view_set((1 << 0), 0, clamp(__view_get((1 << 0), 0), obj_player.cam.y, ((obj_player.cam.y + obj_player.cam_height) - __view_get((3 << 0), 0))))
                        if (shake_mag != 0)
                        {
                            __view_set((0 << 0), 0, (((target.x - (__view_get((2 << 0), 0) / 2)) + chargecamera) + p2pdistancex))
                            __view_set((0 << 0), 0, clamp(__view_get((0 << 0), 0), obj_player.cam.x, ((obj_player.cam.x + obj_player.cam_width) - __view_get((2 << 0), 0))))
                            __view_set((1 << 0), 0, ((target.y - (__view_get((3 << 0), 0) / 2)) + irandom_range((-shake_mag), shake_mag)))
                            __view_set((1 << 0), 0, clamp(__view_get((1 << 0), 0), (obj_player.cam.y + irandom_range((-shake_mag), shake_mag)), (((obj_player.cam.y + obj_player.cam_height) - __view_get((3 << 0), 0)) + irandom_range((-shake_mag), shake_mag))))
                        }
                        if (obj_player.cam != noone)
                        {
                            instance_deactivate_object(obj_minijohn_hitbox)
                            instance_deactivate_object(obj_pepgoblin_kickhitbox)
                            instance_deactivate_object(obj_forkhitbox)
                            instance_deactivate_object(obj_baddiecollisionbox)
                            instance_deactivate_object(obj_baddie)
                            offset = 64
                            instance_activate_region((obj_player.cam.x - offset), (obj_player.cam.y - offset), (obj_player.cam_width + offset), (obj_player.cam_height + offset), true)
                        }
                    }
                    else
                    {
                        __view_set((1 << 0), 0, (target.y - (__view_get((3 << 0), 0) / 2)))
                        if (shake_mag != 0)
                        {
                            __view_set((0 << 0), 0, (((target.x - (__view_get((2 << 0), 0) / 2)) + chargecamera) + p2pdistancex))
                            __view_set((1 << 0), 0, ((target.y - (__view_get((3 << 0), 0) / 2)) + irandom_range((-shake_mag), shake_mag)))
                        }
                    }
                }
            }
            if (obj_player1.state == (121 << 0))
            {
                if obj_player1.key_attack
                {
                    detachedby = 1
                    detach = 1
                }
                else
                {
                    detachedby = -1
                    detach = 0
                }
            }
            if (obj_player2.state == (121 << 0) && detachedby == -1)
            {
                if obj_player2.key_attack
                {
                    detachedby = 2
                    detach = 1
                }
                else
                {
                    detachedby = -1
                    detach = 0
                }
            }
            if (obj_player1.state != (121 << 0) && obj_player2.state != (121 << 0))
            {
                detachedby = -1
                detach = 0
            }
            var vw = camera_get_view_width(view_camera[0])
            var vh = camera_get_view_height(view_camera[0])
            targetzoom = min(2.5, targetzoom)
            var nw = lerp(vw, (targetzoom * original_cam_width), zoomspd)
            var nh = lerp(vh, (targetzoom * original_cam_height), zoomspd)
            disx = abs((obj_player1.x - obj_player2.x))
            disy = abs((obj_player1.y - obj_player2.y))
            if (nh > room_height)
                nh = room_height
            if (nw > room_width)
                nw = room_width
            if (nh < 0)
                nh = 0
            if (nw < 0)
                nw = 0
            camera_set_view_size(view_camera[0], nw, nh)
            if (instance_exists(player) && player.state != (46 << 0) && player.state != (65 << 0) && (!follow_golf) && (!detach))
            {
                if (room != custom_lvl_room)
                {
                    target = player
                    coopdistance = (distance_to_object(obj_player2) / 2)
                    if (player.state == (94 << 0) || player.state == (156 << 0) || player.state == (5 << 0) || player.state == (23 << 0) || player.state == (47 << 0))
                    {
                        _targetcharge = (player.xscale * ((player.movespeed / 4) * 50))
                        _tspeed = 2
                        if ((_targetcharge > 0 && chargecamera < 0) || (_targetcharge < 0 && chargecamera > 0))
                            _tspeed = 8
                        if (chargecamera > _targetcharge)
                            chargecamera -= _tspeed
                        if (chargecamera < _targetcharge)
                            chargecamera += _tspeed
                    }
                    else if (player.state == (81 << 0))
                        chargecamera = Approach(chargecamera, 0, 8)
                    else
                    {
                        if (chargecamera > 0)
                            chargecamera -= 2
                        if (chargecamera < 0)
                            chargecamera += 2
                    }
                    cam_width = camera_get_view_width(view_camera[0])
                    cam_height = camera_get_view_height(view_camera[0])
                    if ((!global.coop) || room == characterselect || room == rm_levelselect || room == Realtitlescreen)
                    {
                        cam_x = (((target.x - (cam_width / 2)) + chargecamera) + p2pdistancex)
                        cam_y = (target.y - (cam_height / 2))
                        cam_x = clamp(cam_x, 0, (room_width - cam_width))
                        cam_y = clamp(cam_y, 0, (room_height - cam_height))
                    }
                    else
                    {
                        cam_x = (((obj_player1.x + obj_player2.x) / 2) - (cam_width / 2))
                        cam_y = (((obj_player1.y + obj_player2.y) / 2) - (cam_height / 2))
                        disx = (abs((obj_player1.x - obj_player2.x)) / coop_zoom_width)
                        disy = (abs((obj_player1.y - obj_player2.y)) / coop_zoom_height)
                        dis = max(disx, disy)
                        dis = max(1, dis)
                        camera_zoom(dis, 0.035)
                    }
                    if (shake_mag != 0)
                    {
                        cam_x += irandom_range((-shake_mag), shake_mag)
                        cam_y += irandom_range((-shake_mag), shake_mag)
                    }
                    camera_set_view_pos(view_camera[0], cam_x, (cam_y + irandom_range((-shake_mag), shake_mag)))
                }
                else
                {
                    target = player
                    coopdistance = (distance_to_object(obj_player2) / 2)
                    if (player.state == (94 << 0) || player.state == (23 << 0) || player.state == (47 << 0))
                    {
                        if (chargecamera > (player.xscale * 100))
                            chargecamera -= 2
                        if (chargecamera < (player.xscale * 100))
                            chargecamera += 2
                    }
                    else
                    {
                        if (chargecamera > 0)
                            chargecamera -= 2
                        if (chargecamera < 0)
                            chargecamera += 2
                    }
                    cam_width = camera_get_view_width(view_camera[0])
                    cam_height = camera_get_view_height(view_camera[0])
                    cam_x = (((target.x - (cam_width / 2)) + chargecamera) + p2pdistancex)
                    cam_y = (target.y - (cam_height / 2))
                    var _room_x = 0
                    var _room_y = 0
                    var _room_width = room_width
                    var _room_height = room_height
                    if bound_camera
                    {
                        _room_x = obj_player.cam.x
                        _room_y = obj_player.cam.y
                        _room_width = obj_player.cam_width
                        _room_height = obj_player.cam_height
                        if (obj_player.cam != noone)
                        {
                            instance_deactivate_object(obj_minijohn_hitbox)
                            instance_deactivate_object(obj_pepgoblin_kickhitbox)
                            instance_deactivate_object(obj_forkhitbox)
                            instance_deactivate_object(obj_baddiecollisionbox)
                            instance_deactivate_object(obj_baddie)
                            instance_activate_object(obj_inputAssigner)
                            offset = 64
                            instance_activate_region((_room_x - offset), (_room_y - offset), (_room_width + offset), (_room_height + offset), true)
                        }
                    }
                    if (shake_mag != 0)
                    {
                        cam_x += irandom_range((-shake_mag), shake_mag)
                        cam_y += irandom_range((-shake_mag), shake_mag)
                    }
                    camera_set_view_pos(view_camera[0], clamp(cam_x, 0, (_room_width - cam_width)), (clamp(cam_y, 0, (_room_height - cam_height)) + irandom_range((-shake_mag), shake_mag)))
                }
            }
            else if follow_golf
            {
                if (instance_exists(targetgolf) && targetgolf.thrown == 1)
                {
                    var _xx = targetgolf.x
                    var _yy = targetgolf.y
                    var _freecamera = 0
                    _room_x = 0
                    _room_y = 0
                    var _width = room_width
                    var _height = room_height
                    if (room == custom_lvl_room)
                    {
                        if (obj_player1.cam != noone)
                        {
                            _room_x = obj_player1.cam.x
                            _room_y = obj_player1.cam.y
                            _width = obj_player1.cam_width
                            _height = obj_player1.cam_height
                        }
                        else
                            _freecamera = 1
                    }
                    _width -= camera_get_view_width(view_camera[0])
                    _height -= camera_get_view_height(view_camera[0])
                    _xx -= (camera_get_view_width(view_camera[0]) / 2)
                    _yy -= (camera_get_view_height(view_camera[0]) / 2)
                    if _freecamera
                        camera_set_view_pos(view_camera[0], _xx, _yy)
                    else
                        camera_set_view_pos(view_camera[0], clamp(_xx, _room_x, _width), clamp(_yy, _room_y, _height))
                }
                else
                {
                    targetgolf = noone
                    follow_golf = 0
                }
            }
            else if detach
            {
                _xx = camera_get_view_x(view_camera[0])
                _yy = camera_get_view_y(view_camera[0])
                var _obj_player = obj_player1.id
                if (detachedby == 2)
                    _obj_player = obj_player2.id
                var _spd = 5
                with (_obj_player)
                {
                    if (key_left < 0)
                        _xx -= _spd
                    else if key_right
                        _xx += _spd
                    if key_up
                        _yy -= _spd
                    else if key_down
                        _yy += _spd
                }
                _freecamera = 0
                _room_x = 0
                _room_y = 0
                _width = room_width
                _height = room_height
                if (room == custom_lvl_room)
                {
                    if (obj_player1.cam != noone)
                    {
                        _room_x = obj_player1.cam.x
                        _room_y = obj_player1.cam.y
                        _width = obj_player1.cam_width
                        _height = obj_player1.cam_height
                    }
                    else
                        _freecamera = 1
                }
                _width -= camera_get_view_width(view_camera[0])
                _height -= camera_get_view_height(view_camera[0])
                if _freecamera
                    camera_set_view_pos(view_camera[0], _xx, _yy)
                else
                    camera_set_view_pos(view_camera[0], clamp(_xx, _room_x, _width), clamp(_yy, _room_y, _height))
            }
        }
    }
    else if (room == editor_room)
    {
    }
    if (obj_player1.spotlight == 1)
    {
        if (!instance_exists(obj_pizzaball))
            targetgolf = -4
    }
    if (collect_shake > 0)
        collect_shake *= 0.5
    if (healthshaketime > 0)
    {
        healthshaketime--
        healthshake = random_range(-2, 2)
    }
    if (healthshaketime == 0)
        healthshake = 0
    if (obj_player1.character == "V")
    {
        if (healthold != global.playerhealth)
        {
            playerhealthup = healthold < global.hp
            healthshaketime = 30
            healthold = global.playerhealth
        }
    }
    else if (obj_player1.character == "P")
    {
        if (healthold != global.hp)
        {
            playerhealthup = healthold < global.hp
            healthshaketime = 30
            healthold = global.hp
        }
    }
    if (global.coop == 1)
    {
        if (obj_player1.spotlight == 1)
        {
            p2pdistance = point_distance(obj_player1.x, 0, obj_player2.x, 0)
            if (obj_player1.x >= obj_player2.x)
                p2pdistancex = ((-p2pdistance) / 2)
            else
                p2pdistancex = (p2pdistance / 2)
        }
        else
        {
            p2pdistance = point_distance(obj_player2.x, 0, obj_player1.x, 0)
            if (obj_player2.x >= obj_player1.x)
                p2pdistancex = ((-p2pdistance) / 2)
            else
                p2pdistancex = (p2pdistance / 2)
        }
    }
    else
        p2pdistancex = 0
    if (floor(image_index) == 10)
        shoving = 0
    if (room == strongcold_endscreen || room == Longintro || room == Mainmenu || room == rm_levelselect || room == rank_room || room == timesuproom || room == Realtitlescreen || room == characterselect || room == hub_loadingscreen || (string_copy(room_get_name(room), 1, 5) == "tower" && (!global.panic)))
        visible = false
    else
        visible = true
    if ((instance_exists(obj_debugcontroller) && (!obj_debugcontroller.showhud)) || (!global.option_hud))
        visible = false
    if (global.combo >= 10)
    {
        global.SAGEcombo10 = 1
        ini_open("saveData.ini")
        ini_write_string("SAGE2019", "combo10", 1)
        ini_close()
    }
    if (shoving == 1 && image_index >= 3 && bang == 0)
    {
        with (instance_create(x, y, obj_fallingHUDface))
        {
            if ((obj_player1.spotlight == 0 && obj_player1.character == "P") || (obj_player1.spotlight == 1 && obj_player2.character == "P"))
            {
                sprite = 1026
                hsp = random_range(-1, -5)
            }
            else
            {
                sprite = 954
                hsp = random_range(1, 5)
            }
        }
        bang = 1
    }
    if (shoving == 0)
        bang = 0
    if (room == timesuproom)
        timestop = 1
    if (global.seconds <= 0 && global.minutes <= 0 && ded == 0)
    {
        alarm[1] = -1
        alarm[2] = 3
        ded = 1
    }
    if (global.seconds < 0)
    {
        global.seconds = 59
        global.minutes -= 1
    }
    if (global.seconds > 59)
    {
        global.minutes += 1
        global.seconds -= 59
    }
    if ((global.panic == 1 && global.minutes < 1) || player.sprite_index == spr_player_timesup)
    {
        shake_mag = 2
        shake_mag_acc = (3 / room_speed)
    }
    else if (global.panic == 1 && basement == 0)
    {
        shake_mag = 2
        shake_mag_acc = (3 / room_speed)
    }
    if (shake_mag > 0)
    {
        shake_mag -= shake_mag_acc
        if (shake_mag < 0)
            shake_mag = 0
    }
    if (instance_exists(player) && player.state != (44 << 0) && player.state != (63 << 0))
    {
        if (room != custom_lvl_room)
        {
            target = player
            coopdistance = (distance_to_object(obj_player2) / 2)
            if (player.state == (92 << 0) || player.state == (5 << 0) || player.state == (21 << 0) || player.state == (45 << 0))
            {
                if (chargecamera > (player.xscale * 100))
                    chargecamera -= 2
                if (chargecamera < (player.xscale * 100))
                    chargecamera += 2
                __view_set((0 << 0), 0, (((target.x - (__view_get((2 << 0), 0) / 2)) + chargecamera) + p2pdistancex))
            }
            else
            {
                if (chargecamera > 0)
                    chargecamera -= 2
                if (chargecamera < 0)
                    chargecamera += 2
                __view_set((0 << 0), 0, (((target.x - (__view_get((2 << 0), 0) / 2)) + chargecamera) + p2pdistancex))
            }
            __view_set((0 << 0), 0, clamp(__view_get((0 << 0), 0), 0, (room_width - __view_get((2 << 0), 0))))
            __view_set((1 << 0), 0, (target.y - (__view_get((3 << 0), 0) / 2)))
            __view_set((1 << 0), 0, clamp(__view_get((1 << 0), 0), 0, (room_height - __view_get((3 << 0), 0))))
            if (shake_mag != 0)
            {
                __view_set((0 << 0), 0, (((target.x - (__view_get((2 << 0), 0) / 2)) + chargecamera) + p2pdistancex))
                __view_set((0 << 0), 0, clamp(__view_get((0 << 0), 0), 0, (room_width - __view_get((2 << 0), 0))))
                __view_set((1 << 0), 0, ((target.y - (__view_get((3 << 0), 0) / 2)) + irandom_range((-shake_mag), shake_mag)))
                __view_set((1 << 0), 0, clamp(__view_get((1 << 0), 0), (0 + irandom_range((-shake_mag), shake_mag)), ((room_height - __view_get((3 << 0), 0)) + irandom_range((-shake_mag), shake_mag))))
            }
        }
        else
        {
            target = player
            coopdistance = (distance_to_object(obj_player2) / 2)
            if (player.state == (92 << 0) || player.state == (21 << 0) || player.state == (45 << 0))
            {
                if (chargecamera > (player.xscale * 100))
                    chargecamera -= 2
                if (chargecamera < (player.xscale * 100))
                    chargecamera += 2
                __view_set((0 << 0), 0, (((target.x - (__view_get((2 << 0), 0) / 2)) + chargecamera) + p2pdistancex))
            }
            else
            {
                if (chargecamera > 0)
                    chargecamera -= 2
                if (chargecamera < 0)
                    chargecamera += 2
                __view_set((0 << 0), 0, (((target.x - (__view_get((2 << 0), 0) / 2)) + chargecamera) + p2pdistancex))
            }
            if (bound_camera == 1)
            {
                __view_set((0 << 0), 0, clamp(__view_get((0 << 0), 0), obj_player.cam.x, ((obj_player.cam.x + obj_player.cam_width) - __view_get((2 << 0), 0))))
                __view_set((1 << 0), 0, (target.y - (__view_get((3 << 0), 0) / 2)))
                __view_set((1 << 0), 0, clamp(__view_get((1 << 0), 0), obj_player.cam.y, ((obj_player.cam.y + obj_player.cam_height) - __view_get((3 << 0), 0))))
                if (shake_mag != 0)
                {
                    __view_set((0 << 0), 0, (((target.x - (__view_get((2 << 0), 0) / 2)) + chargecamera) + p2pdistancex))
                    __view_set((0 << 0), 0, clamp(__view_get((0 << 0), 0), obj_player.cam.x, ((obj_player.cam.x + obj_player.cam_width) - __view_get((2 << 0), 0))))
                    __view_set((1 << 0), 0, ((target.y - (__view_get((3 << 0), 0) / 2)) + irandom_range((-shake_mag), shake_mag)))
                    __view_set((1 << 0), 0, clamp(__view_get((1 << 0), 0), (obj_player.cam.y + irandom_range((-shake_mag), shake_mag)), (((obj_player.cam.y + obj_player.cam_height) - __view_get((3 << 0), 0)) + irandom_range((-shake_mag), shake_mag))))
                }
                if (obj_player.cam != noone)
                {
                    instance_deactivate_object(obj_minijohn_hitbox)
                    instance_deactivate_object(obj_pepgoblin_kickhitbox)
                    instance_deactivate_object(obj_forkhitbox)
                    instance_deactivate_object(obj_baddiecollisionbox)
                    instance_deactivate_object(obj_baddie)
                    offset = 64
                    instance_activate_region((obj_player.cam.x - offset), (obj_player.cam.y - offset), (obj_player.cam_width + offset), (obj_player.cam_height + offset), true)
                }
            }
            else
            {
                __view_set((1 << 0), 0, (target.y - (__view_get((3 << 0), 0) / 2)))
                if (shake_mag != 0)
                {
                    __view_set((0 << 0), 0, (((target.x - (__view_get((2 << 0), 0) / 2)) + chargecamera) + p2pdistancex))
                    __view_set((1 << 0), 0, ((target.y - (__view_get((3 << 0), 0) / 2)) + irandom_range((-shake_mag), shake_mag)))
                }
            }
        }
    }
}
