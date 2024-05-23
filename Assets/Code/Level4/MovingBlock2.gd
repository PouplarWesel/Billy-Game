extends Node3D

var isPressed = false

	
func _physics_process(delta):
	if %ButtonTimer.isPressed && !isPressed:
		propagate_call("flipOn")
		isPressed = true
	elif !%ButtonTimer.isPressed && isPressed:
		propagate_call("flipOn")
		isPressed = false
		
		
