extends Label

var velocity = Vector2(0, -50)  # Speed and direction of movement
var lifetime = 3 # Duration before disappearing
 

func _ready():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color(1, 1, 1, 0), lifetime)
	await tween.finished
	queue_free()

func _process(delta):
	position += velocity * delta
