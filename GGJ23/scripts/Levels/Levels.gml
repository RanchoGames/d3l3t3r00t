/*
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
- LEVELS

- Object
- X
- Y
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□

Levels configuration.

*/

global.levels_total = 0;


function add_thing(map,object,x1,y1,data) {
	var thing_data = (data == undefined ? noone : data);
	var size = ds_map_size(map);
	var struct = {
		object	:	object,
		x1		:	x1,
		y1		:	y1,
		data	:	thing_data
	}
	
	map[? size] = struct;
}

function make_levels() {
	// -- Level 0
	global.lvl0_things = ds_map_create();
	
	add_thing(global.lvl0_things,objBlock,2,2);
	add_thing(global.lvl0_things,objBlock,3,2);
	add_thing(global.lvl0_things,objBlock,4,2);
	add_thing(global.lvl0_things,objFolder,4,3,[0,1,0,0]);
	add_thing(global.lvl0_things,objFolder,8,4,[1,2,0,0]);
	
	add_level(0,"A folder",1,1,12,8,global.lvl0_things);
	// -- End Level 0
	
	
	// -- Level 1
	global.lvl1_things = ds_map_create();
	
	add_thing(global.lvl1_things,objBlock,2,2);
	add_thing(global.lvl1_things,objFolder,3,3,[0,0,4,3]);
	add_thing(global.lvl1_things,objFolder,5,3,[0,2,0,0]);
	
	add_level(1,"Another folder",10,6,16,12,global.lvl1_things);
	// -- End Level 1
	
	
	// -- Level 2
	global.lvl2_things = ds_map_create();
	
	add_thing(global.lvl2_things,objFolder,7,2,[1,0,3,3]);
	
	add_level(2,"Another other folder",8,5,21,9,global.lvl2_things);
	// -- End Level 2
	
	// Update total levels
	global.levels_total = level_get_levels();
}