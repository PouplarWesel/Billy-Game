extends Node3D

var POST

var isPressed = false

var startTime
var isTimeStarted = false

var time = 30


# Called when the node enters the scene tree for the first time.
func _ready():
	POST = $Button.position
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (isTimeStarted):
		if (Time.get_unix_time_from_system() - startTime >= time):
			isPressed = false
			isTimeStarted = false
			$Button.position.y += .05
			var newmaterial = StandardMaterial3D.new()
			newmaterial.set_albedo(Color8(0, 159, 41, 255))
			$Button/button.set_surface_override_material(0, newmaterial)
		$Label3D.text = str(snapped(time - (Time.get_unix_time_from_system() - startTime), 0.01))

	else:
		$Label3D.text = ""



func _on_area_3d_body_entered(body):
	print(body)
	if (body.name == "Toad" && !isPressed):
		$Button.position.y-= .05
		var newmaterial = StandardMaterial3D.new()
		newmaterial.set_albedo(Color8(255, 87, 51, 255))
		$Button/button.set_surface_override_material(0, newmaterial)
		body.position.y-=.05
		isPressed = true
		startTime = Time.get_unix_time_from_system()
		isTimeStarted = true
	elif (body.name == "Toad"):
		startTime = Time.get_unix_time_from_system()
		
	
		





