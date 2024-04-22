extends Node2D

@onready var player1 = $Player1
@onready var player2 = $Player2
@onready var ui = $ui

func _ready():
	if !player1._started.is_connected(ui.player1_reset):
		player1._started.connect(ui.player1_reset)
	
	if !player2._started.is_connected(ui.player2_reset):
		player2._started.connect(ui.player2_reset)
		
	if !player1._restart.is_connected(ui.reset_player):
		player1._restart.connect(ui.reset_player)
	
	if !player2._restart.is_connected(ui.reset_player):
		player2._restart.connect(ui.reset_player)

	
	if !player1._restart.is_connected($Level1.respawn_player):
		player1._restart.connect($Level1.respawn_player)
	
	if !player2._restart.is_connected($Level1.respawn_player):
		player2._restart.connect($Level1.respawn_player)
