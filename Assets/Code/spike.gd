extends StaticBody3D




func _ready():
	$Base.visible = false
	
func flip():
	if ($Base.visible):
		$Base.visible = false
		$Spikes.visible = true
	else:
		$Base.visible = true
		$Spikes.visible = false
