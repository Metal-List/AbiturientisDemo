var _camera_id = view_camera[0];
var _view_width = camera_get_view_width(_camera_id);
var _view_height = camera_get_view_height(_camera_id);
display_set_gui_size(_view_width, _view_height);

if not instance_exists(o_boss) exit;
draw_hp = o_boss.hp;
draw_max_hp = o_boss.max_hp;
draw_set_font(f_one);


//audio_play_sound(a_music, 10, true);


