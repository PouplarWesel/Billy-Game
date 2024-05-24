extends Node

var currentCoins = [0,0,0,0,0,0]
var coins = [0,0,0,0,0,0]
var currentLevel = null
var pastLevel = null

func _physics_process(delta):

	if (pastLevel != currentLevel):
		if (pastLevel != null):
			if (coins[pastLevel] < currentCoins[pastLevel]):
				coins[pastLevel] = currentCoins[pastLevel]
			currentCoins[pastLevel] = 0
		pastLevel = currentLevel

	
			
		
