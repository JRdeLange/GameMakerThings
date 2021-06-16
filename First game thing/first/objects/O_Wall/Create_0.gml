/// @description Insert description here
// You can write your code in this editor
depth = 1

height = sprite_height * 0.5
width = sprite_width * 0.5

// Create Hbounces
upper = instance_create_layer(x, y - height, "Walls", O_Hbounce)
upper.image_xscale = image_xscale

lower = instance_create_layer(x, y + height, "Walls", O_Hbounce)
lower.image_xscale = image_xscale

left = instance_create_layer(x - width, y, "Walls", O_Vbounce)
left.image_yscale = image_yscale

right = instance_create_layer(x + width, y, "Walls", O_Vbounce)
right.image_yscale = image_yscale