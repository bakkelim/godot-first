extends Area2D

func _on_body_entered(body):
	#print_debug("_on_body_entered")
	if body.has_method("restart"):
		body.restart(true)

