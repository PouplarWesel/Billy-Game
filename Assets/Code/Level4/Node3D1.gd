extends Node3D

var isPressed = false

func _ready():
	$"../../../MovingBlock2/MovingBlock3".distance = 1
	$"../../../MovingBlock2/MovingBlock3".flipped = true
	
