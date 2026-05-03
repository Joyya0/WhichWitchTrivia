extends Node

# Model: Handles the data and logic for the 3 types of quetions
# Question Types: Mulitple Choice, true/false, and short answer

enum QuestionType {MULTIPLE_CHOICE, TRUE_FALSE, SHORT_ANSWER }

var current_type = QuestionType.MULTIPLE_CHOICE
var question_text: String = ""
var correct_answer: String = "" # This would store the correct answer
var options: Array = [] #Use this for multiple choice selections

# Loads the data 

# Checks player's input
