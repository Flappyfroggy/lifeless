extends Node2D
@onready var scene5 = preload("res://scene5dialogue.dialogue")
@onready var ghost = $static
func _process(_float) -> void:
	if e.ghostappearance:
		ghost.show()
	if e.to_scene6:
		get_tree().change_scene_to_file("res://scenes/scene_6.tscn")
func _ready():
	DialogueManager.show_dialogue_balloon(scene5, "start")
	ghost.hide()
