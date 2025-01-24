extends Node

class_name State

signal ready_for_transition

func enter():
	pass

func exit():
	pass

func update(_delta : float):
	pass

func physics_update(_delta : float):
	pass

func next_transition():
	pass
