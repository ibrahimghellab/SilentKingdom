extends Node2D

var is_menulvl = false
@onready var menu_lvl : Control = $CanvasLayer/MenuLVL


func _physics_process(delta):
	if Input.is_action_just_pressed("space"):
		menuLVL()
	
func menuLVL():
	if !menu_lvl.visible:
		menu_lvl.show()
		Engine.time_scale = 0
	else:
		menu_lvl.hide()
		Engine.time_scale = 1
