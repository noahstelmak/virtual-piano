extends Node2D

var note_sequence: Array[int] = []  # The generated sequence of notes
var player_sequence: Array[int] = []  # The player's input sequence
var random = RandomNumberGenerator.new()

func _play_sequence():
	for note in note_sequence:
		await get_tree().create_timer(0.5).timeout
		$Piano.play_note(note)
		Global.play_note(note)

func _add_note():
	note_sequence.append(60 + random.randi_range(0, 11))

func _ready():
	_add_note()
	_play_sequence()

func _on_piano_note_pressed(note):
	# Ignore input if the player sequence exceeds the note sequence length
	if len(player_sequence) >= len(note_sequence):
		return

	player_sequence.append(note)
	Global.play_note(note)
	print("Player sequence:", player_sequence)

	# Validate the player's input against the note sequence
	if player_sequence[-1] != note_sequence[len(player_sequence) - 1]:
		print("Wrong note! Game over.")
		_reset_game()
		return

	# Check if the player completed the sequence
	if len(player_sequence) == len(note_sequence):
		print("Sequence complete!")
		player_sequence.clear()  # Clear for the next round
		await get_tree().create_timer(1.5).timeout  # Short pause
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
