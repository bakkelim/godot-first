extends Area2D

func _on_body_exited(body):
	#print_debug("_on_body_exited")
	if body.has_method("started"):
		body.started()
		
