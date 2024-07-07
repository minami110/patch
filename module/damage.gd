class_name Damage
extends Area2D

@export var _amount := 10.0
@export var _speed := 200.0
@export var _direction := Vector2.RIGHT
@export var _lifetime := 2.0

var _age := 0.0

func _enter_tree() -> void:
	add_to_group("projectile")

func _physics_process(delta: float) -> void:
	_age += delta
	if _age >= _lifetime:
		queue_free()
		return
	# move
	var velocity = _direction * _speed
	global_position += velocity * delta

func _area_entered(area: Area2D) -> void:
	if area.has_method("take_damage"):
		area.take_damage(_amount)
	queue_free()
