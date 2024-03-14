if surface_exists(surfclip)
	surface_free(surfclip);
if surface_exists(surffinal)
	surface_free(surffinal);
var p = 1;
var l = string_length(displaytext);
var old_text = displaytext;
displaytext = "";
for (font = lang_get_font("tutorialfont"); p <= l; p++)
{
	displaytext = string_insert(string_char_at(old_text, p), displaytext, p + 1);
	displaytext = scr_separate_text(displaytext, font, (text_sprite_width * text_xscale) - (text_contentpad * 2));
}
text_yscale = (string_height(displaytext) + (text_contentpad * 2)) / text_sprite_height;
if (text_yscale < 1)
	text_yscale = 1;
if (change_y)
	text_y = -(text_yscale * text_sprite_height);
else
	change_y = true;
text_oldxscale = text_xscale;
draw_set_font(font);
text_arr = scr_compile_icon_text(displaytext);
