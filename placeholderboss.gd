extends Area2D

var boss_health
signal boss_health_bar(boss_health)
signal player_turn

#!!! CALL THIS FUNCTION AFTER EVERY HIT THE BOSS TAKES !!!
func boss_health_check():
	if Global.boss_health <= 0:
		Global.boss_phase_1 = false
		Global.boss_phase_2 = true
		boss_health = Global.phase2_health
		Global.boss_health = Global.phase2_health
		boss_health_bar.emit(boss_health)

func _on_alchemia_attacking_regular():
	#original damage = 5
	Global.boss_health = (Global.boss_health - (randi_range(0, 10) + 10))
	boss_health = Global.boss_health
	boss_health_bar.emit(boss_health)
	boss_health_check()

func _on_plasma_blast_t_imer_timeout():
	if Global.boss_shield_active:
		pass
	else:
		#original damage = 40
		Global.boss_health = (Global.boss_health - (randi_range(40, 80)))
	boss_health = Global.boss_health
	boss_health_bar.emit(boss_health)
	boss_health_check()

func _on_leap_timer_timeout():
	if Global.boss_shield_active:
		pass
	else:
		if Input.is_action_pressed("action_command"):
			Global.boss_health = (Global.boss_health - (randi_range(50, 90)))
		else:
			Global.boss_health = (Global.boss_health - (randi_range(30, 60)))
	boss_health = Global.boss_health
	boss_health_bar.emit(boss_health)
	boss_health_check()
