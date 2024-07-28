extends Node2D

@onready var path_follow : PathFollow2D = $"Body Slam Arc/PathFollow2D"

@export var speed = 400

var jumping = false

@export var jump_timer : Timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.beast3_melee:
		path_follow.progress += speed * delta
		if not jumping:
			Global.player_turn = false
			show()
			jump_timer.start()
			jumping = true

func _on_jump_timer_timeout():
	jumping = false
	$"../Alchemia".show()
	Global.beast3_melee = false
	Global.partner_turn = true
	Global.player_dazed = true
	path_follow.progress_ratio = 0
