/// @description Insert description here
// You can write your code in this editor

/*
colliders = ds_list_create()
instance_place_list(x + xvel, y + yvel, O_Wall, colliders, true)
if (ds_list_size(colliders) > 0){
	wall_vec = [x + xvel - colliders[| 0].x, y + yvel - colliders[| 0].y]
	// Bounce
	if (abs(wall_vec[0]) < abs(wall_vec[1])){
		// Vertical collision
		// If bouncing does not place us into a wall, bounce. Otherwise, speed = 0
		if (!place_meeting(x + xvel, y - yvel * bounce_multiplier, O_Wall)){
			yvel = -yvel
		} else if (!place_meeting(x - xvel * bounce_multiplier, y + yvel, O_Wall)){ 
			xvel = -xvel
		} else {
			yvel = -yvel
		}
	} else if (abs(wall_vec[0]) > abs(wall_vec[1])) {
		// Horizontal collision
		// If bouncing does not place us into a wall, bounce. Otherwise, speed = 0
		if (!place_meeting(x - xvel, y + yvel, O_Wall)){
			xvel = -xvel
		} else if (!place_meeting(x + xvel, y - yvel, O_Wall)){
			yvel = -yvel
		} else {
			xvel = -xvel
		} 
	} else {
		xvel = -xvel
		yvel = -yvel
	}
	xvel *= bounce_multiplier
	yvel *= bounce_multiplier
}
*/

function bullet_bounce(object){
	return (place_meeting(x + xvel*0.25, y + yvel*0.25, object) || place_meeting(x + xvel*0.5, y + yvel*0.5, object) || 
	place_meeting(x + xvel*0.75, y + yvel*0.75, object) || place_meeting(x + xvel, y + yvel, object))
}


if (bullet_bounce(O_Hbounce)){
	yvel = -yvel
}
if (bullet_bounce(O_Vbounce)){
	xvel = -xvel
}


x += xvel
y += yvel