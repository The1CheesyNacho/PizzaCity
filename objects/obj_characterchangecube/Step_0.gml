if (obj_player1.character == "P" && obj_player1.spotlight == 1)
    image_index = 0
else if (obj_player1.character == "N" && obj_player1.spotlight == 1)
    image_index = 2
else if (obj_player1.character == "F" && obj_player1.spotlight == 1)
    image_index = 1
if (place_meeting(x, y, obj_player) && activated == 0)
{
    with (obj_player1)
    {
        if (character == "P" && other.activated == 0)
        {
            y += 50
            character = "N"
            other.activated = 1
            vsp = 1
            other.alarm[0] = 50
            scr_characterspr()
            taunttimer = 20
            tauntstoredmovespeed = 0
            tauntstoredsprite = spr_fall
            tauntstoredstate = 58
            state = states.normal
            image_index = random_range(0, (sprite_get_number(spr_taunt) - 1))
            sprite_index = spr_taunt
            instance_create(x, y, obj_taunteffect)
        }
        if (character == "N" && other.activated == 0)
        {
            y += 50
            character = "M"
            other.activated = 1
            vsp = 1
            other.alarm[0] = 50
            scr_characterspr()
            taunttimer = 20
            tauntstoredmovespeed = 0
            tauntstoredsprite = spr_fall
            tauntstoredstate = 58
            state = states.ratmount
            image_index = random_range(0, (sprite_get_number(spr_taunt) - 1))
            sprite_index = spr_taunt
            instance_create(x, y, obj_taunteffect)
        }

        if (character == "M" && other.activated == 0)
        {
            y += 50
            character = "P"
            other.activated = 1
            vsp = 1
            other.alarm[0] = 50
            scr_characterspr()
            taunttimer = 20
            tauntstoredmovespeed = 0
            tauntstoredsprite = spr_fall
            tauntstoredstate = 58
            state = states.normal
            image_index = random_range(0, (sprite_get_number(spr_taunt) - 1))
            sprite_index = spr_taunt
            instance_create(x, y, obj_taunteffect)
        }
	}
}



