global.debug = 0;
application_surface_draw_enable(false);

global.scale = 2;
#macro WINDOW_SCALE global.scale

make_levels();

global.bgcolor = make_color_rgb(125,139,122);
draw_clear_alpha(c_white,1);
draw_set_font(fntPixel);

depth = -2;

global.fullscreen = 0;
global.fullscreen_update = 0;

global.ended = 0;
global.ended_timer_total = 120;
global.ended_timer = global.ended_timer_total;
#macro ENDED global.ended

global.playing = 0;
#macro PLAYING global.playing



alarm[1] = 1;