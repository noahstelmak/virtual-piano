extends Node

func _input(event):
	if event.is_action("Back"):
		get_tree().change_scene_to_file("res://src/scenes/start_screen/start_screen.tscn")
