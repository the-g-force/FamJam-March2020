extends Node2D

var cooldown = false

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

func _input(event):
	if event.is_action("shoot_offense"):
		if cooldown == false:
			var bullet = PlayerBullet.instance()
			get_parent().add_child(bullet)
			bullet.position = position
			cooldown = true
			yield(get_tree().create_timer(0.5), 'timeout')
			cooldown = false
	if event.is_action("shoot_defense"):
		if cooldown == false:
			var bullet = PlayerBullet.instance()
			bullet.is_offense = false
			get_parent().add_child(bullet)
			bullet.position = position
			cooldown = true
			yield(get_tree().create_timer(0.5), 'timeout')
			cooldown = false

func damage():
	$HealthTracker.reduce_health()

func _on_death():
	queue_free()


func _on_Defense_pressed():
	if cooldown == false:
		var bullet = PlayerBullet.instance()
		bullet.is_offense = false
		get_parent().add_child(bullet)
		bullet.position = position
		cooldown = true
		yield(get_tree().create_timer(0.5), 'timeout')
		cooldown = false


func _on_Attack_pressed():
	if cooldown == false:
		var bullet = PlayerBullet.instance()
		get_parent().add_child(bullet)
		bullet.position = position
		cooldown = true
		yield(get_tree().create_timer(0.5), 'timeout')
		cooldown = false
