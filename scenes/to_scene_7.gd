extends Area2D


func _on_area_entered(area: Area2D) -> void:
	if area.name == "a2d":
		get_tree().change_scene_to_file("res://scenes/scene_7.tscn")
		e.been_to_area6 = true
