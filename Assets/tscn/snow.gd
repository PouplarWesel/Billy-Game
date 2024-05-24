extends GPUParticles3D

func _ready(): # Called every time the node is added to the scene.
	speed_scale += 10
	wait(5)
	speed_scale=1
	
func wait(seconds: float) -> void: # Wait for a number of seconds.
	await get_tree().create_timer(seconds).timeout
