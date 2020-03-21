extends Node2D

# Where it wheels to
export var destination_x = 250

var _is_rolling_in = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if _is_rolling_in:
		position.x -= 5
		if position.x <= destination_x:
			_is_rolling_in = false

func _input(event):
	if event.is_action("debug_roll_cart"):
		_is_rolling_in = true
