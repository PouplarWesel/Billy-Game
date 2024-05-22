extends Node3D

var isPressed = false

func _physics_process(delta):
	if $"../Button".isPressed && !isPressed:
		propagate_call("flipOn")
		isPressed = true
