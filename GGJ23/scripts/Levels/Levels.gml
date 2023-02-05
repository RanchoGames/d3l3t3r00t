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
	/*
		add_thing(global.lvl1_things,objFolder,X,Y,[A,B,C,D]);
		->	A: Sprite
		->	B: Target Room ID
		->	C: Teleport X
		->	D: Teleport Y
	*/
	//add_thing(global.lvl0_things,objBlock,1,2);
	
	// -- Level 0
	global.lvl0_things = ds_map_create();
	
	add_thing(global.lvl0_things,objBlock,1,2,1);
	add_thing(global.lvl0_things,objFolder,2,1,[0,1,1,1]);
	add_thing(global.lvl0_things,objTXT,2,0,[sprImg_Bob,6,3,1,"Bob.jpg"]);
	//add_thing(global.lvl0_things,objDoor,0,2,[0,1]);
	
	var xx = 2;
	var yy = 2;
	var ww = 3;
	var hh = 3;

	add_level(0,"Recycle bin", xx, yy, xx+ww, yy+hh, global.lvl0_things);
	// -- End Level 0
	
	
	// -- Level 1
	global.lvl1_things = ds_map_create();
	
	add_thing(global.lvl1_things,objFolder,1,1,[1,0,2,1]);	
	add_thing(global.lvl1_things,objBlock,1,3);
	add_thing(global.lvl1_things,objFolder,3,2,[1,2,0,7]);
	//add_thing(global.lvl1_things,objKey,2,2,[0,1]);
	
	var xx = 6;
	var yy = 4;
	var ww = 5;
	var hh = 4;

	add_level(1,"Folder 1", xx, yy, xx+ww, yy+hh, global.lvl1_things);
	// -- End Level 1
	
	
	// -- Level 2
	global.lvl2_things = ds_map_create();
	
	add_thing(global.lvl2_things,objFolder,0,7,[0,1,3,2]);	
	add_thing(global.lvl2_things,objFolder,1,1,[1,3,1,1]);
	
	var xx = 13;
	var yy = 2;
	var ww = 2;
	var hh = 8;

	add_level(2,"Folder 2", xx, yy, xx+ww, yy+hh, global.lvl2_things);
	// -- End Level 2
	
	// -- Level 3
	global.lvl3_things = ds_map_create();
	
	add_thing(global.lvl3_things,objFolder,1,1,[0,2,1,1]);	
	add_thing(global.lvl3_things,objFolder,3,0,[1,99,1,1]);
	add_thing(global.lvl3_things,objFolder,4,2,[1,5,4,3]);
	add_thing(global.lvl3_things,objFolder,2,3,[1,4,1,1]);
	add_thing(global.lvl3_things,objBlock,0,2);
	add_thing(global.lvl3_things,objBlock,3,1);
	
	var xx = 12;
	var yy = 5;
	var ww = 5;
	var hh = 4;

	add_level(3,"Folder 3", xx, yy, xx+ww, yy+hh, global.lvl3_things);
	// -- End Level 3
	
	// -- Level 4
	global.lvl4_things = ds_map_create();
	
	add_thing(global.lvl4_things,objFolder,1,1,[0,3,2,3]);
	add_thing(global.lvl4_things,objBlock,0,2);
	add_thing(global.lvl4_things,objBlock,1,3);
	add_thing(global.lvl4_things,objBlock,3,1);
	add_thing(global.lvl4_things,objBlock,3,3);

	var xx = 16;
	var yy = 2;
	var ww = 4;
	var hh = 4;

	add_level(4,"Folder 4", xx, yy, xx+ww, yy+hh, global.lvl4_things);
	// -- End Level 4
	
	// -- Level 5
	global.lvl5_things = ds_map_create();
	
	add_thing(global.lvl5_things,objFolder,4,3,[0,3,4,2]);
	add_thing(global.lvl5_things,objFolder,2,1,[1,6,0,0]);
	add_thing(global.lvl5_things,objBlock,0,3);
	add_thing(global.lvl5_things,objBlock,3,0);

	var xx = 16;
	var yy = 2;
	var ww = 5;
	var hh = 4;

	add_level(5,"Folder 5", xx, yy, xx+ww, yy+hh, global.lvl5_things);
	// -- End Level 5
	
	// -- Level 6
	global.lvl6_things = ds_map_create();
	
	add_thing(global.lvl6_things,objFolder,0,0,[0,5,2,1]);
	add_thing(global.lvl6_things,objFolder,3,0,[2,7,0,0]);

	var xx = 11;
	var yy = 7;
	var ww = 4;
	var hh = 1;

	add_level(6,"Folder 6", xx, yy, xx+ww, yy+hh, global.lvl6_things);
	// -- End Level 6
	
	// -- Level 7
	global.lvl7_things = ds_map_create();
	
	add_thing(global.lvl7_things,objFolder,5,1,[0,8,3,3]);

	var xx = 4;
	var yy = 8;
	var ww = 6;
	var hh = 2;

	add_level(7,"Folder 7", xx, yy, xx+ww, yy+hh, global.lvl7_things);
	// -- End Level 7
	
	// -- Level 8
	global.lvl8_things = ds_map_create();
	
	add_thing(global.lvl8_things,objFolder,3,3,[1,7,5,1]);
	add_thing(global.lvl8_things,objFolder,1,1,[0,9,4,0]);
	//add_thing(global.lvl8_things,objBlock,1,1);

	var xx = 14;
	var yy = 5;
	var ww = 5;
	var hh = 4;

	add_level(8,"Folder 8", xx, yy, xx+ww, yy+hh, global.lvl8_things);
	// -- End Level 8
	
	// -- Level 9
	global.lvl9_things = ds_map_create();
	
	add_thing(global.lvl9_things,objFolder,4,0,[1,8,1,1]);
	add_thing(global.lvl9_things,objFolder,0,3,[0,10,1,1]);
	add_thing(global.lvl9_things,objFolder,3,4,[1,98,0,0]);
	add_thing(global.lvl9_things,objBlock,0,0);
	add_thing(global.lvl9_things,objBlock,2,1);

	var xx = 4;
	var yy = 8;
	var ww = 5;
	var hh = 5;

	add_level(9,"Folder 9", xx, yy, xx+ww, yy+hh, global.lvl9_things);
	// -- End Level 9
	
	// -- Level 10
	global.lvl10_things = ds_map_create();
	
	add_thing(global.lvl10_things,objFolder,1,1,[1,9,0,3]);
	add_thing(global.lvl10_things,objFolder,3,3,[1,11,0,1]);
	add_thing(global.lvl10_things,objFolder,10,3,[1,17,3,0]);
	add_thing(global.lvl10_things,objFolder,11,1,[0,97,0,3]);
	add_thing(global.lvl10_things,objBlock,4,0);
	add_thing(global.lvl10_things,objBlock,0,3);
	add_thing(global.lvl10_things,objBlock,6,3);
	add_thing(global.lvl10_things,objBlock,7,4);
	add_thing(global.lvl10_things,objBlock,9,0);
	add_thing(global.lvl10_things,objBlock,13,4);

	var xx = 4;
	var yy = 8;
	var ww = 14;
	var hh = 5;

	add_level(10,"Folder 10", xx, yy, xx+ww, yy+hh, global.lvl10_things);
	// -- End Level 10
	
	// -- Level 11
	global.lvl11_things = ds_map_create();
	
	add_thing(global.lvl11_things,objFolder,1,0,[0,10,3,3]);
	add_thing(global.lvl11_things,objFolder,0,1,[1,12,6,0]);
	add_thing(global.lvl11_things,objFolder,2,3,[1,16,2,2]);
	add_thing(global.lvl11_things,objBlock,2,1);
	add_thing(global.lvl11_things,objBlock,0,2);

	var xx = 4;
	var yy = 8;
	var ww = 3;
	var hh = 4;

	add_level(11,"Folder 11", xx, yy, xx+ww, yy+hh, global.lvl11_things);
	// -- End Level 11
	
	// -- Level 12
	global.lvl12_things = ds_map_create();
	
	add_thing(global.lvl12_things,objFolder,0,0,[0,11,3,3]);
	add_thing(global.lvl12_things,objFolder,1,1,[1,13,0,0]);

	var xx = 4;
	var yy = 8;
	var ww = 7;
	var hh = 2;

	add_level(12,"Folder 12", xx, yy, xx+ww, yy+hh, global.lvl12_things);
	// -- End Level 12
	
	// -- Level 13
	global.lvl13_things = ds_map_create();
	
	add_thing(global.lvl13_things,objFolder,0,0,[0,12,1,1]);
	add_thing(global.lvl13_things,objFolder,2,1,[0,14,2,0]);

	var xx = 4;
	var yy = 8;
	var ww = 3;
	var hh = 2;

	add_level(13,"Folder 13", xx, yy, xx+ww, yy+hh, global.lvl13_things);
	// -- End Level 13
		
	// -- Level 14
	global.lvl14_things = ds_map_create();
	
	add_thing(global.lvl14_things,objFolder,0,0,[0,15,3,0]);
	add_thing(global.lvl14_things,objFolder,2,0,[0,13,2,1]);

	var xx = 4;
	var yy = 8;
	var ww = 3;
	var hh = 1;

	add_level(14,"Folder 14", xx, yy, xx+ww, yy+hh, global.lvl14_things);
	// -- End Level 14
	
	// -- Level 15
	global.lvl15_things = ds_map_create();
	
	add_thing(global.lvl15_things,objFolder,3,0,[0,14,3,0]);
	add_thing(global.lvl15_things,objBlock,0,0);
	add_thing(global.lvl15_things,objBlock,1,0);

	var xx = 4;
	var yy = 8;
	var ww = 7;
	var hh = 4;

	add_level(15,"Folder 15", xx, yy, xx+ww, yy+hh, global.lvl15_things);
	// -- End Level 15
	
	// -- Level 16
	global.lvl16_things = ds_map_create();
	
	add_thing(global.lvl16_things,objFolder,2,2,[1,11,2,3]);
	add_thing(global.lvl16_things,objFolder,3,0,[2,17,0,0]);
	add_thing(global.lvl16_things,objBlock,1,1);
	add_thing(global.lvl16_things,objBlock,2,1);
	add_thing(global.lvl16_things,objBlock,3,1);

	var xx = 4;
	var yy = 8;
	var ww = 5;
	var hh = 3;

	add_level(16,"Folder 16", xx, yy, xx+ww, yy+hh, global.lvl16_things);
	// -- End Level 16
	
	
	// Update total levels
	global.levels_total = level_get_levels();
}