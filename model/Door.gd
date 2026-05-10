extends Node

# Represents the states of a door in the room 
# Connected the relationship between the door and question 

enum DoorStatus { LOCKED, OPEN, PERM_CLOSED}
var myCurrentStatus = DoorStatus.LOCKED # Tracks status of door (open or locked)

# Check status of door  
# if door is locked permanently -> boolean type (True or False)
func isPermClosed() -> bool:
	return myCurrentStatus == DoorStatus.PERM_CLOSED

# Updates door status if the player got the question wrong or correct
func updateDoorStatus(IsCorrect: bool): 
	if IsCorrect:
		myCurrentStatus = DoorStatus.OPEN
	else:
		myCurrentStatus = DoorStatus.PERM_CLOSED

# Handles the input of the player: 
# takes the asnwer of the player and updates the status of the door
func answerResult(isRight: bool):
	updateDoorStatus(isRight)
