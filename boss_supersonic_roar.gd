extends Node2D

@export var path_follow : PathFollow2D

@export var speed = 800

var is_roaring = false

func _process(delta):
	if is_roaring:
		path_follow.progress += delta * speed

func start_attack():
	is_roaring = true
	show()
	$"Boss Sound Speed".start()

func _on_boss_sound_speed_timeout():
	hide()
	is_roaring = false
	path_follow.progress_ratio = 0
