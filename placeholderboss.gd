extends Area2D

var boss_health
signal boss_health_bar(boss_health)
signal player_turn

func _on_alchemia_attacking_regular():
	Global.boss_health = (Global.boss_health - (randi() % 5 + 10))
	boss_health = Global.boss_health
	boss_health_bar.emit(boss_health)
	player_turn.emit()
	if boss_health <= 0:
		Global.boss_phase_1 = false
		Global.boss_phase_2 = true
		Global.boss_health = 1000
		boss_health = Global.boss_health
		boss_health_bar.emit(boss_health)
		player_turn.emit()

func _on_plasma_blast_t_imer_timeout():
	if Global.boss_shield_active:
		pass
	else:
		Global.boss_health = (Global.boss_health - (randi() % 40 + 10))
