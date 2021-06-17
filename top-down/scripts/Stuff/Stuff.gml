// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function print(message){
	show_debug_message(message)
}

function normalize(vec){
	len = sqrt(vec[0] * vec[0] + vec[1] * vec[1])
	return[vec[0] / len, vec[1] / len]
}

function len(array){
	return array_length(array)
}

function multi_place_meeting(types, x, y){
	for (idx = 0; idx < len(types); idx++){
		type = types[idx]
		print(type)
		if (place_meeting(x, y, type)) return true
	}
	return false
}