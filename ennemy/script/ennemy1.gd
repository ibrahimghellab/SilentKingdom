extends Ennemy


@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	if Global.player:
		var direction = (Global.player.global_position - global_position).normalized()
		
		if direction.x >0:
			animated_sprite_2d.flip_h = false
		elif direction.x < 0:
			animated_sprite_2d.flip_h = true
		if direction.y >0:
			animated_sprite_2d.play("move_front")
		elif direction.y < 0:
			animated_sprite_2d.play("move_back")
		
		velocity = direction * speed
		move_and_slide()
	
	



func _on_area_2d_body_entered(body):
	if body.name == "player":
		afflict_damage(body)
	elif body.is_in_group("bullet"):
		take_damage(body.damage)
		body.queue_free()
