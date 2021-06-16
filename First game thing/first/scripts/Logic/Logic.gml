// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function damp(val, damping){
	if (val > damping){
		val -= damping
	} else if (val < - damping){
		val += damping
	} else {
		val = 0
	}
	return val
}

function print(message){
	show_debug_message(message)
}

function bounce(){
	wall = instance_place(x + xvel, y + yvel, O_Wall)
	if (wall != noone){
		wall_vec = [x + xvel - wall.x, y + yvel - wall.y]
		// Bounce
		if (abs(wall_vec[0]) < abs(wall_vec[1])){
			// Vertical collision
			// If bouncing does not place us into a wall, bounce. Otherwise, speed = 0
			if (place_meeting(x + xvel, y - yvel, O_Wall)){
				killspeed()
			} else { 
				yvel = -yvel
			}
		} else {
			// Horizontal collision
			// If bouncing does not place us into a wall, bounce. Otherwise, speed = 0
			if ( place_meeting(x - xvel, y + yvel, O_Wall)){
				killspeed()
			} else {
				xvel = -xvel
			}
		}
		xvel = xvel * bounce_multiplier
		yvel = yvel * bounce_multiplier
	}
	
	return wall != noone
}

function killspeed(){
	yvel = 0
	xvel = 0
}
