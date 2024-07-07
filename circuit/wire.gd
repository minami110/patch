class_name Wire
extends Node2D

var _in: PortOut
var _out: PortOut

func _draw():	
	if (_in != null and _out == null):
		# is drawing
		var to = get_global_mouse_position()
		draw_line(to_local(_in.global_position), to_local(to), Color.GREEN, 1.0)
	elif (_in != null and _out != null):
		var strength = _in._value
		var color = Color(strength, strength, 0)
		draw_line(to_local(_in.global_position), to_local(_out.global_position), color, 1.0)
	
func _process(_delta):
	queue_redraw()
		
func _exit_tree():
	if _in != null:
		_in._other = null
		_in._wire = null
	if _out != null:
		_out._other = null
		_out._wire = null
