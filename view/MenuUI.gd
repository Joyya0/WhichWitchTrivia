extends CanvasLayer

@onready var file_menu = $Panel/HBoxContainer/FileMenu
@onready var help_menu = $Panel/HBoxContainer/HelpMenu

func _ready():
	# File menu items
	var file_popup = file_menu.get_popup()
	file_popup.add_item("Save Game", 0)
	file_popup.add_item("Load Game", 1)
	file_popup.add_separator()
	file_popup.add_item("Exit", 3)
	file_popup.id_pressed.connect(_on_file_pressed)
	
	# Help menu items
	var help_popup = help_menu.get_popup()
	help_popup.add_item("About", 0)
	help_popup.add_item("Gameplay Instructions", 1)
	help_popup.id_pressed.connect(_on_help_pressed)
	
	# Keybind shortcuts for File and Help
	_assign_menu_shortcut(file_menu, KEY_F)
	_assign_menu_shortcut(help_menu, KEY_H)
	
	_setup_dialogs()

func _assign_menu_shortcut(menu_btn: MenuButton, key_to_bind: Key):
	var shortcut = Shortcut.new()
	var input_event = InputEventKey.new()
	input_event.keycode = key_to_bind
	shortcut.events.append(input_event)
	menu_btn.shortcut = shortcut

func _setup_dialogs():
	var about = AcceptDialog.new()
	about.name = "AboutDialog"
	about.title = "About"
	about.dialog_text = "WhichWitch Trivia Maze\nVersion 1.0\n\nCreated by: [Anna, Bee, Francesca]\nTCSS 360 - Spring 2026"
	add_child(about)

	var instructions = AcceptDialog.new()
	instructions.name = "InstructionsDialog"
	instructions.title = "Gameplay Instructions"
	instructions.dialog_text = """Welcome to WhichWitch Trivia Maze!
HOW TO PLAY:
- Navigate through the maze from entrance to exit using WASD to move.
- Each door requires you to answer a trivia question.
- Answer correctly to pass through the door.
- Answer wrong three times and the door is permanently locked!
QUESTION TYPES:
- Multiple Choice
- True / False
- Short Answer
TIPS:
- If all doors in a room are locked, the game is lost.
- Save often using File > Save Game!"""
	add_child(instructions)

	var exit_confirm = ConfirmationDialog.new()
	exit_confirm.name = "ExitDialog"
	exit_confirm.title = "Exit Game"
	exit_confirm.dialog_text = "Are you sure you want to exit? Unsaved progress will be lost."
	exit_confirm.confirmed.connect(_on_exit_confirmed)
	add_child(exit_confirm)

func _on_file_pressed(id):
	match id:
		0: _save_game()
		1: _load_game()
		3: $ExitDialog.popup_centered()

func _on_help_pressed(id):
	match id:
		0: $AboutDialog.popup_centered()
		1: $InstructionsDialog.popup_centered()

func _save_game():
	GameState.save_game()

func _load_game():
	GameState.load_game()

func _on_exit_confirmed():
	get_tree().quit()
