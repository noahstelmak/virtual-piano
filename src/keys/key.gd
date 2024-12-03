extends Area2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var collision_polygon_2d = $CollisionPolygon2D

signal note_pressed(note: int)
signal note_released(note: int)

@export var note: int;
@export var note_name: String;

const NOTE_PARTICLE = preload("res://src/note_particles/note_particle.tscn")

var piano;
var is_mouse_over: bool = false;

func set_note(value: int):
	self.note = value;

func _ready():
	var local_note = note % 12
	match local_note:
		0, 5:
			animated_sprite_2d.set_animation("side_key")
			$CollisionPolygon2D2.queue_free()
			$CollisionPolygon2D3.queue_free()
			scale = Vector2(-1, 1)
		4, 11:
			$CollisionPolygon2D2.queue_free()
			$CollisionPolygon2D3.queue_free()
			animated_sprite_2d.set_animation("side_key")
		2, 7, 9:
			animated_sprite_2d.set_animation("middle_key")
			$CollisionPolygon2D.queue_free()
			$CollisionPolygon2D3.queue_free()
		1, 3, 6, 8, 10:
			$CollisionPolygon2D.queue_free()
			$CollisionPolygon2D2.queue_free()
			animated_sprite_2d.set_animation("black_key")

func press_key():
	show_note_particle(note) 
	animated_sprite_2d.set_frame(1)

func release_key():
	animated_sprite_2d.set_frame(0)

func _press_key():
	if piano.playingback:
		return;
	show_note_particle(note) 
	animated_sprite_2d.set_frame(1)
	note_pressed.emit(note)

func _release_key():
	if piano.playingback:
		return;

	animated_sprite_2d.set_frame(0)
	note_released.emit(note)

func _input(event):
	_mouse_input(event)

func _mouse_input(event):
	if event is not InputEventMouseButton:
		return;
		
	if event.button_index != MOUSE_BUTTON_LEFT:
		return;
		
	if is_mouse_over and event.pressed:
		_press_key()
	else:
		_release_key()
	

func _on_mouse_entered():
	is_mouse_over = true
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		_press_key()

func _on_mouse_exited():
	is_mouse_over = false
	_release_key()


func show_note_particle(note: int):
	var particle = NOTE_PARTICLE.instantiate()
	particle.text = str(note_name)  # Display the note number (you can map to names if needed)
	particle.global_position = Vector2(10 * -scale.x, -30)  # Offset above the key
	particle.scale = Vector2(0.25 * scale.x, 0.25)
	add_child(particle)
