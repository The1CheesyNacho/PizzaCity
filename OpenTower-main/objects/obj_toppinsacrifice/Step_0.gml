if (throwed == 1)
{
    if (vsp < 12)
        vsp += grav;
}
if (global.shroomfollow == 1)
    sprite_index = spr_toppinshroom_panic;
else if (global.cheesefollow == 1)
    sprite_index = spr_toppincheese_panic;
else if (global.tomatofollow == 1)
    sprite_index = spr_toppintomato_panic;
else if (global.sausagefollow == 1)
    sprite_index = spr_toppinsausage_panic;
else if (global.pineapplefollow == 1)
    sprite_index = spr_toppinpineapple_panic;
if place_meeting(x, y, obj_mouthhitbox)
{
    if (sprite_index == spr_toppinshroom_panic)
    {
        global.shroomfollow = 0;
        instance_destroy(obj_pizzakinshroom);
    }
    if (sprite_index == spr_toppincheese_panic)
    {
        global.cheesefollow = 0;
        instance_destroy(obj_pizzakincheese);
    }
    if (sprite_index == spr_toppintomato_panic)
    {
        global.tomatofollow = 0;
        instance_destroy(obj_pizzakintomato);
    }
    if (sprite_index == spr_toppinsausage_panic)
    {
        global.sausagefollow = 0;
        instance_destroy(obj_pizzakinsausage);
    }
    if (sprite_index == spr_toppinpineapple_panic)
    {
        global.pineapplefollow = 0;
        instance_destroy(obj_pizzakinpineapple);
    }
    if (sprite_index == spr_onion)
    {
        global.pineapplefollow = 0;
        instance_destroy(spr_toppinonion);
    }
	
    obj_davenpillar.eated = 1;
    obj_davenpillar.framereset = 0;
    obj_davenpillar.image_speed = 0.35;
    obj_davenpillar.toppineaten += 1;
    instance_destroy();
}
if place_meeting((x + floor(hsp)), y, obj_null)
{
    x = floor(x);
    while (!(place_meeting((x + sign(hsp)), y, obj_null)))
        x += sign(hsp);
    hsp = 0;
}
x += hsp;
if place_meeting(x, (y + floor(vsp)), obj_null)
{
    y = floor(y);
    while (!(place_meeting(x, (y + sign(vsp)), obj_null)))
        y += sign(vsp);
    vsp = 0;
}
y += floor(vsp);