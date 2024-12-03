extends Node2D


func _on_piano_note_pressed(note):
	var input_event: InputEventMIDI = InputEventMIDI.new()
	input_event.message = MIDIMessage.MIDI_MESSAGE_NOTE_ON 
	input_event.pitch = note
	input_event.velocity = 0x7F 
	$MidiPlayer.receive_raw_midi_message(input_event)
