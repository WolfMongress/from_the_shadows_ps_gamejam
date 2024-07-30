extends Node2D

@export var path_follow : PathFollow2D

@export var speed = 200

var projectile_out = false

func _process(delta):
	if projectile_out:
		path_follow.progress += speed * delta

func start_attack():
	$"Boss Mega Bottle Timer".start()
	projectile_out = true
	show()

func _on_boss_mega_bottle_timer_timeout():
	projectile_out = false
	path_follow.progress_ratio = 0
	hide()
