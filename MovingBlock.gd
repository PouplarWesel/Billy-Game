extends StaticBody3D

var isFoward = true
var distance = 10
var timePause = 2
var paused = false

var count = 0

var count1 = 0

var time

func _physics_process(delta):
	count1 += 1
	if (isFoward && !paused && count1 % 20 == 0):
		position.x += 1
		count += 1
		if ($Area3D.has_overlapping_bodies()):
			var body = $Area3D.get_overlapping_bodies()
			%Toad.position.x += 1
		
			
			
	elif (!isFoward && !paused && count1 % 20 == 0):
		position.x -= 1
		count += 1
		%Toad.position.x -= 1
	
	if (count == distance):
		time = Time.get_unix_time_from_system()
		count = 0
		paused = true
		
	if (paused):
		if (Time.get_unix_time_from_system() - time >= timePause):
			paused = false
			isFoward = !isFoward
			
	
		
