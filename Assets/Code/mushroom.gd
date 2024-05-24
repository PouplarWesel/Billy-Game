extends MeshInstance3D

func _ready():
	var newmaterial = StandardMaterial3D.new() # Create a new material
	var r = randf_range(0,1) 
	var g = randf_range(0,1)
	var b = randf_range(0,1)
	var a = randf_range(0,1)
	newmaterial.set_albedo(Color(r, g, b, a)) # Set the albedo color of the material
	set_surface_override_material(0, newmaterial) # Apply the material to the mesh
