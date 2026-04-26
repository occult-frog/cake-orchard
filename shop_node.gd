extends StaticBody2D


func _physics_process(delta):
	var things_in_range = $Area2D.get_overlapping_bodies()
	
	if Input.is_action_just_pressed("plant") and things_in_range.size() == 1:
		important_variables.shop_open = true
