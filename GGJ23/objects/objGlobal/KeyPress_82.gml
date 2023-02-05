LVLACTIVE = 0;

with (objFolder) { instance_destroy(); }
with (objTXT) { instance_destroy(); }
with (objBlock) { instance_destroy(); }
with (objCharacter) { instance_destroy(); }

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

game_restart();