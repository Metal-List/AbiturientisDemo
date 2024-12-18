function knockback_state(_knockback_sprite, _animation_speed, _next_stage){
	
	set_state_sprite(_knockback_sprite, _animation_speed, 0);
		image_xscale = -sign(knockback_speed) * spritescale;
		m_and_c(knockback_speed, 0);
		var _knockback_friction = 0.3
		knockback_speed = approach(knockback_speed, 0, _knockback_friction);
		if knockback_speed  == 0 {
			state = _next_stage;
		}
}