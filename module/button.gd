class_name MdButton
extends Node2D

@export var _send_value := 1.0

func _enter_tree():
	# Drawer の初期化
	%MdDrawer._text = "button"

	# ModuleDragger からの入力を購読
	%ModuleDragger.input_event.connect(_area_input)

# マウスクリックを監視する
func _area_input(_a, ev, _b) -> void:
	if ev is InputEventMouseButton and ev.button_index == MOUSE_BUTTON_LEFT:
		if ev.is_pressed():
			%PortOut.commit_value(_send_value)
			%MdDrawer._outline_color = Color.YELLOW
			%MdDrawer.queue_redraw()
		else:
			%PortOut.commit_value(0.0)
			%MdDrawer._outline_color = Color.BLACK
			%MdDrawer.queue_redraw()
