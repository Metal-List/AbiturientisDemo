if hp <= 0 and state != "death" {
	state = "death";
	
	repeat (experience)
		{
			instance_create_layer(x + random_range(-8,8) + 40, y - 120 + random_range(-8,8), "Effects", o_experience);
		}
}
