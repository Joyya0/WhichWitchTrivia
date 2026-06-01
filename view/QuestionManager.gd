extends Node

var db : SQLite

var question_tables = [
	"multiple_choice",
	"true_false",
	"short_answer"
]
var used_questions = {
	"multiple_choice": [],
	"true_false": [],
	"short_answer": []
}

func _ready():

	db = SQLite.new()

	# Path to database
	db.path = "res://triviadb/triviadb.db"

	# Open DB
	db.open_db()

	print("QuestionManager loaded")

func get_random_question():

	var table = question_tables.pick_random()

	return get_question_from_table(table)


func get_random_question_from_other_table():

	var available_tables = []

	for table in question_tables:

		var query = ""

		if used_questions[table].is_empty():

			query = "SELECT COUNT(*) as count FROM %s" % table

		else:

			var ids = []

			for id in used_questions[table]:
				ids.append(str(id))

			query = "SELECT COUNT(*) as count FROM %s WHERE id NOT IN (%s)" % [
				table,
				",".join(ids)
			]

		db.query(query)

		if db.query_result[0]["count"] > 0:
			available_tables.append(table)

	if available_tables.is_empty():

		print("All questions have been used.")
		return null

	var new_table = available_tables.pick_random()

	return get_question_from_table(new_table)

func get_question_from_table(table):

	var query = ""

	if used_questions[table].is_empty():

		query = "SELECT * FROM %s ORDER BY RANDOM() LIMIT 1" % table

	else:

		var ids = []

		for id in used_questions[table]:
			ids.append(str(id))

		query = "SELECT * FROM %s WHERE id NOT IN (%s) ORDER BY RANDOM() LIMIT 1" % [
			table,
			",".join(ids)
		]

	db.query(query)

	if db.query_result.is_empty():
		return null

	var question = db.query_result[0]

	used_questions[table].append(question["id"])

	match table:
		"multiple_choice":
			question["type"] = "mc"
		"true_false":
			question["type"] = "tf"
		"short_answer":
			question["type"] = "sa"

	return question
