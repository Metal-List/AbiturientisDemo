if not instance_exists(o_boss) exit;

var _hp_x = 360;
var _hp_y = 950;
var _hp_width = 1200;
var _hp_height = 30;

if o_boss.state != "death"{
	draw_hp = lerp(draw_hp, o_boss.hp, 0.2);
	draw_max_hp = o_boss.max_hp;
} else {
	draw_hp = lerp(draw_hp, 0, 0.2);
}
var _hp_percent = draw_hp / draw_max_hp;

if o_boss.state != "waiting" {
	draw_rectangle_color(_hp_x,_hp_y,(_hp_percent * _hp_width) + _hp_x, _hp_height + _hp_y,
						 hp_boss_colour_2, hp_boss_colour_2, hp_boss_colour_1, hp_boss_colour_1, false);
	draw_sprite(s_boss_healthbar,0, _hp_x, _hp_y);
	
	_text = "Tarnished Widow";
	draw_text(365, 915,_text);
}


