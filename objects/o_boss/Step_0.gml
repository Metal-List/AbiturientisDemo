if instance_exists(o_abiturientis) {
	var _distance_to_player = point_distance(x,y, o_abiturientis.x, o_abiturientis.y);
} else {
	set_state_sprite(s_tarnished_widow_idle, animation_speed, 0);
	exit;
}
if array_length(attack_pool) == 1 {
	
		attack_pool = ["attack_one","attack_one", "attack_spit", "attack_spit", "jump_up","jump_up"];
	}
		
switch(state){
	case "waiting":
		#region waiting
		
		if !instance_exists(o_abiturientis) exit;
		image_speed = animation_speed;
		image_xscale = -spritescale;
		var distance_to_player = point_distance(x,y, o_abiturientis.x, o_abiturientis.y);

		if distance_to_player <= 900 {
			state = "chase";
			audio_stop_sound(a_background);
			snd = audio_play_sound(a_boss_battle, 10, true);
		}
		break;
		
		#endregion
		
	case "chase":
		#region chase
		if !instance_exists(o_abiturientis) exit;
		set_state_sprite(s_tarnished_widow_walk, animation_speed, 0);
		if animation_hit_frame(4) or animation_hit_frame(10) {
			audio_play_sound(a_boss_footstep,5,false);
		}
		boss_chase_state();
		boss_knockback();
		break;
		
		#endregion
		
	case "backwalk":
		#region backwalk
		
		if image_xscale != sign(o_abiturientis.x - x) * spritescale {
			image_xscale = sign(o_abiturientis.x - x)  * spritescale;
		if image_xscale == 0 {
			image_xscale = spritescale;
			}
		}
		set_state_sprite(s_tarnished_widow_backwalk, animation_speed, 0)
		if animation_hit_frame(4) or animation_hit_frame(9) {
			audio_play_sound(a_boss_footstep,5,false);
		}
		
		if _distance_to_player <= backup_range {
			punishment ++;
		}
		m_and_c(-image_xscale * chase_speed, 0);
	
		if punishment >= max_punishment {
			punishment = 0;
			state = "attack_buff";
		}
		
		if _distance_to_player > backup_range {
			punishment = 0;
			state = "chase";
		}
	
		break;
		
		#endregion
	case "stall":
		#region stall
		
		set_state_sprite(s_tarnished_widow_idle,animation_speed, 0);
		if alarm[1] <= 0
			{
				state = "chase"	
			}
		boss_knockback();
		break;
		
		#endregion
	case "attack_one":
		#region attack_one
		
		set_state_sprite(s_tarnished_widow_attack1, animation_speed, 0);
		
		if animation_hit_frame(3) {
			audio_play_sound(a_boss_attack_one, 8, false);
		}
		if animation_hit_frame(4) {
			add_screenshake(45,8)
			if o_abiturientis.state != "roll" {
				create_hitbox(x, y, self, s_tarnished_widow_attack1_damage, knockback_one_force, 4, attack_one_damage, image_xscale);
			}
		}
		
		if animation_end(){
			state = "stall";
			alarm[1] = 30;
			
		}
		boss_knockback();
		break
		
		#endregion
		
	case "attack_spit":
		#region attack_spit
		
		
		set_state_sprite(s_tarnished_widow_attack_spit,animation_speed, 0);
		if animation_hit_frame(5) {
			audio_play_sound(a_boss_attack_spit, 8, false);
			if o_abiturientis.state != "roll" {
				create_hitbox(x, y, self, s_tarnished_widow_attack_spit_damage, knockback_spit_force, 2, attack_spit_damage, image_xscale);
			}
		}
		
		if animation_end(){
			state = "stall";
			alarm[1] = 30;
			
		}
		
		boss_knockback();
		break;
		
		#endregion
		
	case "attack_buff":
		#region attack_buff
		
		set_state_sprite(s_tarnished_widow_buff_attack,animation_speed, 0);
		if animation_hit_frame(7) {
			
			audio_play_sound(a_boss_attack_buff, 8, false);
			if o_abiturientis.state != "roll" {
				create_hitbox(x, y, self, s_tarnished_widow_buff_attack_damage, knockback_buff_force, 1, attack_buff_damage, image_xscale);
			}
			if animation_hit_frame (10){
				audio_pause_sound(Firespray_2);
			}
		}
		
		if animation_end(){
			state = "stall";
			alarm[1] = 30;
			
		}
		
		boss_knockback();
		break;
		
		#endregion
	
	case "jump_up":
		#region jump_up
		
		set_state_sprite(s_tarnished_widow_jump_attack_up,animation_speed, 0);
		
		if animation_hit_frame(4) {
			
			audio_play_sound(a_boss_jump_up, 8, false);
			collision_off(self);	
			
		}
		
		if animation_end() {
			self.visible = false;
			alarm[1] = 75;
			state = "jump_stall";
			
			
		}
		
		break;
		
		#endregion
	
	
	case "jump_stall":
		#region jump_stall
		
		set_state_sprite(s_tarnished_widow_idle,animation_speed, 0);
		o_boss.x = o_abiturientis.x;
		if alarm[1] <= 0
			{	
				state = "jump_land"	
			}
		
		break;
		
		#endregion
		
	case "jump_land":
		#region jump_land
		
		self.visible = true;
		set_state_sprite(s_tarnished_widow_jump_attack_land, 0.45, 0);
		if animation_hit_frame(2){
			mask_index = s_tarnished_widow_mask;
		}
		
		if animation_hit_frame(3) {
			audio_play_sound(a_boss_land, 10, false);
			add_screenshake(120,16);
			if o_abiturientis.state != "roll" {
				create_hitbox(x, y, self, s_tarnished_widow_jump_attack_land_damage, knockback_jump_force, 2, attack_jump_damage, image_xscale);
			}
		}
		
		if animation_end() {
			state = "stall";
			alarm[1] = 45;
		}
		
		boss_knockback();
		break;
		
		#endregion
		
	case "death":
		collision_off(self);
		boss_death_state(s_tarnished_widow_death, animation_speed * 2, 0);
		
		//Затишье звука после смерти босса
		audio_sound_gain(snd, 0, 2000);
		
		//for demo
		instance_create_layer(self.x,self.y, "Instances",o_win_timer);
		
			
			
		break;
		
	default:
		show_debug_message("State "+state+" does not exists");
		state = "chase";
		break;
}



