strip = 0;
strip_total = 8;
timer = 0;
timer_total = 30;

for (i=0; i<strip_total; i++) {
	strip_alpha[i] = 0;
	strip_alpha_goto[i] = 0;
}

// -- Images
image[1]	= sprIntro1;
image[2]	= sprIntro2;
image[3]	= sprIntro3;
image[4]	= sprIntro4;
image[5]	= sprIntro5;
image[6]	= sprIntro6;
image[7]	= sprIntro7;


// -- Sounds
loc[1]		= sndIntro1;
loc[2]		= sndIntro2;
loc[3]		= sndIntro3;
loc[4]		= sndIntro4;
loc[5]		= sndIntro5;
loc[6]		= sndIntro6;
loc[7]		= sndIntro7;


// -- Timing
timing[1]	= 2.86;
timing[2]	= 2.15;
timing[3]	= 1.61;
timing[4]	= 2.00;
timing[5]	= 2.78;
timing[6]	= 2.88;
timing[7]	= 2.58;
timing[8]	= 1;
timing[9]	= 0.1;

ending = 0;