function sonar(snd) {
	if (global.sonido) {
		audio_play_sound(snd,0,0);
	}
}

function sonar_musica(snd) {
	if (global.sonido) {
		audio_play_sound(snd,0,1);
	}
}

function is_musica(snd) {
	var sonando = 0;
	if (audio_is_playing(snd)) {
		sonando = 1;
	}
	
	return sonando;
}