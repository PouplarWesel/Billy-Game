extends Area3D		


func _on_area_entered(area):
	get_tree().change_scene_to_file("res://Assets/tscn/level_select.tscn")
