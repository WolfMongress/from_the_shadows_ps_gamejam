extends Area2D

@export var health = 500
signal boss_health_bar(health)
signal player_turn

func _on_alchemia_attacking_regular():
	health = (health - (randi() % 5 + 10))
	boss_health_bar.emit(health)
	player_turn.emit()

func save_boss():
	Global.boss_health = health

func load_boss():
	health = Global.boss_health
