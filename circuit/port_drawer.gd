class_name PortDrawer
extends Node2D

@export var _size := Vector2(10, 10)

var _port_value := 0.0
var _mouse_hovered := false

func _draw():
	var color = Color(_port_value, _port_value, 0)
	if _mouse_hovered:
		color += Color(0.0, 0.6, 0.0)

	draw_set_transform(Vector2.ZERO, deg_to_rad(45)) # Rotate 45 degrees
	draw_rect(Rect2(_size / - 2, _size), color, false)

func _enter_tree():
	var port = get_parent()

	# PortIn からの入力を購読
	var callback = func(x):
		_port_value = x
		queue_redraw()
	port.value_changed.connect(callback)

	port.mouse_entered.connect(_mouse_entered)
	port.mouse_exited.connect(_mouse_exited)

func _mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	_mouse_hovered = true
	queue_redraw()

func _mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	_mouse_hovered = false
	queue_redraw()
