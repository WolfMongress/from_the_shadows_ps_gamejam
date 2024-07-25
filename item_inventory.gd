extends ItemList

func _ready():
	if Global.heal_potion == true:
		add_item("Healing Potion", null, true)
	elif Global.defense_potion == true:
		add_item("Defense Potion", null, true)
	elif Global.weakness_potion == true:
		add_item("Weakness Potion", null, true)

func _on_item_activated(index):
	if get_item_text(index) == "Healing Potion":
		Global.player_health = (Global.player_health + 15)
		if Global.player_health > 200:
			Global.player_health = 200
	elif get_item_text(index) == "Defense Potion":
		pass
	elif get_item_text(index) == "Weakness Potion":
		pass
