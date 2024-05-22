extends StaticBody3D

var pos
var time =  Time.get_unix_time_from_system()
var time2 = 0
var isOverLapping = false

func _ready():
	pos = position
	
func _physics_process(delta):
	if ($Area3D.has_overlapping_bodies()):
		for items in $Area3D.get_overlapping_bodies():
			if (items.name == "Toad"):
				if (!isOverLapping):
					time = Time.get_unix_time_from_system()
				isOverLapping = true
				time2 = Time.get_unix_time_from_system()

	if (isOverLapping):
		time2 = Time.get_unix_time_from_system()
		if (time2 - time > .5 && time2 - time < 2):
			position.y -= 5 * delta
		if (time2 - time > 5):
			time = 0
			time2 = Time.get_unix_time_from_system()
			position = pos
			isOverLapping = false
