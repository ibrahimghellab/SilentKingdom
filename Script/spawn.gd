extends Node2D

const ENNEMY2 = preload("res://ennemy/ennemy2.tscn")
const ENNEMY1 = preload("res://ennemy/ennemy.tscn")
@export var spawn_distance_min = 200  # Distance minimale de sécurité
@export var spawn_distance_max = 200 
@export var mobs_to_spawn = 1  # Nombre de mobs à générer
var world_limits = Rect2(Vector2(10, 10), Vector2(1800, 920)) 
@export var margin = 100
@export var amount: int = 1
@export var proba_ennemy_2 = 0

func spawn_enemy():
	var camera_rect = Rect2(
		Global.player.camera.global_position - get_viewport().get_visible_rect().size / 2,
		get_viewport().get_visible_rect().size
	)

	# Obtenir une position aléatoire en dehors de la caméra mais dans les limites du monde
	var spawn_position = get_random_position_in_margin(camera_rect)
	if spawn_position != Vector2.ZERO:
		var enemy_instance: Node
		if randf() > proba_ennemy_2:
			enemy_instance = ENNEMY1.instantiate()
		else:
			enemy_instance = ENNEMY2.instantiate()
		enemy_instance.global_position = spawn_position
		get_parent().add_child(enemy_instance)
	else:
		print("Impossible de trouver une position valide pour spawn l'ennemi.")

func _process(delta):
	if Global.niveau > 10:
		amount = 3
		proba_ennemy_2 = 0.90
	elif Global.niveau > 7:
		proba_ennemy_2 = 0.50
	elif Global.niveau > 5:
		amount = 2
	elif Global.niveau > 2:
		$Timer.wait_time = 0.5
	elif Global.niveau > 1:
		proba_ennemy_2 = 0.10
func get_random_position_in_margin(camera_rect: Rect2) -> Vector2:
	var attempts = 0
	while attempts < 10:  # Limiter les tentatives pour éviter une boucle infinie
		# Générer une position aléatoire dans la marge autour de la caméra
		var spawn_position = Vector2(
			randf_range(
				world_limits.position.x - margin, 
				world_limits.position.x + world_limits.size.x + margin
			),
			randf_range(
				world_limits.position.y - margin, 
				world_limits.position.y + world_limits.size.y + margin
			)
		)

		# Vérifier si la position est hors de la caméra mais toujours dans les limites du monde
		if not camera_rect.has_point(spawn_position) and world_limits.has_point(spawn_position):
			return spawn_position
		attempts += 1

	# Retourner null si aucune position valide n'est trouvée après 10 tentatives
	return Vector2.ZERO

func _on_timer_timeout():
	for i in range(amount):
		spawn_enemy()
#
#const ENNEMY = preload("res://ennemy/ennemy.tscn")
#@export var spawn_distance_min = 200  # Distance minimale de sécurité
#@export var spawn_distance_max = 200 
#@export var mobs_to_spawn = 1  # Nombre de mobs à générer
#
#
#
#func spawn_mobs():
	#for i in range(mobs_to_spawn):
		#var spawn_position = get_valid_spawn_position()
		#if spawn_position != null:
			#var mob = ENNEMY.instantiate()
			#mob.position = spawn_position
			#get_parent().add_child(mob)
#
#func get_valid_spawn_position() -> Vector2:
	#var attempts = 10
	#while attempts > 0:
		#var angle = randf_range(0, PI * 2)
		#var distance = randf_range(spawn_distance_min, spawn_distance_max)
		#var offset = Vector2(cos(angle), sin(angle)) * distance
		#var spawn_position = Global.player.position + offset
#
		#if is_valid_spawn_position(spawn_position):
			#return spawn_position
#
		#attempts -= 1
#
	#return Vector2.ZERO
#
#func is_valid_spawn_position(pos: Vector2) -> bool:
	#var world_bounds = Rect2(Vector2(0, 0), Vector2(1800, 950))  # Limites du monde
	#return world_bounds.has_point(pos)
