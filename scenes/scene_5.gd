extends Node2D
@onready var scene5 = preload("res://scene5dialogue.dialogue")
@onready var ghost = $static
func _process(_float) -> void:
	if e.ghostappearance:
		ghost.show()
func _ready():
	DialogueManager.show_dialogue_balloon(scene5, "start")
	ghost.hide()
