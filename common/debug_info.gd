class_name DebugInfo
extends Node2D

func _draw():
	# draw current fps
	var default_font = ThemeDB.fallback_font
	var font_size = 12
	var outline_size = 3

	# Show FPS
	var fps = Engine.get_frames_per_second()
	var text = "fps: %s" % fps
	var pos = Vector2(5, 15)
	draw_string_outline(default_font, pos, text, HORIZONTAL_ALIGNMENT_LEFT, -1, font_size, outline_size, Color.BLACK)
	draw_string(default_font, pos, text, HORIZONTAL_ALIGNMENT_LEFT, -1, font_size, Color.WHITE)

func _process(_delta: float) -> void:
	queue_redraw()
