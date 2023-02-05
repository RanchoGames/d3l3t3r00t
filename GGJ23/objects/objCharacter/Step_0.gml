/// @description Movement

character_movement();
character_interaction();
gamepad_movement();

img_timer++;
if (img_timer>=img_timer_total) {
	img++;
	if (img>img_max) { img = 0; }
	img_timer = 0;
}

an_x = lerp(an_x,x,.3);
an_y = lerp(an_y,y,.3);