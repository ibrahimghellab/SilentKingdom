extends Node2D

const ENNEMY = preload("res://ennemy/ennemy.tscn")
var world_limits = Rect2(Vector2(0, 0), Vector2(1800, 950)) 
var margin = 0

func spawn_enemy():
	var camera_rect = Rect2(
		Global.player.camera.global_position - get_viewport().get_visible_rect().size / 2,
		get_viewport().get_visible_rect().size
	)

	# Obtenir une position aléatoire en dehors de la caméra mais dans les limites du monde
	var spawn_position = get_random_position_outside_camera(camera_rect)
	var enemy_instance = ENNEMY.instantiate()
	enemy_instance.global_position = spawn_position
	add_child(enemy_instance)
	
func get_random_position_outside_camera(camera_rect: Rect2) -> Vector2:
	var spawn_position: Vector2
	while true:
		# Générer une position aléatoire dans les limites du monde
		spawn_position = Vector2(
			randf_range(world_limits.position.x, world_limits.position.x + world_limits.size.x),
			randf_range(world_limits.position.y, world_limits.position.y + world_limits.size.y)
		)

		# Vérifier si la position est hors de la caméra + marge
		if not camera_rect.grow(margin).has_point(spawn_position):
			return spawn_position
	return Vector2.ZERO


func _on_timer_timeout():
	spawn_enemy()
