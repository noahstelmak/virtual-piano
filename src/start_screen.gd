extends Control

func _on_start_game_button_pressed():
	get_tree().change_scene_to_file("res://src/main.tscn")

func _on_exit_button_pressed():
	get_tree().quit()
