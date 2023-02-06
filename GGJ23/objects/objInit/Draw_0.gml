draw_set_color(c_white);
draw_set_font(fntBoot);

// -- First messages
var mx,my;
mx = 80;
my = 42;

for (i=0; i<2; i++) {
	if (line>i) {
		draw_text(mx,my+(i*15),sentence[i]);
	}
}

// -- Logo
if (line>0) {
	draw_sprite(sprLogoBoot,0,48,45);
}

// -- Loader messages
var fulldots = "";
switch (dots) {
	case 1: fulldots="."; break;
	case 2: fulldots=".."; break;
	case 3: fulldots="..."; break;
}
var lx,ly;
lx = 48;
ly = 105;

for (l=0; l<5; l++) {
	if ((line-2)>l) {
		var mydots="";
		if (l==(line-3)) { mydots = fulldots; }
		
		draw_text(lx,ly+(l*(15+9)),loader[l]+mydots);
		
		if ((line-2)>(l+1)) {
			draw_text(264,ly+(l*(15+9)),"DONE");
		}
	}
}

// -- Game ready
if (line>7) { draw_text(48,249,sentence[2]); }

// -- Play
if (line>8) {
	// -- Click to play
	draw_rectangle(48,273,48+152,273+27,0);
	draw_set_color(make_color_rgb(42,37,43));
	var tab = ((line%2)==0 ? "_" : "");
	draw_text(60,279,sentence[3]+tab);
	draw_set_color(c_white);
	
	//Sound music
	var isOn = (global.sonido ? "ON" : "OFF");
	draw_text(48,312,sentence[4]+isOn+sentence[5]);
}