extends Node3D

func _physics_process(delta):
	rotate_x(delta * 1)
	rotate_z(delta * 1)
	rotate_y(delta * 1)
