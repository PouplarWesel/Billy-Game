extends Camera3D

var isOne = true
var isTwo = false

var count = 0
var countBool = false
func _physics_process(delta):
	if countBool:
		count+=1
		if (count >= 10):
			countBool = false
			count = 0
	if Input.is_action_pressed("Left") && !countBool:
		position.z -= 2
		countBool = !countBool
	elif Input.is_action_pressed("Right") && !countBool:
		position.z += 2
		countBool = !countBool
		
	elif Input.is_action_pressed("Select"):
		if ($RayCast3D.is_colliding()):
			if ($RayCast3D.get_collider().name == "Level1"):
				get_tree().change_scene_to_file("res://level_1.tscn")
			elif ($RayCast3D.get_collider().name == "Level2"):
				get_tree().change_scene_to_file("res://level_2.tscn")
			elif ($RayCast3D.get_collider().name == "Level3"):
				get_tree().change_scene_to_file("res://level_3.tscn")
