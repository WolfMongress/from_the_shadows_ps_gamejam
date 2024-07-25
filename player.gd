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
	if Global.player_turn == true:
		$"Primary UI".show()
	elif Global.player_turn == false:
		$"Primary UI".hide()
		partner_turn.emit()

func _on_placeholderboss_player_turn():
		$"Primary UI".show()

func _on_attack_pressed():
	if not Global.transformed:
		attacking_regular.emit()
	else:
		transformation_submenu_active.emit()
		if Global.beast1 == true:
			pass
	partner_turn.emit()

#code doing with partner transformations
func _on_partner_pressed():
	Global.player_turn = false
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

func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("test")
	if Global.boss_phase_1 == true:
		if Input.is_action_pressed("block"):
			Global.player_health = (Global.player_health - 8)
		else:
			Global.player_health = (Global.player_health - 10)
		Global.boss_turn = false
