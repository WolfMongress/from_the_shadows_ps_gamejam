extends Button

func _on_mouse_entered():
	$"Body Slam Description".show()

func _on_mouse_exited():
	$"Body Slam Description".hide()
