class_name MdGun
extends Node2D

@export var _damage_scene : PackedScene

func _enter_tree():
	# Drawer の初期化
	%MdDrawer._text = "gun"
	
	# PortIn の入力を購読
	%PortIn.value_changed.connect(_on_port_in_value_changed)

func _on_port_in_value_changed(value: float) -> void:
	if value <= 0.0:
		return
	
	var damage : Damage = _damage_scene.instantiate()
	damage.global_position = global_position + Vector2(32, 16)
	%ProjectileSpawnRoot.add_child(damage)
	
