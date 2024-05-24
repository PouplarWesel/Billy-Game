extends StaticBody3D

var isSpiked = true




func _ready():
	$Base.visible = false # make the base invisible
	
func flip(): # flip the spikes
	if ($Base.visible): # if the base is visible, make the spikes visible
		$Base.visible = false
		$Spikes.visible = true
		isSpiked = true
	else: # if the spikes are visible, make the base visible
		$Base.visible = true
		$Spikes.visible = false
		isSpiked = false
