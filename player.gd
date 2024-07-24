extends StaticBody2D

var transformed = false
@export var health = 200
@export var first_turn = true

signal attacking_regular #regular attack with no transformations
signal partner_turn
signal ui_appear

signal bear_bear
signal bear_elephant
signal bear_cat
signal elephant_bear
signal elephant_elephant
signal elephant_cat
signal cat_bear
signal cat_elephant
signal cat_cat

func _ready():
	if first_turn:
		$"Primary UI".show()
		first_turn = false

func _on_placeholderboss_player_turn():
		$"Primary UI".show()

func _on_attack_pressed():
	if not transformed:
		attacking_regular.emit()
	partner_turn.emit()

func _on_partner_pressed():
	$"Primary UI".hide()
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://partner_shadowplay.tscn")


func _on_partner_shadowplay_bear_bear_selection():
	get_tree().change_scene_to_file("res://battle_scene.tscn")
	bear_bear.emit()
	partner_turn.emit()

func _on_partner_shadowplay_bear_cat_selection():
	get_tree().change_scene_to_file("res://battle_scene.tscn")
	bear_cat.emit()
	partner_turn.emit()

func _on_partner_shadowplay_bear_elephant_selection():
	get_tree().change_scene_to_file("res://battle_scene.tscn")
	bear_elephant.emit()
	partner_turn.emit()

func _on_partner_shadowplay_cat_bear_selection():
	get_tree().change_scene_to_file("res://battle_scene.tscn")
	cat_bear.emit()
	partner_turn.emit()

func _on_partner_shadowplay_cat_cat_selection():
	get_tree().change_scene_to_file("res://battle_scene.tscn")
	cat_cat.emit()
	partner_turn.emit()

func _on_partner_shadowplay_cat_elephant_selection():
	get_tree().change_scene_to_file("res://battle_scene.tscn")
	cat_elephant.emit()
	partner_turn.emit()

func _on_partner_shadowplay_elephant_bear_selection():
	get_tree().change_scene_to_file("res://battle_scene.tscn")
	elephant_bear.emit()
	partner_turn.emit()

func _on_partner_shadowplay_elephant_cat_selection():
	get_tree().change_scene_to_file("res://battle_scene.tscn")
	elephant_cat.emit()
	partner_turn.emit()

func _on_partner_shadowplay_elephant_elephant_selection():
	get_tree().change_scene_to_file("res://battle_scene.tscn")
	elephant_elephant.emit()
	partner_turn.emit()

func _on_items_pressed():
	$"Primary UI".hide()
	get_tree().change_scene_to_file("res://item_alchemy.tscn")
