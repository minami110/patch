class_name MdDrawer
extends Node2D

@export var _text := ""
@export var _size := Vector2(64, 64)
@export var _outline_color := Color.BLACK

var _mouse_hovered := false

func _draw():
	# 外枠を描写する
	var color = _outline_color
	if _mouse_hovered:
		color += Color(0.0, 0.0, 0.6)

	draw_rect(Rect2(Vector2.ZERO, _size), color, false)

	# Module Name を描写する
	var default_font = ThemeDB.fallback_font
	var y = _size.y/2 + 3
	draw_string_outline(default_font, Vector2(0, y), _text, HORIZONTAL_ALIGNMENT_CENTER, _size.x, 10, 3, Color.BLACK)
	draw_string(default_font, Vector2(0, y), _text, HORIZONTAL_ALIGNMENT_CENTER, _size.x, 10, Color.GRAY)

func _enter_tree():
	# ModuleDragger からの入力を購読
	%ModuleDragger.mouse_entered.connect(_mouse_entered)
	%ModuleDragger.mouse_exited.connect(_mouse_exited)

func _mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	_mouse_hovered = true
	queue_redraw()

func _mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	_mouse_hovered = false
	queue_redraw()
