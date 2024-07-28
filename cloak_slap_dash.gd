extends Node2D

@onready var path_follow : PathFollow2D = $"Dash Path/PathFollow2D"

@export var speed = 600

var dashing = false

@export var dash_timer : Timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.beast2_melee:
		path_follow.progress += speed * delta
		if not dashing:
			Global.player_turn = false
			show()
			dash_timer.start()
			dashing = true

func _on_cloak_slap_timer_timeout():
	dashing = false
	hide()
	$"../Alchemia".show()
	Global.beast2_melee = false
	Global.partner_turn = true
	path_follow.progress_ratio = 0
