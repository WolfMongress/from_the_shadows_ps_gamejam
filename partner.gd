extends StaticBody2D

signal boss_turn

func _on_alchemia_partner_turn():
	if Global.bear_bear:
		print(Global.bear_bear)
		$"Partner UI/Ultra Weaken".show()
	elif Global.bear_cat:
		$"Partner UI/Weaken".show()
		$"Partner UI/Heal".show()
	elif Global.bear_elephant:
		$"Partner UI/Weaken".show()
		$"Partner UI/Shield".show()
	elif Global.cat_bear:
		$"Partner UI/Weaken".show()
		$"Partner UI/Heal".show()
	elif Global.cat_cat:
		$"Partner UI/Ultra Heal".show()
	elif Global.cat_elephant:
		$"Partner UI/Shield".show()
		$"Partner UI/Heal".show()
	elif Global.elephant_bear:
		$"Partner UI/Weaken".show()
		$"Partner UI/Shield".show()
	elif Global.elephant_cat:
		$"Partner UI/Shield".show()
		$"Partner UI/Heal".show()
	elif Global.elephant_elephant:
		$"Partner UI/Ultra Shield".show()

func _on_ultra_weaken_pressed():
	$"Partner UI/Ultra Weaken".hide()
	$"Partner UI".hide()
	Global.boss_turn = true
	Global.boss_ultra_weakened = true

func _on_ultra_heal_pressed():
	Global.boss_turn = true
	Global.player_health = (Global.player_health + 20)
	$"Partner UI/Ultra Heal".hide()
