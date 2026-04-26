extends CharacterBody2D

@onready var shop_menu = $ShopMenuNode

func _physics_process(delta):
	var direction = Input.get_vector("move_right", "move_left", "move_up", "move_down")
	velocity = direction * 600
	move_and_slide()
	$MoneyCounter.text = "Money: %s"%str(important_variables.money)
	if important_variables.shop_open == true:
		add_child(shop_menu)
	else:
		remove_child(shop_menu)
