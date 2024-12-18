if not instance_exists(o_abiturientis) exit;

var _hp_x = 8;
var _hp_y = 8;
var _hp_width = 660;
var _hp_height = 30;

if instance_exists(o_abiturientis){
	draw_hp = lerp(draw_hp, o_abiturientis.hp, 0.2);
	draw_max_hp = o_abiturientis.max_hp;
} else {
	draw_hp = lerp(draw_hp, 0, 0.2);
}
var _hp_percent = draw_hp / draw_max_hp;
draw_rectangle_color(_hp_x,_hp_y,(_hp_percent * _hp_width) + _hp_x, _hp_height + _hp_y,
					hp_colour_2, hp_colour_2, hp_colour, hp_colour, false);
draw_sprite(s_abiturientis_healthbar,0, _hp_x, _hp_y);

if not instance_exists(o_abiturientis) exit;
var _text = "Kills: " + string(o_abiturientis.kills);
var _text_width = string_width(_text);
var _text_height = string_height(_text);
var _start_x = 8;
var _start_y = 45;
var _padding_x = 4;
var _padding_y = 4;

draw_rectangle_color(_start_x,_start_y, _start_x + _text_width + _padding_x, _start_y + _text_height + _padding_y, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
draw_text(_start_x + _padding_x / 2,_start_y + _padding_y ,_text);

_text = "Level: " + string(o_abiturientis.level);
_start_x += _text_width + _padding_x*3;
_text_width = string_width(_text);
_text_height = string_height(_text);


draw_rectangle_color(_start_x,_start_y, _start_x + _text_width + _padding_x, _start_y + _text_height + _padding_y, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);
draw_text(_start_x + _padding_x / 2,_start_y + _padding_y ,_text);
