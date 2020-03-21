extends Node2D

var HUD = preload("res://menu/main menu.tscn")
var Level = preload("res://level/Level.tscn")
var Lose = preload("res://endgame/Lose.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HUD_start_game():
	$HUD.queue_free()
	var level = Level.instance()
	add_child(level)
	level.connect("player_died", self, "_on_player_died")

func _on_player_died():
	var level = Lose.instance()
	add_child(level)
	remove_child(get_child(0)) # Remove active level, leaving only the loss level
	level.connect("dismiss_lose_screen", self, "_on_dismiss_lose_screen")

func _on_dismiss_lose_screen():
	var hud = HUD.instance()
	add_child(hud)
	remove_child(get_child(0))
	hud.connect("start_game", self, "_on_HUD_start_game")
