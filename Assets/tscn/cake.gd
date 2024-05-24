extends Area3D		

var select = preload("res://Assets/tscn/level_select.tscn")

func _on_area_entered(area):
	%Transition.fadeIn(select)
	await get_tree().create_timer(1.2).timeout 
	get_tree().change_scene_to_packed(select)
	
