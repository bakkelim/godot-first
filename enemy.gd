extends Area2D

var d = 0.0
@export var radius = 0.1
@export var speed = 2.0

func _process(delta):
	d += delta
	
	position = Vector2(
		sin(d * speed) * radius,
		cos(d * speed) * radius,
	) * Vector2(250, 250)

func _on_body_entered(body):
	#print_debug("hit!")
	if body.has_method("restart"):
		body.restart(false)
