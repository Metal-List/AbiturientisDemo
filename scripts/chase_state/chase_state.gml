// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function chase_state(){
	if !instance_exists(o_abiturientis) exit;
		
		image_xscale = sign(o_abiturientis.x - x) * spritescale;
		if image_xscale == 0 {
			image_xscale = spritescale;
		}
		
		var _direction_facing = image_xscale;
		var _distance_to_player = point_distance(x,y, o_abiturientis.x, o_abiturientis.y);
		if _distance_to_player <= attack_range {
			state = "attack";	
		} else {
			
			m_and_c(_direction_facing * chase_speed, 0);
		}
}