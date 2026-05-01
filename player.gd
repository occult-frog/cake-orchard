extends CharacterBody2D

@onready var shop_menu = $ShopMenuNode
@onready var workbench_menu = $WorkbenchMenuNode
var speed = important_variables.speed

func _physics_process(delta):
	speed = important_variables.speed
	var direction = Input.get_vector("move_right", "move_left", "move_up", "move_down")
	velocity = direction * speed
	move_and_slide()
	$MoneyCounter.text = "Money: %s"%str(important_variables.money)
	if important_variables.shop_open == true:
		if !has_node("ShopMenuNode"):
			add_child(shop_menu)
	else:
		if has_node("ShopMenuNode"):
			remove_child(shop_menu)
		
	if important_variables.workbench_open == true:
		if !has_node("WorkbenchMenuNode"):
			add_child(workbench_menu)
	else:
		if has_node("WorkbenchMenuNode"):
			remove_child(workbench_menu)
