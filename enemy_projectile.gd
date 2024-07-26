extends Node2D

@onready var path_follow : PathFollow2D = $Path2D/PathFollow2D

@export var speed = 200

@export var phase1_timer : Timer
var projectile_out = false

func _ready():
	$Path2D/PathFollow2D.progress_ratio
	hide()

func _process(delta):
	if Global.boss_turn != false:
		path_follow.progress += speed * delta
		if not projectile_out:
			show()
			phase1_timer.start()
			projectile_out = true

func _on_timer_timeout():
	Global.boss_turn = false
	Global.player_turn = true
	projectile_out = false
	self.hide()
	$Path2D/PathFollow2D.progress_ratio = 0
