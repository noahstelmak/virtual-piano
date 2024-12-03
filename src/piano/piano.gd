extends Node2D

var offset: float = 3.5

signal note_pressed(note: int)

var key_scene = preload("res://src/key/key.tscn")

var keys = {}

var solfege_to_midi: Dictionary = {
	"Do": 0,
	"Do#": 1,
	"Re": 2,
	"Re#": 3,
	"Mi": 4,
	"Fa": 5,
	"Fa#": 6,
	"Sol": 7,
	"Sol#": 8,
	"La": 9,
	"La#": 10,
	"Si": 11,
	#"Do1": 12,
	#"Do#1": 13,
	#"Re1": 14,
	#"Re#1": 15,
}

var current_octave: int = 5; 
var c3: int = 48;

var playingback = false;

func _ready():
	_create_keys();
	$"OctaveIndicator/0".color = Color.DARK_GRAY;
	$"OctaveIndicator/1".color = Color.WHITE_SMOKE;
	$"OctaveIndicator/2".color = Color.DARK_GRAY;

func _create_keys():
	for i in range(36):
		var key = key_scene.instantiate()
		var note = c3 + i
		key.set_note(note)
		key.note_name = solfege_to_midi.keys()[i % 12] 
		key.piano = self
		keys[note] = key
		key.connect('note_pressed', _play_note)
		
		add_child(key)
		
		if key.animated_sprite_2d.get_animation() == 'black_key':
			key.translate(Vector2(offset - 4, -6))
			key.z_index = 1
		else: 
			key.translate(Vector2(offset, 0))
			offset += 8
			key.z_index = 2

func _input(event):
	if playingback:
		return
		
	if event is not InputEventKey:
		return
		
	if event.is_action_pressed('shift+'):
		current_octave = min(6, current_octave + 1)
	if event.is_action_pressed('shift-'):
		current_octave = max(4, current_octave - 1)
	
	$"OctaveIndicator/0".color = Color.DARK_GRAY;
	$"OctaveIndicator/1".color = Color.DARK_GRAY;
	$"OctaveIndicator/2".color = Color.DARK_GRAY;
	
	get_node("OctaveIndicator/" + str(current_octave - 4)).color = Color.WHITE_SMOKE
	
	for key_name in solfege_to_midi:
		if event.is_action_pressed(key_name):
			var note = solfege_to_midi[key_name] + current_octave * 12
			if keys.has(note):
				keys[note].call_deferred("_press_key")
		if event.is_action_released(key_name):
			var note = solfege_to_midi[key_name] + current_octave * 12
			if keys.has(note):
				keys[note].call_deferred("_release_key")

func play_note(note: int):
	if keys.has(note):
		playingback = true
		keys[note].call_deferred("press_key")
		await get_tree().create_timer(0.5).timeout
		keys[note].call_deferred("release_key")
		playingback = false

func _play_note(note: int):
	if not playingback:
		note_pressed.emit(note)
