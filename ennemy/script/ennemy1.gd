extends Ennemy




func _physics_process(delta):
	if Global.player:
		var direction = (Global.player.global_position - global_position).normalized()
		velocity = direction * speed
		move_and_slide()
	
	



func _on_area_2d_body_entered(body):
	afflict_damage(body)
