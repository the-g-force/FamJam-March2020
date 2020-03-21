extends TextureButton

var _available = true

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _pressed():
	if _available:
		disabled = true
		_available = false
		yield(get_tree().create_timer(0.5), 'timeout')
		_available = true
		disabled = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
