extends ItemList

func _ready():
	for i in range(0, Global.heal_potion):
		add_item("Healing Potion", null, true)
	for i in range(0, Global.defense_potion):
		add_item("Defense Potion", null, true)
	for i in range(0, Global.weakness_potion):
		add_item("Weakness Potion", null, true)

func _on_item_activated(index):
	if get_item_text(index) == "Healing Potion":
		Global.player_health = (Global.player_health + 15)
		if Global.player_health > 200:
			Global.player_health = 200
		Global.heal_potion -= 1
	elif get_item_text(index) == "Defense Potion":
		Global.boss_weakened = true
		Global.defense_potion -= 1
	elif get_item_text(index) == "Weakness Potion":
		Global.player_shield = true
		Global.weakness_potion -= 1
	remove_item(index)
