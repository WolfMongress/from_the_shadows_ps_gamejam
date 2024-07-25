extends Node2D

var beast1 = true
var beast2 = false
var beast3 = false

signal transformed
signal beast1_transformation
signal beast2_transformation
signal beast3_transformation

func _on_left_pressed():
	if beast1 == true:
		beast1 = false
		beast3 = true
	if beast2 == true:
		beast2 = false
		beast1 = true
	if beast3 == true:
		beast3 = false
		beast2 = true

func _on_right_pressed():
	if beast1 == true:
		beast1 = false
		beast2 = true
	if beast2 == true:
		beast2 = false
		beast3 = true
	if beast3 == true:
		beast3 = false
		beast1 = true

func _input(event):
	if Input.is_action_pressed("ui_accept"):
		if beast1 == true:
			transformed.emit()
			beast1_transformation.emit()
			get_tree().change_scene_to_file("res://battle_scene.tscn")
		if beast2 == true:
			transformed.emit()
			beast2_transformation.emit()
			get_tree().change_scene_to_file("res://battle_scene.tscn")
		if beast3 == true:
			transformed.emit()
			beast3_transformation.emit()
			get_tree().change_scene_to_file("res://battle_scene.tscn")
