extends Node

func _ready():
	GameState.reset()
	print("lives should be 3: ", GameState.playerLives)
	print("curRoom should be 0: ", GameState.curRoom)
	print("isGameOver should be false: ", GameState.isGameOver)
	
	GameState.loseLife()
	print("lives after loseLife should be 2: ", GameState.playerLives)
	
	GameState.loseLife()
	GameState.loseLife()
	print("isGameOver should be true: ", GameState.isGameOver)
	
	GameState.reset()
	GameState.advanceRoom()
	print("curRoom after advanceRoom should be 1: ", GameState.curRoom)
	
	GameState.reset()
	print("isAlive should be true: ", GameState.isAlive())
	GameState.playerLives = 0
	print("isAlive should be false: ", GameState.isAlive())
	
	GameState.reset()
	print("hasWon should be false: ", GameState.hasWon())
	GameState.curRoom = 8
	print("hasWon should be true: ", GameState.hasWon())
