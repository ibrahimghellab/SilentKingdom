extends CharacterBody2D

@export var SPEED = 500

var dir: float
var spawnPos: Vector2
var spawnRot: float
var damage = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	if randi() % 2 == 0:
		$AnimatedSprite2D.play("1")
	else:
		$AnimatedSprite2D.play("2")
	name = "bullet"
	global_position = spawnPos
	global_rotation = spawnRot

func _physics_process(_delta):
	velocity = Vector2(0, -SPEED).rotated(dir)
	move_and_slide()

func set_damage(value):
	damage = value

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_timer_timeout():
	queue_free()
