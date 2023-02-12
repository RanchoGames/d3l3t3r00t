if (showing==0) {
	if (instance_exists(objCharacter)) {
		if (place_meeting(x,y,objCharacter) && TUTIMER==0) {
			var mid = window_total_imgs();
			miid = mid;
			window_add_img(mid,image,image_frame,img_x,img_y,title, file_format);
			global.music_player = sonar(music);
			
			if (is_musica(sndMusic1)) {
				audio_sound_gain(sndMusic1,0,0);
			}
			
			if (is_musica(sndMusic2)) {
				audio_sound_gain(sndMusic2,0,0);
			}
		
			if (is_musica(sndAmbient)) {
				audio_sound_gain(sndAmbient,0,0);
			}
			
			showing = 1;
		}
	}
}
else {
	if (!place_meeting(x,y,objCharacter)) {
		level_musica(LVLACTIVE);
		
		if (is_musica(global.music_player)) {
			audio_stop_sound(global.music_player);
		}
		
		window_delete_img(miid);
		showing = 0;
		sonar(sndCerrarTXT);
		miid = noone;
	}
}