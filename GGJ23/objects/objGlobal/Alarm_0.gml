global.fullscreen_update = 0;

global.scale = (global.fullscreen ? 1 : 2);
display_set_gui_size(640*WINDOW_SCALE,360*WINDOW_SCALE);
display_set_gui_maximize(WINDOW_SCALE,WINDOW_SCALE,0,0);

window_set_size(640*WINDOW_SCALE,360*WINDOW_SCALE);

if (global.fullscreen==0) {
	window_center();
}