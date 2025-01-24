extends State

@export var player : Player
@export var animation_sprite : AnimatedSprite2D

func enter():
	pass

func exit():
	pass

func update(_delta : float):
	pass

func physics_update(_delta : float):
	pass
		
func next_transition():
	GameInputEvent.movement_input()
	if GameInputEvent.is_movement_input():
		ready_for_transition.emit("Run")
	
	
	
