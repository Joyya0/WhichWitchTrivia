extends Control

@onready var start_button = $StartButton
@onready var load_button = $LoadButton

func _ready():
	GameState.reset()
	start_button.pressed.connect(_on_start_pressed)
	load_button.pressed.connect(_on_load_pressed)

func _on_start_pressed():
	GameState.reset()
	get_tree().change_scene_to_file("res://scenes/room_1.tscn")

func _on_load_pressed():
	GameState.load_game()
	get_tree().change_scene_to_file("res://scenes/room_" + str(GameState.curRoom + 1) + ".tscn")
