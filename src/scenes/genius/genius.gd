extends Node2D

var note_sequence: Array[int] = [];
var player_sequence: Array[int] = [];

func _play_sequence():
	pass

func _ready():
	pass

func _on_piano_note_pressed(note):
	player_sequence.append(note)
	print(note)
