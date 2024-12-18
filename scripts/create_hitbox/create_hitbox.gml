function create_hitbox(_x, _y, _creator, _sprite, _knockback, _lifespan, _damage, _xscale){
	
	var _hitbox = instance_create_layer(_x,_y,"Instances", o_hitbox);
	_hitbox.sprite_index = _sprite;
	_hitbox.creator = _creator;
	_hitbox.knockback = _knockback;
	_hitbox.alarm[0] = _lifespan;
	_hitbox.damage = _damage;
	_hitbox.image_xscale = _xscale
	_hitbox.image_yscale = spritescale;
}