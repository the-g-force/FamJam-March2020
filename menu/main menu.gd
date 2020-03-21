extends CanvasLayer

signal start_game

var AboutPage = preload("res://menu/AboutPage.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_StartButton_pressed():
	emit_signal("start_game")


func _on_HelpButton_pressed():
	var about_page = AboutPage.instance()
	add_child(about_page)
