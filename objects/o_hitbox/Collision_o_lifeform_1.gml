if creator == noone or creator == other or ds_list_find_index(hit_objects, other) !=-1 {
	exit;	
}

other.hp -= damage;
//audio_play_sound(a_medium_hit, 8, false);
//repeat(10)
//{
	//instance_create_layer(other.x, other.y - 12, "Effects", o_hit_effect);
//}


if instance_exists(o_abiturientis) {
	
	
	if creator.object_index == o_abiturientis and other.hp <= 0 and other.state != "death" {
		o_abiturientis.kills++;
	}
	// Удар по игроку
	if other.object_index == o_abiturientis {
		//if creator.object_index == o_boss {
			//add_screenshake(10, 16);
		//} else {
			add_screenshake(6, 10);
		}
		if other.hp <= 0 {
			//var _number = sprite_get_number(s_skeleton_bones);	
			//for (var _i = 0; _i < _number; _i++){
				//var _bx = other.x + random_range (-8, 8);
				//var _by = other.y + random_range (-24, 8);
				//var _bone = instance_create_layer(_bx,_by,"Instances", o_sceleton_bone);
				//_bone.direction = 90 - (image_xscale * random_range(30,60));
				//_bone.speed = random_range(3,10);
				//_bone.image_index = _i;
				//if _i == 5 _bone.image_angle = 130;  //специально для падения меча
			//}
			//ini_open("save.ini")
			//ini_write_real("Scores", "Kills", other.kills);
			//var _highscore = ini_read_real("Scores", "Highscore", 0);
			//if other.kills > _highscore {
				//ini_write_real("Scores", "Highscore", other.kills)	
			//}
			//ini_close();
		//}
	//} else {
		// Удар по противнику
		//other.alarm[0] = 190;
		//add_screenshake(2, 5);
	}
}

ds_list_add(hit_objects, other);
if other.state != "death" { //and other.object_index != o_boss {
	other.state = "knockback";
}
other.knockback_speed = knockback * image_xscale;




