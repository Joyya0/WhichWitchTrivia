extends Node

var RoomId: int = 0
var doors: Array = []

# Returns a specific door object based on its index in the array
func getDoor(doorIndex: int): 
	if doorIndex >= 0 and doorIndex < doors.size():
		return doors[doorIndex]
	return null
	
# Checks if all the doors in the room are permanetly locked 
# If only ONE door is permanently closed play is still not fully trapped 
	
