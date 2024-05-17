extends StaticBody3D

var isSpiked = true




func _ready():
	$Base.visible = false
	
func flip():
	if ($Base.visible):
		$Base.visible = false
		$Spikes.visible = true
		isSpiked = true
	else:
		$Base.visible = true
		$Spikes.visible = false
		isSpiked = false
