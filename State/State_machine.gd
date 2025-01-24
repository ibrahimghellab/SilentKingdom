extends Node

class_name FiniteStateMachine

@export var initial_state : State

var states : Dictionary = {}
var current_state : State
var current_state_name : String

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.ready_for_transition.connect(on_child_transition)
	
	if initial_state:
		initial_state.enter()
		current_state = initial_state

func _process(delta):
	if current_state:
		current_state.update(delta)

func _physics_process(delta):
	if current_state:
		current_state.physics_update(delta)
		current_state.next_transition()

func on_child_transition(new_state_name : String):
	if new_state_name == current_state_name:
		return
	
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	
	if current_state:
		current_state.exit()
	new_state.enter()
	current_state = new_state
	current_state_name = new_state_name.to_lower()
			
