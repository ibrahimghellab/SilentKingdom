extends CharacterBody2D
class_name Ennemy

@export var health: int = 50
@export var max_health = 50
@export var damage: int = 10
@export var speed = 50
@export var attack_cooldown = 1
var attack_timer = 0

func take_damage(value: int):
	health = clamp(health - value, 0, max_health)
	if health == 0:
		death()

func _process(delta):
	attack_timer += delta

func afflict_damage(body: Node):
	if body.name == "player" and attack_timer > attack_cooldown:
		var player: Player = body
		player.take_damage(damage)

func death():
	queue_free()
