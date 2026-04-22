extends StaticBody2D

var normal_farmland
var watered_farmland
var current_farmland

func _ready():
	var normal_farmland = $NormalFarmland
	watered_farmland = $WateredFarmland
	current_farmland = "normal"
	remove_child(watered_farmland)

func _physics_process(delta):
	var things_in_range = $Area2D.get_overlapping_bodies()
	if things_in_range.size() > 0 and Input.is_action_just_pressed("water_plant") and current_farmland == "normal":
		current_farmland = "watered"
		remove_child(normal_farmland)
		add_child(watered_farmland)
		$Timer.start()


func _on_plants_grown():
	current_farmland = "normal"
	remove_child(watered_farmland)
	add_child(normal_farmland)
