extends Node

# Represents the states of a door in the room 
# Connected the relationship between the door and question 

enum DoorStatus { LOCKED, OPEN, PERM_CLOSED}
var myCurrentStatus = DoorStatus.LOCKED # Tracks status of door (open or locked)

# Check status of door  
# if door is locked permanently -> boolean type (True or False)


# Updates door status if the player got the question wrong or correct
func update_door_status(IsCorrect: bool): 
	if IsCorrect:
		myCurrentStatus = DoorStatus.OPEN
	else:
		myCurrentStatus = DoorStatus.PERM_CLOSED
