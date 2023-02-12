/*
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
- LEVEL SYSTEM
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□

Info needed:

- ID
- Name
- x1
- y1
- x2
- y2
*/

global.levels = ds_map_create();
#macro LVL global.levels

global.level_active = 0;
#macro LVLACTIVE global.level_active

for (var l = 0; l< 40; l++) {
	global.lvl_bg[l] = (l==0 ? 1 : 0);
}


/*
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
- ADD LEVEL
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
*/

function add_level(levelid,name,x1,y1,x2,y2,data) {
	var struct = {
		levelid		:		levelid,
		lvlname		:		name,
		x1			:		x1,
		y1			:		y1,
		x2			:		x2,
		y2			:		y2,
		data		:		data
	}
	
	LVL[? levelid] = struct;
}


/*
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
- GET INFO FROM LEVELS
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
*/

/*
─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─

- level_get_data
Obtiene los datos de un level desde el ID.
Se usa en el resto de funciones.

─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─
*/

function level_get_data(levelid) {
	var level = LVL[? levelid];
	return level;
}


/*
─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─

- level_get_name
Obtiene el nombre de un nivel desde el ID.

─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─
*/

function level_get_name(levelid) {
	var level = level_get_data(levelid);
	return level.lvlname;
}


/*
─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─

- level_get_sizes
Obtiene las coordenadas de un nivel

─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─
*/

function level_get_x1(levelid) { var level = level_get_data(levelid); return level.x1; }
function level_get_x2(levelid) { var level = level_get_data(levelid); return level.x2; }
function level_get_y1(levelid) { var level = level_get_data(levelid); return level.y1; }
function level_get_y2(levelid) { var level = level_get_data(levelid); return level.y2; }


/*
─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─

- level_get_things
Obtiene el data de un nivel desde el ID.

─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─
*/

function level_get_things(levelid) {
	var level = level_get_data(levelid);
	return level.data;
}


/*
─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─

- level_get_levels
Obtiene el numero total de levels que hay.

─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─
*/

function level_get_levels() {
	return ds_map_size(LVL);
}


/*
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
- START LEVEL
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
*/

function level_start(level) {
	// - Musica
	if (LVLACTIVE>0) {
		if (is_musica(sndMusic1)==0) {
			sonar_musica(sndMusic1);
			audio_sound_gain(sndMusic1,0,0);
			audio_sound_gain(sndMusic1,.6,3000);
		}
	}
	
	if (LVLACTIVE>6) {
		if (is_musica(sndMusic2)==0) {
			sonar_musica(sndMusic2);
			audio_sound_gain(sndMusic2,0,0);
			audio_sound_gain(sndMusic2,.5,4000);
		}
		
		if (is_musica(sndMusic1)) {
			audio_sound_gain(sndMusic1,0,2000);
		}
	}
	
<<<<<<< Updated upstream
=======
	if (LVLACTIVE==20) {
		if (is_musica(sndAmbient)==0) {
			sonar_musica(sndAmbient);
			audio_sound_gain(sndAmbient,0,0);
			audio_sound_gain(sndAmbient,.75,4000);
		}
		else {
			audio_sound_gain(sndAmbient,.75,4000);
		}
		
		if (is_musica(sndMusic1)) {
			audio_sound_gain(sndMusic1,0,1000);
		}
		
		if (is_musica(sndMusic2)) {
			audio_sound_gain(sndMusic2,0,1000);
		}
	}
}

/*
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
- START LEVEL
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
*/

function level_start(level) {
	
	// - Musica
	level_musica(level);
	
>>>>>>> Stashed changes
	// - Movement
	STKEYS = 0;
	
	var things = level_get_things(level);
	var things_total = ds_map_size(things);
	var lvl_x = level_get_x1(level) * GRID_SIZE;
	var lvl_y = level_get_y1(level) * GRID_SIZE;
	
	// First level
	if (global.starting_x==0) {
		global.starting_x = lvl_x;
		global.starting_y = lvl_y;
	}
	
	if (!instance_exists(objCharacter)) {
		var charx = global.starting_x;
		var chary = global.starting_y;
		var char = instance_create_layer(charx,chary,"Instances",objCharacter);
	}
	
	for (var i=0; i<things_total; i++) {
		var piece = things[? i];
		
		var piece_object	= piece.object;
		var piece_x			= lvl_x + (piece.x1 * GRID_SIZE);
		var piece_y			= lvl_y + (piece.y1 * GRID_SIZE);
		
		var new_obj = instance_create_layer(piece_x,piece_y,"Instances",piece_object);
		
		// - If it has special data
		if (piece.data != noone) {
			switch (piece_object) {
				// - Which level a folder gets you to
				case objFolder:
					new_obj.tipo	= piece.data[0];
					new_obj.goto	= piece.data[1];
					new_obj.goto_x	= piece.data[2];
					new_obj.goto_y	= piece.data[3];
				break;
				
				// - Image
				case objTXT:
					new_obj.image	= piece.data[0];
					new_obj.img_x	= piece.data[1];
					new_obj.img_y	= piece.data[2];
					new_obj.tipo	= piece.data[3];
					new_obj.title	= piece.data[4];
				break;
				
				// - Door
				case objDoor:
					new_obj.tipo	= piece.data[0];
					new_obj.step	= piece.data[1];
				break;
				
				// -- Key
				case objKey:
					new_obj.tipo	= piece.data[0];
					new_obj.mykey	= piece.data[1];
				break;
				
				// -- Block
				case objBlock:
					new_obj.tipo	= piece.data;
				break;
			}
		}
	}
	
	window_update_background();
	global.lvl_bg[level] = 1;
	
	ST = STTOTAL;
}


/*
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
- MOVE TO A LEVEL
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
*/

function level_goto(level,gox,goy) {
	LVLACTIVE = level;
	with (objBlock) { instance_destroy(); }
	with (objFolder) { instance_destroy(); }
	with (objTXT) { instance_destroy(); }
	with (objDoor) { instance_destroy(); }
	with (objKey) { instance_destroy(); }
	with (objPowerup) { instance_destroy(); }
	with (objC) {instance_destroy(); }
	
	window_update_playablezone(LVLACTIVE);
	level_start(LVLACTIVE);
	
	if (instance_exists(objCharacter)) {
		with (objCharacter) {
			x = (PLAY_X1 * GRID_SIZE) + (gox * GRID_SIZE);
			y = (PLAY_Y1 * GRID_SIZE) + (goy * GRID_SIZE);
			an_x = x;
			an_y = y;
		}
		
		restart_starting_point(objCharacter.x,objCharacter.y);
	}
	
	global.surface_update = 1;
}


function restart_everything() {
	LVLACTIVE = 0;

	ENDED = 0;
	global.ended_timer = global.ended_timer_total;

	with (objFolder) { instance_destroy(); }
	with (objTXT) { instance_destroy(); }
	with (objBlock) { instance_destroy(); }
	with (objCharacter) { instance_destroy(); }

	audio_stop_all();

	for (i=0; i<global.levels_total; i++) {
		global.lvl_bg[i] = 0;
	}

	/*ds_map_destroy(LVL);
	ds_map_destroy(IMG);*/

	ST = 0;
	global.starting_x = 0;

	global.playablezone_startx = 2;
	global.playablezone_starty = 2;
	global.playablezone_endx = 5;
	global.playablezone_endy = 5;

	surface_free(global.surface_background);
	global.surface_update = 0;

	global.keys = 0;
	global.key[0] = 0;
	global.key[1] = 0;
	
	global.facing = 1;

	game_restart();
}