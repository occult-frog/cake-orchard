extends StaticBody2D

var closemenu
var waterbutton
var speedbutton
var wheatbutton
var sugarbutton
var flourbutton
var cakebutton
var waterlabel
var speedlabel
var wheatlabel
var sugarlabel
var flourlabel

func _ready():
	closemenu = $CloseButton
	waterbutton = $WaterButton
	speedbutton = $SpeedButton
	wheatbutton = $WheatButton
	sugarbutton = $SugarButton
	flourbutton = $FlourButton
	cakebutton = $CakeButton
	waterlabel = $WaterLabel
	speedlabel = $SpeedLabel
	wheatlabel = $WheatLabel
	sugarlabel = $SugarLabel
	flourlabel = $FlourLabel
	
	closemenu.pressed.connect(_closeMenu)
	waterbutton.pressed.connect(_upgradeWater)
	speedbutton.pressed.connect(_upgradeSpeed)
	wheatbutton.pressed.connect(_upgradeWheat)
	sugarbutton.pressed.connect(_craftSugar)
	flourbutton.pressed.connect(_craftFlour)
	cakebutton.pressed.connect(_bakeCake)
	

func _physics_process(delta):
	important_variables.water_upgrade_price = 10*important_variables.no_of_water_upgrades
	important_variables.speed_upgrade_price = 10*important_variables.no_of_speed_upgrades
	important_variables.wheat_upgrade_price = 10*important_variables.no_of_wheat_upgrades
	waterlabel.text = "Water Capacity Upgrade - %s"%str(important_variables.water_upgrade_price)
	speedlabel.text = "Speed Upgrade - %s"%str(important_variables.speed_upgrade_price)
	wheatlabel.text = "Wheat Drop Upgrade - %s"%(important_variables.wheat_upgrade_price)
	

	
func _closeMenu():
	important_variables.workbench_open = false

func _upgradeWater():
	if important_variables.money >= important_variables.water_upgrade_price:
		important_variables.max_water_level += 10
		important_variables.money -= important_variables.water_upgrade_price
		important_variables.no_of_water_upgrades += 1
	
func _upgradeSpeed():
	if important_variables.money >= important_variables.speed_upgrade_price:
		important_variables.speed += 50
		important_variables.money -= important_variables.speed_upgrade_price
		important_variables.no_of_speed_upgrades += 1
	
func _upgradeWheat():
	if important_variables.money >= important_variables.wheat_upgrade_price:
		important_variables.wheat_range = [1, important_variables.no_of_wheat_upgrades]
		important_variables.money -= important_variables.wheat_upgrade_price
		important_variables.no_of_wheat_upgrades += 1
		
func _craftSugar():
	if important_variables.sugarcane >= 1:
		important_variables.sugarcane -= 1
		important_variables.sugar += 1
	
func _craftFlour():
	if important_variables.wheat >= 3:
		important_variables.wheat -= 3
		important_variables.flour += 1
		
func _bakeCake():
	if important_variables.flour >= 10 and important_variables.sugar >= 15 and important_variables.eggs >= 3 and important_variables.vanilla >= 2 and important_variables.salt >= 1 and important_variables.stand_mixer == 1:
		important_variables.flour -= 10
		important_variables.sugar -= 15
		important_variables.eggs -= 3
		important_variables.vanilla -= 2
		important_variables.cake += 1
