extends StaticBody2D

var wheatsell
var wheatbuy
var eggsbuy
var closemenu

func _ready():
	wheatsell = $WheatSellButton
	wheatbuy = $WheatBuyButton
	eggsbuy = $EggsBuyButton
	closemenu = $CloseButton
	
	wheatsell.pressed.connect(_sellWheat)
	wheatbuy.pressed.connect(_buyWheat)
	eggsbuy.pressed.connect(_buyEggs)
	closemenu.pressed.connect(_closeWindow)


func _sellWheat():
	if important_variables.wheat > 0:
		important_variables.wheat -= 1
		important_variables.money += 10
		
func _buyWheat():
	if important_variables.money > 9:
		important_variables.wheat += 1
		important_variables.money -= 10
		
func _buyEggs():
	if important_variables.money > 4:
		important_variables.eggs += 1
		important_variables.money -= 5
		
func _closeWindow():
		important_variables.shop_open = false
