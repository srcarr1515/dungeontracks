extends State

onready var touch_timer = $TouchTimer
var last_touch_position:Vector2
signal on_tap(tap_type, tap_position)

func enter():
	connect("on_tap", get_tree().get_root().get_node("Game"), "on_tap")

func _process(delta):
	GameData.camera.global_position = GameData.car.global_position

func _unhandled_input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			pass
		if !event.is_pressed():
			last_touch_position = event.position
			if !touch_timer.is_stopped():
				resolve_tap("double")
			else:
				touch_timer.start()

func _on_TouchTimer_timeout():
	resolve_tap("single")

func resolve_tap(tap_type):
	if tap_type == "double":
		touch_timer.stop()
	emit_signal("on_tap", tap_type, last_touch_position)
