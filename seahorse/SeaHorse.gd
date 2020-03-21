extends Node2D

var X = 1
var Y = 1
var screen_size

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = position.x + X
	position.y = position.y + Y
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)


func _on_Timer_timeout():
	X = rand_range(-1,1)
	Y = rand_range(-1,1)
