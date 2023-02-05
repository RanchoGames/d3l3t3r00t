global.fullscreen = (global.fullscreen ? 0 : 1);

global.fullscreen_update = 1;
window_update_background();
surface_free(global.surface_background);

window_set_fullscreen(global.fullscreen);
alarm[0] = 1;