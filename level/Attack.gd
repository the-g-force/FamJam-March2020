extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var _available = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _pressed():
	if _available:
		_available = false
		disabled = true
		yield(get_tree().create_timer(0.5), 'timeout')
		_available = true
		disabled = false
#func _process(delta):
#	pass
