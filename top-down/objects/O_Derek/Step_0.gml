/// @description Insert description here
// You can write your code in this editor

//// INPUT ////

key_left = keyboard_check(vk_left)
key_right = keyboard_check(vk_right)
key_up = keyboard_check(vk_up)
key_down = keyboard_check(vk_down)

leftright = key_right - key_left
updown = key_down - key_up

//// MOVEMENT ////
xvel = 0
yvel = 0

xvel += vel * leftright
yvel += vel * updown

x += xvel
y += yvel


//// ANIMATION ////

if (xvel == 0 and yvel == 0){
	sprite_index = S_Derek_standing
} else {
	sprite_index = S_Derek_walking
	if (leftright != 0) image_xscale = sign(leftright)
}

