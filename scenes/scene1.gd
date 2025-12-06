extends Node2D
@onready var scene1dialogue = preload("res://scene1dialogue.dialogue")
@onready var ghost = $ghost
func _ready():
	DialogueManager.show_dialogue_balloon(scene1dialogue, "start")
func _process(float) -> void:
	if e.ghosthidden:
		ghost.hide()
