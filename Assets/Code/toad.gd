extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const MOUSE_SENSITIVITY = 0.1

var raycastFront
var raycastBack

var countForFoward = 0
var boolForFoward = true
var countForRotate = 0
var boolForRotate = true
var laddersPath
var cameraPath
var coin = 0


func _ready():
	raycastFront =  $Node3D/RayCast3D_Front
	raycastBack = $Node3D/RayCast3D_Back
	cameraPath = %PathFollow3D
	laddersPath =  %Ladders


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	if (!boolForRotate):
		countForRotate += 1
	if (countForRotate == 0):	
		if (Input.is_action_pressed("Left")):
			rotate_y(deg_to_rad(90))
			boolForRotate = false
		elif (Input.is_action_pressed("Right")):
			rotate_y(deg_to_rad(-90))
			boolForRotate = false
	elif (countForRotate == 30):
		boolForRotate = true
		countForRotate = 0
		
		
	if (!boolForFoward):
		countForFoward +=1

	if (!raycastFront.is_colliding() && !raycastBack.is_colliding()):
		position.x = round(position.x * 2) / 2
		if abs(position.x - floor(position.x)) < 0.01:
			position.x += 0.5

		position.z = round(position.z * 2) / 2
		if abs(position.z - floor(position.z)) < 0.01:
			position.z += 0.5


	if (countForFoward == 0):
		if (Input.is_action_pressed("Foward")):
			if (!raycastFront.is_colliding()):			
				move(true)
				boolForFoward = false
			else:
				var boolForRay = false

				if raycastFront.is_colliding():
					var collider = raycastFront.get_collider()
					if collider.get_parent() == laddersPath:
						
						position.y += 1
						boolForRay = true

				if (boolForRay):
					move(true)
					boolForFoward = false
					
		elif (Input.is_action_pressed("Backward")):
			if (!raycastBack.is_colliding()):
				move(false)
				boolForFoward = false

			else:
				var boolForRay = false
				
				if raycastBack.is_colliding():
					var collider = raycastBack.get_collider()
					if collider.get_parent() == laddersPath:
						position.y += 1
						boolForRay = true

				if (boolForRay):
					move(false)
					boolForFoward = false

	elif (countForFoward == 20):
		boolForFoward = true
		countForFoward = 0

		

		
	## Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
#
	## Handle jump
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var input_dir = Input.get_vector("Left", "Right", "Foward", "Backward")
	#var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#if direction:
		#velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		#velocity.z = move_toward(velocity.z, 0, SPEED)
		#
	#if ($Area3D.overlaps_body($"../Button")):
		#print("overlay")
		#velocity.y=1.5
		#
#
#
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

