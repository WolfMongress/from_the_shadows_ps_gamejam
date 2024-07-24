extends VBoxContainer

var submenu_active = false

func _on_shadows_pressed():
	if submenu_active:
		visible = false
		submenu_active = false
	else:
		visible = true
		submenu_active = true
