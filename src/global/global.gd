extends Node

const START_SCREEN = preload("res://src/scenes/start_screen/start_screen.tscn")
const MIDI_PLAYER = preload("res://addons/midi/MidiPlayer.tscn")

var midi_player: MidiPlayer;

func _ready():
	midi_player = MIDI_PLAYER.instantiate();
	midi_player.set_soundfont.call_deferred("res://assets/soundfonts/Yamaha-Grand-Lite-v2.0.sf2")
	get_tree().get_root().add_child.call_deferred(midi_player)

func _input(event):
	if event.is_action("Back"):
		get_tree().change_scene_to_packed(START_SCREEN)

func play_note(note: int):
	var input_event: InputEventMIDI = InputEventMIDI.new()
	input_event.message = MIDIMessage.MIDI_MESSAGE_NOTE_ON 
	input_event.pitch = note
	input_event.velocity = 0x7F 
	midi_player.receive_raw_midi_message(input_event)
