tool

extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal death

export var image = preload("health.png")

export var max_health = 3

onready var _health = max_health

func _draw():
	for i in range(_health):
		draw_texture(image, Vector2(i*image.get_width(),0))

func reduce_health():
	_health = _health - 1
	update()
	if _health <= 0:
		emit_signal("death")
	
