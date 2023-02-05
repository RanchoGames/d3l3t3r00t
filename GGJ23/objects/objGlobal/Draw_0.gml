window_draw_img();

if (global.debug) {
	// -- GRID
	draw_set_color(c_gray);
	draw_set_alpha(.2);
	
	// -- Horizontal lines
	for (i=0; i<(room_width/GRID_SIZE); i++) {
		draw_line(i*GRID_SIZE,0,i*GRID_SIZE,room_height);
	}
	
	// -- Vertical lines
	for (o=0; o<(room_height/GRID_SIZE); o++) {
		draw_line(0,o*GRID_SIZE,room_width,o*GRID_SIZE);
	}
	
	draw_set_alpha(1);
	draw_set_color(c_white);
	
	// -- GLOBALS
	draw_set_color(c_black);
	draw_text(0,0,"Turn: "+string(TU));
	draw_text(0,16,"Turn timer: "+string(TUTIMER));
	draw_text(0,32,"Steps: "+string(global.steps));
	draw_text(0,room_height-16,"Level: "+string(LVLACTIVE));
	
	draw_text(0,room_height-32,string(global.lvl_bg[0])+","+string(global.lvl_bg[1])+","+string(global.lvl_bg[2]));
}