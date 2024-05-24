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
	if (isTimeStarted): # if the button is pressed
		if (Time.get_unix_time_from_system() - startTime >= time): # if the time is up
			isPressed = false
			isTimeStarted = false
			$Button.position.y += .05
			var newmaterial = StandardMaterial3D.new()
			newmaterial.set_albedo(Color8(0, 159, 41, 255))
			$Button/button.set_surface_override_material(0, newmaterial) # change the color of the button
		$Label3D.text = str(snapped(time - (Time.get_unix_time_from_system() - startTime), 0.01)) # display the time left

	else:
		$Label3D.text = ""



func _on_area_3d_body_entered(body): # when the button is pressed
	if (body.name == "Toad" && !isPressed): # if the button is not pressed before
		$Button.position.y-= .05 # move the button down
		var newmaterial = StandardMaterial3D.new()
		newmaterial.set_albedo(Color8(255, 87, 51, 255))
		$Button/button.set_surface_override_material(0, newmaterial)
		body.position.y-=.05 # move the toad up
		isPressed = true
		startTime = Time.get_unix_time_from_system() # start the timer
		isTimeStarted = true
	elif (body.name == "Toad"): # if the button is pressed
		startTime = Time.get_unix_time_from_system() # reset the timer
		
	
		





