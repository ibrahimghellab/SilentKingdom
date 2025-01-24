extends Node
class_name CompetenceHelper


var competences : Dictionary = {}
var competence_names = []

func _ready():
	for child in get_children():
		if child is Competence:
			competence_names.append(child.name.to_lower())
			competences[child.name.to_lower()] = child


func get_competence_at(i: int):
	return competences[competence_names[i]]

func get_three_competences():
	pass

func get_three_unique_randoms_alternative(n: int) -> Array:
	var all_numbers = range(0, n + 1) 
	all_numbers.shuffle()
	return all_numbers.slice(0, 3)  
