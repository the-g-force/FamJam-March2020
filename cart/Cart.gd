extends Node2D

# Where it wheels to
export var destination_x = 250
export var speed_x = 5

var _is_rolling_in = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if _is_rolling_in:
		position.x -= speed_x
		if position.x <= destination_x:
			_is_rolling_in = false

func roll_in():
	_is_rolling_in = true
	$CartRollSound.play()


func _on_area_entered(area):
	if area.is_in_group("Chainsaw"):
		$HealthTracker.reduce_health()


func _on_cart_death():
	$Cart.visible = false
