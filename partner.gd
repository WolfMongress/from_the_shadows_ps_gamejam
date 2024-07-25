extends StaticBody2D

signal player_turn_end

#code to change partner into chosen partner
func _on_alchemia_bear_bear():
	Global.bear_bear = true
	Global.bear_cat = false
	Global.bear_elephant = false
	Global.cat_bear = false
	Global.cat_cat = false
	Global.cat_elephant = false
	Global.elephant_bear = false
	Global.elephant_cat = false
	Global.elephant_elephant = false
	$"Partner UI".visible = true
	$"Partner UI/Ultra Weaken".visible = true

func _on_alchemia_bear_cat():
	Global.bear_bear = false
	Global.bear_cat = true
	Global.bear_elephant = false
	Global.cat_bear = false
	Global.cat_cat = false
	Global.cat_elephant = false
	Global.elephant_bear = false
	Global.elephant_cat = false
	Global.elephant_elephant = false
	$"Partner UI".visible = true
	$"Partner UI/Weaken".visible = true
	$"Partner UI/Heal".visible = true

func _on_alchemia_bear_elephant():
	Global.bear_bear = false
	Global.bear_cat = false
	Global.bear_elephant = true
	Global.cat_bear = false
	Global.cat_cat = false
	Global.cat_elephant = false
	Global.elephant_bear = false
	Global.elephant_cat = false
	Global.elephant_elephant = false
	$"Partner UI".visible = true
	$"Partner UI/Weaken".visible = true
	$"Partner UI/Shield".visible = true

func _on_alchemia_cat_bear():
	pass # Replace with function body.

func _on_alchemia_cat_cat():
	pass # Replace with function body.

func _on_alchemia_cat_elephant():
	pass # Replace with function body.

func _on_alchemia_elephant_bear():
	pass # Replace with function body.

func _on_alchemia_elephant_cat():
	pass # Replace with function body.

func _on_alchemia_elephant_elephant():
	pass # Replace with function body.


func _on_alchemia_partner_turn():
	if Global.cat_cat:
		pass


