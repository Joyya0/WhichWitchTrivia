extends CanvasLayer

@onready var question_label = $Panel/QuestionLabel

@onready var button1 = $Panel/Answer1
@onready var button2 = $Panel/Answer2
@onready var button3 = $Panel/Answer3
@onready var button4 = $Panel/Answer4

var current_question
var next_room = ""

var questions = [
	{
		"question": "What is 2 + 2?",
		"answers": ["1", "2", "4", "8"],
		"correct": 2
	},
	{
		"question": "What color is the sky?",
		"answers": ["Blue", "Green", "Red", "Yellow"],
		"correct": 0
	},
	{
		"question": "Which language does Godot use?",
		"answers": ["Java", "Python", "GDScript", "C"],
		"correct": 2
	}
]

func _ready():
	add_to_group("trivia")

	visible = false

	button1.pressed.connect(func(): answer_selected(0))
	button2.pressed.connect(func(): answer_selected(1))
	button3.pressed.connect(func(): answer_selected(2))
	button4.pressed.connect(func(): answer_selected(3))

func show_question(room_path):

	visible = true
	next_room = room_path

	current_question = questions.pick_random()

	question_label.text = current_question["question"]

	button1.text = current_question["answers"][0]
	button2.text = current_question["answers"][1]
	button3.text = current_question["answers"][2]
	button4.text = current_question["answers"][3]

	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

	var player = get_tree().get_first_node_in_group("player")

	if player:
		player.can_move = false

func answer_selected(index):

	if index == current_question["correct"]:

		print("Correct!")

		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

		print("Loading room: ", next_room)

	else:

		question_label.text = "Incorrect! Try again."
