function boss_death_state(_death_sprite, _animation_speed, _image_index){
	set_state_sprite(_death_sprite, _animation_speed, _image_index);
	friction = true;
	
	if animation_hit_frame(2) or animation_hit_frame(7) or animation_hit_frame(17) or animation_hit_frame(19) or animation_hit_frame(21) or animation_hit_frame(23) {
		audio_play_sound(boss_timer_explosion,10,false);
	}
	
	
	if animation_hit_frame(24){
		audio_play_sound(boss_fin_explosion,10,false);
	}
	
	if image_index >= image_number - 1 {
		image_index = image_number - 1;
		image_speed = 0;
		if image_alpha > 0 {
			image_alpha -=0.05;
		
		} else {
			instance_destroy();
		}
	}

m_and_c(knockback_speed, 0);
var _knockback_friction = 0.3
knockback_speed = approach(knockback_speed, 0, _knockback_friction);
}