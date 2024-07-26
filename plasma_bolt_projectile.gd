extends Node2D

@onready var path_follow : PathFollow2D = $Path2D/PathFollow2D

@export var speed = 300

var projectile_out = false

@export var projectile_timer : Timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.beast1_ranged != false:
		path_follow.progress += speed * delta
		if not projectile_out:
			Global.player_turn = false
			show()
			projectile_timer.start()
			projectile_out = true

func _on_plasma_blast_t_imer_timeout():
	projectile_out = false
	Global.beast1_ranged = false
	Global.boss_turn = true
	self.hide()
	$Path2D/PathFollow2D.progress_ratio = 0
