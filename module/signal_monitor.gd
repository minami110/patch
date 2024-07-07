class_name SignalMonitor
extends Node2D

func _enter_tree():
	%PortIn.value_changed.connect(_in_value_changed)
	
func _in_value_changed(value: float) -> void:
	%Display.text = "%s" % str(value)
	%PortOut.commit_value(value)
