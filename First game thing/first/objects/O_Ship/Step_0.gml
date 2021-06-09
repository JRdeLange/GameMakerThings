/// @description Insert description here
// You can write your code in this editor
brake = false
left = keyboard_check(vk_left)
right = keyboard_check(vk_right)
up = keyboard_check(vk_up)
down = keyboard_check(vk_down)

steer = left - right
throttle = up - down

//// Input
rotation_speed += steer * rot_acc
rotation_speed = clamp(rotation_speed, -max_rot, max_rot)

direction_vec = deg2vec(direction)
xvel += acceleration * direction_vec[0] * throttle
yvel += acceleration * direction_vec[1] * throttle

//// MOVE

// rotate 
direction += rotation_speed
image_angle = direction - 90

// Check collisions
wall = instance_place(x + xvel, y + yvel, O_Wall)
if (wall != noone){
	direction -= rotation_speed
	wall_vec = [x + xvel - wall.x, y + yvel - wall.y]
	// Bounce
	if (abs(wall_vec[0]) < abs(wall_vec[1])){
		// Vertical collision
		// If bouncing does not place us into a wall, bounce. Otherwise, speed = 0
		if (place_meeting(x + xvel, y - yvel, O_Wall)){
			killspeed()
		} else { 
			yvel = -yvel * bounce_multiplier
		}
	} else {
		// Horizontal collision
		// If bouncing does not place us into a wall, bounce. Otherwise, speed = 0
		if (place_meeting(x - xvel, y + yvel, O_Wall)){
			killspeed()
		} else {
			xvel = -xvel * bounce_multiplier
		}
	}
	//xvel = 0
	//yvel = 0
}
image_angle = direction - 90
x += xvel
y += yvel
test()

// Damp
vel_vec = normalize([xvel, yvel])
rotation_speed = damp(rotation_speed, rotation_damping)
xvel = damp(xvel, (brake ? vel_damping + vel_brake : vel_damping) * abs(vel_vec[0])) 
yvel = damp(yvel, (brake ? vel_damping + vel_brake : vel_damping) * abs(vel_vec[1]))

if (x > room_width) x = 0
if (y > room_height) y = 0
if (x < 0) x = room_width
if (y < 0) y = room_height

// Draw sprite




// Functions

function killspeed(){
	yvel = 0
	xvel = 0
}
