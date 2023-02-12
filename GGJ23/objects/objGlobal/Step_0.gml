if (keyboard_check_pressed(ord("K"))) { global.debug=!global.debug; }

if (PLAYING) {
	if (ENDED) {
		global.ended_timer--;
		if (global.ended_timer<=0) {
			restart_everything();
		}
	}
	
	// -- Check screensaver timer	
	global.screensaver_timer = (is_player_playing() ? 0 : global.screensaver_timer+1);
	

	// -- Restart with gamepad
	if (gamepad_button_check(0,gp_start)) {
		if (gamepad_button_check_pressed(0,gp_face1)) {
			restart_everything();
		}
	}

	// -- Restart with keyboard
	if (keyboard_check(vk_control)) {
		if (keyboard_check_pressed(ord("R"))) {
			restart_everything();
		}
	}
}