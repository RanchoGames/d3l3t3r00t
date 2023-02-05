/*
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
- KEYS INIT
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
*/

#macro KLEFT (keyboard_check_pressed(vk_left) or gamepad_button_check_pressed(0,gp_padl))
#macro KRIGHT (keyboard_check_pressed(vk_right) or gamepad_button_check_pressed(0,gp_padr))
#macro KUP (keyboard_check_pressed(vk_up) or gamepad_button_check_pressed(0,gp_padu))
#macro KDOWN (keyboard_check_pressed(vk_down) or gamepad_button_check_pressed(0,gp_padd))
#macro KINTERACT (keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(0,gp_face1))

global.facing = 1;


/*
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
- MOVEMENT STEP
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
*/

function character_movement() {
	if (TU==0 && ST>-1) {
		var goto_x, goto_y;
		goto_x		= x;
		goto_y		= y;
		
		// -- Movement goto
		/*if (KLEFT or KRIGHT or KUP or KDOWN){
			var moh = KRIGHT - KLEFT;
			var mov = KDOWN - KUP;
			
			goto_x += GRID_SIZE*moh;
			goto_y += GRID_SIZE*mov;
			is_move = 1;
			
			exit;
		}*/
		
		if (KLEFT)	{ goto_x -= GRID_SIZE; character_moveset(goto_x,y); global.facing =-1; exit; }
		if (KRIGHT)	{ goto_x += GRID_SIZE; character_moveset(goto_x,y); global.facing = 1; exit; }
		if (KUP)	{ goto_y -= GRID_SIZE; character_moveset(x,goto_y); exit; }
		if (KDOWN)	{ goto_y += GRID_SIZE; character_moveset(x,goto_y); exit; }
	}
}

function character_moveset(goto_x,goto_y) {
	// -- Collision
	var collision = place_meeting(goto_x,goto_y,parBlock);
	var inside = collision_playablezone(goto_x,goto_y);
		
	// -- Movement
	if (collision==false && inside) {
		x = goto_x;
		y = goto_y;
				
		// -- Next turn
		turn_next();
	}
}


/*
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
- INTERACTION
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
*/

function character_interaction() {
	if (TU==0 && TUTIMER==0) {
		if (KINTERACT) {
			// -- Folder
			if (place_meeting(x,y,objFolder)) {				
				var folder = instance_place(x,y,objFolder);
				if (folder!=noone) {
					var goto = folder.goto;
					show_debug_message(string(LVLACTIVE) + " - " + string(goto));
					if (LVLACTIVE > goto) {
						global.lvl_bg[LVLACTIVE] = 0;
						
						// -- Close older windows
						for (i=LVLACTIVE; i<global.levels_total; i++) {
							global.lvl_bg[i] = 0;
						}
					}
					
					level_goto(goto,folder.goto_x,folder.goto_y);
				}
			}
		}
		
		// -- Key
		if (place_meeting(x,y,objKey)) {
			var keyHold = instance_place(x,y,objKey);
			if (instance_exists(keyHold)) {
				window_update_background();
				global.keys++;
				var whichkey = keyHold.mykey;
				global.key[whichkey] = 1;
				with (keyHold) { instance_destroy(); }
			}
		}
	}
}