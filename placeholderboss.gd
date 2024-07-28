extends Area2D

var boss_health
signal boss_health_bar(boss_health)
signal player_turn

#!!! CALL THIS FUNCTION AFTER EVERY HIT THE BOSS TAKES !!!
func boss_health_check():
	if Global.boss_health > Global.boss_health_limits:
		Global.boss_health = Global.boss_health_limits
	print(Global.boss_health)
	if Global.boss_poison_countdown > 0:
		Global.boss_poison_countdown = (Global.boss_poison_countdown - 1)
		Global.boss_health = (Global.boss_health - 25)
	if Global.boss_health <= 0:
		Global.boss_phase_1 = false
		Global.boss_phase_2 = true
		boss_health = Global.phase2_health
		Global.boss_health = Global.phase2_health
	boss_health_bar.emit(boss_health)

func _on_alchemia_attacking_regular():
	if Global.boss_shield_active:
		Global.boss_health = (Global.boss_health + (randi_range(10, 20)))
	Global.boss_health = (Global.boss_health - (randi_range(10, 20)))
	boss_health = Global.boss_health
	boss_health_bar.emit(boss_health)
	boss_health_check()

func _on_plasma_blast_t_imer_timeout():
	if Global.boss_shield_active:
		Global.boss_health = (Global.boss_health + (randi_range(40, 80)))
	else:
		#original damage = 40
		Global.boss_health = (Global.boss_health - (randi_range(40, 80)))
	boss_health = Global.boss_health
	boss_health_bar.emit(boss_health)
	boss_health_check()

func _on_leap_timer_timeout():
	if Global.boss_shield_active:
		Global.boss_shield_active = false
	else:
		if Input.is_action_pressed("action_command"):
			Global.boss_health = (Global.boss_health - (randi_range(50, 90)))
		else:
			Global.boss_health = (Global.boss_health - (randi_range(30, 60)))
	boss_health = Global.boss_health
	boss_health_bar.emit(boss_health)
	boss_health_check()

func _on_mega_bottle_flight_timeout():
	if Global.boss_shield_active:
		Global.boss_health = (Global.boss_health + 50)
	else:
		Global.boss_health = (Global.boss_health - 50)
		Global.boss_poison_countdown = 3
	boss_health = Global.boss_health
	boss_health_bar.emit(boss_health)
	boss_health_check()


func _on_cloak_slap_timer_timeout():
	if Global.boss_shield_active:
		Global.boss_shield_active = false
	else:
		if Input.is_action_pressed("action_command"):
			Global.Boss_health = (Global.boss_health - 60)
		else:
			Global.boss_health = (Global.boss_health - 40)
	Global.boss_dazed = true
	boss_health = Global.boss_health
	boss_health_bar.emit(boss_health)
	boss_health_check()

func _on_sound_speed_timeout():
	if Global.boss_shield_active:
		Global.boss_health = (Global.boss_health + 50)
	else:
		Global.boss_health = (Global.boss_health - 50)
		Global.boss_dazed = true
	boss_health = Global.boss_health
	boss_health_bar.emit(boss_health)
	boss_health_check()

func _on_jump_timer_timeout():
	if Global.boss_shield_active:
		Global.boss_shield_active = false
	else:
		Global.boss_health = (Global.boss_health - randi_range(60, 100))
	boss_health = Global.boss_health
	boss_health_bar.emit(boss_health)
	boss_health_check()
