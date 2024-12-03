extends Control

func _on_start_game_button_pressed():
	get_tree().change_scene_to_file("res://src/scenes/livre/livre.tscn")

func _on_exit_button_pressed():
	get_tree().quit()

func _on_genius_audio_pressed():
	get_tree().change_scene_to_file("res://src/scenes/genius/genius.tscn")
