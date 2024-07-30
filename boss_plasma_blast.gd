extends Node2D

@export var path_follow : PathFollow2D

@export var speed = 600

var projectile_out = false

func _process(delta):
	if projectile_out:
		path_follow.progress += speed * delta

func start_attack():
	$"Boss Plasma Blast TImer".start()
	projectile_out = true
	show()

func _on_boss_plasma_blast_t_imer_timeout():
	projectile_out = false
	path_follow.progress_ratio = 0
	hide()
	print("timeout")
