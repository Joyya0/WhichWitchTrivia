extends Node

var db : SQLite

var question_tables = [
	"multiple_choice",
	"true_false",
	"short_answer"
]

func _ready():

	db = SQLite.new()

	# Path to database
	db.path = "res://triviadb.db"

	# Open DB
	db.open_db()

	print("QuestionManager loaded")


func get_random_question():

	# Pick random table
	var table = question_tables.pick_random()

	print("Selected table: ", table)

	# SQL query
	var query = "SELECT * FROM %s ORDER BY RANDOM() LIMIT 1" % table

	print("Running query: ", query)

	db.query(query)

	if db.query_result.size() == 0:
		return null

	# Get first row
	var question = db.query_result[0]

	# Add type info
	match table:

		"multiple_choice":
			question["type"] = "mc"

		"true_false":
			question["type"] = "tf"

		"short_answer":
			question["type"] = "sa"

	print("Loaded question: ", question)

	return question
