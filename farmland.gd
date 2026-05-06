extends StaticBody2D

var normal_farmland
var watered_farmland
var current_farmland
var planted_farmland
var grown_farmland
var watered_cane
var planted_cane
var grown_cane

func _ready():
	normal_farmland = preload("res://farmland.png")
	watered_farmland = preload("res://farmland_watered.png")
	planted_farmland = preload("res://farmland_planted.png")
	grown_farmland = preload("res://farmland_grown.png")
	watered_cane = preload("res://sugarcane_watered.png")
	planted_cane = preload("res://sugarcane_planted.png")
	grown_cane = preload("res://sugarcane_grown.png")
	$NormalFarmland.texture = normal_farmland
	current_farmland = "normal"
	randomize()

func _physics_process(delta):
	var things_in_range = $Area2D.get_overlapping_bodies()
	if things_in_range.size() == 1 and Input.is_action_just_pressed("water_or_harvest"):
		if current_farmland == "planted" and important_variables.water_level > 9:
			current_farmland = "watered"
			important_variables.water_level -= 10
			$NormalFarmland.texture = watered_farmland
			$Timer.wait_time = important_variables.wheat_grow_time
			$Timer.start()
			
		elif current_farmland == "grown":
			current_farmland = "normal"
			important_variables.wheat += randi_range(important_variables.wheat_range[0], important_variables.wheat_range[1])
			important_variables.wheat_seeds += randi_range(1,3)
			$NormalFarmland.texture = normal_farmland
			
		elif current_farmland == "cane_planted" and important_variables.water_level > 19:
			current_farmland = "cane_watered"
			important_variables.water_level -= 20
			$NormalFarmland.texture = watered_cane
			$Timer.wait_time = important_variables.cane_grow_time
			$Timer.start()
			
		elif current_farmland == "cane_grown":
			current_farmland = "normal"
			important_variables.sugarcane += 1
			$NormalFarmland.texture = normal_farmland
			
	if things_in_range.size() == 1 and Input.is_action_just_pressed("plant"):
		if important_variables.inv_selected == 1 and current_farmland == "normal" and important_variables.wheat_seeds > 0:
			current_farmland = "planted"
			important_variables.wheat_seeds -= 1
			$NormalFarmland.texture = planted_farmland
		
		elif important_variables.inv_selected == 5 and current_farmland == "normal" and important_variables.cane_stalks > 0:
			current_farmland = "cane_planted"
			important_variables.cane_stalks -= 1
			$NormalFarmland.texture = planted_cane


func _on_plants_grown():
	if current_farmland == "watered":
		current_farmland = "grown"
		$NormalFarmland.texture = grown_farmland
		
	elif current_farmland == "cane_watered":
		current_farmland = "cane_grown"
		$NormalFarmland.texture = grown_cane
	
	$Timer.stop()
