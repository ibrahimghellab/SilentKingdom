extends Control
class_name  MenuCompetence

@onready var comp_1 = $PanelContainer/VBoxContainer/comp1
@onready var comp_2 = $PanelContainer/VBoxContainer/comp2
@onready var comp_3 = $PanelContainer/VBoxContainer/comp3
@onready var nom1 = $PanelContainer/VBoxContainer/comp1/nom
@onready var nom2 = $PanelContainer/VBoxContainer/comp2/nom
@onready var nom3 = $PanelContainer/VBoxContainer/comp3/nom


func _on_comp_1_pressed():
	Global.player.competence_tab[0].execute()


func _on_comp_2_pressed():
	Global.player.competence_tab[1].execute()


func _on_comp_3_pressed():
	Global.player.competence_tab[2].execute()
