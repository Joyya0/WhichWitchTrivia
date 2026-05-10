extends Node

# Main variables to track the player's progress
var playerLives: int = 3
var curRoom: int = 0
var totalScore: int = 0
var isGameOver: bool = false
const TOTAL_ROOMS: int = 8 

# Save/Load Game Function 

# If player gets a questions wrong they loose a life/health 
func looseLife():
	playerLives -= 1;
	if playerLives <= 0:
		isGameOver = true
		print("GAME OVER")
		
# Checks to see if player has reached the last room
func WinCondition(): 
	if curRoom >= TOTAL_ROOMS:
		print("YOU HAVE ESCAPED")
