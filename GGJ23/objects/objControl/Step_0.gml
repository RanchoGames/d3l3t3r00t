turn_step();

dots_timer++;
if (dots_timer >= dots_timer_total) {
	dots_timer=0;
	dots++;
	if (dots>dots_total) { dots=0; }
}