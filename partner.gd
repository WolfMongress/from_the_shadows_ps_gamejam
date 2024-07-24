extends StaticBody2D

signal player_turn_end

var bear_bear
var bear_cat
var bear_elephant

var cat_bear
var cat_cat
var cat_elephant

var elephant_bear
var elephant_cat
var elephant_elephant

func _on_alchemia_bear_bear():
	bear_bear = true
	bear_cat = false
	bear_elephant = false
	cat_bear = false
	cat_cat = false
	cat_elephant = false
	elephant_bear = false
	elephant_cat = false
	elephant_elephant = false
	$"Partner UI".visible = true
	$"Partner UI/Ultra Weaken".visible = true

func _on_alchemia_bear_cat():
	bear_bear = false
	bear_cat = true
	bear_elephant = false
	cat_bear = false
	cat_cat = false
	cat_elephant = false
	elephant_bear = false
	elephant_cat = false
	elephant_elephant = false
	$"Partner UI".visible = true
	$"Partner UI/Weaken".visible = true
	$"Partner UI/Heal".visible = true

func _on_alchemia_bear_elephant():
	bear_bear = false
	bear_cat = false
	bear_elephant = true
	cat_bear = false
	cat_cat = false
	cat_elephant = false
	elephant_bear = false
	elephant_cat = false
	elephant_elephant = false
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
	if cat_cat:
		pass


