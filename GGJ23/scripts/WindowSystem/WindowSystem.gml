/*
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
- WINDOW INIT
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
*/

global.playablezone_startx = 2;
global.playablezone_starty = 2;
global.playablezone_endx = 5;
global.playablezone_endy = 5;

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

global.images = ds_map_create();
#macro IMG global.images


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

function draw_window(x1,y1,x2,y2,wa,tl) {
	var size_width = x2 - x1;
	var size_height = y2 - y1;
	x1 *= GRID_SIZE;
	y1 *= GRID_SIZE;
	x2 *= GRID_SIZE;
	y2 *= GRID_SIZE;
	
	var active_window = (wa == undefined ? 0 : wa);
	var title = (tl == undefined ? noone : tl);
	
	// -- Draw window
	var masx,masy,isActive,mySprite,opacity;
	var isActive = (active_window==1 ? 1 : 0);
	masx = (global.shake_x * isActive) * choose(-1,1);
	masy = (global.shake_y * isActive) * choose(-1,1);
	mySprite = (wa==2 ? sprWindowBack : sprWindow);
	opacity = (wa==3 ? 1 : 1);
	
	draw_sprite_ext(mySprite,0,x1-GRID_SIZE+masx,y1-GRID_SIZE+masy,1,1,0,c_white,opacity);
	
	if (isActive) {
		draw_sprite(sprWindow,2,x2+masx+1,y1-GRID_SIZE+masy+1);
		draw_sprite(sprWindow,6,x1-GRID_SIZE+masx+1,y2+masy+1);
		draw_sprite_ext(sprWindow,8,x2+masx+1,y2+masy+1,1,1,0,c_black,1);
		
		for (var i=0; i<size_width; i++) {
			draw_sprite(sprWindow,7,x1+(i*GRID_SIZE)+masx+1,y2+masy+1);
		}
		
		for (var o=0; o<size_height; o++) {
			draw_sprite(sprWindow,5,x2+masx+1,y1+(o*GRID_SIZE)+masy+1);
		}
	}
	
	draw_sprite_ext(mySprite,2,x2+masx,y1-GRID_SIZE+masy,1,1,0,c_white,opacity);
	draw_sprite_ext(mySprite,6,x1-GRID_SIZE+masx,y2+masy,1,1,0,c_white,opacity);
	draw_sprite_ext(mySprite,8,x2+masx,y2+masy,1,1,0,c_white,opacity);
	
	for (var i=0; i<size_width; i++) {
		draw_sprite_ext(mySprite,1,x1+(i*GRID_SIZE)+masx,y1-GRID_SIZE+masy,1,1,0,c_white,opacity);
		draw_sprite_ext(mySprite,7,x1+(i*GRID_SIZE)+masx,y2+masy,1,1,0,c_white,opacity);
	}
	
	for (var o=0; o<size_height; o++) {
		draw_sprite_ext(mySprite,3,x1-GRID_SIZE+masx,y1+(o*GRID_SIZE)+masy,1,1,0,c_white,opacity);
		draw_sprite_ext(mySprite,5,x2+masx,y1+(o*GRID_SIZE)+masy,1,1,0,c_white,opacity);
	}
	
	// -- Buttons
	if (wa!=2) {
		draw_sprite_ext(sprWindowButtons,0,x2-GRID_SIZE+masx,y1-GRID_SIZE+masy,1,1,0,c_white,opacity);
		draw_sprite_ext(sprWindowButtons,1,x2+masx,y1-GRID_SIZE+masy,1,1,0,c_white,opacity);
	}
	else {
		draw_sprite_ext(sprWindowButtonsBack,0,x2-GRID_SIZE+masx,y1-GRID_SIZE+masy,1,1,0,c_white,opacity);
		draw_sprite_ext(sprWindowButtonsBack,1,x2+masx,y1-GRID_SIZE+masy,1,1,0,c_white,opacity);
	}

	
	// -- Draw background
	if (wa==2) { draw_set_color(make_color_rgb(213,212,203)); }
	else { draw_set_color(make_color_rgb(222,221,212)); }
	draw_set_alpha(opacity);
	draw_rectangle(x1+masx,y1+masy,x2+masx,y2+masy,0);
	draw_set_alpha(1);
	draw_set_color(c_white);
	
	
	// -- Title
	if (title != noone) {
		draw_set_font(fntTitle);
		if (wa==2) { draw_set_color(make_color_rgb(120,106,123)); }
		else { draw_set_color(make_color_rgb(42,37,43)); }
		draw_set_alpha(opacity);
		draw_text(x1+masx,y1-18+masy,title);
		draw_set_alpha(1);
		draw_set_font(fntPixel);
	}
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
		draw_clear_alpha(c_white,0);
			for (var q=0; q<global.levels_total; q++) {
				var o = global.lvl_bg[q];
				if (o && q!=LVLACTIVE) {
					// -- Window
					var lvl_x1 = level_get_x1(q);
					var lvl_y1 = level_get_y1(q);
					var lvl_x2 = level_get_x2(q);
					var lvl_y2 = level_get_y2(q);
					var lvl_title = level_get_name(q);
			
					draw_window(lvl_x1,lvl_y1,lvl_x2,lvl_y2,2,lvl_title);
					//draw_window(lvl_x1,lvl_y1,lvl_x2,lvl_y2,3,lvl_title);
					
					// -- Things
					var things = level_get_things(q);
					var things_total = ds_map_size(things);
					
					var lvl_x = lvl_x1 * GRID_SIZE;
					var lvl_y = lvl_y1 * GRID_SIZE;
					
					for (var i=0; i<things_total; i++) {
						var piece = things[? i];
		
						var piece_object	= piece.object;
						var piece_x			= lvl_x + (piece.x1 * GRID_SIZE);
						var piece_y			= lvl_y + (piece.y1 * GRID_SIZE);
						var piece_sprite	= object_get_sprite(piece.object);
						var should_draw		= 1;
						
						// - If it has special data
						var piece_subimg	= 0;
						if (piece.data != noone) {
							switch (piece_object) {
								case objFolder:
									piece_subimg	= piece.data[0];
								break;
								
								case objTXT:
									piece_subimg	= piece.data[3];
								break;
								
								case objDoor:
									var mystep		= piece.data[1];
									should_draw = (global.keys >= mystep ? 0 : 1);
								break;
								
								case objKey:
									var mykey		= piece.data[1];
									should_draw = (global.key[mykey] ? 0 : 1);
								break;
								
								case objBlock:
									if (piece.data!=undefined) {
										piece_subimg = piece.data;
									}
								break;
							}
						}
						
						if (piece_object == objPowerup) {
							piece_subimg = choose(0,1,2,3);
						}
						
						if (should_draw) {
							draw_sprite_ext(piece_sprite,piece_subimg,piece_x,piece_y,1,1,0,c_white,.5);
						}
					}
					
				}
			}
		surface_reset_target();
		global.surface_update = 0;
	}
	
	draw_surface_ext(global.surface_background,0,0,1,1,0,c_white,1);
	
	// -- Update shake
	global.shake_x = lerp(global.shake_x,0,.2);
	global.shake_y = lerp(global.shake_y,0,.2);
}

function window_update_background() {
	global.surface_update = 1;
}


/*
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
- DRAW IMGs
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
*/

function window_add_img(iid,image,x1,y1,title) {
	var struct = {
		iid : iid,
		image : image,
		x1 : x1,
		y1 : y1,
		title : title
	}
	
	IMG[? iid] = struct;
}

function window_total_imgs() {
	return ds_map_size(IMG);
}

function window_img_find(bid) {
	var returnid = noone;
	
	with (objTXT) {
		if (miid==bid) { returnid = id; }
	}
	
	return returnid;
}

function window_draw_img() {
	var total_img = window_total_imgs();
	show_debug_message(string(total_img));
	if (total_img>0) {
		for (i=0; i<total_img; i++) {
			var metadata = IMG[? i];
			
			show_debug_message(metadata);
			
			var nid = metadata.iid;
			var tid = window_img_find(nid);
			
			show_debug_message(nid);
			if (tid!=noone) {
				if (instance_exists(tid)) {
					show_debug_message("show something...");
					//if (nid.showing) {
						var image	= metadata.image;
						var image_x	= metadata.x1;
						var image_y	= metadata.y1;
						var image_w = sprite_get_width(image);
						var image_h = sprite_get_height(image);
						var image_title = metadata.title;
			
						draw_window(image_x,image_y,image_x+(image_w/GRID_SIZE),image_y+(image_h/GRID_SIZE),1,image_title);
						draw_sprite(image,0,image_x*GRID_SIZE,image_y*GRID_SIZE);
					//}
				}
			}
		}
	}
}

function window_delete_img(iid) {
	if (ds_map_exists(IMG,iid)) {
		ds_map_delete(IMG,iid);
	}
}