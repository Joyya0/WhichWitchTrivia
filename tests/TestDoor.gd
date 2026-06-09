extends Node

func _ready():
	# load room1 and grab the door from it
	var room_scene = preload("res://scenes/room_1.tscn").instantiate()
	var door = room_scene.get_node("Door/Mesh/StaticBody3D")
	
	print("door starts LOCKED: ", door.myCurrentStatus == door.DoorStatus.LOCKED)
	
	door.updateDoorStatus(true)
	print("correct answer OPEN: ", door.myCurrentStatus == door.DoorStatus.OPEN)
	
	door.updateDoorStatus(false)
	print("wrong answer PERM_CLOSED: ", door.myCurrentStatus == door.DoorStatus.PERM_CLOSED)
	
	door.myCurrentStatus = door.DoorStatus.LOCKED
	print("isPermClosed false: ", door.isPermClosed() == false)
	
	door.myCurrentStatus = door.DoorStatus.PERM_CLOSED
	print("isPermClosed true: ", door.isPermClosed() == true)
	
	door.answerResult(true)
	print("answerResult true OPEN: ", door.myCurrentStatus == door.DoorStatus.OPEN)
	
	door.answerResult(false)
	print("answerResult false PERM_CLOSED: ", door.myCurrentStatus == door.DoorStatus.PERM_CLOSED)
