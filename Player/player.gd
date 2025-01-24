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
var xp: int = 0
var cap_xp = [25, 50, 100, 200, 500, 800,  1300, 2000, 3000, 5000, 7500, 10000]
@export var damage: int = 5

func _ready():
	name = "player"
	Global.player = self

func _process(delta):
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
	instance.set_damage(damage)
	get_parent().add_child.call_deferred(instance)
	timerBullet = 0

func take_damage(value: int):
	health = clamp(health - value, 0, max_health)

func take_xp(value: int):
	xp += value
	if len(cap_xp) != 0 and cap_xp[0] <= xp:
		xp -= cap_xp[0]
		cap_xp.remove_at(0)
		level_up()

func level_up():
	Global.niveau += 1
	
	

func _on_area_2d_area_entered(area):
	if area.is_in_group("xp"):
		area.set_player(self)
