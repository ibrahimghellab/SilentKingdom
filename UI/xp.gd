extends ProgressBar


func _process(_delta):
	max_value = Global.player.cap_xp[0]
	value = Global.player.xp
