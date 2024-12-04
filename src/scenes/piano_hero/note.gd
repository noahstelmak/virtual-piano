extends PathFollow2D

@onready var slim = $Slim
@onready var wide = $Wide

signal miss

var _pitch: int;

func set_pitch(pitch: int):
	_pitch = pitch;
	
func get_pitch():
	return _pitch;

func _ready():
	match _pitch:
		0, 5, 4, 11:
			slim.queue_free()
		2, 7, 9:
			wide.queue_free()
		1, 3, 6, 8, 10:
			slim.color = Color.BLACK
			wide.queue_free()


func _physics_process(delta):
	set_progress_ratio(progress_ratio + 0.2 * delta)
	if progress_ratio >= 1:
		miss.emit(self)
