extends Node2D

@onready var path_follow : PathFollow2D = $Path2D/PathFollow2D

@export var speed = 200

@export var phase1_timer : Timer

@export var boss_node : Node2D

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

#boss plasma blast node
@export var boss_plasma_blast : Node2D
#boss claw strike node
@export var boss_claw_strike : Node2D
#boss mega bottle node
@export var boss_mega_bottle : Node2D
#boss cloak slap node
@export var boss_cloak_slap : Node2D
#boss supersonic roar
@export var boss_roar : Node2D
#boss body slam
@export var boss_body_slam : Node2D

var projectile_out = false

var rng = RandomNumberGenerator.new()

var bottle_counter = 3

func _ready():
	$Path2D/PathFollow2D.progress_ratio = 0
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
				var which_attack = rng.randi_range(0,3)
				Global.phase2_which_attack = which_attack
				match which_attack:
					0:
						projectile_out = true
						print("a1")
						show()
						speed = 400
						phase2_1_timer.start()
					1:
						projectile_out = true
						print("a2")
						phase2_2_1_timer.start()
					2:
						projectile_out = true
						print("a3")
						phase2_3_2_timer.start()
					3:
						Global.boss_shield_active = true
						print("a4")
						Global.boss_turn = false
						Global.player_turn = true
			elif Global.boss_phase_3:
				var which_attack = rng.randi_range(0,5)
				Global.phase3_which_attack = which_attack
				match which_attack:
					0:
						projectile_out = true
						print("a1")
						boss_plasma_blast.start_attack()
					1:
						projectile_out = true
						print("a2")
						boss_claw_strike.start_attack()
						boss_node.hide()
					2:
						projectile_out = true
						print("a3")
						boss_mega_bottle.start_attack()
					3:
						projectile_out = true
						print("a4")
						boss_cloak_slap.start_attack()
						boss_node.hide()
					4:
						projectile_out = true
						print("a5")
						boss_roar.start_attack()
					5:
						projectile_out = true
						print("a6")
						boss_body_slam.start_attack()
						boss_node.hide()

func _on_timer_timeout():
	if Global.player_dazed == true:
		Global.boss_turn = true
		Global.player_dazed = false
	else:
		Global.boss_turn = false
		Global.player_turn = true
	projectile_out = false
	self.hide()
	$Path2D/PathFollow2D.progress_ratio = 0

func _on_phase_2_attack_1_timeout():
	if Global.player_dazed == true:
		Global.boss_turn = true
		Global.player_dazed = false
	else:
		Global.boss_turn = false
		Global.player_turn = true
	projectile_out = false
	self.hide()
	$Path2D/PathFollow2D.progress_ratio = 0

func _on_phase_2_attack_2_delay_timeout():
	phase2_2_1_timer.start()

func _on_phase_2_attack_3_delay_timeout():
	phase2_3_1_timer.start()

func _on_phase_2_attack_2_timeout():
	bottle_counter -= 1
	if bottle_counter == 0:
		projectile_out = false
		Global.boss_turn = false
		Global.player_turn = true
		bottle_counter = 3
	else:
		phase2_2_1_timer.start()

func _on_phase_2_attack_3_timeout():
	Global.boss_turn = false
	Global.player_turn = true
	projectile_out = false

func _on_boss_plasma_blast_t_imer_timeout():
	Global.boss_turn = false
	Global.player_turn = true
	projectile_out = false

func _on_boss_leap_timer_timeout():
	Global.boss_turn = false
	Global.player_turn = true
	projectile_out = false
	boss_node.show()

func _on_boss_mega_bottle_timer_timeout():
	Global.boss_turn = false
	Global.player_turn = true
	projectile_out = false

func _on_boss_cloak_slap_timer_timeout():
	Global.boss_turn = false
	Global.player_turn = true
	projectile_out = false
	boss_node.show()

func _on_boss_sound_speed_timeout():
	Global.boss_turn = false
	Global.player_turn = true
	projectile_out = false

func _on_jump_timer_timeout():
	Global.boss_turn = false
	Global.player_turn = true
	projectile_out = false
	boss_node.show()
