/// @description Insert description here
// You can write your code in this editor
engine_firing = false
key_left = keyboard_check(vk_left)
key_right = keyboard_check(vk_right)
key_up = keyboard_check(vk_up)
key_down = keyboard_check(vk_down)

steer = key_left - key_right
throttle = key_up - key_down
engine_firing = key_up || key_down



//// INPUT ////
rotation_speed += steer * rot_acc
rotation_speed = clamp(rotation_speed, -max_rot, max_rot)

direction_vec = deg2vec(direction)
xvel += acceleration * direction_vec[0] * throttle
yvel += acceleration * direction_vec[1] * throttle



//// MOVE ////
// Rotate before collisions in order to do collisions
direction += rotation_speed
image_angle = direction - 90

// Check collisions
if(bounce()) direction -= rotation_damping

// Actually move and revert rotation if necessary
image_angle = direction - 90
x += xvel
y += yvel

// Damp
vel_vec = normalize([xvel, yvel])
rotation_speed = damp(rotation_speed, rotation_damping)
xvel = damp(xvel, vel_damping * abs(vel_vec[0])) 
yvel = damp(yvel, vel_damping * abs(vel_vec[1]))

if (x > room_width) x = 0
if (y > room_height) y = 0
if (x < 0) x = room_width
if (y < 0) y = room_height



//// ANIMATION ////
if (key_up){
	sprite_index = S_Ship_Engine
} else {
	sprite_index = S_Ship_Still
}

