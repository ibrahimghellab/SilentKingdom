extends Node2D

@onready var animation_player = $AnimationPlayer

func _ready():
	animation_player.play("fade_in")

func remove_all_enemies():
	print("ok")
	for child in get_children():
		if child is Ennemy:
			child.queue_free()  
