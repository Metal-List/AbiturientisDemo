// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function boss_knockback(){
	m_and_c(knockback_speed, 0);
	var _knockback_friction = 0.3
	knockback_speed = approach(knockback_speed, 0, _knockback_friction);
}