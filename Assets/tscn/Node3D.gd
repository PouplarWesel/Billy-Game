extends Node3D

var count = 0
var pos

func _ready():
	pos = position
	


func _physics_process(delta): 
	rotate_y(1 * delta)
	rotate_z(1 * delta)
	
	count += 1
	
	if (count < (1/delta) * 4): 
		if (count % 2 == 0):
			position.y-= 0.0025
	else:
		if (count % 2 == 0):
			position.y += 0.0025
		
		
	if (count > (1/delta) * 8):
		count = 0
		position = pos
	
	
		
