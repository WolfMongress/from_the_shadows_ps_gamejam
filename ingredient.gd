extends RigidBody2D

signal clicked

var lifted = false
var target = Vector2.ZERO
@export var snap_power = 10

func _physics_process(delta):
	target = get_viewport().get_mouse_position()

func _on_input_event(x, event, y):
	#lifted = event.is_pressed()
	if event is InputEventMouseButton and event.button_index == 1:
		lifted = event.pressed
		sleeping = false

func _input(event):
	if lifted and event is InputEventMouseButton and not event.pressed:
		lifted = false

func _integrate_forces(state):
	if lifted:
		state.linear_velocity = (target - self.position) * snap_power
