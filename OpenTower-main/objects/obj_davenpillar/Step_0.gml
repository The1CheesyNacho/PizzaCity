if (obj_player.state == states.pizzathrow) {
    sprite_index = spr_hungrypillar_mouth;
    solid = true;
    if (floor(image_index) == 3)
		image_speed = 0;
}
else {
    framereset = 0;
    if (sprite_index != spr_hungrypillar_angry)
		sprite_index = spr_davenpillar;
    image_speed = 0.35;
}
if (toppineaten == 5) sprite_index = spr_hungrypillar_happy;
if (place_meeting((x + 1), y, obj_player) && (sprite_index != spr_hungrypillar_happy)) {
    sprite_index = spr_hungrypillar_angry;
    with (obj_player) {
        xscale = (-other.image_xscale);
        state = 58;
        hsp = ((-xscale) * 10);
        vsp = -6;
        image_index = 0;
    }
	solid = false
}