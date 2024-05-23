extends Node3D

var sizeX = 512
var sizeY = 512

func _physics_process(delta):
	rotation += Vector3(delta * .1, delta * .1, delta * .1)
	scale.x += .005 * delta
	scale.y += .005 * delta
	scale.z += .005 * delta
	sizeX += 10 * delta
	sizeY += 10 * delta
	$"..".set_size(Vector2i(sizeX,sizeY))
	$"../..".position.x += 10 * delta
	$"../..".position.y -= 10 * delta
	
	
	


