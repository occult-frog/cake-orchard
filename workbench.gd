extends StaticBody2D


func _physics_process(delta):
	var things_in_range = $Area2D.get_overlapping_bodies()
	if things_in_range.size() == 1 and Input.is_action_just_pressed("plant"):
		important_variables.workbench_open = true
