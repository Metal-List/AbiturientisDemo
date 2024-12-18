draw_self();

if state == "death" exit;

if alarm[0] > 0 {
	var _height = sprite_height / 3;
	draw_rectangle_color(x - 54, y - _height, x - 54 + (hp/max_hp)*120, y-(_height - 12),c_white,c_white,c_white,c_white,false)
	draw_sprite(s_enemy_healthbar, 0, x - 54, y - _height);
}




