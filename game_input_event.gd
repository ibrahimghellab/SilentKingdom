extends Node

class_name GameInputEvent

static var direction : Vector2

static func movement_input() -> Vector2:
	var test_direction : Vector2
	test_direction.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	test_direction.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	
	if test_direction.x == 0 and test_direction.y == 0:
		direction = Vector2.ZERO
	else:
		direction = test_direction.normalized()
	
	return direction

static func is_movement_input() -> bool:
	if direction == Vector2.ZERO:
		return false
	else:
		return true
