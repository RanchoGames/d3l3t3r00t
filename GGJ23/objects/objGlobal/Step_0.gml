if (keyboard_check_pressed(vk_control)) { global.debug=!global.debug; }

if (ENDED) {
	global.ended_timer--;
	if (global.ended_timer<=0) {
		restart_everything();
	}
}