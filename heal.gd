extends Competence

func execute():
	Global.player.health += Global.player.max_health/2
	Global.player.menuLVL()
