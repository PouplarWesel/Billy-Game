extends GPUParticles3D

func _ready():
	speed_scale += 10
	wait(5)
	speed_scale=1
	
func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
