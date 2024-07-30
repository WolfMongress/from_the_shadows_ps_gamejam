extends Node2D

@export var path_follow : PathFollow2D

@export var speed = 400

var is_jumping = false

func _process(delta):
	if is_jumping:
		path_follow.progress += speed * delta

func start_attack():
	show()
	is_jumping = true
	$"Jump Timer".start()

func _on_jump_timer_timeout():
	is_jumping = false
	hide()
	path_follow.progress_ratio = 0
