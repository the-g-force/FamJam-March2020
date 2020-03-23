extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var duck_amount_db = 15

const _SONGS = {
	"Level": {
		"path": preload("LevelMusic.ogg"),
		"volume": -12
	},
	"Menu": {
		"path": preload("START.ogg"),
		"volume": 15
	},
	"Loss": {
		"path": preload("fIRST.ogg"),
		"volume": -12
	}
}

func duck():
	$Music.volume_db -= duck_amount_db
	
func unduck():
	$Music.volume_db += duck_amount_db
	
func play_menu_song():
	_change_song("Menu")

func play_level_song():
	if $Music.stream != _SONGS["Level"]["path"]:
		_change_song("Level")
	
func play_lose_song():
	_change_song("Loss")
	
func _change_song(key):
	var song = _SONGS[key]
	$Music.stream = song["path"]
	$Music.volume_db = song["volume"]
	$Music.play()

