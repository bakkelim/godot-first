extends CharacterBody2D

signal _started()
signal _restart(player, won)
signal _win()

@export var speed = 200
@export var up = "player1_up"
@export var down = "player1_down"
@export var left = "player1_left"
@export var right = "player1_right"


func get_input():
	var input_direction = Input.get_vector(left, right, up, down)
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()

func started():
	#print_debug('started')
	_started.emit()

func restart(won: bool):
	_restart.emit(self,won)
	#queue_free()
