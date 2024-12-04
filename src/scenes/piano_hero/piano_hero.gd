extends Node2D

const NOTE = preload("res://src/scenes/piano_hero/note.tscn")
var acertos: int = 0
var erros: int = 0

@onready var path = $Lane/Paths
var paths: Array;
var current_notes = [];

var lyrics = [
	[0, 2, 4, 5],        # do, re, mi, fa
	[5, 5],              # fa, fa
	[],
	[0, 2, 0, 2],        # do, re, do, re
	[2, 2],              # re, re
	[],
	[0, 7, 5, 4],        # do, sol, fa, mi
	[4, 4],              # mi, mi
	[],
	[0, 2, 4, 5],        # do, re, mi, fa
	[5, 5],              # fa, fa
	[],
	[0, 2, 4, 5],        # do, re, mi, fa
	[5, 5],              # fa, fa
	[],
	[0, 2, 0, 2],        # do, re, do, re
	[2, 2],              # re, re
	[],
	[0, 7, 5, 4],        # do, sol, fa, mi
	[4, 4],              # mi, mi
	[],
	[0, 2, 4, 5],        # do, re, mi, fa
	[5, 5],              # fa, fa
]


func _ready():
	paths = path.get_children()
	for p in paths:
		current_notes.append([])

	play_lyrics()

func play_lyrics():
	for list in lyrics:
		for note in list:
			_create_note(note)
			await get_tree().create_timer(0.5).timeout
		await get_tree().create_timer(0.5).timeout

func _create_note(pitch: int):
	var note = NOTE.instantiate()
	note.connect("miss", _on_note_miss)
	note.set_pitch(pitch)
	current_notes[pitch].append(note)
	paths[pitch].add_child(note)
	

func _on_piano_note_pressed(note):
	if note >= 72 or note < 60:
		return
	
	var pitch = note % 12
	
	if len(current_notes[pitch]) < 1:
		erros += 1
		$Erros.text = 'Erros: ' + str(erros)
		return
	
	var _note = current_notes[pitch][0]
	
	if _note.progress_ratio > 0.8:
		acertos += 1
		$Acertos.text = 'Acertos: ' + str(acertos)
		current_notes[pitch].pop_front()
		_note.queue_free()
	else:
		erros += 1
		$Erros.text = 'Erros: ' + str(erros)
	
	Global.play_note(note)

func _on_note_miss(note):
	erros += 1
	$Erros.text = 'Erros: ' + str(erros)
	var _note = current_notes[note.get_pitch()].pop_front()
	_note.queue_free()
