extends Camera3D

var isOne = true
var isTwo = false

var leftPos = Vector3(-0.87978, 0.621227, 0.012622)
var rightPos = Vector3(-0.87978, 0.621227, 10.012622)

var level1 = preload("res://level_1.tscn")
var level2 = preload("res://level_2.tscn")
var level3 = preload("res://level_3.tscn")
var level4 = preload("res://level_4.tscn")
var level5 = preload("res://level_5.tscn")
var level6 = preload("res://level_6.tscn")

var count = 0
var countBool = false
func _physics_process(delta):
	if countBool:
		count+=1
		if (count >= 20):
			countBool = false
			count = 0
	if Input.is_action_pressed("Left") && !countBool && position.z > leftPos.z:
		position.z -= 2
		countBool = !countBool
	elif Input.is_action_pressed("Right") && !countBool && position.z < rightPos.z:
		position.z += 2
		countBool = !countBool
		
	elif Input.is_action_pressed("Select"):
		if ($RayCast3D.is_colliding()):
			if ($RayCast3D.get_collider().name == "Level1"):
				$"../Transition".fadeIn(level1)
				await get_tree().create_timer(1.2).timeout 
				get_tree().change_scene_to_packed(level1)
			elif ($RayCast3D.get_collider().name == "Level2"):
				$"../Transition".fadeIn(level2)
				await get_tree().create_timer(1.2).timeout 
				get_tree().change_scene_to_packed(level2)
			elif ($RayCast3D.get_collider().name == "Level3"):
				$"../Transition".fadeIn(level3)
				await get_tree().create_timer(1.2).timeout 
				get_tree().change_scene_to_packed(level3)
			elif ($RayCast3D.get_collider().name == "Level4"):
				$"../Transition".fadeIn(level4)
				await get_tree().create_timer(1.2).timeout 
				get_tree().change_scene_to_packed(level4)
			elif ($RayCast3D.get_collider().name == "Level5"):
				$"../Transition".fadeIn(level5)
				await get_tree().create_timer(1.2).timeout 
				get_tree().change_scene_to_packed(level5)
			elif ($RayCast3D.get_collider().name == "Level6"):
				$"../Transition".fadeIn(level6)
				await get_tree().create_timer(1.2).timeout 
				get_tree().change_scene_to_packed(level6)
