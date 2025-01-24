extends CharacterBody2D
class_name Ennemy

const XP = preload("res://xp.tscn")
@export var health: int = 50
@export var max_health = 50
@export var damage: int = 10
@export var speed = 50
@export var attack_cooldown = 1
@export var xp_value = 5
var attack_timer = 0

func take_damage(value: int):
	health = clamp(health - value, 0, max_health)
	if health == 0:
		death()

func _process(delta):
	attack_timer += delta

func afflict_damage(body: Node):
	var player: Player = body
	player.take_damage(damage)

func death():
	drop_xp()
	queue_free()

func drop_xp():
	var xp_instance = XP.instantiate()
	xp_instance.position = position  
	xp_instance.set_xp_value(xp_value)
	get_parent().call_deferred("add_child", xp_instance)
