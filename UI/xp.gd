extends ProgressBar


func _process(delta):
	max_value = Global.player.cap_xp[0]
	value = Global.player.xp
