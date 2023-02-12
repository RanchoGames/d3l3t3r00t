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
	
	add_thing(global.lvl0_things,objFolder,2,1,[0,1,1,1]);
	add_thing(global.lvl0_things,objTXT,2,0,[sprImg_controls,6,3,0,"controls.txt"]);
	add_thing(global.lvl0_things,objTXT,0,2,[sprImg_credits,6,3,0,"credits.txt"]);
	
	var xx = 2;
	var yy = 2;
	var ww = 3;
	var hh = 3;

	add_level(0,"Recycle bin", xx, yy, xx+ww, yy+hh, global.lvl0_things);
	// -- End Level 0
	
	
	// -- Level 1
	global.lvl1_things = ds_map_create();
	
	add_thing(global.lvl1_things,objFolder,1,1,[2,0,2,1]);	
	add_thing(global.lvl1_things,objBlock,1,3,choose(0,1,2,3));
	add_thing(global.lvl1_things,objFolder,3,2,[0,2,0,7]);
	
	var xx = 6;
	var yy = 3;
	var ww = 5;
	var hh = 4;

	add_level(1,"GGJ23_", xx, yy, xx+ww, yy+hh, global.lvl1_things);
	// -- End Level 1
	
	
	// -- Level 2
	global.lvl2_things = ds_map_create();
	
	add_thing(global.lvl2_things,objFolder,0,7,[3,1,3,2]);	
	add_thing(global.lvl2_things,objFolder,1,1,[0,3,1,1]);
	
	var xx = 13;
	var yy = 2;
	var ww = 2;
	var hh = 8;

	add_level(2,"Temp", xx, yy, xx+ww, yy+hh, global.lvl2_things);
	// -- End Level 2
	
	// -- Level 3
	global.lvl3_things = ds_map_create();
	
	add_thing(global.lvl3_things,objFolder,1,1,[3,2,1,1]);	
	add_thing(global.lvl3_things,objFolder,3,0,[0,20,1,1]);
	add_thing(global.lvl3_things,objFolder,4,2,[3,5,4,3]);
	add_thing(global.lvl3_things,objFolder,2,3,[12,4,1,1]);
	add_thing(global.lvl3_things,objTXT,0,2,[sprImg_Chiquito,4,5,1,"jorl-condemor.jpg"]);
	add_thing(global.lvl3_things,objTXT,3,1,[sprImg_Torroles,18,5,1,"eNn-toRRoles.png"]);
	
	var xx = 12;
	var yy = 5;
	var ww = 5;
	var hh = 4;

	add_level(3,"Downloads", xx, yy, xx+ww, yy+hh, global.lvl3_things);
	// -- End Level 3
	
	// -- Level 4
	global.lvl4_things = ds_map_create();
	
	add_thing(global.lvl4_things,objFolder,1,1,[0,3,2,3]);

	add_thing(global.lvl4_things,objTXT,0,2,[sprImg_Toot,4,2,1,"toot.gif"]);
	add_thing(global.lvl4_things,objTXT,1,3,[sprImg_Baby,4,2,1,"chachaBB.gif"]);
	add_thing(global.lvl4_things,objTXT,3,1,[sprImg_Bill,4,2,1,"eBill.gif"]);
	add_thing(global.lvl4_things,objTXT,3,3,[sprImg_Kid,4,2,1,"ta_good.gif"]);

	var xx = 16;
	var yy = 2;
	var ww = 4;
	var hh = 4;

	add_level(4,"Gufs", xx, yy, xx+ww, yy+hh, global.lvl4_things);

	// -- End Level 4
	
	// -- Level 5
	global.lvl5_things = ds_map_create();
	
	add_thing(global.lvl5_things,objFolder,4,3,[0,3,4,2]);
	add_thing(global.lvl5_things,objFolder,2,1,[3,6,0,0]);
	add_thing(global.lvl5_things,objTXT,0,3,[sprImg_Goblin1,4,8,1,"goblin_mando_1.jpg"]);
	add_thing(global.lvl5_things,objTXT,4,2,[sprImg_mlgjam,4,8,1,"mlgjamLogo.png"]);
	add_thing(global.lvl5_things,objTXT,3,0,[sprImg_Goblin2,7,6,1,"culito_goblin.jpg"]);
	add_thing(global.lvl5_things,objTXT,1,1,[sprImg_Goblin,4,8,1,"gob.jpg"]);

	var xx = 1;
	var yy = 5;
	var ww = 5;
	var hh = 4;

	add_level(5,"Pack creativo goblin", xx, yy, xx+ww, yy+hh, global.lvl5_things);
	// -- End Level 5
	
	// -- Level 6
	global.lvl6_things = ds_map_create();
	
	add_thing(global.lvl6_things,objFolder,0,0,[0,5,2,1]);
	add_thing(global.lvl6_things,objFolder,3,0,[9,7,0,0]);

	var xx = 11;
	var yy = 7;
	var ww = 4;
	var hh = 1;

	add_level(6,"_RANCHOSX", xx, yy, xx+ww, yy+hh, global.lvl6_things);
	// -- End Level 6
	
	// -- Level 7
	global.lvl7_things = ds_map_create();
	
	add_thing(global.lvl7_things,objFolder,5,1,[0,8,3,3]);
	add_thing(global.lvl7_things,objTXT,3,0,[sprImg_Pipo,8,6,1,"Pipo.jpg"]);

	var xx = 3;
	var yy = 9;
	var ww = 6;
	var hh = 2;

	add_level(7,"Pipo", xx, yy, xx+ww, yy+hh, global.lvl7_things);

	// -- End Level 7
	
	// -- Level 8
	global.lvl8_things = ds_map_create();

	add_thing(global.lvl8_things,objFolder,3,3,[8,7,5,1]);
	add_thing(global.lvl8_things,objFolder,1,1,[0,9,4,0]);
	add_thing(global.lvl8_things,objTXT,0,0,[sprImg_Apple,12,4,1,"Apple.jpg"]);
	add_thing(global.lvl8_things,objTXT,4,1,[sprImg_Gafas,12,4,1,"dud.jpg"]);
	add_thing(global.lvl8_things,objTXT,1,3,[sprImg_Tree,12,4,1,"Treee.jpg"]);
	add_thing(global.lvl8_things,objTXT,3,0,[sprImg_sus,12,4,1,"sus.jpg"]);

	var xx = 17;
	var yy = 2;
	var ww = 5;
	var hh = 4;

	add_level(8,"My drawings", xx, yy, xx+ww, yy+hh, global.lvl8_things);

	// -- End Level 8
	
	// -- Level 9
	global.lvl9_things = ds_map_create();

	add_thing(global.lvl9_things,objFolder,4,0,[7,8,1,1]);
	add_thing(global.lvl9_things,objFolder,0,3,[0,10,1,1]);
	add_thing(global.lvl9_things,objFolder,3,4,[4,23,0,0]);
	add_thing(global.lvl9_things,objBlock,0,0,choose(1,2));
	add_thing(global.lvl9_things,objBlock,2,1,choose(1,2));

	var xx = 19;
	var yy = 3;
	var ww = 5;
	var hh = 5;

	add_level(9,"Images", xx, yy, xx+ww, yy+hh, global.lvl9_things);

	// -- End Level 9
	
	// -- Level 10
	global.lvl10_things = ds_map_create();
	
	add_thing(global.lvl10_things,objFolder,1,1,[7,9,0,3]);
	add_thing(global.lvl10_things,objFolder,3,3,[6,11,1,0]);
	add_thing(global.lvl10_things,objFolder,10,3,[10,17,3,0]);

	add_thing(global.lvl10_things,objFolder,11,1,[0,18,3,2]);
	add_thing(global.lvl10_things,objBlock,4,0,choose(0,1,2,3));
	add_thing(global.lvl10_things,objBlock,0,3,choose(0,1,2,3));
	add_thing(global.lvl10_things,objBlock,6,3,choose(0,1,2,3));
	add_thing(global.lvl10_things,objBlock,7,4,choose(0,1,2,3));
	add_thing(global.lvl10_things,objBlock,9,0,choose(0,1,2,3));
	add_thing(global.lvl10_things,objBlock,13,4,choose(0,1,2,3));

	var xx = 5;
	var yy = 3;
	var ww = 14;
	var hh = 5;

	add_level(10,"My documents", xx, yy, xx+ww, yy+hh, global.lvl10_things);
	// -- End Level 10
	
	// -- Level 11
	global.lvl11_things = ds_map_create();
	
	add_thing(global.lvl11_things,objFolder,1,0,[0,10,3,3]);

	add_thing(global.lvl11_things,objFolder,0,1,[5,12,6,0]);
	add_thing(global.lvl11_things,objFolder,2,3,[6,16,2,2]);
	add_thing(global.lvl11_things,objBlock,2,1,choose(0,1,2));
	add_thing(global.lvl11_things,objBlock,0,2,choose(0,1,2));


	var xx = 7;
	var yy = 2;
	var ww = 3;
	var hh = 4;

	add_level(11,"School", xx, yy, xx+ww, yy+hh, global.lvl11_things);
	// -- End Level 11
	
	// -- Level 12
	global.lvl12_things = ds_map_create();
	
	add_thing(global.lvl12_things,objFolder,6,0,[0,11,0,1]);

	add_thing(global.lvl12_things,objFolder,1,1,[3,13,0,0]);
	add_thing(global.lvl12_things,objTXT,4,1,[sprImg_Stonks,10,5,2,"tuburao.xlsx"]);

	var xx = 16;
	var yy = 8;
	var ww = 7;
	var hh = 2;

	add_level(12,"Math", xx, yy, xx+ww, yy+hh, global.lvl12_things);
	// -- End Level 12
	
	// -- Level 13
	global.lvl13_things = ds_map_create();
	
	add_thing(global.lvl13_things,objFolder,0,0,[0,12,1,1]);
	add_thing(global.lvl13_things,objFolder,2,0,[5,14,0,0]);

	var xx = 8;
	var yy = 7;
	var ww = 3;
	var hh = 2;

	add_level(13,"Algebra", xx, yy, xx+ww, yy+hh, global.lvl13_things);
	// -- End Level 13
		
	// -- Level 14
	global.lvl14_things = ds_map_create();
	
	add_thing(global.lvl14_things,objFolder,0,0,[0,13,2,0]);
	add_thing(global.lvl14_things,objFolder,2,0,[3,15,3,0]);

	var xx = 18;
	var yy = 1;
	var ww = 3;
	var hh = 1;

	add_level(14,"???", xx, yy, xx+ww, yy+hh, global.lvl14_things);
	// -- End Level 14
	
	// -- Level 15
	global.lvl15_things = ds_map_create();
	
	add_thing(global.lvl15_things,objFolder,3,0,[0,14,2,0]);
	add_thing(global.lvl15_things,objTXT,1,1,[sprImg_Bob,16,3,1,"Bob.jpg"]);

	var xx = 7;
	var yy = 2;
	var ww = 7;
	var hh = 4;

	add_level(15,"Complex calculus", xx, yy, xx+ww, yy+hh, global.lvl15_things);
	// -- End Level 15
	
	// -- Level 16
	global.lvl16_things = ds_map_create();
	
	add_thing(global.lvl16_things,objFolder,2,2,[0,11,2,3]);
	add_thing(global.lvl16_things,objFolder,3,0,[11,17,1,3]);
	add_thing(global.lvl16_things,objBlock,1,1, choose(0,2));
	add_thing(global.lvl16_things,objBlock,2,1, choose(0,2));
	add_thing(global.lvl16_things,objBlock,3,1, choose(0,2));

	var xx = 17;
	var yy = 6;
	var ww = 5;
	var hh = 3;

	add_level(16,"Assignments", xx, yy, xx+ww, yy+hh, global.lvl16_things);
	// -- End Level 16
	
	// -- Level 17
	global.lvl17_things = ds_map_create();
	
	add_thing(global.lvl17_things,objFolder,3,0,[0,10,10,3]);
	add_thing(global.lvl17_things,objMusic,0,0,[sprImg_WMP,11,5,"paj_arit0.mp3", ostPajarito]);
	add_thing(global.lvl17_things,objMusic,3,3,[sprImg_WMP,11,6,"heavens-a-Bob.mp3", ostCannonBob]);
	add_thing(global.lvl17_things,objMusic,2,1,[sprImg_WMP,11,5,"cuackcuacuack.mp3", ostPlugLife]);
	add_thing(global.lvl17_things,objMusic,4,2,[sprImg_WMP,11,6,"enjoy_the_.wav", ostSpaceSummer]);
	add_thing(global.lvl17_things,objBlock,4,0,3);
	add_thing(global.lvl17_things,objBlock,0,2,3);

	var xx = 19;
	var yy = 8;
	var ww = 5;
	var hh = 4;

	add_level(17,"My music", xx, yy, xx+ww, yy+hh, global.lvl17_things);
	// -- End Level 17
	
	// -- Level 18
	global.lvl18_things = ds_map_create();
	
	add_thing(global.lvl18_things,objFolder,0,1,[0,19,0,4]);

	add_thing(global.lvl18_things,objFolder,3,2,[5,10,11,1]);
	add_thing(global.lvl18_things,objPowerup,1,3);
	add_thing(global.lvl18_things,objBlock,2,0,choose(0,1,2));	

	var xx = 1;
	var yy = 5;
	var ww = 5;
	var hh = 4;

	add_level(18,"_app", xx, yy, xx+ww, yy+hh, global.lvl18_things);
	// -- End Level 18
	
	// -- Level 19
	global.lvl19_things = ds_map_create();

	add_thing(global.lvl19_things,objFolder,0,4,[3,18,3,0]);
	add_thing(global.lvl19_things,objFolder,4,1,[0,20,6,6]);
	add_thing(global.lvl19_things,objPowerup,0,1);
	add_thing(global.lvl19_things,objBlock,1,3,choose(0,1,2));	
	add_thing(global.lvl19_things,objBlock,2,2,choose(0,1,2));
	add_thing(global.lvl19_things,objBlock,4,4,choose(0,1,2));

	var xx = 15;
	var yy = 5;
	var ww = 5;
	var hh = 5;

	add_level(19,"user", xx, yy, xx+ww, yy+hh, global.lvl19_things);
	// -- End Level 19
	
	// -- Level 20
	global.lvl20_things = ds_map_create();
	
	add_thing(global.lvl20_things,objFolder,1,1,[3,3,3,0]);
	add_thing(global.lvl20_things,objFolder,6,6,[3,19,4,1]);
	add_thing(global.lvl20_things,objFolder,4,6,[17,21,5,2]);
	add_thing(global.lvl20_things,objFolder,8,6,[19,25,1,2]);
	add_thing(global.lvl20_things,objC,6,0);
	add_thing(global.lvl20_things,objDoor,6,1,[0,0]);
	add_thing(global.lvl20_things,objDoor,6,2,[0,1]);	
	add_thing(global.lvl20_things,objBlock,5,0,4);
	add_thing(global.lvl20_things,objBlock,5,1,4);
	add_thing(global.lvl20_things,objBlock,5,2,4);
	add_thing(global.lvl20_things,objBlock,7,0,4);
	add_thing(global.lvl20_things,objBlock,7,1,4);
	add_thing(global.lvl20_things,objBlock,7,2,4);
	add_thing(global.lvl20_things,objBlock,0,2,choose(0,1,2));
	add_thing(global.lvl20_things,objBlock,1,2,choose(0,1,2));
	add_thing(global.lvl20_things,objBlock,2,1,choose(0,1,2));
	add_thing(global.lvl20_things,objBlock,3,0,choose(0,1,2));

	var xx = 9;
	var yy = 2;
	var ww = 13;
	var hh = 8;

	add_level(20,"My PC", xx, yy, xx+ww, yy+hh, global.lvl20_things);
	// -- End Level 20
	
	// -- Level 21
	global.lvl21_things = ds_map_create();
	
	add_thing(global.lvl21_things,objFolder,0,1,[0,22,0,2]);

	add_thing(global.lvl21_things,objBlock,4,1,1);
	add_thing(global.lvl21_things,objBlock,4,2,1);
	add_thing(global.lvl21_things,objBlock,2,0,1);
	add_thing(global.lvl21_things,objBlock,2,2,1);
	add_thing(global.lvl21_things,objPowerup,3,2);
	
	var xx = 5;
	var yy = 7;
	var ww = 7;
	var hh = 4;

	add_level(21,"edited", xx, yy, xx+ww, yy+hh, global.lvl21_things);
	// -- End Level 21
	
	// -- Level 22
	global.lvl22_things = ds_map_create();
	
	add_thing(global.lvl22_things,objFolder,0,2,[16,21,0,1]);
	add_thing(global.lvl22_things,objFolder,0,4,[0,23,3,3]);
	add_thing(global.lvl22_things,objPowerup,2,0);
	add_thing(global.lvl22_things,objPowerup,2,4);
	add_thing(global.lvl22_things,objPowerup,1,6);
	add_thing(global.lvl22_things,objBlock,1,1,1);
	add_thing(global.lvl22_things,objBlock,1,2,1);
	add_thing(global.lvl22_things,objBlock,0,3,1);
	add_thing(global.lvl22_things,objBlock,1,3,1);
	add_thing(global.lvl22_things,objBlock,1,4,1);
	add_thing(global.lvl22_things,objBlock,1,5,1);

	var xx = 15;
	var yy = 4;
	var ww = 3;
	var hh = 7;

	add_level(22,"trip 2016", xx, yy, xx+ww, yy+hh, global.lvl22_things);
	// -- End Level 22
	
	// -- Level 23
	global.lvl23_things = ds_map_create();
	
	add_thing(global.lvl23_things,objFolder,0,0,[0,9,3,4]);
	add_thing(global.lvl23_things,objFolder,3,3,[3,22,0,4]);
	add_thing(global.lvl23_things,objFolder,6,2,[3,24,0,1]);
	add_thing(global.lvl23_things,objBlock,1,3,1);
	add_thing(global.lvl23_things,objBlock,2,2,choose(1,2));
	add_thing(global.lvl23_things,objBlock,3,1,1);
	add_thing(global.lvl23_things,objBlock,4,2,choose(1,2));
	add_thing(global.lvl23_things,objBlock,5,0,1);
	add_thing(global.lvl23_things,objBlock,5,1,choose(1,2));
	add_thing(global.lvl23_things,objBlock,6,0,choose(1,1,2));
	
	var xx = 4;
	var yy = 8;
	var ww = 8;
	var hh = 4;

	add_level(23,"Photos", xx, yy, xx+ww, yy+hh, global.lvl23_things);

	// -- End Level 23
	
	// -- Level 24
	global.lvl24_things = ds_map_create();
	
	add_thing(global.lvl24_things,objFolder,0,1,[0,23,0,1]);
	add_thing(global.lvl24_things,objKey,2,1,[0,0]);
	add_thing(global.lvl24_things,objFolder,4,1,[21,20,6,4]);

	var xx = 16;
	var yy = 1;
	var ww = 5;
	var hh = 3;

	add_level(24,"Untitled", xx, yy, xx+ww, yy+hh, global.lvl24_things);
	// -- End Level 24
	
	// -- Level 25
	global.lvl25_things = ds_map_create();
	
	add_thing(global.lvl25_things,objFolder,0,7,[1,26,1,7]);
	add_thing(global.lvl25_things,objBlock,1,3,choose(0,1,2,3));
	add_thing(global.lvl25_things,objBlock,0,6);
	add_thing(global.lvl25_things,objPowerup,0,1);
	add_thing(global.lvl25_things,objPowerup,1,5);

	var xx = 21;
	var yy = 4;
	var ww = 2;
	var hh = 8;

	add_level(25,"Archive", xx, yy, xx+ww, yy+hh, global.lvl25_things);
	// -- End Level 25
	
	// -- Level 26
	global.lvl26_things = ds_map_create();
	
	add_thing(global.lvl26_things,objFolder,6,0,[0,27,4,1]);
	add_thing(global.lvl26_things,objPowerup,0,5);
	add_thing(global.lvl26_things,objPowerup,2,1);
	add_thing(global.lvl26_things,objPowerup,3,4);
	add_thing(global.lvl26_things,objPowerup,4,7);
	add_thing(global.lvl26_things,objPowerup,7,5);
	add_thing(global.lvl26_things,objPowerup,9,2);
	add_thing(global.lvl26_things,objBlock,0,0,choose(0,1,2,3));
	add_thing(global.lvl26_things,objBlock,3,0,choose(0,1,2,3));
	add_thing(global.lvl26_things,objBlock,4,1,choose(0,1,2,3));
	add_thing(global.lvl26_things,objBlock,7,1,choose(0,1,2,3));
	add_thing(global.lvl26_things,objBlock,5,3,choose(0,1,2,3));
	add_thing(global.lvl26_things,objBlock,8,3,choose(0,1,2,3));
	add_thing(global.lvl26_things,objBlock,4,4,choose(0,1,2,3));
	add_thing(global.lvl26_things,objBlock,5,4,choose(0,1,2,3));
	add_thing(global.lvl26_things,objBlock,4,5,choose(0,1,2,3));
	add_thing(global.lvl26_things,objBlock,3,7,choose(0,1,2,3));
	add_thing(global.lvl26_things,objBlock,9,5,choose(0,1,2,3));

	var xx = 12;
	var yy = 1;
	var ww = 10;
	var hh = 8;

	add_level(26,"old desktop", xx, yy, xx+ww, yy+hh, global.lvl26_things);
	// -- End Level 26
	
	// -- Level 27
	global.lvl27_things = ds_map_create();
	
	add_thing(global.lvl27_things,objFolder,4,1,[0,26,0,6]);
	add_thing(global.lvl27_things,objKey,2,1,[0,1]);
	add_thing(global.lvl27_things,objFolder,0,1,[21,20,6,4]);
	
	var xx = 6;
	var yy = 5;
	var ww = 5;
	var hh = 3;

	add_level(27,"Untitled", xx, yy, xx+ww, yy+hh, global.lvl27_things);
	// -- End Level 27
	
	
	// Update total levels
	global.levels_total = level_get_levels();
}