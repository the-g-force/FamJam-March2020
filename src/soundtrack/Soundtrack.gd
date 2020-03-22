extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var duck_amount_db = 15

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func duck():
	$LevelMusic.volume_db -= duck_amount_db
	
func unduck():
	$LevelMusic.volume_db += duck_amount_db
	
func play_menu_song():
	$MenuMusic.play()
	$LossMusic.stop()
	$LevelMusic.stop()

func play_level_song():
	if not $LevelMusic.playing:
		$LossMusic.stop()
		$MenuMusic.stop()
		$LevelMusic.play()
	
func play_lose_song():
	$LossMusic.play()
	$LevelMusic.stop()
	$MenuMusic.stop()

