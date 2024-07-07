class_name MdButton
extends Node2D

@export var _send_value := 1.0

func _enter_tree():
	%ModuleDragger.input_event.connect(_area_input)

func _area_input(a, ev, b) -> void:
	if ev is InputEventMouseButton:
		if ev.is_pressed() and ev.button_index == MOUSE_BUTTON_LEFT:
			%PortOut.commit_value(_send_value)
		elif not ev.is_pressed() and ev.button_index == MOUSE_BUTTON_LEFT:
			%PortOut.commit_value(0)
