extends PathFollow3D

var MOUSE_SENSITIVITY_X = 0.015
var MOUSE_SENSITIVITY_Y = 0.0005
var pan_speed = 0.001
var zoom_speed = 2
var target_progress
var mouse_moving = false




func _ready(): 
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) # Hide the mouse cursor and keep it in the window
	target_progress = progress 
	progress -= 40

func _input(event):
	if event is InputEventMouseMotion: # If the mouse is moving
		var mouse_delta_x = event.relative.x * MOUSE_SENSITIVITY_X
		var mouse_delta_y = event.relative.y * MOUSE_SENSITIVITY_Y
		progress += mouse_delta_x
		$Camera3D.rotate_z(mouse_delta_y)

	if event is InputEventMouseButton: # If the mouse button is pressed
		if event.is_pressed():
			if (Input.is_action_pressed("Wheel Up")): # If the mouse wheel is scrolled up
				$Camera3D.fov = clamp($Camera3D.fov - zoom_speed, 1, 179)
			elif (Input.is_action_pressed("Wheel Down")): # If the mouse wheel is scrolled down
				$Camera3D.fov = clamp($Camera3D.fov + zoom_speed, 1, 179)

func _physics_process(delta): 
	if not mouse_moving: # If the mouse is not moving
		target_progress = progress # Set the target progress to the current progress
	progress = lerp(progress, target_progress, pan_speed * delta) # Move the camera towards the target progress
