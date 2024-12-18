if not instance_exists(o_abiturientis) exit;
var dir = point_direction(x,y, o_abiturientis.x, o_abiturientis.y - 60);
var acceleration = 0.25;
motion_add(dir, acceleration);

if speed > max_speed
{
	speed = max_speed;
}
