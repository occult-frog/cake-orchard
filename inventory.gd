extends Sprite2D

@onready var inv1texture = preload("res://inventory_1_selected.png")
@onready var inv2texture = preload("res://inventory_2_selected.png")
@onready var inv3texture = preload("res://inventory_3_selected.png")
@onready var inv4texture = preload("res://inventory_4_selected.png")
@onready var inv5texture = preload("res://inventory_5_selected.png")
@onready var inv6texture = preload("res://inventory_6_selected.png")
@onready var inv7texture = preload("res://inventory_7_selected.png") 
@onready var inv8texture = preload("res://inventory_8_selected.png")
@onready var inv9texture = preload("res://inventory_9_selected.png")

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
	if Input.is_action_just_pressed("inv6"):
		$".".texture = inv6texture
		important_variables.inv_selected = 6
	if Input.is_action_just_pressed("inv7"):
		$".".texture = inv7texture
		important_variables.inv_selected = 7
	if Input.is_action_just_pressed("inv8"):
		$".".texture = inv8texture
		important_variables.inv_selected = 8
	if Input.is_action_just_pressed("inv9"):
		$".".texture = inv9texture
		important_variables.inv_selected = 9
	
	$WheatSeeds.text = str(important_variables.wheat_seeds)
	$Wheat.text = str(important_variables.wheat)
	$Eggs.text = str(important_variables.eggs)
	$Vanilla.text = str(important_variables.vanilla)
	$Stalks.text = str(important_variables.cane_stalks)
	$Sugarcane.text = str(important_variables.sugarcane)
	$Sugar.text = str(important_variables.sugar)
	$Salt.text = str(important_variables.salt)
	$Flour.text = str(important_variables.flour)
