class_name ModuleDragger
extends Area2D

var _drag_offset := Vector2.ZERO

func _ready():
	set_process_input(false)

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
			_drag_offset = event.global_position - get_parent().global_position
			set_process_input(true)

func _input(event):
	if event is InputEventMouseButton:
		if not event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
			set_process_input(false)
	elif event is InputEventMouse:
		get_parent().global_position = event.global_position - _drag_offset
