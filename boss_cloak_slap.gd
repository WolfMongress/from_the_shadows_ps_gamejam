extends Node2D

@export var path_follow : PathFollow2D

@export var speed = 600

var is_dashing = false

func _process(delta):
	if is_dashing:
		path_follow.progress += delta * speed

func start_attack():
	$"Boss Cloak Slap Timer".start()
	is_dashing = true
	show()

func _on_boss_cloak_slap_timer_timeout():
	is_dashing = false
	path_follow.progress_ratio = 0
	hide()
