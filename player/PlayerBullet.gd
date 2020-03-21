extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var is_offense = true

# Called when the node enters the scene tree for the first time.
func _ready():
	if is_offense:
		$DefenseSprite.visible = false
	else:
		$OffenseSprite.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = position.x + 5
	update()

func _on_area_entered(area):
	if is_offense and area.name == "Turtle":
		area.damage()
		queue_free()
	if area.is_in_group("EnemyBullet"):
		# The trick here is that the alternate types kill each other.
		if is_offense != area.is_offense:
			area.queue_free()
			queue_free()
			
			
