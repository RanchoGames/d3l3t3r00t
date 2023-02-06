timer++;
if (timer >= timer_total) {
	timer = 0;
	strip++;
	
	if (strip>7) { ending = 1; }
	if (strip>8) { room_goto(rmJuego); }
	
	timer_total = (timing[strip] * 60);
	
	strip_alpha_goto[strip] = 1;
	
	// -- Sounds
	switch (strip) {
		case 1: sonar(sndIntro1); break;
		case 2: sonar(sndIntro2); break;
		case 3: sonar(sndIntro3); break;
		case 4: sonar(sndIntro4); break;
		case 5: sonar(sndIntro5); break;
		case 6: sonar(sndIntro6); break;
		case 7: sonar(sndIntro7); break;
	}
}

for (i=0; i<strip_total; i++) {
	strip_alpha[i] = lerp(strip_alpha[i],strip_alpha_goto[i],.1);
}