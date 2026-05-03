extends Node

# Handles the data and logic for the 3 types of quetions
# Question Types: Mulitple Choice, true/false, and short answer

enum QuestionType {MULTIPLE_CHOICE, TRUE_FALSE, SHORT_ANSWER }

var myCurrentType = QuestionType.MULTIPLE_CHOICE
var myQuestionText: String = "" # The question that the player would see
var myCorrectAns: String = "" # This would store the correct answer
var myOptions: Array = [] #Use this for multiple choice selections

# Loads the data from trivia database

# Checks player's answer (input) to see if it is correct 
