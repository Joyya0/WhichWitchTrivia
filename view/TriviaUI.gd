extends CanvasLayer

@onready var question_label = $Panel/QuestionLabel
@onready var prompt = $"../InteractLabel"

@onready var multiple_choice_container = $Panel/MCContainer
@onready var true_false_container = $Panel/TFContainer
@onready var short_answer_container = $Panel/SAContainer

# Multiple choice buttons
@onready var button1 = $Panel/MCContainer/Answer1
@onready var button2 = $Panel/MCContainer/Answer2
@onready var button3 = $Panel/MCContainer/Answer3

@onready var true_button = $Panel/TFContainer/True
@onready var false_button = $Panel/TFContainer/False

@onready var textbox = $Panel/SAContainer/textbox

var current_question
var next_room = ""
@export var door_count : int = 1

func _ready():
	add_to_group("trivia")
	visible = false
	textbox.text_submitted.connect(_on_text_submitted)

	button1.pressed.connect(func(): answer_selected(0))
	button2.pressed.connect(func(): answer_selected(1))
	button3.pressed.connect(func(): answer_selected(2))
	
	true_button.pressed.connect(func(): answer_selected_tf("True"))
	false_button.pressed.connect(func(): answer_selected_tf("False"))


func show_question(question_data, room_path = ""):
	visible = true

	current_question = question_data
	next_room = room_path

	question_label.text = current_question["question"]

	# Hide all containers first
	multiple_choice_container.visible = false
	true_false_container.visible = false
	short_answer_container.visible = false

	match current_question["type"]:

		"mc":

			multiple_choice_container.visible = true

			button1.text = current_question["option1"]
			button2.text = current_question["option2"]
			button3.text = current_question["option3"]

		"tf":

			true_false_container.visible = true

			button1.text = "True"
			button2.text = "False"

		"sa":

			short_answer_container.visible = true
			textbox.text = ""
			textbox.grab_focus()

			

	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

	var player = get_tree().get_first_node_in_group("player")

	if player:
		player.can_move = false

func _on_text_submitted(_text):
	submit_short_answer()
	
func answer_selected(index):

	var selected_answer = ""

	match index:
		0:
			selected_answer = button1.text
		1:
			selected_answer = button2.text
		2:
			selected_answer = button3.text

	if selected_answer.to_lower() == str(current_question["answer"]).to_lower():

		print("Correct!")

		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

		var player = get_tree().get_first_node_in_group("player")

		if player:
			player.can_move = true

		get_tree().change_scene_to_file(next_room)

	else:

		wrong_answer_selected()

func answer_selected_tf(selected_answer):

	if selected_answer.to_lower() == str(current_question["answer"]).to_lower():

		print("Correct!")

		var player = get_tree().get_first_node_in_group("player")

		if player:
			player.can_move = true

		get_tree().change_scene_to_file(next_room)

	else:

		wrong_answer_selected()

func submit_short_answer():

	var user_answer = textbox.text.strip_edges()

	if user_answer.to_lower() == str(current_question["answer"]).to_lower():

		print("Correct!")

		var player = get_tree().get_first_node_in_group("player")

		if player:
			player.can_move = true

		get_tree().change_scene_to_file(next_room)

	else:

		wrong_answer_selected()

func wrong_answer_selected():
	door_count -= 1
	if door_count == 0:
		question_label.text = "Game Over!"
	else:
		question_label.text = "Incorrect! This door is now locked."
