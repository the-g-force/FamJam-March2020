extends Node2D

signal dismiss_lose_screen

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_button_pressed():
	emit_signal("dismiss_lose_screen")
