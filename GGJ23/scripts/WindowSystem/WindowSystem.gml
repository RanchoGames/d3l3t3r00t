/*
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
- WINDOW INIT
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
*/

global.playablezone_startx = 1;
global.playablezone_starty = 1;
global.playablezone_endx = 12;
global.playablezone_endy = 8;

#macro PLAY_X1 global.playablezone_startx
#macro PLAY_Y1 global.playablezone_starty
#macro PLAY_X2 global.playablezone_endx
#macro PLAY_Y2 global.playablezone_endy
#macro PLAY_WIDTH global.playablezone_endx - global.playablezone_startx
#macro PLAY_HEIGHT global.playablezone_endy - global.playablezone_starty

global.surface_background = noone;
global.surface_update = 0;

global.shake_x = 0;
global.shake_y = 0;


/*
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
- WINDOW PLAYABLE ZONE
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
*/

// -- Collision

function collision_playablezone(x1,y1) {
	var inside = 0;
	
	if (x1>=PLAY_X1*GRID_SIZE && y1>=PLAY_Y1*GRID_SIZE
	&& x1<PLAY_X2*GRID_SIZE && y1<PLAY_Y2*GRID_SIZE) {
		inside = 1;
	}
	
	return inside;
	//return collision_rectangle(PLAY_X1*GRID_SIZE,PLAY_Y1*GRID_SIZE,PLAY_X2*GRID_SIZE,PLAY_Y2*GRID_SIZE,obj,0,0);
}


/*
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
- WINDOW DRAW
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
*/

function draw_window(x1,y1,x2,y2,wa) {
	var size_width = x2 - x1;
	var size_height = y2 - y1;
	x1 *= GRID_SIZE;
	y1 *= GRID_SIZE;
	x2 *= GRID_SIZE;
	y2 *= GRID_SIZE;
	
	var active_window = (wa == undefined ? 0 : 1);
	
	// -- Draw window
	var masx,masy;
	masx = (global.shake_x * active_window) * choose(-1,1);
	masy = (global.shake_y * active_window) * choose(-1,1);
	draw_sprite(sprWindow,0,x1-GRID_SIZE+masx,y1-GRID_SIZE+masy);
	draw_sprite(sprWindow,2,x2+masx,y1-GRID_SIZE+masy);
	draw_sprite(sprWindow,6,x1-GRID_SIZE+masx,y2+masy);
	draw_sprite(sprWindow,8,x2+masx,y2+masy);
	for (var i=0; i<size_width; i++) {
		draw_sprite(sprWindow,1,x1+(i*GRID_SIZE)+masx,y1-GRID_SIZE+masy);
		draw_sprite(sprWindow,7,x1+(i*GRID_SIZE)+masx,y2+masy);
	}
	
	for (var o=0; o<size_height; o++) {
		draw_sprite(sprWindow,3,x1-GRID_SIZE+masx,y1+(o*GRID_SIZE)+masy);
		draw_sprite(sprWindow,5,x2+masx,y1+(o*GRID_SIZE)+masy);
	}
	
	// -- Buttons
	draw_sprite(sprWindowButtons,0,x2-GRID_SIZE+masx,y1-GRID_SIZE+masy);
	draw_sprite(sprWindowButtons,1,x2+masx,y1-GRID_SIZE+masy);
	
	// -- Draw background
	draw_set_color(c_white);
	draw_rectangle(x1+masx,y1+masy,x2+masx,y2+masy,0);
	draw_set_color(c_white);
}

/*function draw_playablezone() {
	draw_window(PLAY_X1,PLAY_Y1,PLAY_X2,PLAY_Y2);
}*/


/*
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
- UPDATE PLAYABLE ZONE
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
*/

function window_update_playablezone(level) {
	PLAY_X1 = level_get_x1(level);
	PLAY_Y1 = level_get_y1(level);
	PLAY_X2 = level_get_x2(level);
	PLAY_Y2 = level_get_y2(level);
}


/*
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
- DRAW BACKGROUND LEVELS
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
*/

function window_draw_background() {
	if (global.surface_update) {
		if (!surface_exists(global.surface_background)) {
			global.surface_background = surface_create(room_width,room_height);
		}
	
		//draw_clear_alpha(global.bgcolor,0);
		surface_set_target(global.surface_background);
			for (var i=0; i<global.levels_total; i++) {
				var o = global.lvl_bg[i];
				if (o && (i!=LVLACTIVE)) {
					// -- Window
					var lvl_x1 = level_get_x1(i);
					var lvl_y1 = level_get_y1(i);
					var lvl_x2 = level_get_x2(i);
					var lvl_y2 = level_get_y2(i);
			
					draw_window(lvl_x1,lvl_y1,lvl_x2,lvl_y2);
					
					// -- Things
					var things = level_get_things(i);
					var things_total = ds_map_size(things);
					
					var lvl_x = lvl_x1 * GRID_SIZE;
					var lvl_y = lvl_y1 * GRID_SIZE;
					
					for (var i=0; i<things_total; i++) {
						var piece = things[? i];
		
						var piece_object	= piece.object;
						var piece_x			= lvl_x + (piece.x1 * GRID_SIZE);
						var piece_y			= lvl_y + (piece.y1 * GRID_SIZE);
						var piece_sprite	= object_get_sprite(piece.object);
						
						// - If it has special data
						var piece_subimg	= 0;
						if (piece.data != noone) {
							switch (piece_object) {
								case objFolder:
									piece_subimg	= piece.data[0];
								break;
							}
						}
						
						draw_sprite(piece_sprite,piece_subimg,piece_x,piece_y);
					}
					
				}
			}
		surface_reset_target();
		global.surface_update = 0;
	}
	
	draw_surface_ext(global.surface_background,0,0,1,1,0,c_white,.5);
	
	// -- Update shake
	global.shake_x = lerp(global.shake_x,0,.2);
	global.shake_y = lerp(global.shake_y,0,.2);
}

function window_update_background() {
	global.surface_update = 1;
}