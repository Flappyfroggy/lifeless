extends Node2D
@onready var player = $player
func _process(_float) -> void:
	if e.been_to_area4:
		player.position = Vector2(2260,600)
