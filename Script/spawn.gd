#extends Node2D
#

#var world_limits = Rect2(Vector2(0, 0), Vector2(1800, 950)) 
#var margin = 0
#
#func spawn_enemy():
	#var camera_rect = Rect2(
		#Global.player.camera.global_position - get_viewport().get_visible_rect().size / 2,
		#get_viewport().get_visible_rect().size
	#)
#
	## Obtenir une position aléatoire en dehors de la caméra mais dans les limites du monde
	#var spawn_position = get_random_position_outside_camera(camera_rect)
	#var enemy_instance = ENNEMY.instantiate()
	#enemy_instance.global_position = spawn_position
	#add_child(enemy_instance)
	#
#func get_random_position_outside_camera(camera_rect: Rect2) -> Vector2:
	#var spawn_position: Vector2
	#while true:
		## Générer une position aléatoire dans les limites du monde
		#spawn_position = Vector2(
			#randf_range(world_limits.position.x, world_limits.position.x + world_limits.size.x),
			#randf_range(world_limits.position.y, world_limits.position.y + world_limits.size.y)
		#)
#
		## Vérifier si la position est hors de la caméra + marge
		#if not camera_rect.grow(margin).has_point(spawn_position):
			#return spawn_position
	#return Vector2.ZERO
#
#

	
	
extends Node2D

func _on_timer_timeout():
	spawn_mobs()

const ENNEMY = preload("res://ennemy/ennemy.tscn")
@export var spawn_distance_min = 200  # Distance minimale de sécurité
@export var spawn_distance_max = 200 
@export var mobs_to_spawn = 1  # Nombre de mobs à générer



func spawn_mobs():
	for i in range(mobs_to_spawn):
		var spawn_position = get_valid_spawn_position()
		if spawn_position != null:
			var mob = ENNEMY.instantiate()
			mob.position = spawn_position
			get_parent().add_child(mob)

func get_valid_spawn_position() -> Vector2:
	var attempts = 10
	while attempts > 0:
		var angle = randf_range(0, PI * 2)
		var distance = randf_range(spawn_distance_min, spawn_distance_max)
		var offset = Vector2(cos(angle), sin(angle)) * distance
		var spawn_position = Global.player.position + offset

		if is_valid_spawn_position(spawn_position):
			return spawn_position

		attempts -= 1

	return Vector2.ZERO

func is_valid_spawn_position(pos: Vector2) -> bool:
	var world_bounds = Rect2(Vector2(0, 0), Vector2(1800, 950))  # Limites du monde
	return world_bounds.has_point(pos)
