class_name PortOut
extends Area2D

# When value changed
signal value_changed(value: float)

# value
var _value := 0.0
var _other : PortOut
var _wire : Wire

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		# すでに Wire がつながっていて、ダブルクリックされたら Wire を削除する
		if event.double_click and is_wired():
			_wire.queue_free()
			_wire = null

		# Wire がつながっておらず, マウスが押されたら Wire を生成する
		elif event.pressed and not is_wired():
			# Spawn Wire
			_wire = Wire.new()
			_wire._in = self
			add_child(_wire)

func _input(event):
	if _wire == null or _other != null:
		return

	if event is InputEventMouseButton:
		# When released mouse
		if not event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			# マウスを離した先に空いてる Port があれば接続する
			var space_state = get_world_2d().direct_space_state
			var parms = PhysicsPointQueryParameters2D.new()
			parms.collide_with_areas = true
			parms.position = get_global_mouse_position()
			parms.collision_mask = 1 << 0
			var result = space_state.intersect_point(parms, 4)

			# クエリ結果
			var target : PortOut = null
			for r in result:
				var col = r.collider
				if col is PortOut and not col.is_wired():
					target = r.collider
					break

			# 空いてるポートが見つかってたらつなぐ
			if target != null:
				self._other = target
				target._other = self
				target._wire = _wire
				_wire._out = target
			# 生成してた Wire を削除する
			else:
				_wire.queue_free()
				_wire = null

# 現在ワイヤーが繋がっているかどうか
func is_wired() -> bool:
	return _wire != null

# 
func commit_value(value: float) -> void:
	if _value == value:
		return

	_value = value
	value_changed.emit(_value)

	if _other != null:
		_other.commit_value(value)
