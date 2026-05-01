extends StaticBody2D

var closemenu
var waterbutton
var speedbutton
var wheatbutton
var waterlabel
var speedlabel
var wheatlabel

func _ready():
	closemenu = $CloseButton
	waterbutton = $WaterButton
	speedbutton = $SpeedButton
	waterlabel = $WaterLabel
	speedlabel = $SpeedLabel
	wheatlabel = $WheatLabel
	wheatbutton = $WheatButton
	
	closemenu.pressed.connect(_closeMenu)
	waterbutton.pressed.connect(_upgradeWater)
	speedbutton.pressed.connect(_upgradeSpeed)
	wheatbutton.pressed.connect(_upgradeWheat)
	

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
	important_variables.max_water_level += 10
	important_variables.money -= important_variables.water_upgrade_price
	important_variables.no_of_water_upgrades += 1
	
func _upgradeSpeed():
	important_variables.speed += 50
	important_variables.money -= important_variables.speed_upgrade_price
	important_variables.no_of_speed_upgrades += 1
	
func _upgradeWheat():
	important_variables.wheat_range = [1, important_variables.no_of_wheat_upgrades]
	important_variables.money -= important_variables.wheat_upgrade_price
	important_variables.no_of_wheat_upgrades += 1
