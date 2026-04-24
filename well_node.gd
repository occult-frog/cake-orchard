extends StaticBody2D


func _physics_process(delta):
	var things_in_range = $Area2D.get_overlapping_bodies()
	
	if things_in_range.size() > 0 and Input.is_action_pressed("plant"):
		if important_variables.water_level != important_variables.max_water_level and $Timer.is_stopped() == true:
			$Timer.start()


func _on_timer_timeout():
	important_variables.water_level += 1
	$Timer.stop()
	
