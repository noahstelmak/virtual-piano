extends Button

const START_SCREEN = preload("res://src/scenes/start_screen/start_screen.tscn")

func _on_pressed():
	get_tree().change_scene_to_file("res://src/scenes/start_screen/start_screen.tscn")
