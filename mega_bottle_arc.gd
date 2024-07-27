extends Node2D

@onready var path_follow : PathFollow2D = $"Mega Bottle Arc/PathFollow2D"

@export var speed = 200

var flight = false

@export var flight_timer : Timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.beast2_ranged != false:
		path_follow.progress = speed * delta
		if not flight:
			Global.player_turn = false
			show()
			flight_timer.start()
			flight = true

func _on_mega_bottle_flight_timeout():
	flight = false
	hide()
	Global.beast2_ranged = false
	Global.partner_turn = true
	path_follow.progress_ratio = 0
