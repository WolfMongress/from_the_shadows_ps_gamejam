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

func _process(delta):
	if Global.player_turn == true:
		$"Primary UI".show()
	elif Global.player_turn == false:
		$"Primary UI".hide()
		partner_turn.emit()
	if Global.player_health > 200:
		Global.player_health = 200

func _on_placeholderboss_player_turn():
		$"Primary UI".show()

func _on_attack_pressed():
	if not Global.transformed:
		attacking_regular.emit()
	else:
		transformation_submenu_active.emit()
		if Global.beast1 == true:
			pass
	Global.player_turn = false
	partner_turn.emit()

#code doing with partner transformations
func _on_partner_pressed():
	$"Primary UI".hide()
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://partner_shadowplay.tscn")

#code doing with items
func _on_items_pressed():
	$"Primary UI".hide()
	get_tree().change_scene_to_file("res://item_alchemy.tscn")


#code doing with player transformations
func _on_alchemia_pressed():
	$"Primary UI".hide()
	get_tree().change_scene_to_file("res://transformations.tscn")

func _on_transformations_transformed():
	Global.transformed = true

func _on_transformations_beast_1_transformation():
	Global.beast1 = true
	Global.three_turn_countdown = 3

func _on_transformations_beast_2_transformation():
	Global.beast2 = true
	Global.three_turn_countdown = 3

func _on_transformations_beast_3_transformation():
	Global.beast3 = true
	Global.three_turn_countdown = 3

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
		print(Global.player_health)
	
	#elif Global.boss_phase_2:
		#match Global.phase2_which_attack:
			#0:
				#Global.player_health -= 15
			#1:
				#Global.player_health -= 15
			#2:
				#Global.player_health -= 30


func _on_phase_2_timer_1_timeout():
	Global.player_health -= 15

func _on_phase_2_timer_2_timeout():
	Global.player_health -= 15

func _on_phase_2_timer_3_timeout():
	Global.player_health -= 30
