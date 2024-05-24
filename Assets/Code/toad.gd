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
	handleMovement()
	applyGravity(delta)
	move_and_slide()

func handleMovement():
	if not boolForFoward:
		countForFoward += 1
	else:
		handleInput()
	
	if countForFoward == 20:
		boolForFoward = true
		countForFoward = 0

func handleInput():
	if Input.is_action_pressed("Left"):
		handleLeftInput()
	elif Input.is_action_pressed("Right"):
		handleRightInput()
	elif Input.is_action_pressed("Foward"):
		handleForwardInput()
	elif Input.is_action_pressed("Backward"):
		handleBackwardInput()
	elif (Input.is_action_just_pressed("Escape")):
		%Transition.fadeIn(select)
		await get_tree().create_timer(1.2).timeout 
		get_tree().change_scene_to_packed(select)

func handleLeftInput():
	if cameraPath.progress >= one && cameraPath.progress <= two:
		if snapped(rad_to_deg(rotation.y), 1) == 0:
			move(true)
			climb()
		else: 
			rotation.y = deg_to_rad(0)
	elif cameraPath.progress >= two || cameraPath.progress <= three:
		if snapped(rad_to_deg(rotation.y), 1) == 90:
			move(true)
			climb()
		else: 
			rotation.y = deg_to_rad(90)
	elif cameraPath.progress >= three && cameraPath.progress <= four:
		if snapped(rad_to_deg(rotation.y), 1) == -180 || snapped(rad_to_deg(rotation.y), 1) == 180:
			move(true)
			climb()
		else: 
			rotation.y = deg_to_rad(-180)
	elif cameraPath.progress >= four && cameraPath.progress <= one:
		if snapped(rad_to_deg(rotation.y), 1) == -90:
			move(true)
			climb()
		else: 
			rotation.y = deg_to_rad(-90)

func handleRightInput():
	if cameraPath.progress >= one && cameraPath.progress <= two:
		if snapped(rad_to_deg(rotation.y), 1) == -180 || snapped(rad_to_deg(rotation.y), 1) == 180:
			move(true)
			climb()
		else: 
			rotation.y = deg_to_rad(-180)

	elif cameraPath.progress >= two || cameraPath.progress <= three:
		if snapped(rad_to_deg(rotation.y), 1) == -90:
			move(true)
			climb()
		else: 
			rotation.y = deg_to_rad(-90)
			
	elif cameraPath.progress >= three && cameraPath.progress <= four:
		if snapped(rad_to_deg(rotation.y), 1) == 0:
			move(true)
			climb()
		else: 
			rotation.y = deg_to_rad(0)
			
	elif cameraPath.progress >= four && cameraPath.progress <= one:
		if snapped(rad_to_deg(rotation.y), 1) == 90:
			move(true)
			climb()
		else: 
			rotation.y = deg_to_rad(90)
			

func handleForwardInput():
	if cameraPath.progress >= one && cameraPath.progress <= two:
		if snapped(rad_to_deg(rotation.y), 1) == -90:
			move(true)
			climb()
		else: 
			rotation.y = deg_to_rad(-90)
			
	elif cameraPath.progress >= two || cameraPath.progress <= three:
		if snapped(rad_to_deg(rotation.y), 1) == 0:
			move(true)
			climb()
		else: 
			rotation.y = deg_to_rad(0)
			
	elif cameraPath.progress >= three && cameraPath.progress <= four:
		if snapped(rad_to_deg(rotation.y), 1) == 90:
			move(true)
			climb()
		else: 
			rotation.y = deg_to_rad(90)
			

	elif cameraPath.progress >= four && cameraPath.progress <= one:
		if snapped(rad_to_deg(rotation.y), 1) == -180 || snapped(rad_to_deg(rotation.y), 1) == 180:
			move(true)
			climb()
		else: 
			rotation.y = deg_to_rad(-180)

func handleBackwardInput():
	if cameraPath.progress >= one && cameraPath.progress <= two:
		if snapped(rad_to_deg(rotation.y), 1) == 90:
			move(true)
			climb()
		else: 
			rotation.y = deg_to_rad(90)
	elif cameraPath.progress >= two || cameraPath.progress <= three:
		if snapped(rad_to_deg(rotation.y), 1) == -180 || snapped(rad_to_deg(rotation.y), 1) == 180:
			move(true)
			climb()
		else: 
			rotation.y = deg_to_rad(-180)
	elif cameraPath.progress >= three && cameraPath.progress <= four:
		if snapped(rad_to_deg(rotation.y), 1) == -90:
			move(true)
			climb()
		else: 
			rotation.y = deg_to_rad(-90)
	elif cameraPath.progress >= four && cameraPath.progress <= one:
		if snapped(rad_to_deg(rotation.y), 1) == 0:
			move(true)
			climb()
		else: 
			rotation.y = deg_to_rad(0)

func applyGravity(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta

func move(isForward):
	if isForward && checkCollusion():
		if snapped(get_rotation_degrees().y,1) == 90:
			position.x -= 1
		elif snapped(get_rotation_degrees().y,1) == -180 || snapped(get_rotation_degrees().y,1) == 180:
			position.z += 1
		elif snapped(get_rotation_degrees().y,1) == 0:
			position.z -= 1
		elif snapped(get_rotation_degrees().y,1) == -90:
			position.x += 1
	elif checkCollusion():
		if snapped(get_rotation_degrees().y,1) == 90:
			position.x += 1
		elif snapped(get_rotation_degrees().y,1) == -180 || snapped(get_rotation_degrees().y,1) == 180:
			position.z -= 1
		elif snapped(get_rotation_degrees().y,1) == 0:
			position.z += 1
		elif snapped(get_rotation_degrees().y,1) == -90:
			position.x -= 1
	boolForFoward = false

	# round to nearest .5

	position.x = round(position.x * 2) / 2
	position.z = round(position.z * 2) / 2



func climb():
	if raycastFront.is_colliding():
		var collider = raycastFront.get_collider()
		if collider.name.contains("Ladder"):
			position.y += ladderHeight
			move(true)
		elif collider.name.contains("Button"):
			position.y += .2
		elif collider.name.contains("Crate"):
			crate(collider)
		

func checkCollusion():
	if raycastFront.is_colliding():
		var collider = raycastFront.get_collider()
		if collider.name.contains("Ladder") || collider.name.contains("Button") || (collider.name.contains("Spike") && !collider.isSpiked): 
			return true
		return false
	return true
	
func crate(collider):
	var side = collider.getSide()
	
	if(side == null):
		return
	elif (side == "1Z"):
		collider.position.z += 1
	elif (side == "-1X"):
		collider.position.x -= 1
	elif (side == "1X"):
		collider.position.x += 1
	elif (side == "-1Z"):
		collider.position.z -= 1
	
