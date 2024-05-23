extends Node3D

var sizeX = 512
var sizeY = 512
var increase = 1

func _physics_process(delta):
	rotation += Vector3(delta * .1 * increase, delta * .1 * increase, delta * .1 * increase)
	scale.x += .005 * delta * increase
	scale.y += .005 * delta * increase
	scale.z += .005 * delta * increase
	sizeX += 10 * delta * increase
	sizeY += 10 * delta * increase
	$"..".set_size(Vector2i(sizeX * increase,sizeY * increase))
	$"../..".position.x += 10 * delta * increase
	$"../..".position.y -= 10 * delta * increase
	
	
	


