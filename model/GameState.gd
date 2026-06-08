extends Node

# Main variables to track the player's progress
var playerLives: int = 3
var curRoom: int = 0
var totalScore: int = 0
var isGameOver: bool = false
const TOTAL_ROOMS: int = 8

func reset():
	playerLives = 3
	curRoom = 0
	totalScore = 0
	isGameOver = false

func loseLife():
	playerLives -= 1
	if playerLives <= 0:
		isGameOver = true
		print("GAME OVER")

func advanceRoom():
	curRoom += 1
	WinCondition()

func WinCondition():
	if curRoom >= TOTAL_ROOMS:
		print("YOU HAVE ESCAPED")

func addScore(points: int = 10):
	totalScore += points

func isAlive() -> bool:
	return playerLives > 0 and not isGameOver

func hasWon() -> bool:
	return curRoom >= TOTAL_ROOMS

func save_game():
	var file = FileAccess.open("user://savegame.json", FileAccess.WRITE)
	var data = {
		"current_room": curRoom,
		"player_lives": playerLives,
		"total_score": totalScore
	}
	file.store_string(JSON.stringify(data))
	file.close()
	print("Game saved!")

func load_game():
	if not FileAccess.file_exists("user://savegame.json"):
		print("No save file found.")
		return
	var file = FileAccess.open("user://savegame.json", FileAccess.READ)
	var data = JSON.parse_string(file.get_as_text())
	file.close()
	curRoom = data["current_room"]
	playerLives = data["player_lives"]
	totalScore = data["total_score"]
	print("Game loaded!")
