extends Control


var select = preload("res://Assets/tscn/level_select.tscn")

func _ready():
	$Transition.fadeOut()
	
func _on_play_pressed():
	$Transition.fadeIn(select)
	await get_tree().create_timer(1.2).timeout 
	get_tree().change_scene_to_packed(select)

func _on_options_pressed():
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
