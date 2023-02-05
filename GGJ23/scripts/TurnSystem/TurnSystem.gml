/*
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
- TURN INIT
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
*/

// -- Turns
global.turn = 0;
global.turn_timer = 0;
global.turn_timer_total = 5;
global.total_turns = 1;

#macro TU global.turn
#macro TUTIMER global.turn_timer
#macro TUTIMERTOTAL global.turn_timer_total
#macro TUTOTAL global.total_turns


// -- Steps
global.steps = 7;
global.steps_total = 7;

#macro ST global.steps
#macro STTOTAL global.steps_total

global.starting_x = 0;
global.starting_y = 0;


/*
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
- TURN INIT
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
*/

function turn_next(){
	var myturn = (TU==0 ? 1 : 0);
	if (myturn /*&& LVLACTIVE>=7*/) { ST--; }
	
	TU++;
	TUTIMER = TUTIMERTOTAL;
	
	if (TU>TUTOTAL) { TU=0; }
	
	// -- Restart level if no steps available
	if (ST<=0) {
		with (objCharacter) {
			objCharacter.x = global.starting_x;
			objCharacter.y = global.starting_y;
			objCharacter.an_x = objCharacter.x;
			objCharacter.an_y = objCharacter.y;
			
			ST = STTOTAL;
			global.shake_x = 6;
			global.shake_y = 6;
		}
	}
}


/*
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
- TURN STEP
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
*/

// -- Step for the timer
function turn_step() {
	if (TUTIMER>0) { TUTIMER--; }
	
	// Get to the enemy turn
	if (TU==1 && TUTIMER==0) {
		turn_enemy();
		turn_next();
	}
}

// -- Enemies turn
function turn_enemy() {
	// :( no enemies
}


/*
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
- RESTART STARTING POINT
□━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━□
*/

function restart_starting_point(sx,sy) {
	global.starting_x = sx;
	global.starting_y = sy;
}