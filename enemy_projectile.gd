extends Node2D

@onready var path_follow : PathFollow2D = $Path2D/PathFollow2D

@export var speed = 200

func _process(delta):
	if Global.boss_turn != false:
		path_follow.progress += speed * delta
