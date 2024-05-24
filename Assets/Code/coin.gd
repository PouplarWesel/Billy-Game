extends Node3D

var count = 0
var pos

func _ready():
	pos = position
	rotate_y(deg_to_rad(randi_range(0,360)))
	


func _physics_process(delta): # called every frame
	rotate_y(1 * delta) # rotate the coin
	count += 1 
	if (count < (1/delta) * 4): # move the coin up and down
		if (count % 2 == 0):
			position.y-= 0.001
	else: 
		if (count % 2 == 0):
			position.y += 0.001
	if (count > (1/delta) * 8):
		count = 0
		position = pos
	
	
		


func _on_body_entered(body): # called when the coin is collected
	if(body.name.contains("Toad")): # if the body is the player
		queue_free() # destroy the coin
		if (Global.currentLevel != null): 
			Global.currentCoins[Global.currentLevel] += 1 # increment the coin count
	
