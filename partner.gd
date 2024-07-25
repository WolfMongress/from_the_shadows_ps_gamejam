extends StaticBody2D

signal player_turn_end

func _on_alchemia_partner_turn():
	$"Partner UI".visible = true
	if Global.bear_bear:
		print(Global.bear_bear)
		$"Partner UI/Ultra Weaken".visible = true
	elif Global.bear_cat:
		$"Partner UI/Weaken".visible = true
		$"Partner UI/Heal".visible = true
	elif Global.bear_elephant:
		$"Partner UI/Weaken".visible = true
		$"Partner UI/Shield".visible = true
	elif Global.cat_bear:
		$"Partner UI/Weaken".visible = true
		$"Partner UI/Heal".visible = true
	elif Global.cat_cat:
		$"Partner UI/Ultra Heal".visible = true
	elif Global.cat_elephant:
		$"Partner UI/Shield".visible = true
		$"Partner UI/Heal".visible = true
	elif Global.elephant_bear:
		$"Partner UI/Weaken".visible = true
		$"Partner UI/Shield".visible = true
	elif Global.elephant_cat:
		$"Partner UI/Shield".visible = true
		$"Partner UI/Heal".visible = true
	elif Global.elephant_elephant:
		$"Partner UI/Ultra Shield".visible = true




