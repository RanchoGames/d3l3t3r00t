// -- Draw images
for (i=1; i<strip_total; i++) {
	var shx,shy;
	shx = 0;
	shy = 0;
	if (i==7) {
		shx = 3 * random_range(-1,1);
		shy = 3 * random_range(-1,1);
	}
	
	draw_sprite_ext(image[i],0,shx,shy,1,1,0,c_white,strip_alpha[i]);
}

if (ending) {
	draw_set_color(make_color_rgb(42,37,43));
	draw_set_alpha(1);
	draw_rectangle(0,0,room_width,room_height,0);
	draw_set_color(c_white);
}