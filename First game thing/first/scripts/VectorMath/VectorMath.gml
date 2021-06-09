// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function normalize(vec){
	total = sqrt(power(vec[0],2) + power(vec[1],2))
	vec[0] /= total
	vec[1] /= total
	return vec;
}

function deg2vec(deg){
	return [dcos(deg), -dsin(deg)]
}