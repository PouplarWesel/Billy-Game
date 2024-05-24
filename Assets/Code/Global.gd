extends Node

var currentCoins = [0,0,0,0,0,0] #0 = level 1, 1 = level 2, 2 = level 3, 3 = level 4, 4 = level 5, 5 = level 6
var coins = [0,0,0,0,0,0] #0 = level 1, 1 = level 2, 2 = level 3, 3 = level 4, 4 = level 5, 5 = level 6
var currentLevel = null 
var pastLevel = null

func _physics_process(delta):

	if (pastLevel != currentLevel): #if the player has moved to a new level
		if (pastLevel != null):
			if (coins[pastLevel] < currentCoins[pastLevel]):  #if the player has collected more coins than before
				coins[pastLevel] = currentCoins[pastLevel] #update the coins
			currentCoins[pastLevel] = 0 #reset the current coins
		pastLevel = currentLevel #update the past level

	
			
		
