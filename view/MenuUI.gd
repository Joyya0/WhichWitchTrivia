extends CanvasLayer

@onready var file_menu = $HBoxContainer/FileMenu
@onready var help_menu = $HBoxContainer/HelpMenu

func _ready():
	var file_popup = file_menu.get_popup()
	file_popup.add_item("Save Game")
	file_popup.add_item("Load Game")
	file_popup.add_separator()
	file_popup.add_item("Exit")
	file_popup.id_pressed.connect(_on_file_pressed)

	var help_popup = help_menu.get_popup()
	help_popup.add_item("About")
	help_popup.add_item("Gameplay Instructions")
	help_popup.id_pressed.connect(_on_help_pressed)

func _on_file_pressed(id):
	if id == 0:
		print("Save Game clicked!")
	elif id == 1:
		print("Load Game clicked!")
	elif id == 3:
		get_tree().quit()

func _on_help_pressed(id):
	if id == 0:
		print("About clicked!")
	elif id == 1:
		print("Gameplay Instructions clicked!")
