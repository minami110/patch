class_name DamageRenderer
extends Node2D

@export var _size := Vector2(10, 10)
@export var _outline_color := Color.DARK_RED

func _draw():
	# 外枠を描写する
	var color = _outline_color
	draw_set_transform(_size / -2, deg_to_rad(45)) # Rotate 45 degrees
	draw_rect(Rect2(Vector2.ZERO, _size), color, false)
