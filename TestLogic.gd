extends Node

func _ready():
	print("\n STARTING UNIT TESTS")
	testQuestion()
	testDoor()
	testGameState()
	print("ALL TESTS COMPLETE\n")

func testQuestion(): 
	print("\nTesting Question Script: ")    
	
	# Load the script file directly from your project files
	var question_script = load("res://Question.gd")
	var question_test = question_script.new()
	
	question_test.myQuestionText = "Who is Merlin?"
	question_test.myCorrectAns = "Wizard"
	
	# Testing lowercase, uppercase, and mixed case inputs
	if question_test.checkAnswer("wizard") == true and question_test.checkAnswer("WIZARD") == true and question_test.checkAnswer("WiZaRd") == true:
		print("SUCCESS: Case-insensitivity works!")
	else:
		print("ERROR: Case-insensitivity failed!")

	# Testing a wrong answer
	if question_test.checkAnswer("Dragon") == false:
		print("SUCCESS: Wrong answer caught")
	else:
		print("ERROR: Wrong answer marked as correct")   

func testDoor():
	print("\nTesting Door Script: ")
	
	# Load the script file directly from your project files
	var door_script = load("res://Door.gd")
	var door_test = door_script.new()
	
	# Verify the door starts out standard LOCKED
	if door_test.myCurrentStatus == door_test.DoorStatus.LOCKED:
		print("SUCCESS: Door correctly starts as LOCKED")
	else:
		print("ERROR: Door did not start as LOCKED")
	
	# Verify a correct answer changes status to OPEN
	
		
	# Verify a wrong answer changes status to PERM_CLOSED
	

func testGameState():
	
