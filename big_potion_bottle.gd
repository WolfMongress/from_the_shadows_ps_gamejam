extends Area2D

func _on_body_entered(body):
	if $"../Goldenseal":
		print("brewing")
	elif $"../Armoranth":
		print("we aint cooking")
