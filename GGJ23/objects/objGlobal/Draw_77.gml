var extraWindow = (room==rmJuego ? 8 : 0);
draw_surface_ext(application_surface,extraWindow*WINDOW_SCALE,0,WINDOW_SCALE,WINDOW_SCALE,0,c_white,1);

if (PLAYING) {
	draw_set_color(global.bgcolor);
	draw_set_alpha(1);
	//draw_rectangle(0,0,8 * WINDOW_SCALE,room_height*WINDOW_SCALE-13,0)
	draw_set_color(c_white);
	draw_sprite_ext(sprClouds,1,0,0,2,2,0,c_white,1);

	draw_sprite_ext(sprBar,0,0,(room_height-13)*WINDOW_SCALE,WINDOW_SCALE,WINDOW_SCALE,0,c_white,1);

	var chour = string(current_hour);
	if (string_length(chour)==1) { chour = "0"+chour; }
	var cminute = string(current_minute);
	if (string_length(cminute)==1) { cminute = "0"+cminute; }
	var time = chour + ":" + cminute;

	draw_set_font(fntTitle);
	draw_set_color(make_color_rgb(42,37,43));
	draw_set_alpha(1);
	draw_text_transformed(24*WINDOW_SCALE,(room_height-15)*WINDOW_SCALE,"RanchOS",2,2,0);
	draw_text_transformed((room_width-28)*WINDOW_SCALE,(room_height-15)*WINDOW_SCALE,time,2,2,0);
	draw_set_font(fntPixel);

	if (global.screensaver_timer > 30){
		var ff = global.screensaver_timer mod sprite_get_number(sprScreensaver);
		draw_sprite_ext(sprBluescreen,ff,0,0,WINDOW_SCALE,WINDOW_SCALE,0,c_white,1);
	}

	if (ENDED) {
		draw_sprite_ext(sprBluescreen,((floor(global.ended_timer/16))%2==0 ? 0 : 1),0,0,WINDOW_SCALE,WINDOW_SCALE,0,c_white,1);
	}
	
}
else {
	if (room==rmInit) {
		draw_set_color(make_color_rgb(42,37,43));
		draw_set_alpha(1);
		draw_rectangle(0,0,8 * WINDOW_SCALE,room_height*WINDOW_SCALE,0);
		draw_set_color(c_white);
	}
	else {
		/*var colorFondo = (objIntro.ending ? make_color_rgb(42,37,43) : make_color_rgb(219,218,208));
		draw_set_color(colorFondo);
		draw_set_alpha(1);
		draw_rectangle(0,0,8 * WINDOW_SCALE,room_height*WINDOW_SCALE,0);
		draw_set_color(c_white);*/
	}	
}