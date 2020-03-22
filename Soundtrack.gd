extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var duck_amount_db = 15

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func duck():
	$AudioStreamPlayer.volume_db -= duck_amount_db
	
func unduck():
	$AudioStreamPlayer.volume_db += duck_amount_db
