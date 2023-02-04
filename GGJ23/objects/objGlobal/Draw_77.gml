/// @description Insert description here
// You can write your code in this editor


//surface_resize(application_surface,8,0);

draw_surface_ext(application_surface,8*WINDOW_SCALE,0,WINDOW_SCALE,WINDOW_SCALE,0,c_white,1);
draw_set_color(global.bgcolor);
draw_set_alpha(1);
draw_rectangle(0,0,8 * WINDOW_SCALE,room_height* WINDOW_SCALE,0);
draw_set_color(c_white);