extends Node2D
@onready var scene1dialogue = preload("res://scene1dialogue.dialogue")
@onready var ghost = $ghost
func _ready():
	DialogueManager.show_dialogue_balloon(scene1dialogue, "start")
func _process(_float) -> void:
	if e.ghosthidden:
		ghost.hide()


func _on_area_2d_2_area_entered(area: Area2D) -> void:
	if area.name == "a2d":
		get_tree().change_scene_to_file("res://scenes/scene_2.tscn")
