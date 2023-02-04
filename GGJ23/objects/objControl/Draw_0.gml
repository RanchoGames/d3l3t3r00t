/// @description Insert description here
// You can write your code in this editor

window_draw_background();

// -- Draw active level
var active_x1 = level_get_x1(LVLACTIVE);
var active_x2 = level_get_x2(LVLACTIVE);
var active_y1 = level_get_y1(LVLACTIVE);
var active_y2 = level_get_y2(LVLACTIVE);

draw_window(active_x1,active_y1,active_x2,active_y2,1);

//draw_playablezone();