if (showing==0) {
	if (instance_exists(objCharacter)) {
		if (place_meeting(x,y,objCharacter) && TUTIMER==0) {
			var mid = window_total_imgs();
			miid = mid;
			window_add_img(mid,image,img_x,img_y,title);
			showing = 1;
		}
	}
}
else {
	if (!place_meeting(x,y,objCharacter)) {
		window_delete_img(miid);
		showing = 0;
		miid = noone;
	}
}