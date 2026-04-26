extends Sprite2D

@onready var inv1texture = preload("res://inventory_1_selected.png")
@onready var inv2texture = preload("res://inventory_2_selected.png")
@onready var inv3texture = preload("res://inventory_3_selected.png")
@onready var inv4texture = preload("res://inventory_4_selected.png")
@onready var inv5texture = preload("res://inventory_5_selected.png") 

func _physics_process(delta):
	if Input.is_action_just_pressed("inv1"):
		$".".texture = inv1texture
		important_variables.inv_selected = 1
	if Input.is_action_just_pressed("inv2"):
		$".".texture = inv2texture
		important_variables.inv_selected = 2
	if Input.is_action_just_pressed("inv3"):
		$".".texture = inv3texture
		important_variables.inv_selected = 3
	if Input.is_action_just_pressed("inv4"):
		$".".texture = inv4texture
		important_variables.inv_selected = 4
	if Input.is_action_just_pressed("inv5"):
		$".".texture = inv5texture
		important_variables.inv_selected = 5
	
	$WheatSeeds.text = str(important_variables.wheat_seeds)
	$Wheat.text = str(important_variables.wheat)
	$Eggs.text = str(important_variables.eggs)
