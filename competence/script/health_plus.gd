extends Competence


func execute():
	var val = Global.player.max_health *0.2
	Global.player.health += val
	Global.player.max_health += val
	Global.player.menuLVL()
