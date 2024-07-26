extends RigidBody2D

signal clicked

var lifted = false

func _ready():
	get_viewport().get_mouse_position()

func _physics_process(delta):
	if lifted:
		global_transform.origin = get_global_mouse_position()
		#position = get_viewport().get_mouse_position()

func _on_input_event(x, event, y):
	#lifted = event.is_pressed()
	if event is InputEventMouseButton:
		if event.is_pressed():
			linear_velocity = Vector2(0, 0)
			lifted = not lifted
			print(lifted)
