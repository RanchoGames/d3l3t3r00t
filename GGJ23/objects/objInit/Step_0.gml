// -- Timer
line_timer++;
if (line_timer>=line_timer_total) { line++; line_timer = 0; }

if (line==1) { line++; }

// -- Dots
dots_timer++;
if (dots_timer >= dots_timer_total) {
	dots_timer=0;
	dots++;
	if (dots>dots_total) { dots=0; }
}