extends RigidBody2D

var lifted = false

func _ready():
	get_viewport().get_mouse_position()

func _on_input_event(event):
	if event is InputEventMouseButton and event.pressed:
		lifted = true

func _unhandled_input(event):
	if event is InputEventMouseButton and not event.pressed:
		lifted = false
	if lifted and event is InputEventMouseMotion:
		position += event.relative


