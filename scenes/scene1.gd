extends Node2D
@onready var scene1dialogue = preload("res://scene1dialogue.dialogue")
@onready var ghost = $ghost
@onready var player = $player
func _ready():
	if not e.shown_startingdialogue:
		DialogueManager.show_dialogue_balloon(scene1dialogue, "start")
		e.shown_startingdialogue = true
	if e.been_to_area2:
		player.position = Vector2(2150,500)
func _process(_float) -> void:
	if e.ghosthidden:
		ghost.hide()


func _on_area_2d_2_area_entered(area: Area2D) -> void:
	if area.name == "a2d":
		get_tree().change_scene_to_file("res://scenes/scene_2.tscn")
