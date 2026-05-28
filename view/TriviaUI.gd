extends CanvasLayer

@onready var question_label = $Panel/QuestionLabel

@onready var multiple_choice_container = $Panel/MCContainer
@onready var true_false_container = $Panel/TFContainer
@onready var short_answer_container = $Panel/SAContainer

# Multiple choice buttons
@onready var button1 = $Panel/MCContainer/Answer1
@onready var button2 = $Panel/MCContainer/Answer2
@onready var button3 = $Panel/MCContainer/Answer3
@onready var button4 = $Panel/MCContainer/Answer4

var current_question
var next_room = ""

func _ready():

	add_to_group("trivia")

	visible = false

	button1.pressed.connect(func(): answer_selected(0))
	button2.pressed.connect(func(): answer_selected(1))
	button3.pressed.connect(func(): answer_selected(2))
	button4.pressed.connect(func(): answer_selected(3))


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
			button4.text = current_question["option4"]

		"tf":

			true_false_container.visible = true

		"sa":

			short_answer_container.visible = true

	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

	var player = get_tree().get_first_node_in_group("player")

	if player:
		player.can_move = false


func answer_selected(index):

	var selected_answer = ""

	match index:
		0:
			selected_answer = button1.text
		1:
			selected_answer = button2.text
		2:
			selected_answer = button3.text
		3:
			selected_answer = button4.text

	if selected_answer == current_question["answer"]:

		print("Correct!")

		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

		var player = get_tree().get_first_node_in_group("player")

		if player:
			player.can_move = true

		# Change room here later
		print("Loading room: ", next_room)

	else:

		question_label.text = "Incorrect! Try again."
