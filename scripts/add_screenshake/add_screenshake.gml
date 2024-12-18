// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function add_screenshake(_intensity, _duration){
	
	if not instance_exists(o_camera) exit;
	
	with(o_camera) {
		screenshake = _intensity;
		alarm[0] = _duration;
	}

}