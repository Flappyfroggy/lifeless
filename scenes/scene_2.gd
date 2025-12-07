extends Node2D
@onready var player = $player
func _ready():
	if e.been_to_area3:
		player.position = Vector2(2300,85)
