extends Node2D

signal dismiss_lose_screen

# Called when the node enters the scene tree for the first time.
func _ready():

	$"/root/Soundtrack".play_lose_song()
func _on_button_pressed():
	emit_signal("dismiss_lose_screen")
