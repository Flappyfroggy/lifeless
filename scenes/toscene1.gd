extends Area2D
#GO TO AREA 1
func _on_area_entered(area: Area2D) -> void:
	if area.name == "a2d":
		get_tree().change_scene_to_file("res://scenes/scene_1.tscn")
		e.been_to_area2 = true
