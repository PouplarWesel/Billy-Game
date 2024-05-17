extends Node3D

var count = 0
var pos

func _ready():
	pos = position
	rotate_y(deg_to_rad(randi_range(0,360)))
	


func _physics_process(delta):
	rotate_y(1 * delta)
	count += 1
	if (count < (1/delta) * 4):
		if (count % 2 == 0):
			position.y-= 0.001
	else:
		if (count % 2 == 0):
			position.y += 0.001
	if (count > (1/delta) * 8):
		count = 0
		position = pos
	
	
		


func _on_body_entered(body):
	if(body.name.contains("Toad")):
		queue_free()
		%Toad.coin += 1
	
