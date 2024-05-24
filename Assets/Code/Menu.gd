extends Control


var select = preload("res://Assets/tscn/level_select.tscn")

func _ready():
	$Transition.fadeOut()
	
func _on_play_pressed(): # Play button
	$Transition.fadeIn(select) # Change scene to level select
	await get_tree().create_timer(1.2).timeout  # Wait for 1.2 seconds
	get_tree().change_scene_to_packed(select) # Fallback to change scene

func _on_options_pressed():
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
