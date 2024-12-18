event_inherited(); //Запускает create event родителя (o_lifeform)
image_speed = 0.5;
spritescale = 5;
state = "move";
run_speed = 8;
roll_speed = 12;
jump_height = 12;
animation_speed = 0.5;
kills = 0;
level = 1;
experience = 0;
max_experience = 10;



strength = 1;

//Параметры нанесения урона
damage_frame_count = 4;

attack_one_damage = 5;
knockback_one_force = 1;

attack_two_damage = 7;
knockback_two_force = 1;

attack_three_damage = 45;
knockback_three_force = 1;

knockback_friction = 0.3; // скорость остановки после удара


// Зависимости
input = instance_create_layer(0,0,"Instances", o_input);
