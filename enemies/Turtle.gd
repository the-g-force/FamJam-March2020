extends Node2D

const EnemyBullet = preload("res://enemies/EnemyBullet.tscn")

var _is_next_offense = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Inflict one damage to the turtle
func damage():
	$HealthTracker.reduce_health()

func _on_ShotTimer_timeout():
	var bullet = EnemyBullet.instance()
	bullet.position = position
	bullet.is_offense = _is_next_offense 
	_is_next_offense = !_is_next_offense
	get_parent().add_child(bullet)

func _on_death():
	queue_free()
