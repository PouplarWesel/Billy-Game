extends PathFollow3D

var MOUSE_SENSITIVITY_X = 0.015
var MOUSE_SENSITIVITY_Y = 0.0005
var pan_speed = 0.001
var zoom_speed = 2
var target_progress
var mouse_moving = false

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	target_progress = progress
	progress -= 35

func _input(event):
	if event is InputEventMouseMotion:
		var mouse_delta_x = event.relative.x * MOUSE_SENSITIVITY_X
		var mouse_delta_y = event.relative.y * MOUSE_SENSITIVITY_Y
		progress += mouse_delta_x
		$Camera3D.rotate_z(mouse_delta_y)

	if event is InputEventMouseButton:
		if event.is_pressed():
			if (Input.is_action_pressed("Wheel Up")):
				$Camera3D.fov = clamp($Camera3D.fov - zoom_speed, 1, 179)
			elif (Input.is_action_pressed("Wheel Down")):
				$Camera3D.fov = clamp($Camera3D.fov + zoom_speed, 1, 179)

func _physics_process(delta :float) -> void:
	if not mouse_moving:
		target_progress = progress
	progress = lerp(progress, target_progress, pan_speed * delta)
