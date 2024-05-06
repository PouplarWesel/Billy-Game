extends PathFollow3D

func _physics_process(delta :float) -> void:
	if (Input.is_action_pressed("ui_left")):
		if (Input.is_action_pressed("Shift")):
			progress += 10 * delta
		else:
			progress += 5 * delta
	elif (Input.is_action_pressed("ui_right")):
		if (Input.is_action_pressed("Shift")):
			progress -= 10 * delta
		else:
			progress -= 5 * delta
		
	if (Input.is_action_pressed("Rotate Up")):
		if (Input.is_action_pressed("Shift")):
			$Camera3D.rotate_z(0.05)
		else:
			$Camera3D.rotate_z(0.01)
	elif (Input.is_action_pressed("ui_up")):
		if (Input.is_action_pressed("Shift")):
			$Camera3D.position.y += (0.05)
		else:
			$Camera3D.position.y += (0.01)
		
	if (Input.is_action_pressed("Rotate Down")):
		if (Input.is_action_pressed("Shift")):
			$Camera3D.rotate_z(-0.05)
		else:
			$Camera3D.rotate_z(-0.01)
	elif (Input.is_action_pressed("ui_down")):
		if (Input.is_action_pressed("Shift")):
			$Camera3D.position.y += (-0.05)
		else:
			$Camera3D.position.y += (-0.01)
		
	if (Input.is_action_just_pressed("Wheel Up")):
		if (Input.is_action_pressed("Shift")):
			$Camera3D.set_fov($Camera3D.get_fov() - 5)
		else:
			$Camera3D.set_fov($Camera3D.get_fov() - 1)
	elif (Input.is_action_just_pressed("Wheel Down")):
		if (Input.is_action_pressed("Shift")):
			$Camera3D.set_fov($Camera3D.get_fov() + 5)
		else:
			$Camera3D.set_fov($Camera3D.get_fov() + 1)
	
