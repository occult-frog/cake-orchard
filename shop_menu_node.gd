extends StaticBody2D

var wheatsell
var eggsbuy
var vanillabuy
var mixerbuy
var canebuy
var saltbuy
var closemenu

func _ready():
	closemenu = $CloseButton
	wheatsell = $WheatSellButton
	eggsbuy = $EggsBuyButton
	vanillabuy = $VanillaBuyButton
	mixerbuy = $MixerBuyButton
	canebuy = $SugarcaneBuyButton
	saltbuy = $SaltBuyButton
	
	wheatsell.pressed.connect(_sellWheat)
	eggsbuy.pressed.connect(_buyEggs)
	vanillabuy.pressed.connect(_buyVanilla)
	mixerbuy.pressed.connect(_buyMixer)
	canebuy.pressed.connect(_buyCane)
	saltbuy.pressed.connect(_buySalt)
	closemenu.pressed.connect(_closeWindow)


func _sellWheat():
	if important_variables.wheat > 0:
		important_variables.wheat -= 1
		important_variables.money += 10
		
func _buyEggs():
	if important_variables.money >= 5:
		important_variables.eggs += 1
		important_variables.money -= 5
		
func _buyVanilla():
	if important_variables.money >= 50:
		important_variables.money -= 50
		important_variables.vanilla += 1
		
func _buyMixer():
	if important_variables.money >= 200 and important_variables.stand_mixer == 0:
		important_variables.money -= 200
		important_variables.stand_mixer = 1
		
func _buyCane():
	if important_variables.money >= 100:
		important_variables.money -= 100
		important_variables.cane_stalks += 1
		
func _buySalt():
	if important_variables.money >= 50:
		important_variables.money -= 50
		important_variables.salt += 1
		
func _closeWindow():
		important_variables.shop_open = false
