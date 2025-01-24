extends Area2D

@export var value: int = 5
var player: Player
@export var max_speed: float = 300  # Vitesse maximale
@export var acceleration: float = 100  # Facteur d'accélération
@export var min_distance: float = 10  # Distance minimale pour éviter des comportements étranges

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player:
		var direction = (player.global_position - global_position).normalized()

		var distance = global_position.distance_to(player.global_position)

		var speed = clamp(distance * acceleration, 0, max_speed)

		if distance > min_distance:
			global_position += direction * speed * delta

func set_player(p: Player):
	player = p

func set_xp_value(v: int):
	value = v


func _on_body_entered(body):
	if body.name == "player":
		body.take_xp(value)
		queue_free()
