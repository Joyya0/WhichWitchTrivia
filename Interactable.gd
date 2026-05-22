extends StaticBody3D

@export_file("*.tscn")
var next_room_scene : String

func interact():

	var trivia_ui = get_tree().get_first_node_in_group("trivia")

	if trivia_ui:
		trivia_ui.show_question(next_room_scene)
