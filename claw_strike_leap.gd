extends Node2D

@onready var path_follow : PathFollow2D = $"Leap Strike Path/PathFollow2D"

@export var speed = 300

var leap_active = false

@export var leap_timer : Timer

func _process(delta):
	if Global.beast1_melee != false:
		path_follow.progress += speed * delta
		if not leap_active:
			Global.player_turn
			show()
			leap_timer.start()
			leap_active = true

func _on_leap_timer_timeout():
	leap_active = false
	hide()
	$"../Alchemia".show()
	Global.beast1_melee = false
	Global.partner_turn = true
	path_follow.progress_ratio = 0
