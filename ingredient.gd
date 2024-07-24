extends RigidBody2D

var dragging_position

func _on_mouse_entered():
	get_local_mouse_position()
	
