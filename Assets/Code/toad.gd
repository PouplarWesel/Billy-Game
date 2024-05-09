extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const MOUSE_SENSITIVITY = 0.1

var raycastFront
var raycastBack

var countForFoward = 0
var boolForFoward = true
var countForRotate = 0
var laddersPath
var cameraPath
var coin = 0

var one = 33.5140342712402
var two = 49.0990219116211
var three = 2.26603817939758
var four = 15.7960376739502


func _ready():
	raycastFront =  $Node3D/RayCast3D_Front
	raycastBack = $Node3D/RayCast3D_Back
	cameraPath = %PathFollows3D
	laddersPath =  %Ladders


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
		
	if (!boolForFoward):
		countForFoward +=1

	elif (!raycastFront.is_colliding() && !raycastBack.is_colliding()):
		position.x = round(position.x * 2) / 2
		if abs(position.x - floor(position.x)) < 0.01:
			position.x += 0.5

		position.z = round(position.z * 2) / 2
		if abs(position.z - floor(position.z)) < 0.01:
			position.z += 0.5


	if (countForFoward == 0):
		if (Input.is_action_pressed("Left")):
			if (%PathFollows3D.progress >= one && %PathFollows3D.progress <= two):
				print("one")
				if (snapped(rad_to_deg(rotation.y), 1) == 0):
					if (raycastFront.is_colliding()):
						climb()
					else:
						move(true)
						climb()
				else: 
					rotation.y = deg_to_rad(0)
					if (raycastFront.is_colliding()):
						climb()
					else:
						move(true)
						climb()
			elif (%PathFollows3D.progress >= two || %PathFollows3D.progress <= three):
				print("two")
				if (snapped(rad_to_deg(rotation.y), 1) == 90):
					if (raycastFront.is_colliding()):
						climb()
					else:
						move(true)
						climb()
				else: 
					rotation.y = deg_to_rad(90)
					if (raycastFront.is_colliding()):
						climb()
					else:
						move(true)
						climb()
			elif (%PathFollows3D.progress >= three && %PathFollows3D.progress <= four):
				print("three")
				if (snapped(rad_to_deg(rotation.y), 1) == -180 || snapped(rad_to_deg(rotation.y), 1) == 180):
					if (raycastFront.is_colliding()):
						climb()
					else:
						move(true)
						climb()
				else: 
					rotation.y = deg_to_rad(-180)
					if (raycastFront.is_colliding()):
						climb()
					else:
						move(true)
						climb()
			elif (%PathFollows3D.progress >= four && %PathFollows3D.progress <= one):
				print("four")
				if (snapped(rad_to_deg(rotation.y), 1) == -90):
					if (raycastFront.is_colliding()):
						print("climb")
						climb()
					else:
						move(true)
						climb()
				else: 
					rotation.y = deg_to_rad(-90)
					move(true)
					climb()
		elif (Input.is_action_pressed("Right")):
			if (%PathFollows3D.progress >= one && %PathFollows3D.progress <= two):
				print("one")
				print(snapped(rad_to_deg(rotation.y), 1))
				if (snapped(rad_to_deg(rotation.y), 1) == -180 || snapped(rad_to_deg(rotation.y), 1) == 180 ):
					print("deg")
					if (raycastFront.is_colliding()):
						climb()
					else:
						move(true)
						climb()
				else: 
					rotation.y = deg_to_rad(-180)
					move(true)
					climb()
			elif (%PathFollows3D.progress >= two || %PathFollows3D.progress <= three):
				print("two")
				if (snapped(rad_to_deg(rotation.y), 1) == -90):
					if (raycastFront.is_colliding()):
						climb()
					else:
						move(true)
						climb()
				else: 
					rotation.y = deg_to_rad(-90)
					if (raycastFront.is_colliding()):
						climb()
					else:
						move(true)
						climb()
			elif (%PathFollows3D.progress >= three && %PathFollows3D.progress <= four):
				print("three")
				if (snapped(rad_to_deg(rotation.y), 1) == 0):
					if (raycastFront.is_colliding()):
						climb()
					else:
						move(true)
						climb()
				else: 
					rotation.y = deg_to_rad(0)
					if (raycastFront.is_colliding()):
						climb()
					else:
						move(true)
						climb()
			elif (%PathFollows3D.progress >= four && %PathFollows3D.progress <= one):
				print("four")
				if (snapped(rad_to_deg(rotation.y), 1) == 90):
					if (raycastFront.is_colliding()):
						print("climb")
						climb()
					else:
						move(true)
						climb()
				else: 
					rotation.y = deg_to_rad(90)
					if (raycastFront.is_colliding()):
						climb()
					else:
						move(true)
						climb()
		elif (Input.is_action_pressed("Foward")):
			if (%PathFollows3D.progress >= one && %PathFollows3D.progress <= two):
				print("one")
				if (snapped(rad_to_deg(rotation.y), 1) == -90):
					if (raycastFront.is_colliding()):
						climb()
					else:
						move(true)
						climb()
				else: 
					rotation.y = deg_to_rad(-90)
					if (raycastFront.is_colliding()):
						climb()
					else:
						move(true)
						climb()
			elif (%PathFollows3D.progress >= two || %PathFollows3D.progress <= three):
				print("two")
				if (snapped(rad_to_deg(rotation.y), 1) == 0):
					if (raycastFront.is_colliding()):
						climb()
					else:
						move(true)
						climb()
				else: 
					rotation.y = deg_to_rad(0)
					print("working")
					if (raycastFront.is_colliding()):
						climb()
					else:
						move(true)
						climb()
			elif (%PathFollows3D.progress >= three && %PathFollows3D.progress <= four):
				print("three")
				if (snapped(rad_to_deg(rotation.y), 1) == 90):
					if (raycastFront.is_colliding()):
						climb()
					else:
						move(true)
						climb()
				else: 
					rotation.y = deg_to_rad(90)
					if (raycastFront.is_colliding()):
						climb()
					else:
						move(true)
						climb()
			elif (%PathFollows3D.progress >= four && %PathFollows3D.progress <= one):
				print("four")
				if (snapped(rad_to_deg(rotation.y), 1) == -180 || snapped(rad_to_deg(rotation.y), 1) == 180):
					if (raycastFront.is_colliding()):
						print("climb")
						climb()
					else:
						move(true)
						climb()
				else: 
					rotation.y = deg_to_rad(-180)
					if (raycastFront.is_colliding()):
						climb()
					else:
						move(true)
						climb()
		elif (Input.is_action_pressed("Backward")):
			if (%PathFollows3D.progress >= one && %PathFollows3D.progress <= two):
				print("one")
				if (snapped(rad_to_deg(rotation.y), 1) == 90):
					if (raycastFront.is_colliding()):
						climb()
					else:
						move(true)
						climb()
				else: 
					rotation.y = deg_to_rad(90)
					if (raycastFront.is_colliding()):
						climb()
					else:
						move(true)
						climb()
			elif (%PathFollows3D.progress >= two || %PathFollows3D.progress <= three):
				print("two")
				if (snapped(rad_to_deg(rotation.y), 1) == -180 || snapped(rad_to_deg(rotation.y), 1) == 180):
					if (raycastFront.is_colliding()):
						climb()
					else:
						move(true)
						climb()
				else: 
					rotation.y = deg_to_rad(-180)
					print("working")
					if (raycastFront.is_colliding()):
						climb()
					else:
						move(true)
						climb()
			elif (%PathFollows3D.progress >= three && %PathFollows3D.progress <= four):
				print("three")
				if (snapped(rad_to_deg(rotation.y), 1) == -90):
					if (raycastFront.is_colliding()):
						climb()
					else:
						move(true)
						climb()
				else: 
					rotation.y = deg_to_rad(-90)
					if (raycastFront.is_colliding()):
						climb()
					else:
						move(true)
						climb()
			elif (%PathFollows3D.progress >= four && %PathFollows3D.progress <= one):
				print("four")
				if (snapped(rad_to_deg(rotation.y), 1) == 0):
					if (raycastFront.is_colliding()):
						print("climb")
						climb()
					else:
						move(true)
						climb()
				else: 
					rotation.y = deg_to_rad(0)
					if (raycastFront.is_colliding()):
						climb()
					else:
						move(true)
						climb()
	elif (countForFoward == 20):
		boolForFoward = true
		countForFoward = 0

		

		
	## Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	move_and_slide()


func move(isFoward):
	if (isFoward):
		if (snapped(get_rotation_degrees().y,1) == 90): ## left
			position.x -=1
		elif (snapped(get_rotation_degrees().y,1) == -180 || snapped(get_rotation_degrees().y,1) == 180): ## left
			position.z +=1
		elif (snapped(get_rotation_degrees().y,1) == 0):
			position.z -=1
		elif (snapped(get_rotation_degrees().y,1) == -90):
			position.x +=1
	else:
		if (snapped(get_rotation_degrees().y,1) == 90): ## left
			position.x +=1
		elif (snapped(get_rotation_degrees().y,1) == -180 || snapped(get_rotation_degrees().y,1) == 180): ## left
			position.z -=1
		elif (snapped(get_rotation_degrees().y,1) == 0):
			position.z +=1
		elif (snapped(get_rotation_degrees().y,1) == -90):
			position.x -=1
	boolForFoward = false
			

func climb():
	if raycastFront.is_colliding():
		var collider = raycastFront.get_collider()
		print("climbing")
		if collider.get_parent() == laddersPath:
			move(true)
			position.y += 1
