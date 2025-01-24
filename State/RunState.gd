extends State

@export var player : Player
@export var animation_sprite : AnimatedSprite2D

func enter():
	pass

func exit():
	pass

func update(_delta : float):
	pass

func physics_update(delta : float):
	var direction = GameInputEvent.movement_input()
	if direction:
		player.velocity.x = clamp(player.velocity.x + direction.x * player.acceleration * delta, -player.SPEED, player.SPEED)
		player.velocity.y = clamp(player.velocity.y + direction.y * player.acceleration * delta, -player.SPEED, player.SPEED)
	if direction.x == 0:
		player.velocity.x = move_toward(player.velocity.x, 0, player.deceleration * delta)
	if direction.y == 0:
		player.velocity.y = move_toward(player.velocity.y, 0, player.deceleration * delta)

	player.move_and_slide()
		
func next_transition():
	if player.velocity.length() == 0:
		ready_for_transition.emit("Idle")
