class_name Constant
extends Node2D

@export var _on := 0.0

func _enter_tree():
	%PortOut.commit_value(_on)
