image_speed = 0.35;
mask_index = spr_playerPM_idle;
show = false;
donepanic = false;
wave_timer = 0;
text = "";
text_borderpad = 32;
text_contentpad = 16;
text_ystart = text_borderpad;
text_y = -200;
tex_x = 0;
text_state = states.titlescreen;
text_xscale = (SCREEN_WIDTH - 64) / sprite_get_width(spr_tutorialbubble);
text_oldxscale = text_xscale;
text_yscale = 1;
text_sprite_width = sprite_get_width(spr_tutorialbubble);
text_sprite_height = sprite_get_height(spr_tutorialbubble);
text_wave_x = 0;
text_wave_y = 0;
text_arr = -4;
text_dir = 1;
background_spr = bg_pepperman;
bubble_spr = spr_tutorialbubble;
text_color = 0;
surfclip = -4;
surffinal = -4;
showgranny = true;
change_y = true;
alarm[0] = 1;
depth = 10;
voicecooldown = 0;
