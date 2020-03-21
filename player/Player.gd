extends Node2D

signal player_died

var cooldown = false
var _is_chainsawing = false
var _chainsaw_mode = false
export var chainsaw_unit_speed = 0.07
export var chainsaw_unit_speed_variance = 0.02

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var PlayerBullet = preload("res://player/PlayerBullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if _is_chainsawing:
		var follow = $ChainsawPath/ChainsawFollow
		var variance = chainsaw_unit_speed + rand_range(-chainsaw_unit_speed_variance, chainsaw_unit_speed_variance)
		var new_offset = follow.unit_offset + variance
		if new_offset >= 1:
			_is_chainsawing = false
			new_offset = 0
		follow.unit_offset = new_offset

func _input(event):
	if event.is_action("shoot_offense"):
		if _chainsaw_mode:
			_is_chainsawing = true
		elif cooldown == false:
			var bullet = PlayerBullet.instance()
			get_parent().add_child(bullet)
			bullet.position = position
			cooldown = true
			yield(get_tree().create_timer(0.5), 'timeout')
			cooldown = false
	if event.is_action("shoot_defense"):
		if _chainsaw_mode:
			_is_chainsawing = true
		elif cooldown == false:
			var bullet = PlayerBullet.instance()
			bullet.is_offense = false
			get_parent().add_child(bullet)
			bullet.position = position
			cooldown = true
			yield(get_tree().create_timer(0.5), 'timeout')
			cooldown = false
	if event.is_action("swing_chainsaw"):
		_is_chainsawing = true
		$ChainsawPath/ChainsawFollow/Chainsaw.visible = true

func damage():
	$HealthTracker.reduce_health()

func _on_death():
	emit_signal("player_died")
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

func equip_chainsaw():
	_chainsaw_mode = true
	$ChainsawPath/ChainsawFollow/Chainsaw.visible = true
