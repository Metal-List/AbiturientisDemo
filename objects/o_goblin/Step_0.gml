if !instance_exists(o_abiturientis) {
	set_state_sprite(s_goblin_idle, animation_speed - 0.2, 0);
	exit;
}
switch (state){
	case "chase":
		#region Chase State
		set_state_sprite(s_goblin_run, animation_speed, 0);
		chase_state();
		#endregion
		break;
		
	case "attack":
		#region Attack State
		var _distance_to_player = point_distance(x,y, o_abiturientis.x, o_abiturientis.y);
		set_state_sprite(s_goblin_attack_one, animation_speed - 0.1, 0);
		if animation_hit_frame(6) and o_abiturientis.state != "roll" {
			audio_play_sound(a_goblin_attack, 4, false);
			create_hitbox(x, y, self, s_goblin_attack_one_damage, 1, damage_frame_count, enemy_damage, image_xscale);
		}
		if animation_end() and _distance_to_player <= attack_range * 3 {
			state = "attack two";
			
		} else if animation_end() {
			state = "chase";
		}
		#endregion
		break;
	
	case "attack two":
		#region attack two state
		if animation_hit_frame_range(0,1) {
			image_xscale = sign(o_abiturientis.x - x) * spritescale;
		}
		set_state_sprite(s_goblin_attack_two,animation_speed - 0.2, 0);
		if animation_hit_frame(6) {
			audio_play_sound(a_goblin_attack_two, 4, false);
			if o_abiturientis.state != "roll" {
				create_hitbox(x, y, self, s_goblin_attack_two_damage, 1, damage_frame_count, enemy_damage, image_xscale);
			}
		}
		
		if animation_end(){
			state = "chase";
		}
		#endregion
		break;
		
	case "knockback":
		#region Knockback State
		knockback_state(s_goblin_hitstun, animation_speed, "chase");
		#endregion
		break;
		
	case "death":
		death_state(s_goblin_death, 0.25, 0);
		break;

	default:
		show_debug_message("State " + state + "does not exists");
		state = "chase";
		break;
		
}