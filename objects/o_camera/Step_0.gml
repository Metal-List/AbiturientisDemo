x += random_range(-screenshake,screenshake);
y += random_range(-screenshake,screenshake);

if not instance_exists(o_abiturientis) exit;

var _target_x = o_abiturientis.x;
var _target_y= o_abiturientis.y - 48;


x = lerp(x, _target_x, 0.2);
y = lerp(y, _target_y, 0.2);

camera_set_view_pos(view_camera[0], x - width / 2, y - height / 2);





