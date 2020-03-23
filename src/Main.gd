extends Node2D

var MainMenu = preload("res://menu/main menu.tscn")
var Level = preload("res://level/Level.tscn")
var Lose = preload("res://endgame/Lose.tscn")
var Win = preload("res://endgame/Win.tscn")

func _on_MainMenu_start_game():
	var level = _replace_current_level(Level)
	level.connect("player_died", self, "_on_player_died")
	level.connect("player_wins", self, "_on_player_wins")

func _on_player_died():
	var level = _replace_current_level(Lose)
	level.connect("dismiss_lose_screen", self, "_on_dismiss_end_screen")
	
func _on_player_wins():
	var level = _replace_current_level(Win)
	level.connect("dismiss_win_screen", self, "_on_dismiss_end_screen")

func _on_dismiss_end_screen():
	var level = _replace_current_level(MainMenu)
	level.connect("start_game", self, "_on_MainMenu_start_game")

func _replace_current_level(Scene):
	var level = Scene.instance()
	add_child(level)
	remove_child(get_child(0))
	return level
