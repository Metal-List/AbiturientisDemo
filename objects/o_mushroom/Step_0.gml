if !instance_exists(o_abiturientis) {
	set_state_sprite(s_mushroom_idle, animation_speed, 0);
	exit;
}

switch (state){
	case "chase":
		#region Chase State
		set_state_sprite(s_mushroom_run, animation_speed, 0);
		chase_state();
		#endregion
		break;
		
	case "attack":
		#region Attack State
		set_state_sprite(s_mushroom_attack_one, animation_speed + 0.1, 0);
		if animation_hit_frame(6) {
			audio_play_sound(a_mushroom_attack, 4, false);
			if o_abiturientis.state != "roll"{
				create_hitbox(x, y, self, s_mushroom_attack_one_damage, knockback_force, damage_frame_count, enemy_damage, image_xscale);
			}
		}
		
		if animation_end(){
			state = "chase";
		}
		#endregion
		break;
		
	case "knockback":
		#region Knockback State
		knockback_state(s_mushroom_hitstun, animation_speed, "chase");
		#endregion
		break;
		
	case "death":
		death_state(s_mushroom_death, 0.25, 0);
		break;

	default:
		show_debug_message("State " + state + "does not exists");
		state = "chase";
		break;
		
}
