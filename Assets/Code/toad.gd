extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const MOUSE_SENSITIVITY = 0.1

var raycastFront
var raycastBack
var raycastRight
var raycastLeft
var countForFoward = 0
var boolForFoward = true
var countForRotate = 0
var laddersPath
var cameraPath
var coin = 0
var one
var two
var three
var four 
var ladderHeight
var posStart
var select = preload("res://Assets/tscn/level_select.tscn")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity") 


func _ready():
	raycastFront = $Node3D/RayCast3D_Front
	raycastBack = $Node3D/RayCast3D_Back
	cameraPath = %PathFollows3D
	laddersPath = %Ladders
	raycastRight = $Node3D/RayCast3D_Right
	raycastLeft = $Node3D/RayCast3D_Left
	ladderHeight = get_parent().ladderHeight
	one = get_parent().one
	two = get_parent().two
	three = get_parent().three
	four = get_parent().four
	posStart = position

func _physics_process(delta):
	handleMovement() # Handle movement
	applyGravity(delta) # Apply gravity
	move_and_slide() # Move the character

func handleMovement(): # Handle movement
	if not boolForFoward: # If the player is not moving foward
		countForFoward += 1
	else:
		handleInput() # Handle input
	
	if countForFoward == 20: # If the player is not moving foward for 20 frames
		boolForFoward = true # Set the player to move foward
		countForFoward = 0 # Reset the count

func handleInput():
	if Input.is_action_pressed("Left"): # If the left key is pressed
		handleLeftInput() 
	elif Input.is_action_pressed("Right"): # If the right key is pressed
		handleRightInput()
	elif Input.is_action_pressed("Foward"): # If the foward key is pressed
		handleForwardInput()
	elif Input.is_action_pressed("Backward"): # If the backward key is pressed
		handleBackwardInput()
	elif (Input.is_action_just_pressed("Escape")): # If the escape key is pressed
		%Transition.fadeIn(select) # Change the scene to the level select
		await get_tree().create_timer(1.2).timeout  # Wait for 1.2 seconds
		get_tree().change_scene_to_packed(select) # Fallback the scene to the level select

func handleLeftInput():
	if cameraPath.progress >= one && cameraPath.progress <= two: # If the camera is between the first and second on the path
		if snapped(rad_to_deg(rotation.y), 1) == 0: # If the rotation is 0
			move(true) # Move the player
			climb() # Climb the ladder
		else: 
			rotation.y = deg_to_rad(0) # Set the rotation to 0
	elif cameraPath.progress >= two || cameraPath.progress <= three: # If the camera is between the second and third on the path
		if snapped(rad_to_deg(rotation.y), 1) == 90: # If the rotation is 90
			move(true) # Move the player
			climb() # Climb the ladder
		else: 
			rotation.y = deg_to_rad(90) # Set the rotation to 90
	elif cameraPath.progress >= three && cameraPath.progress <= four: # If the camera is between the third and fourth on the path
		if snapped(rad_to_deg(rotation.y), 1) == -180 || snapped(rad_to_deg(rotation.y), 1) == 180: # If the rotation is -180 or 180
			move(true) # Move the player
			climb() # Climb the ladder 
		else: 
			rotation.y = deg_to_rad(-180) # Set the rotation to -180
	elif cameraPath.progress >= four && cameraPath.progress <= one: # If the camera is between the fourth and first on the path
		if snapped(rad_to_deg(rotation.y), 1) == -90: # If the rotation is -90
			move(true) # Move the player
			climb() # Climb the ladder
		else: 
			rotation.y = deg_to_rad(-90) # Set the rotation to -90

func handleRightInput():
	if cameraPath.progress >= one && cameraPath.progress <= two: # If the camera is between the first and second on the path
		if snapped(rad_to_deg(rotation.y), 1) == -180 || snapped(rad_to_deg(rotation.y), 1) == 180: # If the rotation is -180 or 180
			move(true)	# Move the player
			climb() # Climb the ladder
		else: 
			rotation.y = deg_to_rad(-180) # Set the rotation to -180

	elif cameraPath.progress >= two || cameraPath.progress <= three: # If the camera is between the second and third on the path
		if snapped(rad_to_deg(rotation.y), 1) == -90: # If the rotation is -90
			move(true) # Move the player
			climb() # Climb the ladder
		else: 
			rotation.y = deg_to_rad(-90) # Set the rotation to -90
			
	elif cameraPath.progress >= three && cameraPath.progress <= four: # If the camera is between the third and fourth on the path
		if snapped(rad_to_deg(rotation.y), 1) == 0: # If the rotation is 0
			move(true) # Move the player
			climb() # Climb the ladder
		else: 
			rotation.y = deg_to_rad(0) # Set the rotation to 0
			
	elif cameraPath.progress >= four && cameraPath.progress <= one: # If the camera is between the fourth and first on the path
		if snapped(rad_to_deg(rotation.y), 1) == 90: # If the rotation is 90
			move(true) # Move the player
			climb() # Climb the ladder
		else: 
			rotation.y = deg_to_rad(90) # Set the rotation to 90
			

func handleForwardInput(): 
	if cameraPath.progress >= one && cameraPath.progress <= two: # If the camera is between the first and second on the path
		if snapped(rad_to_deg(rotation.y), 1) == -90: # If the rotation is -90
			move(true) # Move the player
			climb() # Climb the ladder
		else: 
			rotation.y = deg_to_rad(-90) # Set the rotation to -90
			
	elif cameraPath.progress >= two || cameraPath.progress <= three: # If the camera is between the second and third on the path
		if snapped(rad_to_deg(rotation.y), 1) == 0: # If the rotation is 0
			move(true) # Move the player
			climb() # Climb the ladder
		else: 
			rotation.y = deg_to_rad(0) # Set the rotation to 0
			
	elif cameraPath.progress >= three && cameraPath.progress <= four: # If the camera is between the third and fourth on the path
		if snapped(rad_to_deg(rotation.y), 1) == 90: # If the rotation is 90
			move(true) # Move the player
			climb() # Climb the ladder
		else: 
			rotation.y = deg_to_rad(90) # Set the rotation to 90
			

	elif cameraPath.progress >= four && cameraPath.progress <= one: # If the camera is between the fourth and first on the path
		if snapped(rad_to_deg(rotation.y), 1) == -180 || snapped(rad_to_deg(rotation.y), 1) == 180: # If the rotation is -180 or 180
			move(true) # Move the player 
			climb() # Climb the ladder
		else: 
			rotation.y = deg_to_rad(-180) # Set the rotation to -180

func handleBackwardInput():
	if cameraPath.progress >= one && cameraPath.progress <= two: # If the camera is between the first and second on the path
		if snapped(rad_to_deg(rotation.y), 1) == 90: # If the rotation is 90
			move(true) # Move the player
			climb() # Climb the ladder
		else: 
			rotation.y = deg_to_rad(90) # Set the rotation to 90
	elif cameraPath.progress >= two || cameraPath.progress <= three: # If the camera is between the second and third on the path
		if snapped(rad_to_deg(rotation.y), 1) == -180 || snapped(rad_to_deg(rotation.y), 1) == 180: # If the rotation is -180 or 180
			move(true) # Move the player
			climb() # Climb the ladder
		else: 
			rotation.y = deg_to_rad(-180) # Set the rotation to -180
	elif cameraPath.progress >= three && cameraPath.progress <= four: # If the camera is between the third and fourth on the path
		if snapped(rad_to_deg(rotation.y), 1) == -90: # If the rotation is -90
			move(true) # Move the player
			climb() # Climb the ladder
		else: 
			rotation.y = deg_to_rad(-90) # Set the rotation to -90
	elif cameraPath.progress >= four && cameraPath.progress <= one: # If the camera is between the fourth and first on the path
		if snapped(rad_to_deg(rotation.y), 1) == 0: # If the rotation is 0
			move(true) # Move the player
			climb() # Climb the ladder
		else: 
			rotation.y = deg_to_rad(0) # Set the rotation to 0

func applyGravity(delta): # Apply gravity
	if not is_on_floor(): # If the player is not on the floor
		velocity.y -= gravity * delta # Apply gravity to the player

func move(isForward): 
	if isForward && checkCollusion(): 
		if snapped(get_rotation_degrees().y,1) == 90: # If the rotation is 90
			position.x -= 1
		elif snapped(get_rotation_degrees().y,1) == -180 || snapped(get_rotation_degrees().y,1) == 180: # If the rotation is -180 or 180
			position.z += 1
		elif snapped(get_rotation_degrees().y,1) == 0: # If the rotation is 0
			position.z -= 1
		elif snapped(get_rotation_degrees().y,1) == -90: # If the rotation is -90
			position.x += 1
	elif checkCollusion():
		if snapped(get_rotation_degrees().y,1) == 90: # If the rotation is 90
			position.x += 1
		elif snapped(get_rotation_degrees().y,1) == -180 || snapped(get_rotation_degrees().y,1) == 180: # If the rotation is -180 or 180
			position.z -= 1
		elif snapped(get_rotation_degrees().y,1) == 0: # If the rotation is 0
			position.z += 1
		elif snapped(get_rotation_degrees().y,1) == -90: # If the rotation is -90
			position.x -= 1
	boolForFoward = false

	# round to nearest .5

	position.x = round(position.x * 2) / 2
	position.z = round(position.z * 2) / 2



func climb():
	if raycastFront.is_colliding(): # If the front raycast is colliding
		var collider = raycastFront.get_collider() # Get the collider
		if collider.name.contains("Ladder"): # If the collider is a ladder
			position.y += ladderHeight
			move(true)
		elif collider.name.contains("Button"): # If the collider is a button
			position.y += .2
		elif collider.name.contains("Crate"): # If the collider is a crate
			crate(collider)
		

func checkCollusion():
	if raycastFront.is_colliding(): # If the front raycast is colliding
		var collider = raycastFront.get_collider() # Get the collider
		if collider.name.contains("Ladder") || collider.name.contains("Button") || (collider.name.contains("Spike") && !collider.isSpiked):  # If the collider is a ladder, button, or spike
			return true
		return false
	return true
	
func crate(collider): # Crate function
	var side = collider.getSide() # Get the side of the collider
	
	if(side == null): # If the side is null
		return
	elif (side == "1Z"): # If the side is 1Z
		collider.position.z += 1
	elif (side == "-1X"): # If the side is -1X
		collider.position.x -= 1
	elif (side == "1X"): # If the side is 1X
		collider.position.x += 1
	elif (side == "-1Z"): # If the side is -1Z
		collider.position.z -= 1
	
