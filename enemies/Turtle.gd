extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _draw():
	var extents = $Area2D/CollisionShape2D.shape.extents
	draw_rect(Rect2(-extents.x, -extents.y, extents.x*2, extents.y*2), Color.green, true)


func _on_area_entered(area):
	print("Turtle hit")
