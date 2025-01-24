class_name Player
extends CharacterBody2D

@onready var projectile = load("res://bullet/bullet.tscn")
@onready var camera = $Camera2D


var SPEED = 200.0
var direction : Vector2
var acceleration = 1800
var deceleration = 1000
var timerBullet = 0
var bulletCooldown = 0.75
var health: int = 100
var max_health: int = 100

func _ready():
	name = "player"
	Global.player = self

func _process(delta):
	print(global_position)
	$projectileHelper.look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("click"):
		shoot()
	
	timerBullet += delta
	if timerBullet > bulletCooldown:
			shoot()
		
func shoot():
	var instance = projectile.instantiate()
	instance.dir = $projectileHelper.rotation + deg_to_rad(90)
	instance.spawnPos = $projectileHelper/projectileSpawn.global_position
	instance.spawnRot = $projectileHelper.global_rotation
	get_parent().add_child.call_deferred(instance)
	timerBullet = 0

func take_damage(value: int):
	health = clamp(health - value, 0, max_health)
