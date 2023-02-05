/// @description Insert description here
// You can write your code in this editor

window_draw_background();

// -- Draw antivirus
if (LVLACTIVE >= global.lvl_antivirus) {
	var antivirus_x = (room_width/2)-(240/2);
	var antivirus_y = room_height-64-8;

	draw_window(((room_width/2)-(240/2))/GRID_SIZE,(room_height-64-8)/GRID_SIZE,((room_width/2)+(240/2))/GRID_SIZE,((room_height-64)+48-8)/GRID_SIZE,0,"Panda Antivirus");
	draw_sprite(sprAntivirus,0,antivirus_x,antivirus_y);

	for (i=0; i<(STTOTAL-ST); i++) {
		if (i<STTOTAL) {
			draw_sprite(sprAntivirus_Bar,0,antivirus_x+49+(i*24),antivirus_y+21);
		}
	}
}


// -- Draw active level
var active_x1 = level_get_x1(LVLACTIVE);
var active_x2 = level_get_x2(LVLACTIVE);
var active_y1 = level_get_y1(LVLACTIVE);
var active_y2 = level_get_y2(LVLACTIVE);
var active_title = level_get_name(LVLACTIVE);

draw_window(active_x1,active_y1,active_x2,active_y2,1,active_title);

//draw_playablezone();