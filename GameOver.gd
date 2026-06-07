extends Control

func _ready():
	$Button.pressed.connect(_on_restart_pressed)

func _on_restart_pressed():
	get_tree().change_scene_to_file("res://scenes/room_1.tscn")
