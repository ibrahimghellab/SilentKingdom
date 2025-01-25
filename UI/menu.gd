extends Control

@onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	animation_player.play("fade_out")


func _on_parametres_pressed() -> void:
	pass


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_animation_player_current_animation_changed(name):
	get_tree().change_scene_to_file("res://test.tscn")
