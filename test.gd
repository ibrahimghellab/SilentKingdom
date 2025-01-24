extends Node2D


func remove_all_enemies():
	print("ok")
	for child in get_children():
		if child is Ennemy:
			child.queue_free()  
