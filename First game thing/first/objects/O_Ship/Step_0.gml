/// @description Insert description here
// You can write your code in this editor
if (rotation_speed > rotation_damping){
	rotation_speed -= rotation_damping;
} else if (rotation_speed < -rotation_damping){
	rotation_speed += rotation_damping;
} else {
	rotation_speed = 0;
}
show_debug_message(dir[0])
direction += rotation_speed
image_angle = direction - 90

if (speed > 0){
	speed -= 0.03;
} else {
	speed = 0;
}