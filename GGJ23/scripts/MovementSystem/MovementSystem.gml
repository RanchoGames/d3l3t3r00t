/*
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
- KEYS INIT
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
*/

global.facing = 1;

global.gp_pressed_left	= 0;
global.gp_pressed_right = 0;
global.gp_pressed_up	= 0;
global.gp_pressed_down	= 0;
global.gp_pressing		= 0;

#macro KLEFT (keyboard_check_pressed(vk_left) or gamepad_button_check_pressed(0,gp_padl) or global.gp_pressed_left)
#macro KRIGHT (keyboard_check_pressed(vk_right) or gamepad_button_check_pressed(0,gp_padr) or global.gp_pressed_right)
#macro KUP (keyboard_check_pressed(vk_up) or gamepad_button_check_pressed(0,gp_padu) or global.gp_pressed_up)
#macro KDOWN (keyboard_check_pressed(vk_down) or gamepad_button_check_pressed(0,gp_padd) or global.gp_pressed_down)
#macro KINTERACT (keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(0,gp_face1))


/*
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
- GAMEPAD MOVEMENT
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
*/

function gamepad_movement() {
	//Reset
	global.gp_pressed_left	= 0;
	global.gp_pressed_right = 0;
	global.gp_pressed_up	= 0;
	global.gp_pressed_down	= 0;
	
	//Info
	var haxis = gamepad_axis_value(0, gp_axislh);
	var vaxis = gamepad_axis_value(0, gp_axislv);
	var treeshold = .7;
	var treesholdback = .5;
	
	if (global.gp_pressing==0 && TUTIMER==0) {
		if (haxis<-treeshold) { global.gp_pressed_left=1; global.gp_pressing = 1; }
		if (haxis> treeshold) { global.gp_pressed_right=1; global.gp_pressing = 1; }
		if (vaxis<-treeshold) { global.gp_pressed_up=1; global.gp_pressing = 1; }
		if (vaxis> treeshold) { global.gp_pressed_down=1; global.gp_pressing = 1; }
	}
	else {
		if (abs(haxis)<treesholdback)
		&& (abs(vaxis<treesholdback)) {
			global.gp_pressing = 0;
		}
	}
}



/*
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
- MOVEMENT STEP
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
*/

function character_movement() {
	if (TU==0 && ST>-1 && ENDED==0) {
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
	if (ENDED==0) {
		// -- Collision
		var collision = place_meeting(goto_x,goto_y,parBlock);
		var inside = collision_playablezone(goto_x,goto_y);
		
		// -- Movement
		if (collision==false && inside) {
			x = goto_x;
			y = goto_y;
		
			// -- Sound
			var stepsDone = STKEYS;
			if (stepsDone<=5) {
				switch (stepsDone) {
					case 0: sonar(sndPaso1); break;
					case 1: sonar(sndPaso2); break;
					case 2: sonar(sndPaso3); break;
					case 3: sonar(sndPaso4); break;
					case 4: sonar(sndPaso5); break;
					case 5: sonar(sndPaso6); break;
				}
			}
			else {
				sonar(sndPaso6);
			}
				
			// -- Next turn
			turn_next();
		}
	}
}


/*
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
- INTERACTION
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
*/

function character_interaction() {
	if (TU==0 && ENDED==0) {
		if (KINTERACT && TUTIMER==0) {
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
					
					if (LVLACTIVE > goto) {
						sonar(sndCAbajo);
					}
					else {
						sonar(sndCArriba);
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
				sonar(sndKey);
				global.keys++;
				var whichkey = keyHold.mykey;
				global.key[whichkey] = 1;
				with (keyHold) { instance_destroy(); }
			}
		}
		
		// -- End
		if (place_meeting(x,y,objC)) {
			audio_stop_all();
			//audio_play_sound(sndGlitch,0,1);
			sonar_musica(sndGlitch);
			audio_sound_gain(sndGlitch,0.3,0);
			ENDED = 1;
		}
		
		// -- Powerup
		if (place_meeting(x,y,objPowerup)) {
			var powerHold = instance_place(x,y,objPowerup);
			if (instance_exists(powerHold)) {
				if (powerHold.activated) {
					ST = STTOTAL;
					STKEYS = 0;
					sonar(sndPowerup);
					with (powerHold) { activated = 0; }
				}
			}
		}
	}
}