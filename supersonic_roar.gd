extends Node2D

@onready var path_follow : PathFollow2D = $"Sound Waves/PathFollow2D"

@export var speed = 800

var roaring = false

@export var sound_timer : Timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.beast3_ranged:
		path_follow.progress += speed * delta
		if not roaring:
			Global.player_turn = false
			show()
			sound_timer.start()
			roaring = true

func _on_sound_speed_timeout():
	roaring = false
	hide()
	Global.beast3_ranged = false
	Global.partner_turn = true
	path_follow.progress_ratio = 0
