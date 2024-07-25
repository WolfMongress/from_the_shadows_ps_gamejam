extends Area2D

var boss_health
signal boss_health_bar(boss_health)
signal player_turn

func _on_alchemia_attacking_regular():
	Global.boss_health = (Global.boss_health - (randi() % 5 + 10))
	boss_health = Global.boss_health
	boss_health_bar.emit(boss_health)
	player_turn.emit()


