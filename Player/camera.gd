extends Camera2D
class_name  Camera

var camera_rect

# Called when the node enters the scene tree for the first time.
func _ready():
	var viewport_size = get_viewport().get_visible_rect().size
	var camera_position = global_position
	camera_rect = Rect2(
		camera_position - viewport_size / 2,
		viewport_size
	)
