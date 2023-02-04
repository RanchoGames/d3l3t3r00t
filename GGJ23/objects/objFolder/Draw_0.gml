draw_sprite(sprite_index,tipo,x,y);

if (global.debug) {
	draw_set_color(c_black);
	draw_text(x,y+24,"Go to " + string(goto));
	draw_set_color(c_white);
}