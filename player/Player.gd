extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var PlayerBullet = preload("res://player/PlayerBullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _draw():
	var extents = $Area2D/CollisionShape2D.shape.extents
	draw_rect(Rect2(-extents.x,-extents.y,extents.x*2, extents.y*2), Color.white, true)

func _input(event):
	if event.is_action("shoot_offense"):
		var bullet = PlayerBullet.instance()
		get_parent().add_child(bullet)
		bullet.position = position
	if event.is_action("shoot_defense"):
		var bullet = PlayerBullet.instance()
		bullet.is_offense = false
		get_parent().add_child(bullet)
		bullet.position = position
		
