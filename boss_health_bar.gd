extends ProgressBar

func _ready():
	set_value_no_signal(500)

func _on_placeholderboss_boss_health_bar(health):
	set_value_no_signal(health)
