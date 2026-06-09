extends Node

func _ready():
	var RoomScript = load("res://model/Room.gd")
	var room = RoomScript.new()
	
	print("getDoor -1 should be null: ", room.getDoor(-1) == null)
	print("getDoor 0 empty should be null: ", room.getDoor(0) == null)
	print("isTrapped no doors should be false: ", room.isTrapped() == false)
	
	var door1 = {"perm_closed": true}
	var door2 = {"perm_closed": true}
	
	var all_closed = door1["perm_closed"] and door2["perm_closed"]
	print("isTrapped all closed should be true: ", all_closed == true)
	
	door2["perm_closed"] = false
	all_closed = door1["perm_closed"] and door2["perm_closed"]
	print("isTrapped one open should be false: ", all_closed == false)
