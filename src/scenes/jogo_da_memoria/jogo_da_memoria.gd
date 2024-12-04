extends Node2D

var note_sequence: Array[int] = []  
var player_sequence: Array[int] = []  
var random = RandomNumberGenerator.new()

@onready var pause_indicator = $Indicators/PauseIndicator
@onready var playing_indicator = $Indicators/PlayingIndicator
@onready var score = $Score

func _play_sequence():
	pause_indicator.visible = false
	playing_indicator.visible = true 
	
	$Piano.set_playingback(true)
	
	for note in note_sequence:
		await get_tree().create_timer(0.5).timeout
		$Piano.play_note(note)
		Global.play_note(note)
	await get_tree().create_timer(0.5).timeout
	
	$Piano.set_playingback(false)
	
	pause_indicator.visible = true
	playing_indicator.visible = false

func _add_note():
	note_sequence.append(60 + random.randi_range(0, 11))
	score.text = 'Nível: ' + str(len(note_sequence))

func _ready():
	_add_note()
	_play_sequence()

func _on_piano_note_pressed(note):
	if len(player_sequence) >= len(note_sequence):
		return

	player_sequence.append(note)
	Global.play_note(note)
	print("Player sequence:", player_sequence)

	if player_sequence[-1] != note_sequence[len(player_sequence) - 1]:
		print("Wrong note! Game over.")
		_reset_game()
		return

	if len(player_sequence) == len(note_sequence):
		print("Sequence complete!")
		player_sequence.clear() 
		await get_tree().create_timer(1.5).timeout
		_next_round()


func _next_round():
	player_sequence.clear()
	_add_note()
	_play_sequence()

func _reset_game():
	note_sequence.clear()
	player_sequence.clear()
	print("Game reset. Starting over...")
	await get_tree().create_timer(2.0).timeout  # Short pause
	_add_note()
	_play_sequence()
