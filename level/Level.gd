extends Node2D

signal player_died
signal player_wins

# Called when the node enters the scene tree for the first time.
func _ready():
	$"/root/Soundtrack".play_level_song()

func _on_player_died():
	emit_signal("player_died")

func _on_turtle_died():
	$Cart.roll_in()
	$Mushroom.equip_chainsaw()

func _on_player_wins():
	emit_signal("player_wins")
