extends Area2D

var array = []

func _on_body_entered(body):
	if body == $"../Goldenseal":
		array.append("Goldenseal")
	elif body == $"../Armoranth":
		array.append("Armoranth")
	elif body == $"../Stinging Nettle":
		array.append("Stinging Nettle")
	elif body == $"../Shadow":
		array.append("Shadow Crystal")
	elif body == $"../Star Fragment":
		array.append("Star Fragment")
	print(array)

func _on_body_exited(body):
	if body == $"../Goldenseal":
		array.erase("Goldenseal")
	elif body == $"../Armoranth":
		array.erase("Armoranth")
	elif body == $"../Stinging Nettle":
		array.erase("Stinging Nettle")
	elif body == $"../Shadow":
		array.erase("Shadow Crystal")
	elif body == $"../Star Fragment":
		array.erase("Star Fragment")
	print(array)

func _on_brew_button_pressed():
	if array == ["Goldenseal", "Shadow Crystal", "Star Fragment"]:
		Global.heal_potion += 1
		Global.goldenseal_amount = (Global.goldenseal_amount - 1)
		Global.shadow_crystal_amount = (Global.shadow_crystal_amount - 1)
		Global.star_fragment_amount = (Global.star_fragment_amount - 1)
	elif array == ["Armoranth", "Shadow Crystal", "Star Fragment"]:
		Global.defense_potion += 1
		Global.armoranth_amount = (Global.armoranth_amount - 1)
		Global.shadow_crystal_amount = (Global.shadow_crystal_amount - 1)
		Global.star_fragment_amount = (Global.star_fragment_amount - 1)
	elif array == ["Stinging Nettle", "Shadow Crystal", "Star Fragment"]:
		Global.weakness_potion += 1
		Global.stinging_nettle_amount = (Global.stinging_nettle_amount - 1)
		Global.shadow_crystal_amount = (Global.shadow_crystal_amount - 1)
		Global.star_fragment_amount = (Global.star_fragment_amount - 1)
	Global.player_turn = true
	get_tree().change_scene_to_file("res://battle_scene.tscn")
