hsp = 0;
vsp = 0;
grav = 0.4;
throwed = 0;
image_speed = 0.35;
image_xscale = -1;
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
else if (global.onionfollow == 1)
    sprite_index = spr_toppinonion;
depth = -1;