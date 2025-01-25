extends Control

@onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	$AudioStreamPlayer2D.stop()
	get_tree().change_scene_to_file("res://test.tscn")


func _on_parametres_pressed() -> void:
	pass


func _on_quit_pressed() -> void:
	get_tree().quit()
	
