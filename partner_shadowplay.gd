extends Node2D

##all the selections

#back half selections
var bear_back
var elephant_back
var cat_back

#front half selections
var bear_front
var elephant_front
var cat_front

var finished_back
var finished_front

#selection signals
signal bear_bear_selection
signal bear_elephant_selection
signal bear_cat_selection

signal elephant_bear_selection
signal elephant_elephant_selection
signal elephant_cat_selection

signal cat_bear_selection
signal cat_elephant_selection
signal cat_cat_selection

#back half of partner

func _on_bear_button_back_pressed():
	bear_back = true
	finished_back = true
	if elephant_back:
		elephant_back = false
	elif cat_back:
		cat_back = false

func _on_elephant_button_back_pressed():
	elephant_back = true
	finished_back = true
	if bear_back:
		bear_back = false
	elif cat_back:
		cat_back = false

func _on_cat_button_back_pressed():
	cat_back = true
	finished_back = true
	if bear_back:
		bear_back = false
	elif elephant_back:
		elephant_back = false

#front half of partner

func _on_bear_button_front_pressed():
	bear_front = true
	finished_front = true
	if elephant_front:
		elephant_front = false
	elif cat_front:
		cat_front = false

func _on_elephant_button_front_pressed():
	elephant_front = true
	finished_front = true
	if bear_front:
		bear_front = false
	elif cat_front:
		cat_front = false

func _on_cat_button_front_pressed():
	cat_front = true
	finished_front = true
	if bear_front:
		bear_front = false
	elif  elephant_front:
		elephant_front = false

func _process(delta):
	#print(finished_back and finished_front)
	if finished_back and finished_front:
		$ok_button.visible = true

func _on_ok_button_pressed():
	if bear_back and bear_front:
		Global.bear_bear = true
	elif bear_back and elephant_front:
		Global.bear_elephant = true
	elif bear_back and cat_front:
		Global.bear_cat = true
	elif elephant_back and bear_front:
		Global.elephant_bear = true
	elif elephant_back and elephant_front:
		Global.elephant_elephant = true
	elif elephant_back and cat_front:
		Global.elephant_cat = true
	elif cat_back and bear_front:
		Global.cat_bear = true
	elif cat_back and elephant_front:
		Global.cat_elephant = true
	elif cat_back and cat_front:
		Global.cat_cat = true
	Global.player_turn = false
	Global.partner_turn = true
	get_tree().change_scene_to_file("res://battle_scene.tscn")
