switch (state){
	case "move":
		#region Move State
		if input.right {
			m_and_c(run_speed, 0);
			image_xscale = spritescale;
			sprite_index = s_knight_run;
			image_speed = animation_speed;
		}

		if input.left {
			m_and_c(-run_speed, 0);
			image_xscale = -spritescale;
			sprite_index = s_knight_run;
			image_speed = animation_speed;
		}

		if (!input.right and !input.left) or (input.right and input.left) {
			sprite_index = s_knight_Idle
			image_speed = animation_speed - 0.1;
		} else {
			 if animation_hit_frame(0) or animation_hit_frame(4) {
				 audio_play_sound(a_footstep_1, 4, false);
			 } 
		}
		
		
	
		if input.roll {
			state  = "roll";
		}
		
		if input.attack_button {
			state  = "attack_one";
		}
		
		if input.jump {
			state = "jump";
		}
		
		#endregion
		break;
		
	case "roll":
		#region Roll State
		set_state_sprite(s_knight_roll,animation_speed + 0.05,0);
		
		if animation_hit_frame(0){
			audio_play_sound(a_roll, 3, false);
		}
		
		if image_xscale == spritescale {
			m_and_c(roll_speed,0);
		}
		
		if image_xscale == -spritescale {
			m_and_c(-roll_speed,0);
			
		}
		
		if animation_end(){
			state = "move";
		}
		
		#endregion
		break;
	case "jump":
		#region Jump State
		set_state_sprite(s_knight_jump_and_fall, animation_speed / 2, 0);
		
		if input.right {
			image_xscale = spritescale;
			if animation_hit_frame_range(0,3) {
				m_and_c(run_speed + 4, -jump_height);	
			} else {
				m_and_c(run_speed + 4, jump_height);
			}
		}

		else if input.left {
			image_xscale = -spritescale;
			if animation_hit_frame_range(0,3) {
				m_and_c(-run_speed - 4, -jump_height);	
			} else {
				m_and_c(-run_speed - 4, jump_height);
			}
		}	
		else if input.left and  input.right {
			if animation_hit_frame_range(0,3) {
				m_and_c(0, -jump_height);	
			} else {
				m_and_c(0, jump_height);
			}
		}
		else {
			if animation_hit_frame_range(0,3) {
				m_and_c(0, -jump_height);	
			} else {
				m_and_c(0, jump_height);
			}
		}
		
		
		if animation_end(){
			state = "move";
		}
		#endregion
		break;
		
	case "attack_one":
		#region Attack one State
		set_state_sprite(s_knight_attack_one,animation_speed + 0.05,0);
		
		if animation_hit_frame(2){
			audio_play_sound(a_sword_attack_1, 6, false);
			create_hitbox(x,y, self, s_knight_attack_one_damage, knockback_one_force,
							damage_frame_count, attack_one_damage, image_xscale);
		}
		
		if input.attack_button and animation_hit_frame_range(3,8) {
			state  = "attack_two";
		}
		
		if animation_end(){
			state = "move"
		}
		#endregion
		break;
	case "attack_two":
		#region Attack two State
		set_state_sprite(s_knight_attack_two,animation_speed + 0.05,0);
		
		if animation_hit_frame(3){
			audio_play_sound(a_sword_attack_2, 6, false);
			create_hitbox(x,y, self, s_knight_attack_two_damage, knockback_two_force, damage_frame_count, attack_two_damage, image_xscale);
		}
		
		if input.attack_button and animation_hit_frame_range(4,8) {
			state  = "attack_three";
		}
		if animation_end(){
			state = "move";
		}
		#endregion
		break;
	case "attack_three":
		#region Attack three State
		set_state_sprite(s_knight_attack_three,animation_speed - 0.05,0);
		
		if image_xscale == spritescale {
			if animation_hit_frame_range(2 , 3){
			m_and_c(run_speed + 5, 0);	
			}
			
			if animation_hit_frame_range(3 , 4){
			m_and_c(run_speed, 0);	
			}
		
			if animation_hit_frame_range(5 , 6){
			m_and_c(run_speed + 4.3, 0);	
			}
		}
		
		if image_xscale == -spritescale {
			if animation_hit_frame_range(2 , 3){
			m_and_c(-run_speed - 5, 0);	
			}
			
			if animation_hit_frame_range(3 , 4){
			m_and_c(-run_speed, 0);	
			}
		
			if animation_hit_frame_range(5 , 6){
			m_and_c(-run_speed - 4.3, 0);	
			}
		}
		
		
		if animation_hit_frame(6){
			audio_play_sound(a_sword_attack_3, 6, false);
			create_hitbox(x,y, self, s_knight_attack_three_damage, knockback_three_force, damage_frame_count, attack_three_damage, image_xscale);
		}
		if input.attack_button and animation_hit_frame_range(8,11) {
			state  = "attack_one";
		}
		
		if animation_end(){
			state = "move";
		}
		#endregion
		break;
		
	case "knockback":
		#region Knockback State
		knockback_state(s_knight_hitstun, animation_speed, "move");
		#endregion
		break;
		
	case "death":
		death_state(s_knight_death, animation_speed, 0);
		break;
		
	default:
		show_debug_message("State "+state+" does not exists");
		state = "move";
		break;

}
		