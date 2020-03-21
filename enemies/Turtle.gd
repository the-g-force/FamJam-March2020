extends Node2D

const EnemyBullet = preload("res://enemies/EnemyBullet.tscn")

var _is_next_offense = true
signal turtle_died

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Inflict one damage to the turtle
func damage():
	$HitSound.play()
	$HealthTracker.reduce_health()

func _on_ShotTimer_timeout():
	var bullet = EnemyBullet.instance()
	bullet.position = position
	bullet.is_offense = _is_next_offense 
	if bullet.is_offense:
		$DefenseSound.play()
	else:
		$AttackSound.play()
	_is_next_offense = !_is_next_offense
	get_parent().add_child(bullet)

func _on_death():
	$DeathSound.play()
	visible = false
	emit_signal("turtle_died")
	remove_child($CollisionShape2D)
	
func _on_DeathSound_finished():
	queue_free()
