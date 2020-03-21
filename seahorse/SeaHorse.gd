extends Node2D

var speed = 3
var screen_size

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = position.x + speed
	if speed == abs(speed):
		$Sprite.flip_h = false
	else:
		$Sprite.flip_h = true
	

func _on_Timer_timeout():
	speed = -speed

