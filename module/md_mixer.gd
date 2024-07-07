class_name MdMixer
extends Node2D

func _enter_tree():
	%MdDrawer._text = "mixer"
	%PortIn0.value_changed.connect(_in_value_changed)
	
func _in_value_changed(value: float) -> void:
	%PortOut0.commit_value(value)
	%PortOut1.commit_value(value)
