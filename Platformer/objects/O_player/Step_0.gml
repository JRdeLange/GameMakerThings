/// @description Insert description here
// You can write your code in this editor

//// INPUT ////
key_left = keyboard_check(vk_left)
key_right = keyboard_check(vk_right)
key_up = keyboard_check(vk_up)
key_down = keyboard_check(vk_down)
key_jump = keyboard_check(vk_space)
key_jump_release = keyboard_check_released(vk_space)

movement = key_right - key_left



//// MOVEMENT ////

yvel += grav
xvel = vel * movement

vertical_coll = place_meeting(x, y + yvel, O_Wall)

// Vertical stuff
if (vertical_coll){
	while (!place_meeting(x, y + sign(yvel), O_Wall)){
		y += sign(yvel)
	}
	yvel = 0
}

// Horizontal stuff
if (place_meeting(x + xvel, y + yvel, O_Wall)){
	while (place_meeting(x - sign(xvel), y + yvel, O_Wall)){
		x -= sign(xvel)
	}
	xvel = 0
}


x += xvel
y += yvel


grounded = place_meeting(x, y + 1, O_Wall) && yvel >= 0

if (grounded) jump_frames = 0
if (!grounded && !key_jump) jump_frames = max_jump_frames

if (key_jump && jump_frames < max_jump_frames && (jump_frames > 0 || yvel == 0)){
	yvel = -jumping_force
	jump_frames++
}
print(jump_frames)

//// SPRITE STUFF ////
if (xvel > 0){
	if (grounded) sprite_index = S_Player_walking
	image_xscale = abs(image_xscale)
}

if (xvel < 0){
	if (grounded) sprite_index = S_Player_walking
	image_xscale = -abs(image_xscale)
}

if (!grounded){
	sprite_index = yvel < 0 ? S_Player_rising : S_Player_fall
}

if (grounded && xvel == 0){
	sprite_index = S_Player_stand
}