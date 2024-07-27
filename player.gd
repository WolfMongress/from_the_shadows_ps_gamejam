extends Area2D

signal attacking_regular #regular attack with no transformations
signal partner_turn
signal ui_appear

#partner transformation variables/signals

signal bear_bear
signal bear_elephant
signal bear_cat
signal elephant_bear
signal elephant_elephant
signal elephant_cat
signal cat_bear
signal cat_elephant
signal cat_cat

signal transformation_submenu_active

func _ready():
	print("beast 1: ", Global.beast1)
	print("beast 2: ", Global.beast2)
	print("beast 3: ", Global.beast3)

func _process(delta):
	if Global.player_turn == true:
		$"Primary UI".show()
	elif Global.player_turn == false:
		$"Primary UI".hide()
		#Global.partner_turn = true
	if Global.player_health > 200:
		Global.player_health = 200
	if Global.three_turn_countdown == 0:
		Global.transformed = false
		Global.beast1 = false
		Global.beast2 = false
		Global.beast3 = false

func _on_placeholderboss_player_turn():
		$"Primary UI".show()

func _on_attack_pressed():
	if not Global.transformed:
		attacking_regular.emit()
		Global.partner_turn = true
		Global.player_turn = false
	else:
		if Global.beast1 == true:
			$"Primary UI/Attack/Transformation Submenu".show()
			$"Primary UI/Attack/Transformation Submenu/Plasma Blast".show()
			$"Primary UI/Attack/Transformation Submenu/Claw Strike".show()
		elif Global.beast2 == true:
			$"Primary UI/Attack/Transformation Submenu".show()
			$"Primary UI/Attack/Transformation Submenu/Mega Bottle".show()
			$"Primary UI/Attack/Transformation Submenu/Cloak Slap".show()
		elif Global.beast3 == true:
			$"Primary UI/Attack/Transformation Submenu".show()
			$"Primary UI/Attack/Transformation Submenu/Supersonic Roar".show()
			$"Primary UI/Attack/Transformation Submenu/Body Slam".show()


#code doing with partner transformations
func _on_partner_pressed():
	Global.player_turn = false
	Global.cat_bear = false
	Global.cat_cat = false
	Global.cat_elephant = false
	Global.bear_bear = false
	Global.bear_cat = false
	Global.bear_elephant = false
	Global.elephant_bear = false
	Global.elephant_cat = false
	Global.elephant_elephant = false
	if Global.three_turn_countdown >= 1:
		Global.three_turn_countdown = (Global.three_turn_countdown - 1)
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://partner_shadowplay.tscn")

#code doing with items
func _on_items_pressed():
	Global.player_turn = false
	get_tree().change_scene_to_file("res://item_alchemy.tscn")



#code doing with player transformations
func _on_alchemia_pressed():
	Global.player_turn = false
	get_tree().change_scene_to_file("res://transformations.tscn")

func _on_transformations_transformed():
	Global.transformed = true
	Global.partner_turn = true

func _on_transformations_beast_1_transformation():
	Global.beast1 = true
	Global.beast2 = false
	Global.beast3 = false
	Global.three_turn_countdown = 3
	Global.partner_turn = true

func _on_transformations_beast_2_transformation():
	Global.beast1 = false
	Global.beast2 = true
	Global.beast3 = false
	Global.three_turn_countdown = 3
	Global.partner_turn = true

func _on_transformations_beast_3_transformation():
	Global.beast1 = false
	Global.beast2 = false
	Global.beast3 = true
	Global.three_turn_countdown = 3
	Global.partner_turn = true

func _on_plasma_blast_pressed():
	Global.beast1_ranged = true
	Global.three_turn_countdown = (Global.three_turn_countdown - 1)
	$"Primary UI/Attack/Transformation Submenu/Plasma Blast".hide()
	$"Primary UI/Attack/Transformation Submenu/Claw Strike".hide()
	$"Primary UI/Attack/Transformation Submenu".hide()

func _on_claw_strike_pressed():
	Global.beast1_melee = true
	Global.three_turn_countdown = (Global.three_turn_countdown - 1)
	hide()
	$"Primary UI/Attack/Transformation Submenu/Plasma Blast".hide()
	$"Primary UI/Attack/Transformation Submenu/Claw Strike".hide()
	$"Primary UI/Attack/Transformation Submenu".hide()

#weaken is boss damage * 0.9
#block is boss damage * 0.9
#shield is boss damage * 0.8
#ultra weaken is boss damage * 0.8
#ultra shield is bossdamage * 0.7

func _on_timer_timeout():
	if Global.boss_phase_1:
		if Global.boss_weakened:
			if Input.is_action_pressed("block"):
				Global.player_health = (Global.player_health - 12)
			else:
				Global.player_health = (Global.player_health - 13)
			if Global.player_shield == true:
				Global.player_health = (Global.player_health - 10)
		elif Global.boss_ultra_weakened:
			if Input.is_action_pressed("block"):
				Global.player_health = (Global.player_health - 10)
			elif Global.player_shield:
				Global.player_health = (Global.player_health - 9)
			else:
				Global.player_health = (Global.player_health - 12)
		elif Global.player_shield:
			Global.player_health = (Global.player_health - 12)
		elif Global.player_ultra_shield:
			if Global.boss_weakened:
				Global.player_health = (Global.player_health - 9)
			else:
				Global.player_health = (Global.player_health - 10)
		else:
			if Input.is_action_pressed("block"):
				Global.player_health = (Global.player_health - 13)
			else:
				Global.player_health = (Global.player_health - 15)
		Global.boss_ultra_weakened = false
		Global.boss_weakened = false
		Global.player_ultra_shield = false
		Global.player_shield = false
		print(Global.player_health)


func _on_phase_2_attack_1_timeout():
	Global.player_health -= 15


func _on_phase_2_attack_2_timeout():
	Global.player_health -= 15


func _on_phase_2_attack_3_timeout():
	Global.player_health -= 30
