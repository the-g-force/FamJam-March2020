extends Area2D

export var is_offense = true

# Called when the node enters the scene tree for the first time.
func _ready():
	if is_offense:
		$DefenseSprite.visible = false
	else:
		$OffenseSprite.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= 5

func _on_area_entered(area):
	print(area.name)
	if is_offense and area.name == "Mushroom":
		area.damage()
