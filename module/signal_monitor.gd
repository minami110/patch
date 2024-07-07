class_name SignalMonitor
extends Node2D

func _enter_tree():
	%MdDrawer._text = "0"
	%PortIn.value_changed.connect(_in_value_changed)
	
func _in_value_changed(value: float) -> void:
	%MdDrawer._text = "%s" % str(value)
	%MdDrawer.queue_redraw()

	# PortOut にも送付する
	%PortOut.commit_value(value)
