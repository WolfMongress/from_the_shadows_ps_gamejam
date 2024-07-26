extends Node2D

@onready var path_follow : PathFollow2D = $Path2D/PathFollow2D

@export var speed = 200

@export var phase1_timer : Timer

#phase 2 fast single bottle
@export var phase2_1_timer : Timer
#phase 2 multi bottle
@export var phase2_2_1_timer : Timer
#phase 2 multi bottle 5s delays
@export var phase2_2_2_timer : Timer
#phase 2 dash
@export var phase2_3_1_timer : Timer
#phase 2 dash wind up
@export var phase2_3_2_timer : Timer

var projectile_out = false
var rng = RandomNumberGenerator.new()

var bottle_counter = 3

func _ready():
	$Path2D/PathFollow2D.progress_ratio
	hide()

func _process(delta):
	if Global.boss_turn != false:
		path_follow.progress += speed * delta
		if not projectile_out:
			if Global.boss_phase_1:
				show()
				phase1_timer.start()
				projectile_out = true
			elif Global.boss_phase_2:
				var which_attack = rng.randi_range(0,2)
				Global.phase2_which_attack = which_attack
				match which_attack:
					0:
						projectile_out = true
						print("a1")
						phase2_1_timer.start()
					1:
						projectile_out = true
						print("a2")
						phase2_2_1_timer.start()
					2:
						projectile_out = true
						print("a3")
						phase2_3_2_timer.start()
				#phase2_timer.start()

func _on_timer_timeout():
	Global.boss_turn = false
	Global.player_turn = true
	projectile_out = false
	self.hide()
	$Path2D/PathFollow2D.progress_ratio = 0


func _on_phase_2_timer_1_timeout():
	Global.boss_turn = false
	Global.player_turn = true
	projectile_out = false

func _on_phase_2_timer_2_delay_timeout():
	phase2_2_1_timer.start()


func _on_phase_2_timer_3_delay_timeout():
	phase2_3_1_timer.start()


func _on_phase_2_timer_2_timeout():
	bottle_counter -= 1
	if bottle_counter == 0:
		projectile_out = false
		Global.boss_turn = false
		Global.player_turn = true
	else:
		phase2_2_1_timer.start()


func _on_phase_2_timer_3_timeout():
	Global.boss_turn = false
	Global.player_turn = true
	projectile_out = false
