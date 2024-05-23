extends StaticBody3D

var isFoward = false
@export var distance = 3
@export var timePause = 2
var paused = false
var flipped = false
var isOn = false

var count = 0

var count1 = 0

var time

func _physics_process(delta):
	if (isOn):
		count1 += 1
		if (isFoward && !paused && count1 % 20 == 0):
			if (flipped):
				position.x += 1
			else:
				position.z += 1
			count += 1
			if ($Area3D.has_overlapping_bodies()):
				for items in $Area3D.get_overlapping_bodies():
					if (items.name == "Toad" || items.name.contains("Crate")):
						if (flipped):
							items.position.x += 1
						else:
							items.position.z += 1
			
				
				
		elif (!isFoward && !paused && count1 % 20 == 0):
			if (flipped):
				position.x += -1
			else:
				position.z += -1
			count += 1
			if ($Area3D.has_overlapping_bodies()):
				for items in $Area3D.get_overlapping_bodies():
					if (items.name == "Toad" || items.name.contains("Crate")):
						if (flipped):
							items.position.x -= 1
						else:
							items.position.z -= 1
						
			
		if (count == distance):
			time = Time.get_unix_time_from_system()
			count = 0
			paused = true
			
		if (paused):
			if (Time.get_unix_time_from_system() - time >= timePause):
				paused = false
				isFoward = !isFoward
		
func flipOn():
	isOn = !isOn
				
		
			
