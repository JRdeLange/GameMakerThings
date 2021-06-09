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

function test(){
	show_debug_message(bounce_multiplier)
}