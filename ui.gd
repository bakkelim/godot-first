extends CanvasLayer

@onready var player1_attempts_label = %Player1Attempts
@onready var player2_attempts_label = %Player2Attempts

@onready var player1_time_elapsed := 0.0
@onready var player2_time_elapsed := 0.0
# You don't really need this
var player1_counter = 1
var player2_counter = 1
var player1_is_stopped := false
var player2_is_stopped := false
var player1_best_time = 0.0
var player2_best_time = 0.0

func _ready():
	_update_player1_attempts_label()
	_update_player2_attempts_label()
	
func _process(delta: float) -> void:
	_update_player1_time(delta)
	_update_player2_time(delta)

func reset_player(player, won):
	if player.name == "Player1":
		_update_player1_attempts()
		player1_stop()	
		if won && player1_time_elapsed > player1_best_time: 
			_update_player1_best_time()
			_update_player1_best_time_label()
			_reset_player1_attempts()
	
	if player.name == "Player2":
		_update_player2_attempts()
		player2_stop()
		if won && player2_time_elapsed > player2_best_time: 
			_update_player2_best_time()
			_update_player2_best_time_label()
			_reset_player2_attempts()
	
func player1_reset() -> void:
	# possibly save time_elapsed somewhere else before overriding it
	player1_time_elapsed = 0.0
	_update_player1_time_label(player1_time_elapsed)
	player1_is_stopped = false

func player1_stop() -> void:
	player1_is_stopped = true
	
func player2_reset() -> void:
	# possibly save time_elapsed somewhere else before overriding it
	player2_time_elapsed = 0.0
	_update_player1_time_label(player2_time_elapsed)
	player2_is_stopped = false

func player2_stop() -> void:
	player2_is_stopped = true

var player1_attempts = 0:
	set(new_player1_attempts):
		player1_attempts = new_player1_attempts
		_update_player1_attempts_label()

var player2_attempts = 0:
	set(new_player2_attempts):
		player2_attempts = new_player2_attempts
		_update_player2_attempts_label()
	
		
func _update_player1_attempts_label():
	player1_attempts_label.text = "Attempts: " + str(player1_attempts)

func _update_player1_attempts():
	player1_attempts += 1
	
func _update_player2_attempts_label():
	player2_attempts_label.text = "Attempts: " + str(player2_attempts)

func _update_player2_attempts():
	player2_attempts += 1

func _update_player1_best_time():
	player1_best_time = player1_time_elapsed
	
func _update_player1_best_time_label():
	%Player1BestTime.text = "Best time: " + str(player1_best_time).pad_decimals(0)
	
func _update_player2_best_time():
	player2_best_time = player2_time_elapsed
	
func _update_player2_best_time_label():
	%Player2BestTime.text = "Best time: " + str(player2_best_time).pad_decimals(0)
	
func _update_player1_time(delta) -> void:
	if !player1_is_stopped:
		player1_time_elapsed += delta
		_update_player1_time_label(player1_time_elapsed)

func _update_player2_time(delta) -> void:
	if !player2_is_stopped:
		player2_time_elapsed += delta
		_update_player2_time_label(player2_time_elapsed)
		
func _update_player1_time_label(elapsed):
	%Player1Time.text = "Time: " + str(elapsed).pad_decimals(0)

func _update_player2_time_label(elapsed):
	%Player2Time.text = "Time: " + str(elapsed).pad_decimals(0)

func _reset_player1_attempts():
	player1_attempts = 0

func _reset_player2_attempts():
	player2_attempts = 0
