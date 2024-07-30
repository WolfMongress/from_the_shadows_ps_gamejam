extends Node2D

@export var path_follow : PathFollow2D

@export var speed = 300

var is_leaping = false

func _process(delta):
	if is_leaping:
		path_follow.progress += delta * speed

func start_attack():
	$"Boss Leap Timer".start()
	is_leaping = true
	show()

func _on_leap_timer_timeout():
	is_leaping = false
	path_follow.progress_ratio = 0
	hide()
