global.debug = 0;
application_surface_draw_enable(false);
display_set_gui_size(640*2,360*2);

display_set_gui_maximize(WINDOW_SCALE,WINDOW_SCALE,0,0);

#macro WINDOW_SCALE 2

window_set_size(640*WINDOW_SCALE,360*WINDOW_SCALE);
window_center();

make_levels();

level_start(0);

global.bgcolor = make_color_rgb(125,139,122);
draw_clear_alpha(c_white,1);
draw_set_font(fntPixel);

depth = -2;