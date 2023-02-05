draw_surface_ext(application_surface,8*WINDOW_SCALE,0,WINDOW_SCALE,WINDOW_SCALE,0,c_white,1);
draw_set_color(global.bgcolor);
draw_set_alpha(1);
//draw_rectangle(0,0,8 * WINDOW_SCALE,room_height*WINDOW_SCALE-13,0)
draw_set_color(c_white);
draw_sprite_ext(sprClouds,1,0,0,2,2,0,c_white,1);

draw_sprite_ext(sprBar,0,0,(room_height-13)*WINDOW_SCALE,WINDOW_SCALE,WINDOW_SCALE,0,c_white,1);

var chour = string(current_hour);
if (string_length(chour)==1) { chour = "0"+chour; }
var cminute = string(current_minute);
if (string_length(cminute)==1) { cminute = "0"+cminute; }
var time = chour + ":" + cminute;

draw_set_font(fntTitle);
draw_set_color(make_color_rgb(42,37,43));
draw_set_alpha(1);
draw_text_transformed((room_width-28)*WINDOW_SCALE,(room_height-16)*WINDOW_SCALE,time,2,2,0);
draw_set_font(fntPixel);