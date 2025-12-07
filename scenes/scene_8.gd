extends Node2D
@onready var scene8 = preload("res://scene8dialogue.dialogue")
@onready var ghost = $static
func _process(_float) -> void:
	if e.ghosthide:
		ghost.hide()
	if e.over:
		get_tree().quit()
func _ready():
	DialogueManager.show_dialogue_balloon(scene8, "start")
