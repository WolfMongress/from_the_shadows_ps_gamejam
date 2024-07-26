extends StaticBody2D

signal boss_turn

func _process(delta):
	if Global.partner_turn == true:
		$"Partner UI".show()
		if Global.bear_bear:
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
	else:
		$"Partner UI".hide()
		$"Partner UI/Ultra Weaken".hide()
		$"Partner UI/Weaken".hide()
		$"Partner UI/Ultra Shield".hide()
		$"Partner UI/Shield".hide()
		$"Partner UI/Ultra Heal".hide()
		$"Partner UI/Heal".hide()

func _on_ultra_weaken_pressed():
	Global.partner_turn = false
	$"Partner UI".hide()
	Global.boss_turn = true
	Global.boss_ultra_weakened = true
	
func _on_weaken_pressed():
	Global.partner_turn = false
	$"Partner UI".hide()
	Global.boss_turn = true
	Global.boss_weakened = true

func _on_ultra_shield_pressed():
	Global.partner_turn = false
	$"Partner UI".hide()
	Global.boss_turn = true
	Global.player_ultra_shield = true

func _on_shield_pressed():
	Global.partner_turn = false
	$"Partner UI".hide()
	Global.boss_turn = true
	Global.player_shield = true

func _on_ultra_heal_pressed():
	Global.partner_turn = false
	$"Partner UI".hide()
	Global.boss_turn = true
	Global.player_health = (Global.player_health + 20)

func _on_heal_pressed():
	Global.partner_turn = false
	$"Partner UI".hide()
	Global.boss_turn = true
	Global.player_health = (Global.player_health + 15)
