extends Node

var db : SQLite

func _ready():

	db = SQLite.new()

	# path to db
	db.path = "res://triviadb.db"

	# open the db
	db.open_db()

	# run query
	db.query("SELECT * FROM questions")

	# results come back as an array of dictionaries
	var results = db.query_result

func get_random_question():

	db.query("SELECT * FROM questions ORDER BY RANDOM() LIMIT 1")

	return db.query_result[0]
