extends Area2D
func _on_area_entered(area: Area2D) -> void:
	if area.name == "a2d":
		e.playertouchedspikes = true
