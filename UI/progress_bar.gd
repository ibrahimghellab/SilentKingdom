extends ProgressBar




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	max_value = Global.player.max_health
	value = Global.player.health
