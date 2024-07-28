extends ProgressBar

func _ready():
	set_value_no_signal(Global.boss_health)
	Global.boss_health_limits = max_value

func _on_placeholderboss_boss_health_bar(health):
	if Global.boss_phase_2 == true:
		max_value = Global.phase2_health
		Global.boss_health_limits = max_value
	set_value_no_signal(health)
