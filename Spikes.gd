extends Node3D

var isPressed = false


func _physics_process(delta):
	
	if $"../Button".isPressed && !isPressed:
		print('pressed')
		propagate_call("flip")
		isPressed = true
