event_inherited();

attack_pool = ["attack_one","attack_one", "attack_spit", "attack_spit", "jump_up","jump_up"];

rand = irandom(array_length(attack_pool) - 1);
show_debug_message(rand);

spritescale = 8;
image_xscale = spritescale;
image_yscale = spritescale;
state = "waiting";
hp = 100;
max_hp = hp;
chase_speed = 0.5;
max_chase_speed = 1;
experience = 50;


attack_range = 150;


//Параметры нанесения урона
damage_frame_count = 4;

attack_buff_damage = 15;
knockback_buff_force = 2;

attack_one_damage = 10;
attack_one_range = 425;
knockback_one_force = 1.2;

attack_spit_damage = 12;
attack_spit_range = 630;
knockback_spit_force = 1;

attack_jump_damage = 5;
attack_jump_range = 1500;
knockback_jump_force = 2;

knockback_friction = 0.3; // скорость остановки после удара


backup_range = 400;

punishment = 0;
max_punishment = 60;

animation_speed = 0.3;


// Для отрисовки HP
var _camera_id = view_camera[0];
var _view_width = camera_get_view_width(_camera_id);
var _view_height = camera_get_view_height(_camera_id);
display_set_gui_size(_view_width, _view_height);

if not instance_exists(o_boss) exit;
draw_hp = o_boss.hp;
draw_max_hp = o_boss.max_hp;

//Для музыки босса



