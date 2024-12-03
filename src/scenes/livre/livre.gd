extends Node2D



func _on_piano_note_pressed(note):
	Global.play_note(note)
