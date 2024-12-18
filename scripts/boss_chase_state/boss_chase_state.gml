function boss_chase_state(){
	if !instance_exists(o_abiturientis) exit;
		
		var _direction_facing = image_xscale;
		var _distance_to_player = point_distance(x,y, o_abiturientis.x, o_abiturientis.y);
		
		var _pick_attack = attack_pool[rand];
		
		switch (_pick_attack){
			case "attack_one":
			attack_range = attack_one_range;
			break;
		 
		 case "attack_spit":
			attack_range = attack_spit_range;
			break;
		 
		 case "jump_up":
			attack_range = attack_jump_range;
			break;
		 
		 default:
			show_debug_message("Range of "+_pick_attack+" is undefined");
			attack_range = 150;
			break;
		}
		
		if _distance_to_player <= attack_range and _distance_to_player > backup_range {
			
			state = _pick_attack;
			array_delete(attack_pool, rand, 1);
			rand = irandom(array_length(attack_pool) - 1);
			
		} 
			
		
		if _distance_to_player > attack_range {
			image_xscale = sign(o_abiturientis.x - x) * spritescale;
			if image_xscale == 0 {
				image_xscale = spritescale;
			}
			m_and_c(_direction_facing * chase_speed, 0);
		}
		
		if _distance_to_player <= backup_range {
			state = "backwalk";
		}
		
}