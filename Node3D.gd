extends Node3D

func _physics_process(delta):
	if $Button.isPressed:
		$"../MovingBlocks/MovingBlock3".flipOn()
		$"../MovingBlocks/MovingBlock2".flipOn()
