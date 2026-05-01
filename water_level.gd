extends ProgressBar


func _physics_process(delta):
	$".".value = important_variables.water_level
	$".".max_value = important_variables.max_water_level
