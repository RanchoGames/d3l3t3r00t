function sonar(snd) {
	var sound_id = noone;
	if (global.sonido) {
		sound_id = audio_play_sound(snd,0,0);
	}
	return sound_id;
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